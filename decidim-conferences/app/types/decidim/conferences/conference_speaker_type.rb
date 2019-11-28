# frozen_string_literal: true

module Decidim
  module Conferences
    # This type represents a conference.
    ConferenceSpeakerType = GraphQL::ObjectType.define do
      name "ConferenceSpeakerType"
      description "A conference speaker"

      field :id, types.Int, ""
      field :fullName, types.String, "", property: :full_name
      field :position, Decidim::Core::TranslatedFieldType, ""
      field :affiliation, Decidim::Core::TranslatedFieldType, ""
      field :twitterHandle, types.String, "", property: :twitter_handle
      field :shortBio, Decidim::Core::TranslatedFieldType, "", property: :short_bio
      field :personalUrl, types.String, "", property: :personal_url
      field :avatar, types.String, ""
      field :user, Decidim::Core::UserType do
        resolve ->(obj, _, _) { Decidim::User.find_by(id: obj.decidim_user_id) }
      end

      field :createdAt, Decidim::Core::DateTimeType, "", property: :created_at
      field :updatedAt, Decidim::Core::DateTimeType, "", property: :updated_at

      # These fields may be private:
      # decidim_participatory_process_group_id
      # decidim_organization_id
      # private_space
    end
  end
end
