module Admin
  class WidgetsController < Admin::BaseController

    crudify :widget

    def index
      search_all_widgets if searching?
      paginate_all_widgets

      render :partial => 'widgets' if request.xhr?
    end

    def new
      @widget = Widget.new
      @ups = UserPlugin.find(:all)
      @user_plugins = Array.new
      @ups.each do |plugin|
        p = Refinery::Plugins.registered.find_by_name(plugin.name)
#       @user_plugins << Refinery::Plugins.registered.find_by_name(plugin.name)
#        if p.activity.class.respond_to?('widget')
#            @user_plugins << p
#        end
#        @user_plugins.each do |p| 
#            p.activity.each do |a| 
#                if a.class.respond_to?('widget')
#                    @user_plugins << p
#                end
#            end
#        end

        p.activity.each do |a| 
            c = "#{a.class.name}sController"
            begin
                ci = Object.const_get(c)
                if ci.method_defined?(:widget)
                    @user_plugins << plugin
                end
            rescue
            end
        end

      end
      
    end
  end
end
