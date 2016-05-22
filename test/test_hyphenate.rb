# coding: utf-8
require "rubygems"
require "bundler/setup"
require_relative "../lib/jekyll/hyphenate_filter/hyphenator"
require "test/unit"

class TestHyphenate < Test::Unit::TestCase

  def test_no_sub_elements
    content = <<-EOS
    <p>The nested set however, has performance limitations on insert, update, and
delete. This arises because the nested set model encodes the hierarchy based on
what the set contains: when a node is inserted or deleted, all of the sets
containing the node must be updated as well. In other words, the encoding
depends on the current state of the database. This behavior makes the nested set
model less desirable for large, dynamic hierarchies. There are limitations</p>
    EOS
    expected = <<-EOS
    <p>The nested set how­ev­er, has per­for­mance lim­i­ta­tions on insert, update, and
delete. This arises because the nested set model encodes the hier­ar­chy based on
what the set con­tains: when a node is inserted or delet­ed, all of the sets
con­tain­ing the node must be updated as well. In other words, the encod­ing
depends on the cur­rent state of the data­base. This behav­ior makes the nested set
model less desir­able for large, dynamic hier­ar­chies. There are limitations</p>
EOS
    hyphenated = Jekyll::HyphenateFilter::Hyphenator.new.hyphenate(content)
    assert_equal(expected, hyphenated)
  end

  def test_with_tag
    content = <<-EOS
<p>The <a href="https://example.com/path/to/article?id=100" title="article name">nested set model</a>
is a convenient way to represent hierarchies in SQL. By
taking advantage of the set nature of relations, it provides quick and
relatively simple queries to determine, for example, all descendants of a given
node. Such queries are more computationally difficult using adjacency lists.</p>
    EOS
    expected = <<-EOS
<p>The <a href="https://example.com/path/to/article?id=100" title="article name">nested set model</a>
is a con­ve­nient way to rep­re­sent hier­ar­chies in SQL. By
tak­ing advan­tage of the set nature of rela­tions, it pro­vides quick and
rel­a­tively sim­ple queries to deter­mine, for exam­ple, all descen­dants of a given
node. Such queries are more com­pu­ta­tion­ally dif­fi­cult using adja­cency lists.</p>
    EOS
    hyphenated = Jekyll::HyphenateFilter::Hyphenator.new.hyphenate(content)

    assert_equal(expected, hyphenated)
  end

  def test_nested
    content = <<-EOS
<ul>
  <li>
    <p>Vadim Tropashko, <cite><a href="https://example.com/path/to/article?id=100" title="Tropashko on nested intervals">Trees in SQL: Nested Sets and Materialized Path</a></cite></p>
  </li>
  <li>
    <p>Vadim Tropashko, <cite><a href="https://example.com/path/to/article?id=200" title="Tropashko on relocating subtrees of nested intervals">Relocating Subtrees in Nested Intervals Model</a></cite></p>
  </li>
</ul>
EOS
    expected = <<-EOS
<ul>
  <li>
    <p>Vadim Tropashko, <cite><a href="https://example.com/path/to/article?id=100" title="Tropashko on nested intervals">Trees in SQL: Nested Sets and Mate­ri­al­ized Path</a></cite></p>
  </li>
  <li>
    <p>Vadim Tropashko, <cite><a href="https://example.com/path/to/article?id=200" title="Tropashko on relocating subtrees of nested intervals">Relo­cat­ing Sub­trees in Nested Inter­vals Model</a></cite></p>
  </li>
</ul>
EOS
    hyphenated = Jekyll::HyphenateFilter::Hyphenator.new(selector: "p").hyphenate(content)
    assert_equal(expected, hyphenated)
  end
  
end
