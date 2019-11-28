# frozen_string_literal: true

module Decidim
  module Assemblies
    # This type represents a assembly.
    AssemblyMemberType = GraphQL::ObjectType.define do
      name "AssemblyMember"
      description "An assembly member"

      field :id, types.Int, ""
      field :fullName, types.String, "", property: :full_name
      field :position, Decidim::Core::TranslatedFieldType, ""

      field :user, Decidim::Core::UserType do
        resolve ->(obj, _, _) { Decidim::User.find_by(id: obj.decidim_user_id) }
      end

      field :createdAt, Decidim::Core::DateTimeType, "", property: :created_at
      field :updatedAt, Decidim::Core::DateTimeType, "", property: :updated_at

      field :weight, types.Int, ""
      field :gender, types.String, ""
      field :birthday, Decidim::Core::DateType, ""
      field :birthplace, types.String, ""
      field :designation_date, Decidim::Core::DateType, "", property: :designation_date
      field :designation_mode, types.String, "", property: :designation_mode
      field :position_other, types.String, "", property: :position_other
      field :ceased_date, Decidim::Core::DateType, "", property: :ceased_date

      # These fields may be private:
      # decidim_participatory_process_group_id
      # decidim_organization_id
      # private_space
    end
  end
end
