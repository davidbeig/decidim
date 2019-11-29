# frozen_string_literal: true

module Decidim
  module Core
    AreaTypeType = GraphQL::ObjectType.define do
      name "AreaType"
      description "An area type."

      field :id, !types.ID
      field :name, !TranslatedFieldType, "The name of this area."
      field :plural, !TranslatedFieldType, "The plural name of this area"
    end
  end
end
