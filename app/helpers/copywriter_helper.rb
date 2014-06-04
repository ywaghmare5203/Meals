module CopywriterHelper

    def getRestaurantNamebyId(rid)

    @restaurants= Restaurant.find(rid)
    @restaurants.name

  end

      def getCuisineNamebyId(cid)
     @Cuisine=Cuisine.find(cid)
    @Cuisine.name
  end

end
