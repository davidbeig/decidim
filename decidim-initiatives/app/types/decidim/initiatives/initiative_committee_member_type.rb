# frozen_string_literal: true

module Decidim
  module Initiatives
    # This type represents a conference.
    InitiativeCommitteeMemberType = GraphQL::ObjectType.define do
      name "InitiativeCommitteeMemberType"
      description "A initiative committee member"

      field :id, !types.ID, ""
      field :user, Decidim::Core::UserType do
        resolve ->(obj, _, _) { Decidim::User.find_by(id: obj.decidim_users_id) }
      end

      field :state, types.Int, "Type of the committee member"
      field :createdAt, Decidim::Core::DateTimeType, "", property: :created_at
      field :updatedAt, Decidim::Core::DateTimeType, "", property: :updated_at

      # These fields may be private:
      # decidim_participatory_process_group_id
      # decidim_organization_id
      # private_space
    end
  end
end
