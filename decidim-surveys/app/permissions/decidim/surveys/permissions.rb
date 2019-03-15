# frozen_string_literal: true

module Decidim
  module Surveys
    class Permissions < Decidim::DefaultPermissions
      def permissions
        # Rails.logger.debug "************"
        # Rails.logger.debug context[:current_settings].allow_unregistered?
        # Rails.logger.debug [context].map(&:inspect).join("\n")
        # Rails.logger.debug "#{context.current_settings}"
        # Rails.logger.debug "************"
        return permission_action unless user || context[:current_settings].allow_unregistered?

        return Decidim::Surveys::Admin::Permissions.new(user, permission_action, context).permissions if permission_action.scope == :admin
        return permission_action if permission_action.scope != :public

        return permission_action if permission_action.subject != :questionnaire

        permission_action.allow! if permission_action.action == :answer

        permission_action
      end
    end
  end
end
