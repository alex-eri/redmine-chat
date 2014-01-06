module ChatPlugin
  class Hooks < Redmine::Hook::ViewListener
#    def view_projects_show_sidebar_bottom(context={})
#      @messages = Messages.all
#      puts @messages
#      context[:controller].send(:render, { :partial => 'hooks/chat/sidebar', :params => {:messages => @messages} })
#    end
#    render_on :view_projects_show_sidebar_bottom,
#              :partial => 'hooks/chat/sidebar'
#    render_on :view_issues_sidebar_issues_bottom,
#              :partial => 'hooks/chat/sidebar'

    def view_layouts_base_sidebar(context={})
      @project = context[:project]
      unless context[:project].nil?
        context[:controller].send(:render, { :partial => 'hooks/chat/sidebar'})
      else 
        ''
      end
    end

#    render_on :view_layouts_base_sidebar,
#              :partial => 'hooks/chat/sidebar'
  end
end
