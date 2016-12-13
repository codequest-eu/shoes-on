Shoes.app do
  background '#F3F'..'#F90'
  self.fullscreen = true
  @push = button("Click Me ;__;", align: 'center', left: 20, top: 20)
  @note = title("\xF0\x9F\x98\xBF", font: 'Bitstream Vera', top: 60, align: 'center', stroke: white)
  @push.click do
    @note.replace(@note.text.empty? ? "Hello" : nil)
  end
end
