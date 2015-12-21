require 'jekyll/writeinpublic/version'

require 'jekyll'

module Jekyll
  module Writeinpublic
    class LinkBlock < Liquid::Block
      def initialize(tag_name, markup, tokens)
        super
        @markup = markup.strip
      end

      def render(context)
        site = context.registers[:site]
        writeinpublic = site.config['writeinpublic']
        return unless writeinpublic && writeinpublic.key?('subdomain')
        return if writeinpublic['disabled']
        person_id = context[@markup]
        %(<a href="#{link(writeinpublic['subdomain'], person_id)}">#{super}</a>)
      end

      def link(subdomain, person_id)
        "http://#{subdomain}.writeinpublic.com/en/write/who/?person_id=person/#{person_id}"
      end
    end
    Liquid::Template.register_tag('writeinpublic_link', LinkBlock)
  end
end
