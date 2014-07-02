module PrivateWiki
  class PrivateWikiHook < Redmine::Hook::ViewListener
    render_on :view_layouts_base_html_head, :partial => 'hooks/html_header'
    render_on :view_layouts_base_body_bottom, :partial => 'hooks/body_bottom'
    render_on :view_projects_settings_wiki, :partial => 'hooks/private_wiki_input'
  end
end