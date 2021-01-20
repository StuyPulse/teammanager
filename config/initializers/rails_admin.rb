RailsAdmin.config do |config|

  ### Popular gems integration

  ## == Devise ==
  # config.authenticate_with do
  #   warden.authenticate! scope: :user
  # end
  config.current_user_method(&:current_user)

  ## == Pundit ==
  config.authorize_with :pundit

  ## == PaperTrail ==
  config.audit_with :paper_trail, 'User', 'PaperTrail::Version'

  ### More at https://github.com/sferik/rails_admin/wiki/Base-configuration

  ## == Gravatar integration ==
  ## To disable Gravatar integration in Navigation Bar set to false
  # config.show_gravatar = true

  # https://github.com/sferik/rails_admin/issues/3014
  config.excluded_models = ['ActiveStorage::Blob', 'ActiveStorage::Attachment']

  # https://stackoverflow.com/q/40377340
  config.parent_controller = '::ApplicationController'

  config.total_columns_width = 1000

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

  config.model 'Stim' do
    navigation_label 'Forms'
  end

  config.model 'Trip' do
    navigation_label 'Trips'
  end

  config.model 'TripDismissal' do
    navigation_label 'Trips'
  end

  config.model 'RequiredPayment' do
    navigation_label 'Trips'
  end

  config.model 'Payment' do
    navigation_label 'Trips'
  end

  config.model 'PermissionSlip' do
    navigation_label 'Trips'
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

    # history actions require audit integration with paper_trail
    history_index
    history_show
  end
end

# This custom authorization adapter allows us to keep all the rails_admin
# action authorizations in one method like before with rails_admin_pundit.
# Removing it would mean making one method per action in our policies.
#
# https://github.com/sferik/rails_admin/issues/3143
module RailsAdmin
  module Extensions
    module Pundit
      class AuthorizationAdapter
        def initialize(controller)
          @controller = controller
          @controller.class.send(:alias_method, :pundit_user, :_current_user)
        end

        def authorize(action, abstract_model = nil, model_object = nil)
          record = model_object || abstract_model&.model
          if action && !policy(record).send(*action_for_pundit(action))
            raise ::Pundit::NotAuthorizedError.new("not allowed to #{action} this #{record}")
          end
          @controller.instance_variable_set(:@_pundit_policy_authorized, true)
        end

        def authorized?(action, abstract_model = nil, model_object = nil)
          record = model_object || abstract_model&.model
          policy(record).send(*action_for_pundit(action)) if action
        end

        private

        def policy(record)
          @controller.send(:policy, record)
        rescue ::Pundit::NotDefinedError
          ::ApplicationPolicy.new(@controller.send(:_current_user), record)
        end

        def action_for_pundit(action)
          [:rails_admin?, action]
        end
      end
    end
  end
end
