# encoding: utf-8

Shoes.setup do
  gem 'gemoji'
  gem 'ruby-mqtt'
end

require 'emoji'

def emoji_image(str)
  image "emojis/#{Emoji.find_by_unicode(str).image_filename}"
rescue StandardError
  title ';__;'
end

Shoes.app(title:"Shoes On!", width:(480), height:(320)) do
  background '#F3F'..'#F90'
  #self.fullscreen = true # this breaks shoes on mac

  @map = [
    [{id: 'btn1', text: '🙈'}, {id: 'btn2', text: '😂'}],
    [{id: 'btn3', text: '🐗'}, {id: 'btn4', text: '💩'}],
    [{id: 'btn1', text: '🙌'}, {id: 'btn4', text: '🐴'}],
    [{id: 'btn1', text: '😚'}, {id: 'btn4', text:'🙆'}],
  ]

  @map.each_with_index do |row, r|
     flow(height: 80) do
      row.each_with_index do |item, c|
        stack(width: 80) do
          emoji_image(item[:text]).click { puts item[:id] }
        end
      end
    end
  end
end
