require 'i18n'

module Jekyll
  module L10nFilter
    def localize(input, format=nil)
      load_translations
      format = (format =~ /^:(\w+)/) ? $1.to_sym : format
      I18n.l input, :format => format
    end

    def load_translations
      unless I18n::backend.instance_variable_get(:@translations)
        I18n.enforce_available_locales = false
        I18n.backend.load_translations Dir[File.join(File.dirname(__FILE__),'../_locales/*.yml')]
        I18n.locale = Jekyll.configuration({})['locale']
      end
    end
  end
end

Liquid::Template.register_filter(Jekyll::L10nFilter)
