# encoding: utf-8

Shoes.app(title:"Shoes On!", width:(480), height:(320)) do
  background '#F3F'..'#F90'
  self.fullscreen = true
  @x = 0
  @y = 0

  @map = [
    [{id: 'btn1', text: '�~_~P�'}, {id: 'btn2', text: '�~_~X~B'}],
    [{id: 'btn3', text: '�~_~X~N'}, {id: 'btn4', text: '�~_~Y~H'}],
  ]

  @map.each_with_index do |row, r|
     flow(height: 80) do
      row.each_with_index do |item, c|
        stack(width: 80) do
          fill "%06x" % (rand * 0xffffff)
          rect(width:80, height:80).click do
            puts item[:id] # send event
          end
          para(item[:id], width: 80, height: 80)
        end
      end
    end
  end
end
