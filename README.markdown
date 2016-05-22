# Jekyll HyphenateFilter

Jekyll Liquid filter to apply [Text::Hyphen][] to content.

[text::hyphen]: https://github.com/halostatue/text-hyphen

## Installation

Install the `jekyll-hyphenate_filter` gem in a [Jekyll-approved
manner](https://jekyllrb.com/docs/plugins/#installing-a-plugin).

## Use

To hyphenate content, you can use the filter like this:

    {{ content | hyphenate }}

## Configuration

There are a few configurable parameters which control hyphenation behavior.
These parameters are `language`, `left`, and `right`. These take the same
values as [Text::Hyphen][]. In brief:

 * `language` - language of the content. Defaults to `en_us`.
 * `left` - minimum number of characters to the left of the hyphen.
   Defaults to 2.
 * `right` - minimum number of characters to the right of the hyphen.
   Defaults to 2.

In addition, you can specify the string used to indicate hyphenation points
with the `hyphen` parameter. The default is the UTF-8 soft-hyphen character
(Unicode code U+00AD). Note that this is the UTF-8 character, not an entity.

You can update `_config.yml` to set these parameters. For example:

    hyphenate_filter:
      language: en_uk
      left: 4
      right: 3
      hyphen: "&shy;"

This configuration sets the language to UK English, with a minimum of 4
characters to the left of the hyphenation, minimum 3 characters to the right,
and the HTML entity `&shy;` to indicate hyphenation points.

## Notes

HyphenateFilter builds upon the [Jekyll::HyphenateFilter][] from
[Jekyll plugins by Aucor][aucor-jekyll-plugins].

Two behavior differences between the Aucor Oy filter (as of 2013-09-20) and the
one provided here:

 * This filter will descend into subelements (such as tags). Paragraphs
   containing tags is effectively skipped by the Aucor Oy filter.
 * The Aucor Oy filter rightly does not hyphenate the final word of a paragraph.
   However, all instances of that word in the paragraph will not be hyphenated.
   This filter does not special case the final word in the paragraph: all words
   are subject to the hyphenation rules.

[Jekyll::HyphenateFilter]: https://github.com/aucor/jekyll-plugins/blob/1bbc2aeacc24c816a0f1cad74c71f3ccd4eb307b/hyphenate.rb
[aucor-jekyll-plugins]: https://github.com/aucor/jekyll-plugins

## Copyright

Copyright 2016 Michael Glaesemann. Released under the MIT License (see LICENSE
for details).
