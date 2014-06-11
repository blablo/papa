# -*- coding: utf-8 -*-
ActiveAdmin.register Product do

  form do |f|
    f.inputs "Details" do
      f.input :name
      f.input :price
      f.input :product_category
      f.input :avatar
    end
    f.actions
  end

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

  controller do
    def scoped_collection
      current_user.company.products
    end

    def update
      params[:product].merge!({ company_id: current_user.company_id })
      update!
    end
    def create
      params[:product].merge!({ company_id: current_user.company_id })
      create!
    end
  end
end
