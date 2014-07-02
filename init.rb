require 'redmine'
require_dependency 'private_wiki/hook'

Rails.configuration.to_prepare do

  require_dependency 'wiki'
  unless Wiki.included_modules.include? PrivateWiki::WikiPatch
    Wiki.send(:include, PrivateWiki::WikiPatch)
  end

  require_dependency 'wiki_page'
  unless WikiPage.included_modules.include? PrivateWiki::WikiPagePatch
    WikiPage.send(:include, PrivateWiki::WikiPagePatch)
  end

  require_dependency 'wiki_controller'
  unless WikiController.included_modules.include? PrivateWiki::WikiControllerPatch
    WikiController.send(:include, PrivateWiki::WikiControllerPatch)
  end

  require_dependency "wikis_controller"
  unless WikisController.included_modules.include? PrivateWiki::WikisControllerPatch
    WikisController.send(:include, PrivateWiki::WikisControllerPatch)
  end

  require_dependency "search_controller"
  unless SearchController.included_modules.include? PrivateWiki::SearchControllerPatch
    SearchController.send(:include, PrivateWiki::SearchControllerPatch)
  end

  unless Redmine::WikiFormatting::Macros::Definitions.included_modules.include? PrivateWiki::MacrosPatch
    Redmine::WikiFormatting::Macros::Definitions.send(:include, PrivateWiki::MacrosPatch)
  end
end

Redmine::Plugin.register :redmine_private_wiki do
  name 'Private Wiki'
  author 'Oleg Kandaurov'
  description 'Adds private pages to wiki'
  version '0.2.2'
  author_url 'http://f0y.me'
  requires_redmine :version_or_higher => '2.1.0'

  project_module :wiki do
    permission :view_private_wiki_pages, {}
    permission :manage_private_wiki_pages, {:wiki => :change_privacy}, :require => :member
  end

end
