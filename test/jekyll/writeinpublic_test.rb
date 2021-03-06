require 'test_helper'

class Jekyll::WriteinpublicTest < Minitest::Test
  def test_that_it_has_a_version_number
    refute_nil ::Jekyll::Writeinpublic::VERSION
  end

  def site
    @site ||= Jekyll::Site.new(Jekyll.configuration)
  end

  def template
    @template ||= '{% writeinpublic_link person.id %}Write to {{ person.name }}{% endwriteinpublic_link %}'
  end

  def tmpl
    @tmpl ||= Liquid::Template.parse(template).tap do |t|
      t.registers[:site] = site
    end
  end

  def test_rendering_tag
    site.config['writeinpublic'] = { 'subdomain' => 'testing' }
    expected = %(<a href="http://testing.writeinpublic.com/en/write/who/?person_id=person/123abc" >Write to Bob</a>)
    assert_equal expected, tmpl.render('person' => { 'id' => '123abc', 'name' => 'Bob' })
  end

  def test_renders_nothing_when_disabled
    site.config['writeinpublic'] = { 'subdomain' => 'testing', 'disabled' => true }
    assert_equal '', tmpl.render('person' => { 'id' => '123abc', 'name' => 'Bob' })
  end

  def test_rendering_html_attributes
    @template = '{% writeinpublic_link person.id class: "foo bar" %}Write to {{ person.name }}{% endwriteinpublic_link %}'
    site.config['writeinpublic'] = { 'subdomain' => 'testing' }
    expected = %(<a href="http://testing.writeinpublic.com/en/write/who/?person_id=person/123abc" class="foo bar">Write to Bob</a>)
    assert_equal expected, tmpl.render('person' => { 'id' => '123abc', 'name' => 'Bob' })
  end
end
