module ApplicationHelper



 def  current_username
   unless @user.nil?
    if @user.name  && @user.name.length > 0
        return @user.name
    else
      return @user.email
    end

   end

 end


 
  def weekday
    days = ["Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday"]
    return days
  end

  def jv
    return "javascript:void(0)"
  end

  def waiting
    return "<img src=\"/img/waiting.gif\" />".html_safe
  end

  def js_jquery
    return "<script type=\"text/javascript\" src=\"http://ajax.googleapis.com/ajax/libs/jquery/1.6.4/jquery.min.js\"></script>".html_safe
  end

  def js_gmap(sensor = false)
    ret = ('<script type="text/javascript" src="http://maps.google.com/maps/api/js?sensor=' + sensor.to_s + '"></script>')
    ret += "<script type=\"text/javascript\" src=\"/js/polybounds.js\"/></script>"
    ret.html_safe
  end

end
