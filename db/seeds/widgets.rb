User.find(:all).each do |user|
  if user.plugins.find_by_name('widgets').nil?
    user.plugins.create(:name => 'widgets',
                        :position => (user.plugins.maximum(:position) || -1) +1)
  end
end

#page = Page.create(
#  :title => 'Widgets',
#  :link_url => '/widgets',
#  :deletable => false,
#  :position => ((Page.maximum(:position, :conditions => {:parent_id => nil}) || -1)+1),
#  :menu_match => '^/widgets(\/|\/.+?|)$'
#)
#Page.default_parts.each do |default_page_part|
#  page.parts.create(:title => default_page_part, :body => nil)
#end
