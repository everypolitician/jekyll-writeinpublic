require 'test_helper'

class Jekyll::WriteinpublicTest < Minitest::Test
  def test_that_it_has_a_version_number
    refute_nil ::Jekyll::Writeinpublic::VERSION
  end

  def test_rendering_tag
    site = Jekyll::Site.new(Jekyll.configuration)
    site.config['writeinpublic'] = { 'subdomain' => 'testing' }
    template = '{% writeinpublic_link person.id %}Write to {{ person.name }}{% endwriteinpublic_link %}'
    tmpl = Liquid::Template.parse(template)
    tmpl.registers[:site] = site
    expected = %(<a href="http://testing.writeinpublic.com/en/write/who/?person_id=person/123abc">Write to Bob</a>)
    assert_equal expected, tmpl.render('person' => { 'id' => '123abc', 'name' => 'Bob' })
  end
end
