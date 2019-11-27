# frozen_string_literal: true

module Decidim
  module Conferences
    # This type represents a conference.
    ConferenceRegistrationType = GraphQL::ObjectType.define do

    name "ConferenceRegistrationType"
    description "A conference registration"

    field :id, types.Int, ""
    field :user, Decidim::Core::UserType do
      resolve ->(obj, _, _) { Decidim::User.find_by(id: obj.decidim_user_id) }
    end 
    field :createdAt, Decidim::Core::DateTimeType, "", property: :created_at
    field :updatedAt, Decidim::Core::DateTimeType, "", property: :updated_at
    field :decidimConferenceRegistrationTypeId, types.Int, "", property: :decidim_conference_registration_type_id
    field :confirmedAt, Decidim::Core::DateTimeType, "", property: :confirmed_at

    # These fields may be private:
    # decidim_participatory_process_group_id
    # decidim_organization_id
    # private_space
    end
  end
end
