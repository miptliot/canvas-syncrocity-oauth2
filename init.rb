Rails.configuration.to_prepare do

  Canvas::Plugin.register :synchrocity_oauth, :auth_system, {
          :name => proc { I18n.t(:synchrocity_name, 'OAuth2 Authorization for Synchrocity') },
          :author => 'Artur Komarov',
          :description => 'This enables OAuth2 Login with Synchrocity to Canvas.',
          :version => '1.0.0',
          :select_text => proc { I18n.t(:synchrocity_file_description, 'Synchrocity') },
  }
end
