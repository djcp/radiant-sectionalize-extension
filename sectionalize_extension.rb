# Uncomment this if you reference any of your controllers in activate
# require_dependency 'application'

class SectionalizeExtension < Radiant::Extension
  version "0.1"
  description "A set of Radius tags to help manage a Radiant site in sections for easier CSS layouts."
  url "http://github.com/djcp/radiant-sectionalize-extension/tree/master"
  
  def activate
    Page.send :include, SectionalizeTags
  end
  
  def deactivate
  end
  
end
