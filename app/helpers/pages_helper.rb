module PagesHelper

   def clustor_list(clustor_array)

           html = ''

           last = clustor_array.length-1
            clustor_array.each_with_index{|cluster,index|

         html <<   content_tag(:span) do
               if index == last
                    concat link_to "#{cluster.name}", "todaysdeal/" + cluster.id.to_s
                else
                    concat link_to "#{cluster.name}", "todaysdeal/" + cluster.id.to_s
                    concat " ,"
                end
          end

       }

  return html


   end





def user_has_cuisines?

  if @user.cuisines.size > 0

    return true

  else

     return false
  end


end

def user_cuisines_list

   html = ''

       last = @user.cuisines.length-1
       @user.cuisines.each_with_index{|cuisine,index|

         html <<   content_tag(:span) do
               if index == last
                    concat "#{cuisine.name}"
                else
                    concat "#{cuisine.name}"
                    concat " , "
                end
          end

       }


   return html

end



def full_name(location)

return location.first_name + " " + location.last_name

end

end
