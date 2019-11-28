# frozen_string_literal: true

module Decidim
  module Initiatives
    InitiativeApiType = GraphQL::ObjectType.define do
      name "InitiativeType"
      description "A initiative type"

      field :id, !types.ID
      field :title, Decidim::Core::TranslatedFieldType, "Initiative type name"
      field :description, Decidim::Core::TranslatedFieldType, "This is the initiative type description"
      field :createdAt, Decidim::Core::DateTimeType, "The date this initiative type was created", property: :created_at
      field :updatedAt, Decidim::Core::DateTimeType, "The date this initiative type was updated", property: :updated_at
      field :bannerImage, types.String, "Banner image", property: :banner_image
      field :collectUserExtraFields, types.Boolean, "Collect participant personal data on signature", property: :collect_user_extra_fields
      field :extraFieldsLegalInformation, types.String, "Legal information about the collection of personal adata", property: :extra_fields_legal_information
      field :minimumCommitteeMembers, types.Int, "Minimum of committee members", property: :minimum_committee_members
      field :validateSmsCodeOnVotes, types.Boolean, "Add SMS code validation step to signature process", property: :validate_sms_code_on_votes
      field :documentNumberAuthorizationHandler, types.String, "Authorization to verify document number on signature", property: :document_number_authorization_handler
      field :undoOnlineSignaturesEnabled, types.Boolean, "Enable participants to undo their online signatures", property: :undo_online_signatures_enabled
      field :promotingComitteeEnabled, types.Boolean, "Enable promoting committee", property: :promoting_committee_enabled
      field :signatureType, types.String, "Signature type of the initiative", property: :signature_type
    end
  end
end
