require 'i18n'

I18n.enforce_available_locales = false
I18n.backend.load_translations Dir[File.join(File.dirname(__FILE__),'../_locales/*.yml')]

module Jekyll
  module L10nFilter
    def localize(input, format=nil)
      format = (format =~ /^:(\w+)/) ? $1.to_sym : format
      I18n.locale = Jekyll.configuration({})['locale']
      I18n.l input, :format => format
    end
  end
end

Liquid::Template.register_filter(Jekyll::L10nFilter)
