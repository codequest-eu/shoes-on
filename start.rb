# encoding: utf-8

Shoes.setup do
  gem 'gemoji'
  gem 'mqtt'
end

require 'emoji'
require 'mqtt'

def emoji_image(str)
  image "emojis/#{Emoji.find_by_unicode(str).image_filename}"
rescue StandardError => e
  puts e.inspect
  # emoji might be unsupported, print a sad face instead
  title ';__;'
end

Shoes.app(title: "mojify", width: 480, height: 320) do
  # TODO(anyone): security! xD ;__;
  @mqtt = MQTT::Client.connect("mqtts://difrxdkm:EIAdmFlDJlos@m21.cloudmqtt.com:28560")

  def set_bg_awesomeness
    background '#F3F'..'#F90' # can't touch this!
  end

  def render(data_layout)
    clear do
      set_bg_awesomeness
      addRow(data_layout)
    end
  end

  def addRow(data_layout)
    data_layout.each_with_index do |row, r|
      flow(height: 80) do
        addItem(row)
      end
    end
  end

  def addItem(row)
    row.each_with_index do |item, c|
      stack(width: 80) do
        # return animateEmoji(item) if item['text']
        addTextButton(item)
      end
    end
  end

  def addTextButton(item)
    text = item['text']
    button "#{text}"
  end

  def animateEmoji(item)
    emoji_image(item['text']).click do |target|
     frames = 0
     icon_anim = animate(24) do |i|
       target.displace((Math.sin(i) * 4).to_i, 0)
       icon_anim.stop if frames > 12
       frames += 1
     end
     @mqtt.publish('events', item['text'])
    end
  end

  Thread.new do
    # TODO(anyone): security! xD ;__;
    puts "subscribing..."
    @mqtt.get('layouts') do |topic, message|
      # TODO(anyone): validate message request and fail nicely
      render(JSON.parse(message))
    end
  end

  # self.fullscreen = true # this breaks shoes on a mac

  # TODO(anyone): prepare initial splash screea
  set_bg_awesomeness
  image("wow.jpg", left: 130)
  # end splash screen
end
