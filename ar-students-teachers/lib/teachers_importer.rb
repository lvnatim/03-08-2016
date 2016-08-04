class TeachersImporter

  def import
    Teacher.create(name: "Tim Lu", email: "tim.lu@ourlog.ca")
    Teacher.create(name: "Katie Huang", email: "katie.huang@ourlog.ca")
    Teacher.create(name: "Clarence Chiu", email: "clarence.chiu@ourlog.ca")
    Teacher.create(name: "Daniel Sun", email: "daniel.sun@ourlog.ca")
    Teacher.create(name: "Brendan Perkins", email: "brendan.perkins@ourlog.ca")
    Teacher.create(name: "Anders Leung", email: "anders.leung@ourlog.ca")
    Teacher.create(name: "Taylor Fladgate", email: "taylor.fladgate@ourlog.ca")
    Teacher.create(name: "Jeff Shih", email: "jeff.shih@ourlog.ca")
    Teacher.create(name: "Freederico Mak", email: "freederico.mak@ourlog.ca")
  end

end

# class TeachersImporter

#   def initialize
#     @filename = File.absolute_path('../db/data/teachers.csv', File.dirname(__FILE__))
#   end

#   def import
#     data = File.readlines(@filename, "r")
#     data.each do |line|
#       line.split(',')
#       Teacher.create!(name: line[0], email: line[1], address: line[2], phone: line[3])
#     end
#   end

# end