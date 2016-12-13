# encoding: utf-8

Shoes.setup do
  gem 'emoji'
end

require 'emoji'
Emoji.asset_host = nil

def emoji_image(str)
  image "emoji/assets/images#{Emoji.image_url_for_unicode_moji(str)}"
end

Shoes.app do
  self.fullscreen = true # this breaks shoes on mac
  emoji_image('🍕').click { para "hello" }  
  emoji_image('😂')
  emoji_image('🐳')
end
