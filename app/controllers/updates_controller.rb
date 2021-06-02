class UpdatesController < ApplicationController
  def update
    items = Item.all

    params["_json"].each do |i|
      item = items.find(i[:id])
      item.update(name: i[:name], categoryNo: i[:categoryNo], index: i[:index])
    end

    items = Item.order(index: :asc)
    items_title1 = []
    items_title2 = []

    items.each do |i|
      if i.categoryNo == 1
        items_title1.push(i)
      else
        items_title2.push(i)
      end
    end

    items_title1 = items_title1.each_with_index {|item, index| item.index = index }
    items_title2 = items_title2.each_with_index {|item, index| item.index = index }

    @items = items_title1.push(items_title2).flatten!
    render json: @items, each_serializer: ItemSerializer
  end
end
