# frozen_string_literal: true

module Decidim
  module Initiatives
    InitiativeApiType = GraphQL::ObjectType.define do
      name "InitiativeType"
      description "A initiative type"

      field :id, !types.ID
      field :title, Decidim::Core::TranslatedFieldType, "initiative type name"
    end
  end
end
