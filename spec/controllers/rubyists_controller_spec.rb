require File.expand_path(File.join(File.dirname(__FILE__), '..', 'spec_helper.rb'))

describe RubyistsController do
  describe "#index" do
    before do
      3.times { Factory(:rubyist) }
      get :index
    end
    it "should be successful" do
      response.should be_success
    end
    it "should assign the rubyists variable" do
      assigns(:rubyists).should_not be_nil
      assigns(:rubyists).length.should == 4 # matz always exists
    end
  end

  describe "#show" do
    before do
      @rubyist = Factory(:rubyist)
      get :show, "id" => @rubyist.id.to_s
    end
    it "should be successful" do
      response.should be_success
    end
    it "should assign the @rubyist and @updates variables" do
      assigns(:rubyist).should_not be_nil
      assigns(:rubyist).should == @rubyist
      assigns(:updates).should_not be_nil
      assigns(:updates).should == @rubyist.status_updates
    end
  end
end
