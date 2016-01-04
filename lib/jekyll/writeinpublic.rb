require 'jekyll/writeinpublic/version'

require 'jekyll'

module Jekyll
  module Writeinpublic
    class LinkBlock < Liquid::Block
      SYNTAX = /(#{Liquid::QuotedFragment}+)?/

      def initialize(tag_name, markup, tokens)
        super
        @attributes = {}

        # Parse parameters
        if markup =~ SYNTAX
          markup.scan(Liquid::TagAttributes) do |key, value|
            @attributes[key] = value.gsub(/("|')/, '')
          end
        end
        @person_id = markup.split(' ').first
      end

      def render(context)
        site = context.registers[:site]
        writeinpublic = site.config['writeinpublic']
        return unless writeinpublic && writeinpublic.key?('subdomain')
        return if writeinpublic['disabled']
        person_id = context[@person_id]
        %(<a href="#{link(writeinpublic['subdomain'], person_id)}" #{html_attributes}>#{super}</a>)
      end

      def html_attributes
        @attributes.map { |k, v| %(#{k}="#{v}") }.join(' ')
      end

      def link(subdomain, person_id)
        "http://#{subdomain}.writeinpublic.com/en/write/who/?person_id=person/#{person_id}"
      end
    end
    Liquid::Template.register_tag('writeinpublic_link', LinkBlock)
  end
end
