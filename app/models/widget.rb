class Widget < ActiveRecord::Base
  belongs_to :user_plugin
  # def title was created automatically because you didn't specify a string field
  # when you ran the refinery_engine generator. Love, Refinery CMS.
  def title
    self.user_plugin.name
    #"Override def title in vendor/engines/widgets/app/models/widget.rb"
  end
  
end
