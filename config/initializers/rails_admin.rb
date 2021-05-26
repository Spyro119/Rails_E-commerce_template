RailsAdmin.config do |config|
  config.parent_controller = 'ApplicationController'
  ### Popular gems integration

  ## == Devise ==
  config.authenticate_with do
    warden.authenticate! scope: :user
  end
  config.current_user_method(&:current_user)

  ## == CancanCan ==
  config.authorize_with :cancancan
  

  ## == Pundit ==
  # config.authorize_with :pundit

  ## == PaperTrail ==
  # config.audit_with :paper_trail, 'User', 'PaperTrail::Version' # PaperTrail >= 3.0.0

  ### More at https://github.com/sferik/rails_admin/wiki/Base-configuration

  ## == Gravatar integration ==
  ## To disable Gravatar integration in Navigation Bar set to false
  # config.show_gravatar = true
  # config.model 'IndexImages' do 
  # end
  
  # config.model Product do
  #   list do
  #   field :sexe, :active_record_enum
  #   end
  # end


  
  config.actions do
    dashboard                     # mandatory
    index                         # mandatory
    new
    export
    bulk_delete
    show
    edit
    delete
    show_in_app

    ## With an audit adapter, you can add:
    # history_index
    # history_show
  end

  config.excluded_models= [ProductCategory, ProductImage]

  # config.model Imodel do
  #   exclude_fields :id
  # end

  config.model Image do
    object_label_method do
      :photo
      end
      exclude_fields :id
    end

    config.model Category do
      exclude_fields :id
    end

    config.model User do 
      exclude_fields :id
    end

    config.model IndexImage do
      exclude_fields :id
    end

        # Products
  config.model Product do 
    object_label_method do
      :title
    end
    exclude_fields :id
    #List in dashboard
    list do
      include_all_fields
      field :price do 
        formatted_value do
          ActionController::Base.helpers.number_to_currency(formatted_value)
        end
      end
      field :production_cost do
        formatted_value do 
          ActionController::Base.helpers.number_to_currency(formatted_value)
        end
      end
      field :weight do
        read_only true
        pretty_value do
          bindings[:object].weight_format
        end
      end
      configure :weight_type do
        hide
      end

      # field :images do
      #   pretty_value do
          # [:images].each do 
            # bindings[:view].tag(:img, { :src => bindings[:object].image.photo })
      #     end
      #   end
      # end
    end
    #On Create
    create do 
      include_all_fields
      field :price do
        formatted_value do
          sprintf "%.2f", formatted_value
        end
      end
      field :production_cost do
        formatted_value do
          sprintf "%.2f", formatted_value
        end
      end

    end
    #On edit
    edit do
      include_all_fields
      field :price do
        formatted_value do
          sprintf "%.2f", formatted_value
        end
      end
      :production_cost.nil? 
      field :production_cost do
        formatted_value do
          sprintf "%.2f", formatted_value
      end
    end
  end
    #On Show
    show do 
    include_all_fields
      field :price do
        formatted_value do
          ActionController::Base.helpers.number_to_currency(formatted_value)
        end
      end
      field :production_cost do
        formatted_value do
          ActionController::Base.helpers.number_to_currency(formatted_value)
        end
      end
      field :weight do
        pretty_value do
          bindings[:object].weight_format
        end
      end
      configure :weight_type do
        hide
      end
      # field :total_quantity do
      #   read_only true
      # end
    end
  end


end
