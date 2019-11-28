# frozen_string_literal: true

module Decidim
  module Initiatives
    # This interface represents a commentable object.
    InitiativeTypeInterface = GraphQL::InterfaceType.define do
      name "InitiativeTypeInterface"
      description "An interface that can be used in InitiativeType objects."

      field :initiativeType, Decidim::Initiatives::InitiativeApiType, "The object's initiative type", property: :type
    end
  end
end
