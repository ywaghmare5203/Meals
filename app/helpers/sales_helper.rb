module SalesHelper

  def getCuisineNamebyId(cid)
     @Cuisine=Cuisine.find(cid)
    @Cuisine.name
  end



end
