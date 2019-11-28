# frozen_string_literal: true

module Decidim
  module Conferences
    # This type represents a conference.
    ConferencePartnerType = GraphQL::ObjectType.define do
      name "ConferencePartnerType"
      description "A conference partner"

      field :id, types.Int, ""
      field :name, types.String, ""
      field :partnerType, types.String, "", property: :partner_type
      field :weight, types.Int, ""
      field :link, types.String, ""
      field :logo, types.String, ""
      field :createdAt, Decidim::Core::DateTimeType, "", property: :created_at
      field :updatedAt, Decidim::Core::DateTimeType, "", property: :updated_at

      # These fields may be private:
      # decidim_participatory_process_group_id
      # decidim_organization_id
      # private_space
    end
  end
end
