class ProductsController < ApplicationController
	protect_from_forgery :only => [:update, :destroy]

  def create
    puts"I am new user&&&&&&&&&&&&&&&&&&&&&&&&&&"
    @product_order = Product.last
    puts"@product_order****************************************#{@product_order.inspect}"
    @user = User.find(params[:user_id])
    @product = @user.products.create
    @product.name =params[:product][:name]
    @product.descripton =params[:product][:descripton]
    @product.user_id =params[:user_id]
    @product.lat =params[:product][:lat]
    @product.lng =params[:product][:lng]
    @product.wish_date=params[:product]["wish_date(3i)"]+"/"+params[:product]["wish_date(2i)"]+"/"+params[:product]["wish_date(1i)"]
    order =params[:product][:order_id]
    @product.order_id = order.to_i+1
   if @product.save!
      @photo_up = Photo.new
      @photo_up.product_id = @product.id
      @photo_up.images = params[:product][:images]
      @photo_up.images1 = params[:product][:images1]
      @photo_up.images2 = params[:product][:images2]
      @photo_up.images3 = params[:product][:images3]
      @photo_up.save
    end
    flash[:notice] = "Your wish is successfully created."
    redirect_to user_path(@user)
 end

 def edit
   @product_edit = Product.find(params[:id])
   @photo_edit = Photo.find_by_product_id(params[:id])
# 		@user = User.find(params[:user_id])
# 		@product_edit = @user.products.find(params[:id])

 end

 def update
    if params[:update]
      @product_edit = Product.find(params[:update])
      @product_edit.update_attributes(params[:product])
      @product_edit.lat = params[:product][:lat]
      @product_edit.lng = params[:product][:lng]
      @user_id = params[:product][:user_id]
      @product_edit.save
        redirect_to :controller=> "users", :action =>"show",:id=>@user_id
     end
 end

 def destroy
    @product =Product.find(params[:id]).destroy

# 		@user = User.find(params[:user_id])
# 		@product = @user.products.find(params[:id])
# 		@product.destroy
		redirect_to  :controller=>"users",:action=>"show",:id=>session[:user_id]
	end

 def sendlist
    @user = User.find(params[:user_id])
    ListMailer.share_list_email(@user, params[:email]).deliver
   redirect_to user_path(@user)
 end
 def add_wish
 end

 def ordering_list
       if params[:id]
        @pro_id = params[:id].gsub("listItem[]=", "")
        @pro_id1 = @pro_id.gsub("&", ",")
        @pro_id3 = @pro_id1.split(",")
        @i=0
        @pro_id3.each do |value|
         @pro = Product.find_by_id(value)
         ActiveRecord::Base.connection.raw_connection.prepare("update product set order_id=@i where id=value")

                   puts"******************************#{@pro.id}"
                   #UPDATE 'Product' SET 'order_id' = @i WHERE 'id' = value
                   puts"----------------------------------@c12------------------------------#{UPDATE 'Product' SET 'order_id' = @i WHERE 'id' = value}"
        end
    end
    render :layout=>"blanck"
end
end
