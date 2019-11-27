# frozen_string_literal: true

module Decidim
  module Conferences
    # This type represents a conference.
    ConferenceMediaLinkType = GraphQL::ObjectType.define do

    name "ConferenceMediaLinkType"
    description "A conference media link"

    field :id, types.Int, ""
    field :title, Decidim::Core::TranslatedFieldType, ""
    field :link, types.String, ""
    field :date, Decidim::Core::DateType, ""
    field :weight, types.Int, ""
    field :createdAt, Decidim::Core::DateTimeType, "", property: :created_at
    field :updatedAt, Decidim::Core::DateTimeType, "", property: :updated_at

    # These fields may be private:
    # decidim_participatory_process_group_id
    # decidim_organization_id
    # private_space
    end
  end
end
