class ApplicationController < ActionController::Base
  protect_from_forgery
  helper_method :current_user, :logged_in?, :current_admin, :admin_logged_in?

  before_filter  :set_user


  include ApplicationHelper

  def api_authenticate
    unless logged_in?
      logger.info("-- [user] not authenticated on API)")
      response.headers["Content-Type"] = "application/xml; charset=utf-8"
      ret = "<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<response>\n<status>error</status>\n</response>\n"
      render(:text => ret)
    end
  end

  def authenticate
    unless logged_in?
      session[:ret] = request.path
      logger.info("-- [user] not authenticated, redirecting to: " + session[:ret])
      redirect_to(root_url, :notice => "You need to login before you can do that")
    end
  end

  def admin_authenticate
    unless admin_logged_in?
      logger.info("-- [admin] not authenticated, redirecting to: " + session[:ret].to_s)
      redirect_to(admin_login_url, :notice => "You need to login as an admin before you can do that")
    else
      if current_admin.status.eql?(0) 
        logger.info("-- [admin] owner not authorized yet (#{current_admin.email})")
        redirect_to(admin_login_url, :notice => "Your account hasn't been approved yet")
      end
    end
  end

  def owner_approved
    admin_authenticate
    unless current_admin.owner? && current_admin.status.eql?(1) # or admin, or owner
      logger.info("-- SECURITY! [admin] owner privileges not allowed (#{current_admin.email} is not an owner")
      redirect_to(admin_login_url, :notice => "You don't have the permissions to do this")
    end
  end

  def ensure_owner
    admin_authenticate
    unless current_admin.owner? # or admin, or owner
      logger.info("-- SECURITY! [admin] owner privileges not allowed (#{current_admin.email} is not an owner")
      redirect_to(admin_login_url, :notice => "You don't have the permissions to do this")
    end
  end

  def ensure_copywriter
    admin_authenticate
    unless current_admin.copywriter? # or admin, or owner
      logger.info("-- SECURITY! [admin] copywrite privileges not allowed (#{current_admin.email} is not a copywriter")
      redirect_to(admin_login_url, :notice => "You don't have the permissions to do this")
    end
  end

  def ensure_manager
    admin_authenticate
    unless current_admin.manager?
      logger.info("-- SECURITY! [admin] manager privileges not allowed (#{current_admin.email} is not a manager")
      redirect_to(admin_login_url, :notice => "You don't have the permissions to do this")
    end
  end

  
  def ensure_admin
    admin_authenticate
    unless current_admin.admin? # or superuser
      logger.info("-- SECURITY! [admin] admin privileges not allowed (#{current_admin.email} is not an admin")
      redirect_to(admin_login_url, :notice => "You don't have the permissions to do this")
    end
  end

  def ensure_superuser
    admin_authenticate
    unless current_admin.superuser? # or superuser
      logger.info("-- SECURITY! [admin] superuser privileges not allowed (#{current_admin.email} is not a superuser")
      redirect_to(admin_login_url, :notice => "You don't have the permissions to do this")
    end
  end

  def owner_allowed?
    if admin_logged_in?
      unless current_admin.role_id.eql?(1) || current_admin.role_id.eql?(2)  # not just an owner
        redirect_to("/admin/dashboard", :notice => "You're not an admin")
      end
    end
  end

  # unset user privs
  def unset_user
    session[:user_id] = nil
  end

  def unset_admin
    session[:admin_id] = nil
  end


    def set_user

    begin
      if @user.nil? && session[:user_id]

        @user = User.find_by_id(session[:user_id])

        if @user.nil?
          return
        end

      end
    rescue  Exception => e
  
    end
  end



  private
  def current_user
    @current_user = User.find(session[:user_id]) if session[:user_id]
  end

  def logged_in?
    return (session[:user_id].to_i > 0)
  end

  # admins
  def current_admin
    @current_admin = Admin.find(session[:admin_id]) if session[:admin_id]
  end

  def admin_logged_in?
    return (session[:admin_id].to_i > 0)
  end


end
