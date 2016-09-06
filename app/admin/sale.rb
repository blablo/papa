ActiveAdmin.register Sale do
  filter :client
  filter :por_pagar
  filter :domicilio
  filter :orden
  
  controller do

    def scoped_collection
      current_user.company.sales
    end
    def update
      params[:sale].merge!({ company_id: current_user.company_id })
      update!
    end
    def create
      params[:sale].merge!({ company_id: current_user.company_id })
      create!
    end

  end
end
