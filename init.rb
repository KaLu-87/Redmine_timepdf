# Registers the plugin and its settings/permissions with Redmine.
require_relative 'lib/timepdf/hooks'

module Timepdf
  CANONICAL_PLUGIN_IDENTIFIER = :redmine_timepdf
  PLUGIN_IDENTIFIER = File.basename(File.expand_path(__dir__)).to_sym
end

if Timepdf::PLUGIN_IDENTIFIER != Timepdf::CANONICAL_PLUGIN_IDENTIFIER
  Rails.logger.warn("[timepdf] plugin directory '#{Timepdf::PLUGIN_IDENTIFIER}' differs from canonical '#{Timepdf::CANONICAL_PLUGIN_IDENTIFIER}'.")
end

Redmine::Plugin.register Timepdf::PLUGIN_IDENTIFIER do
  name 'Time PDF Export'
  author 'KLu – with AI assistance'
  description 'Export the Spent time list as a formatted PDF using current filters/columns/grouping.'
  version '0.3.8'
  requires_redmine version_or_higher: '6.0.0'

  project_module :timepdf do
    permission :export_spenttime_pdf, { timepdf: [:export] }, require: :member
  end

  settings default: { 'logo_path' => '' }, partial: 'settings/timepdf_settings'
end
