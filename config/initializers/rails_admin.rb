RailsAdmin.config do |config|

  ### Popular gems integration

  ## == Devise ==
  config.authenticate_with do
     warden.authenticate! scope: :user
  end
  config.current_user_method(&:current_user)

  ## == CancanCan ==
  config.authorize_with :cancancan
  config.parent_controller = 'ApplicationController'
  ## == Pundit ==
  # config.authorize_with :pundit

  ## == PaperTrail ==
  # config.audit_with :paper_trail, 'User', 'PaperTrail::Version' # PaperTrail >= 3.0.0

  ### More at https://github.com/sferik/rails_admin/wiki/Base-configuration

  ## == Gravatar integration ==
  ## To disable Gravatar integration in Navigation Bar set to false
  # config.show_gravatar = true

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

  config.default_items_per_page = Settings.RAILS_ADMIN_PAGINATION

  config.model 'User' do
    list do
      field :id do
        sort_reverse false
      end
      field :id
      field :name
      field :email
      field :created_at
    end

    edit do
      configure :schedule do
        hide
      end
    end

    show do
      configure :schedule do
        hide
      end
    end
  end

  config.model 'Provider' do
    list do
      field :id do
        sort_reverse false
      end
      field :name
      field :email
      field :address
      field :phone_number
      field :description
      field :created_at
    end

    edit do
      configure :service do
        hide
      end
    end

    show do
      configure :service do
        hide
      end
    end
  end

  config.model 'ServiceBooking' do
    list do
      field :id do
        sort_reverse false
      end
      field :user_name
      field :service_id
    end
  end

  config.model 'Category' do
    list do
      field :id do
        sort_reverse false
      end
      field :name
      field :description
    end
  end

end
