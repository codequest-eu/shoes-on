# Shoes.app do
#   @push = button("Click Me ;__;", align: 'center', left: 20, top: 20)
#   @note = title("\xF0\x9F\x98\xBF", font: 'Bitstream Vera', top: 60, align: 'center', stroke: white)
#   @push.click do
#     @note.replace(@note.text.empty? ? "Hello" : nil)
#   end
# end


Shoes.app(title:"Shoes On!", width:(480), height:(320)) do
  background '#F3F'..'#F90'
  self.fullscreen = true
  @x = 0
  @y = 0
  @map = Array.new(4) { Array.new(6) }

  @map.each_with_index do |row, r|
    row.each_with_index do |item, c|
      fill "%06x" % (rand * 0xffffff)
      rect(top:(r * 80), left:(c * 80), width:80, height:80)
    end
  end
end
