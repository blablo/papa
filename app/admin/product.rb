# -*- coding: utf-8 -*-
ActiveAdmin.register Product do
 index do

    column "Imagen" do |image|
        image_tag image.avatar.url(:thumb)
    end
    column :name
    column 'Categoría' do |pro| 
      pro.product_category.name.capitalize
    end 
    column :price

    default_actions
  end
  
end
