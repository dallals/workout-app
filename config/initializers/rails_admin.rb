RailsAdmin.config do |config|

  Kaminari.configure do |config|
    config.page_method_name = :per_page_kaminari
  end

  config.authorize_with do
    redirect_to main_app.root_path unless current_user == User.find_by(email: 'sammydallal@gmail.com') 
  end

  config.model 'User' do
    navigation_icon 'icon-user'
  end

  config.authenticate_with do
    warden.authenticate! scope: :user
  end
  config.current_user_method(&:current_user) 

  # config.model 'User' do
  #   list do
  #     configure :email do
  #       show
  #     end
  #   end
  # end

  config.model 'User' do
    list do
      field :first_name
      field :last_name
      field :email
      field :created_at do
        date_format :short
      end
      field :updated_at do
        strftime_format "%Y-%m-%d"
      end
    end
  end

  config.model 'Friendship' do
    list do
      field :id
      field :user
      field :friend
      field :created_at do
        date_format :short
      end
      field :updated_at do
        strftime_format "%Y-%m-%d"
      end
    end
  end

  # config.model 'Friendship' do
  #   edit do
  #     field :user do
  #       # configuration here

  #     end
  #   end
  # end  
  ### Popular gems integration

  ## == Devise ==
  # config.authenticate_with do
  #   warden.authenticate! scope: :user
  # end
  # config.current_user_method(&:current_user)

  ## == Cancan ==
  # config.authorize_with :cancan

  ## == Pundit ==
  # config.authorize_with :pundit

  ## == PaperTrail ==
  # config.audit_with :paper_trail, 'User', 'PaperTrail::Version' # PaperTrail >= 3.0.0

  ### More at https://github.com/sferik/rails_admin/wiki/Base-configuration

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
end
