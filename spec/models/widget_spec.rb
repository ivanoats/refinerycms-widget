require 'spec_helper'

describe Widget do

  def reset_widget(options = {})
    @valid_attributes = {
      :id => 1
    }

    @widget.destroy! if @widget
    @widget = Widget.create!(@valid_attributes.update(options))
  end

  before(:each) do
    reset_widget
  end

  context "validations" do
    
  end

end