module RestaurantsHelper

  def getScheduleStatus(id)

   @new = ["","pending","waiting ","closed","approved"]
   @new[id]
  end
end
