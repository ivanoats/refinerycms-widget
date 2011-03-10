# Widgets engine for Refinery CMS.

## Under developpement actually
I will write a better readme when I have more time

## If someone wants to try
You need to add in your ApplicationController

    before_filter :sidebar_widget

    def sidebar_widget
      @widgets = Widget.order(:position)
      @widgets.each do |plugin|
        p = Refinery::Plugins.registered.find_by_name(plugin.user_plugin.name)

        p.activity.each do |a| 
            c = "#{a.class.name}sController"
            begin
              ci = Object.const_get(c)
              if ci.method_defined?(:widget)
                obj = ci.new
                obj.widget()
              end
            rescue
            end
          end
        end
    end


## How to build this engine as a gem

    cd vendor/engines/refinerycms-widgets
    gem build refinerycms-widgets.gempspec
    gem install refinerycms-widgets.gem
    
    # Sign up for a http://rubygems.org/ account and publish the gem
    gem push refinerycms-widgets.gem
