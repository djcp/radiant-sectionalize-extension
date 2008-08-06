require File.dirname(__FILE__) + '/../spec_helper'

describe 'SectionalizeTags' do
  scenario :pages
  describe '<r:in_section>' do
    it 'should identify us as being on the homepage' do
      tag = '<r:in_section/>'
      expected = "home"
      pages(:home).should render(tag).as(expected)
    end
  end
  describe '<r:in_section>' do
    it 'should identify us as being in the "parent" section' do
      tag = '<r:in_section/>'
      expected = "parent"
      pages(:child).should render(tag).as(expected)
    end
  end
  describe '<r:in_section>' do
    it 'should identify us as being in the "assorted" section' do
      tag = '<r:in_section/>'
      expected = "assorted"
      pages(:a).should render(tag).as(expected)
    end
  end
end

