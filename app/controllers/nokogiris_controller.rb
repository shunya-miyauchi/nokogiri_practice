class NokogirisController < ApplicationController
  def index
      year = Date.current.year
      month = Date.current.month
      @scrapes = []
      3.times do |f|
        url = "https://toos.co.jp/basementbar/event/on/#{year}/0#{month}/"
        @scrapes << scrapes(url)
        month += 1
      end
  end
end
