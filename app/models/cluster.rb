class Cluster < ActiveRecord::Base
belongs_to :sale
  has_many :d_restaurants

  # check if point is in polygon - copied from places.ae
  def self.find_for_point?(point)
    Logger.new(STDOUT).info("find for point #{point}");
    c = nil
    Cluster.all.each do |cluster|
      Logger.new(STDOUT).info("trying #{cluster.name}");
      point = point.to_s.split(',')
      points = cluster.points.split('|')
      point = point.collect{ |x| x.to_f } # make all floats
      points = points.collect{|x| x.split(',').collect {|y| y.to_f }}
      inPoly = false
      i = -1
      j = (points.size - 1)
      while (i += 1) < points.size
        if((points[i][1] <= point[1] && point[1] < points[j][1]) || (points[j][1] <= point[1] && point[1] < points[i][1]))
          if (point[0] < ((points[j][0] - points[i][0]) * (point[1] - points[i][1]) / (points[j][1] - points[i][1]) + points[i][0]))
            inPoly = !inPoly
          end
        end
        j = i
        Logger.new(STDOUT).info("inPoly : #{inPoly}");
      end
      c = cluster if inPoly.eql?(true)
    end
    return c
  end

  def to_dashboard_json
    return "{ \"status\": \"ok\", \"cluster\": { \"name\": \"#{self.name}\", \"id\": #{ self.id }, \"desc\":\"#{self.description}\" } }"
  end
  
  def xml
    return "<cluster id=\"#{ self.id }\">\n" +
           "  <name>#{ self.name.gsub("&","&amp;") }</name>\n" +
           "</cluster>\n"
  end

end
