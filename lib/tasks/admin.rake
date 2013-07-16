# -*- coding: utf-8 -*-
namespace :admin do
  task :corte_fecha => :environment do 
    Corte.all.each do |corte|
      if corte.fecha.blank? 
        corte.update_attribute(:fecha, corte.created_at)
      end
    end
  end

end
