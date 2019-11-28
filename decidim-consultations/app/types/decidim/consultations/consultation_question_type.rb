# frozen_string_literal: true

module Decidim
  module Consultations
    # This type represents a consultation.
    ConsultationQuestionType = GraphQL::ObjectType.define do
      interfaces [
        -> { Decidim::Core::ScopableInterface },
        -> { Decidim::Core::AttachableInterface },
        -> { Decidim::Comments::CommentableInterface }
      ]

      name "ConsultationQuestion"
      description "A consultation question"

      field :id, !types.ID, ""
      field :title, Decidim::Core::TranslatedFieldType, ""
      field :subtitle, Decidim::Core::TranslatedFieldType, "The subtitle of this question"
      field :slug, !types.String
      field :createdAt, !Decidim::Core::DateTimeType, "The time this question was created", property: :created_at
      field :updatedAt, !Decidim::Core::DateTimeType, "The time this question was updated", property: :updated_at
      field :publishedAt, !Decidim::Core::DateTimeType, "The time this question was updated", property: :published_at

      field :components, types[Decidim::Core::ComponentInterface] do
        description "Lists the components this space contains."

        resolve ->(participatory_space, _args, _ctx) {
                  Decidim::Component.where(
                    participatory_space: participatory_space
                  ).published
                }
      end

      field :bannerImage, types.String, "The banner image for this question", property: :banner_image
      field :heroImage, types.String, "", property: :hero_image

      field :whatIsDecided, Decidim::Core::TranslatedFieldType, "", property: :what_is_decided
      field :promoterGroup, Decidim::Core::TranslatedFieldType, "", property: :promoter_group
      field :participatoryScope, Decidim::Core::TranslatedFieldType, "", property: :participatory_scope
      field :questionContext, Decidim::Core::TranslatedFieldType, "", property: :question_context
      field :reference, types.String, "", property: :reference
      field :hashtag, types.String, "", property: :hashtag
      field :votesCount, types.Int, "", property: :votes_count
      field :originScope, Decidim::Core::TranslatedFieldType, "", property: :origin_scope
      field :originTitle, Decidim::Core::TranslatedFieldType, "", property: :origin_title
      field :originUrl, types.String, "", property: :origin_url
      field :iFrameUrl, types.String, "", property: :i_frame_url
      field :externalVoting, types.Boolean, "", property: :external_voting
      field :responsesCount, types.Int, "", property: :responses_count
      field :order, types.Int, "", property: :order
      field :maxVotes, types.Int, "", property: :max_votes
      field :minVotes, types.Int, "", property: :min_votes
      field :responseGroupsCount, types.Int, "", property: :response_groups_count
      field :instructions, Decidim::Core::TranslatedFieldType, "", property: :instructions

      # These fields may be private:
      # decidim_participatory_process_group_id
      # decidim_organization_id
      # private_space
    end
  end
end
