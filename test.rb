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
  @map = Array.new(60) { Array.new(80) }

  num = 0
  @map.each do |el|
      if(num!=0)
          line(top:0, left:(num*80), width:0, height:600)
      end
      el.each do |el2|
          if(num!=0)
              line(top:(num*80), left:0, width:800, height:0)
          end
      end
      num = num + 1
  end
end
