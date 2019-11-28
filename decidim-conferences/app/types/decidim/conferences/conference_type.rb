# frozen_string_literal: true

module Decidim
  module Conferences
    # This type represents a conference.
    ConferenceType = GraphQL::ObjectType.define do
      interfaces [
        -> { Decidim::Core::ParticipatorySpaceInterface },
        -> { Decidim::Core::ScopableInterface }
      ]

      name "Conference"
      description "A conference"

      field :subtitle, Decidim::Core::TranslatedFieldType, "The subtitle of this conference"
      field :shortDescription, Decidim::Core::TranslatedFieldType, "The sort description of this conference", property: :short_description
      field :description, Decidim::Core::TranslatedFieldType, "The description of this conference"
      field :slug, types.String, "The slug of this conference"
      field :hashtag, types.String, "The hashtag for this conference"
      field :slogan, Decidim::Core::TranslatedFieldType, "The slogan of the conference"
      field :location, types.String, "The location of this conference"
      field :createdAt, Decidim::Core::DateTimeType, "The time this conference was created", property: :created_at
      field :updatedAt, Decidim::Core::DateTimeType, "The time this conference was updated", property: :updated_at
      field :publishedAt, Decidim::Core::DateTimeType, "The time this conference was updated", property: :published_at
      field :reference, types.String, "Reference prefix for this conference"

      field :heroImage, types.String, "The hero image for this conference", property: :hero_image
      field :bannerImage, types.String, "The banner image for this conference", property: :banner_image
      field :promoted, types.Boolean, "If this conference is promoted (therefore in the homepage)"
      field :objectives, Decidim::Core::TranslatedFieldType, "The objectives of the conference"
      field :showStatistics, types.Boolean, "If this conference shows the statistics", property: :show_statistics
      field :startDate, Decidim::Core::DateType, "The time this conference was created", property: :start_date
      field :endDate, Decidim::Core::DateType, "The time this conference was updated", property: :end_date
      field :registrationsEnabled, types.Boolean, "If the registrations are enabled in this conference", property: :registrations_enabled
      field :availableSlots, types.Int, "The number of available slots in this conference", property: :available_slots
      field :registrationTerms, Decidim::Core::TranslatedFieldType, "The registration terms of this conference", property: :registration_terms

      field :speakers, types[Decidim::Conferences::ConferenceSpeakerType], ""
      field :partners, types[Decidim::Conferences::ConferencePartnerType], ""
      field :categories, types[Decidim::Core::CategoryType], ""
      field :conferenceRegistrations, types[Decidim::Conferences::ConferenceRegistrationType], "", property: :conference_registrations
      field :mediaLinks, types[Decidim::Conferences::ConferenceMediaLinkType], "", property: :media_links
      field :registrationTypes, types[Decidim::Conferences::ConferenceRegistrationTypeType], "", property: :registration_types

      # These fields may be private:
      # decidim_participatory_process_group_id
      # decidim_organization_id
      # private_space
    end
  end
end
