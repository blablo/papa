# -*- coding: utf-8 -*-
ActiveAdmin.register Compra do
  before_filter :skip_sidebar!, :only => :index
  actions :all, :except => [:destroy]

  controller do
    def scoped_collection
      current_user.company.compras
    end
    def update
      params[:compra].merge!({ company_id: current_user.company_id })
      update!
    end
    def create
      params[:compra].merge!({ company_id: current_user.company_id })
      create!
    end
  end

  index do
    column "Imagen" do |image|
      image_tag image.avatar.url(:thumb)
    end
    column :name
    column 'Categoría' do |pro|
      pro.compra_category.name.capitalize if pro.compra_category
    end
    column :medida
 
    default_actions
  end


  form do |f|
    f.inputs "Details" do
      f.input :compra_category, collection: CompraCategory.where(company_id: current_user.company_id).order('name')
      f.input :name
      f.input :avatar
      f.input :medida

    end
    f.actions
  end


end
