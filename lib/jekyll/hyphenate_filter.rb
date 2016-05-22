require_relative "hyphenate_filter/hyphenator"

module Jekyll
  module HyphenateFilter
    def hyphenate(content)
      config = @context.registers[:site].config['hyphenate_filter'] || {}
      config = {'language' => 'en_us',
                'left' => 2,
                'right' => 2,
                'hyphen' => Hyphenator::SOFT_HYPHEN_CHAR,
                'selector' => 'p'}.merge!(config)
      hyphenator = Hyphenator.new(language: config['language'],
                                  left: config['left'],
                                  right: config['right'],
                                  hyphen: config['hyphen'],
                                  selector: config['selector'])
      hyphenator.hyphenate(content)
    end
  end
end

Liquid::Template.register_filter(Jekyll::HyphenateFilter)
