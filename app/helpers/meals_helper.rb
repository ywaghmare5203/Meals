module MealsHelper
   def getmealbyid(id)
    meal=Meal.find_by_id(id)

    if meal.nil?
      "default"
    else
      meal.name.gsub("'","\\'")
    end
  end
end
