Rails.configuration.to_prepare do

  Canvas::Plugin.register :syncrocity_oauth, :auth_system, {
          :name => proc { I18n.t(:syncrocity_name, 'OAuth2 Authorization for Syncrocity') },
          :author => 'Artur Komarov',
          :description => 'This enables OAuth2 Login with Syncrocity to Canvas.',
          :version => '1.0.0',
          :select_text => proc { I18n.t(:synchrocity_file_description, 'Syncrocity') },
  }
end
