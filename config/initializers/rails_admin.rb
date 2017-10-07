RailsAdmin.config do |config|

  ### Popular gems integration

  ## == Devise ==
  # config.authenticate_with do
  #   warden.authenticate! scope: :user
  # end
  config.current_user_method(&:current_user)

  ## == Cancan ==
  # config.authorize_with :cancan

  ## == Pundit ==
  config.authorize_with :pundit

  ## == PaperTrail ==
  # config.audit_with :paper_trail, 'User', 'PaperTrail::Version'

  ### More at https://github.com/sferik/rails_admin/wiki/Base-configuration

  ## == Gravatar integration ==
  ## To disable Gravatar integration in Navigation Bar set to false
  # config.show_gravatar = true

  # https://stackoverflow.com/q/40377340
  config.parent_controller = '::ApplicationController'

  # Organize navigation links
  config.model 'Student' do
    navigation_label 'Members'
    weight -2
  end

  config.model 'Parent' do
    navigation_label 'Members'
  end

  config.model 'Event' do
    navigation_label 'Community Service'
  end

  config.model 'Service' do
    navigation_label 'Community Service'
  end

  config.model 'MediaConsent' do
    navigation_label 'Forms'
    weight -1
  end

  config.model 'SafetyTest' do
    navigation_label 'Forms'
  end

  config.model 'Medical' do
    navigation_label 'Forms'
  end

  config.model 'TeamDue' do
    navigation_label 'Forms'
  end


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
