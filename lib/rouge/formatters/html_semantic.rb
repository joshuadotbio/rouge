# -*- coding: utf-8 -*- #
# frozen_string_literal: true

# stdlib
require 'cgi'

module Rouge
  module Formatters
    # Transforms a token stream into HTML output.
    class HTMLSemantic < Formatter
      tag 'html_semantic'

      # @option opts [String] :css_class ('highlight')
      #
      # Initialize with options.
      #
      #
      def initialize(opts={})
        @css_class = opts.fetch[:css_class]
      end

      def stream(tokens, &b)
        yield %(<pre class="#{@css_class}"><code>)
        @inner.stream(tokens, &b)
        yield "</code></pre>"
      end
    end
  end
end
