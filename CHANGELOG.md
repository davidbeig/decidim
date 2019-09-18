# Change Log

## [Unreleased](https://github.com/decidim/decidim/tree/0.18-stable)

**Added**:

**Changed**:

**Fixed**:

- **decidim-participatory_processes**: BACKPORT Fix: ParticipatoryProcessSearch#search_date [#5326](https://github.com/decidim/decidim/pull/5326)
- **decidim-proposals**: Fix: prevent ransack gem to upgrade to 2.3 as breaks searches with amendments. [#5303](https://github.com/decidim/decidim/pull/5303)
- **decidim-admin**, **decidim-forms**: Fix adding answer options to a new form [#5283](https://github.com/decidim/decidim/pull/5283)
- **decidim-core**, **decidim-proposals**: When rendering the admin log for a Proposal, use the title from extras instead of crashing, when proposal has been deleted. [#5277](https://github.com/decidim/decidim/pull/5277)
- **decidim-core**: Fix CVE-2015-9284 Omniauth issue [#5287](https://github.com/decidim/decidim/pull/5287)

**Removed**:

## [0.18.0](https://github.com/decidim/decidim/tree/v0.18.0)

### Upgrade notes

#### Participants metrics

After running the migrations, you can run the following code from the console to recalculate participants metrics (they should increase). It may take a while to complete.

```ruby
days = (Date.parse(2.months.ago.to_s)..Date.yesterday).map(&:to_s)
Decidim::Organization.find_each do |organization|
  old_metrics = Decidim::Metric.where(organization: organization, metric_type: "participants")
  days.each do |day|
    new_metric = Decidim::Metrics::ParticipantsMetricManage.new(day, organization)
    ActiveRecord::Base.transaction do
      old_metrics.where(day: day).delete_all
      new_metric.save
    end
  end
end
```

**Added**:

- **decidim-surveys**: Added a setting to surveys to allow unregistered (aka: anonymous) users to answer a survey. [\#4996](https://github.com/decidim/decidim/pull/4996)
- **decidim-proposals**: Added a button to reset all participatory text drafts. [\#4814](https://github.com/decidim/decidim/pull/4814)
- **decidim-proposals** Add text formatting capabilities to MarkdownToProposals. [\#4837](https://github.com/decidim/decidim/pull/4837)
- **decidim-docs** Update dependencies and ruby version. [\#4812](https://github.com/decidim/decidim/pull/4812)
- **decidim-proposals** Lists are imported as a single proposal. [\#4780](https://github.com/decidim/decidim/pull/4780)
- **decidim-proposals**: Allow to persist participatory text drafts before publishing. [\#4808](https://github.com/decidim/decidim/pull/4808)
- **decidim-docs**: Some components.md corrections and a little more info related with modules and engines.. [\#4752](https://github.com/decidim/decidim/pull/4752)
- **decidim-proposals**: Add Participatory Text support for images in Markdown. [\#4791](https://github.com/decidim/decidim/pull/4791)
- **decidim-proposals**: In participatory texts it is better to render Article cards open by default. [\#4806](https://github.com/decidim/decidim/pull/4806)
- **decidim-proposals**: Add Participatory Text support for links in Markdown. [\#4790](https://github.com/decidim/decidim/pull/4790)
- **decidim-core**: User groups can now be disabled per organization. [\#4681](https://github.com/decidim/decidim/pull/4681/)
- **decidim-initiatives**: Add setting in `Decidim::InitiativesType` to restrict online signatures [\#4668](https://github.com/decidim/decidim/pull/4668)
- **decidim-verifications**: Add multitenant csv census verifications [\#4719](https://github.com/decidim/decidim/pull/4719)
- **decidim-initiatives**: Extend authorizations to resources not related with components and define initiatives vote authorizations on initiatives types [\#4747](https://github.com/decidim/decidim/pull/4747)
- **decidim-initiatives**: Add setting in `Decidim::InitiativesType` to set minimum commitee members before sending initiative to technical evaluation [\#4688](https://github.com/decidim/decidim/pull/4688)
- **decidim-initiatives**: Add option to initiative types to collect personal data on signature and make related changes in front [\#4690](https://github.com/decidim/decidim/pull/4690)
- **decidim-initiatives**: Implement a mechanism to store encrytped personal data of users on votes and decrypt it exporting to PDF [\#4716](https://github.com/decidim/decidim/pull/4716)
- **decidim-initiatives**: Add setting to initiatives types to enable a step to allow initiative signature after passing SMS verification mechanism [\#4792](https://github.com/decidim/decidim/pull/4792)
- **decidim-initiatives**: Allow integration of services to add timestamps and sign PDFs, define example services and use in application generator [\#4805](https://github.com/decidim/decidim/pull/4805)
- **decidim-initiatives**: Add setting to initiatives types to verify document number provided on votes and avoid duplicated votes with the same document [\#4794](https://github.com/decidim/decidim/pull/4794)
- **decidim-initiatives**: Add validation using metadata of authorization for handler defined to validate document mumber [\#4838](https://github.com/decidim/decidim/pull/4838)
- **decidim-initiatives**: Better admin initiative search [\#4845](https://github.com/decidim/decidim/pull/4845)
- **decidim-meetings**: Order meetings at admin [\#4844](https://github.com/decidim/decidim/pull/4844)
- **decidim-proposals** Add admin edit link for proposals [\#4843](https://github.com/decidim/decidim/pull/4843)
- **decidim-initiatives**: Add setting in `Decidim::InitiativesType` to enable users to undo their initiatives signatures. [\#4841](https://github.com/decidim/decidim/pull/4841)
- **decidim-initiatives**: Add author of initiative to committee members on creation. [\#4861](https://github.com/decidim/decidim/pull/4861)
- **decidim-initiatives**: Display state of initiative on edition form inside a disabled select. [\#4861](https://github.com/decidim/decidim/pull/4861)
- **decidim-initiatives**: Allow users report comments on initiatives and admins moderate reports from initiative admin panel. [\#4878](https://github.com/decidim/decidim/pull/4878)
- **decidim-admin**: Add css variables for multitenant custom colors. [\#4882](https://github.com/decidim/decidim/pull/4882)
- **decidim-verifications**: Allow definition of attributes in settings manifest to be required always on authorizations. [\#4911](https://github.com/decidim/decidim/pull/4911)
- **decidim-verifications**: Allow resending SMS code. [\#4928](https://github.com/decidim/decidim/pull/4928)
- **decidim-forms**: Add `:created_at` and `:id` to survey particpant answers (UserAnswersSerializer) [ \#4990](https://github.com/decidim/decidim/pull/4990)
- **decidim-forms** Render readonly questionnaire to non logged participants [\#4991](https://github.com/decidim/decidim/pull/4991)
- **decidim-consultations**, Add buttons fot better Questions navigation. [#5112](https://github.com/decidim/decidim/pull/5112)
- **decidim-core**, Add rake task to recalculate all metrics since some specific date. [#5117](https://github.com/decidim/decidim/pull/5117)
- **decidim-core**, Add instructions to recalculate participants metrics. [#5110](https://github.com/decidim/decidim/pull/5110)
- **decidim-core**, **decidim-admin**, Add Selective Newsletter and allow Space admins to manage them. [#5039](https://github.com/decidim/decidim/pull/5039)
- **decidim-core** Persistence related documentation for Metrics. [\#5108](https://github.com/decidim/decidim/pull/5108)
- **decidim-core** Add optional parameter :col_sep to CSV exporter [\#5089](https://github.com/decidim/decidim/pull/5089)
- **decidim-meetings** Let user groups join meetings [\#5060](https://github.com/decidim/decidim/pull/5060)
- **decidim-assemblies**, **decidim-participatory_processes** Reorganize admin form [\#5068](https://github.com/decidim/decidim/pull/5068)
- **decidim-assemblies**, **decidim-participatory_processes** Table headers sortable links [\#5010](https://github.com/decidim/decidim/pull/5010)
- **decidim-assemblies**, **decidim-participatory_processes** Filter spaces by scope and area [\#5047](https://github.com/decidim/decidim/pull/5047)
- **decidim-admin**: Do not allow to delete areas when they have dependent spaces. [#5041](https://github.com/decidim/decidim/pull/5041)
- **decidim-assemblies**, **decidim-conferences**, **decidim-participatory_processes** Space CTA button text changes when no components [\#5006](https://github.com/decidim/decidim/pull/5006)
- **decidim-participatory_processes**: Add a select field for assign an area to participatory processes [#5011](https://github.com/decidim/decidim/pull/5011)
- **decidim-accountability**: Also display the main scope as a filter for accountability results [#5022](https://github.com/decidim/decidim/pull/5022)
- **decidim-system**: Add custom SMTP settings for multitenant [#4698](https://github.com/decidim/decidim/pull/4698)
- **decidim-proposals**: Add proposal answers to the proposal export [#5139](https://github.com/decidim/decidim/pull/5139)
- **decidim-core**: Provide "good" password rules [#5106](https://github.com/decidim/decidim/pull/5106)

**Changed**:

- **decidim-accountability**, **decidim-core**, **decidim-proposals**: Improve UX for diff views of versions. [#5149](https://github.com/decidim/decidim/pull/5149)
- **decidim-core**: Allow for extension in Decidim::User::ROLES. [#5133](https://github.com/decidim/decidim/pull/5133)
- **decidim-core**: PermissionsRegistry introduced to enable reconfiguration of permission_class_chain. [#5069](https://github.com/decidim/decidim/pull/5069)
- **decidim-core**: Change attachment photo image alt texts to title instead of description. [#5043](https://github.com/decidim/decidim/pull/5043)
- **decidim-comments**: Allow cancelling a vote on a comment. [#5042](https://github.com/decidim/decidim/pull/5042)
- **decidim-initiatives**: Add styles inline in PDF document of signatures [#5103](https://github.com/decidim/decidim/pull/5103)
- **decidim-core**: Update nobspw [#5227](https://github.com/decidim/decidim/pull/5227)

**Fixed**:

- **decidim-admin**: Fix: Proposals component form introduced regression [\#5180](https://github.com/decidim/decidim/pull/5180)
- **decidim-admin**: Fix: Link `form.js` in `assets/config/decidim_admin_manifest.js` [\#5165](https://github.com/decidim/decidim/pull/5165)
- **decidim-core**: Fix: potential loop redirection when accepting TOS agreement on multi-languages sites [\#5162](https://github.com/decidim/decidim/pull/5162)
- **decidim-assemblies**: Fix: Include asterisk in the required field `position` for `AssemblyMemberForm`. [\#5164](https://github.com/decidim/decidim/pull/5164)
- **decidim-admin**: Fix: disallow enabling `ParticipatoryText` on component when there are proposals [\#5134](https://github.com/decidim/decidim/pull/5134)
- **decidim-meetings**: Fix registration form in duplicated meeting [\#5136](https://github.com/decidim/decidim/pull/5136)
- **decidim-meetings**: Fix meeting minutes related information in public view [\#5137](https://github.com/decidim/decidim/pull/5137)
- **decidim-meetings**: Fix `deliver_now` call on `send_email_confirmation` [\#5111](https://github.com/decidim/decidim/pull/5111)
- **decidim-admin**: fix Decidim::Admin::NewsletterRecipient query [\#5109](https://github.com/decidim/decidim/pull/5109)
- **decidim-proposals**: Fix participatory text form. [#5094](https://github.com/decidim/decidim/pull/5094)
- **decidim-assemblies**: Add class `card--stack` to assemblies when have children assemblies. [#5093](https://github.com/decidim/decidim/pull/5093)
- **decidim-proposals**: Fix proposal participants metrics. [#5048](https://github.com/decidim/decidim/pull/5048)
- **decidim-comments**: Don't show a second reply button when comment is hidden. [#5045](https://github.com/decidim/decidim/pull/5045)
- **decidim-core**: Fix CSS transparencies using customized colors. [\#5071](https://github.com/decidim/decidim/pull/5071)
- **decidim-core**, **decidim-proposals**: Fix: show existing amendments when amendments feature is disabled [\#5070](https://github.com/decidim/decidim/pull/5070)
- **decidim-assemblies**: Fix admin assemblies form. [\#5054](https://github.com/decidim/decidim/pull/5054)
- **decidim-core**: Fix repeated amendments notifications. [\#5001](https://github.com/decidim/decidim/pull/5001)
- **decidim-core**: Fix amendments forms: show error messages and render hashtags. [#4951](https://github.com/decidim/decidim/pull/4951)
- **decidim-comments**: Fixes that as a normal user (no private user) I can comment on a private assembly where is available. [#4924](https://github.com/decidim/decidim/pull/4924)
- **decidim-accountability**: Handle special case when all children weight are nil on accountability. [#5026](https://github.com/decidim/decidim/pull/5026)
- **decidim-proposals**: Filter emendations by rendering only amendments. [#5025](https://github.com/decidim/decidim/pull/5025)
- **decidim-proposals**: Add documents folder in proposals manifest for precompile assets. [#5015](https://github.com/decidim/decidim/pull/5015)
- **decidim-core**: Fix user notification and interest settings on IE11. [#5044](https://github.com/decidim/decidim/pull/5044)
- **decidim-admin**, **decidim-forms**, **decidim-meetings**: Fix dynamic fields components on IE11. [#5052](https://github.com/decidim/decidim/pull/5052)
- **decidim-core**: Fix possible NoMethodErrors in the notification jobs filling logs. [#5083](https://github.com/decidim/decidim/pull/5083)
- **decidim-participatory_processes**: Fix step CTA URL when abse URL had params [#5082](https://github.com/decidim/decidim/pull/5082)
- **decidim-admin**: Ensure static pages slugs are relative paths [#5085](https://github.com/decidim/decidim/pull/5085)
- **decidim-accountability**: Remove useless button on the admin page for accountability statuses [#5099](https://github.com/decidim/decidim/pull/5099)
- **decidim-budgets**: Fix import of proposals to budget projects [#5097](https://github.com/decidim/decidim/pull/5097)
- **decidim-core**: Escape fingerprint content [#5146](https://github.com/decidim/decidim/pull/5146)
- **decidim-initiatives**: Escape hashtag content [#5150](https://github.com/decidim/decidim/pull/5150)
- **decidim-core**: Fix seeds and typo in ActionAuthorizer [#5168](https://github.com/decidim/decidim/pull/5168)
- **decidim-proposals**: Fix seeds [#5168](https://github.com/decidim/decidim/pull/5168)
- **decidim-core**: Fix user names migration [#5210](https://github.com/decidim/decidim/pull/5210)
- **decidim-core**: Fix empty sender SMTP settings [#5260](https://github.com/decidim/decidim/pull/5260)

**Removed**:

## Previous versions

Please check [0.17-stable](https://github.com/decidim/decidim/blob/0.17-stable/CHANGELOG.md) for previous changes.
