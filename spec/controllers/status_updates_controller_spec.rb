require File.expand_path(File.join(File.dirname(__FILE__), '..', 'spec_helper.rb'))

describe StatusUpdatesController do
  describe "#edit" do
    before do
      @update = Factory(:status_update)
      get :edit, "id" => @update.id.to_s
    end
    it "should be successful" do
      response.should be_success
    end
    it "should assign the status_update variable" do
      assigns(:status_update).should_not be_nil
      assigns(:status_update).should == @update
    end
  end

  describe "#edit_notes" do
    before do
      @update = Factory(:status_update)
      get :edit_notes, "id" => @update.id.to_s
    end
    it "should be successful" do
      response.should be_success
    end
    it "should assign status_update and textarea_rows" do
      assigns(:status_update).should_not be_nil
      assigns(:status_update).should == @update
      assigns(:textarea_rows).should_not be_nil
    end
  end

  describe "#update" do
    before do
      @update = Factory(:status_update)
      @new_translation = "new translation text"
      @update.translated_text.should_not == @new_translation
      put :update, "id" => @update.id.to_s, "status_update"=> {"translated_text" => @new_translation}
    end
    it "should be successful" do
      response.should be_success
    end
    it "should update the translation" do
      StatusUpdate.find_by_id(@update.id).translated_text.should == @new_translation
    end
  end

  describe "#update_notes" do
    before do
      @update = Factory(:status_update)
      @new_notes = "new translation notes"
      @update.translation_notes.should_not == @new_notes
      put :update_notes, "id" => @update.id.to_s, "status_update" => { "translation_notes" => @new_notes }
    end
    it "should be successful" do
      response.should be_success
    end
    it "should update the notes" do
      StatusUpdate.find_by_id(@update.id).translation_notes.should == @new_notes
    end
  end

  describe "#add_vote" do
    before do
      @update = Factory(:status_update)
      get :add_vote, "id" => @update.id.to_s
    end
    it "should be successful" do
      response.should be_success
    end
    it "should add a vote to the update" do
      StatusUpdate.find_by_id(@update.id).votes.length.should == 1
    end
  end

  describe "#interesting" do
    before do
      @first_update = Factory(:status_update)
      5.times { @first_update.votes << Vote.new(:vote => true) }
      @third_update = Factory(:status_update)
      2.times { @third_update.votes << Vote.new(:vote => true) }
      @second_update = Factory(:status_update)
      4.times { @second_update.votes << Vote.new(:vote => true) }
      5.times { Factory(:status_update) } # no votes
      get :interesting
    end
    it "should be successful" do
      response.should be_success
    end
    it "should assign the @status_updates variable" do
      assigns(:status_updates).should_not be_nil
    end
    it "should only return updates with votes" do
      assigns(:status_updates).length.should == 3
    end
    it "should order the updates by votes" do
      assigns(:status_updates)[0].should == @first_update
      assigns(:status_updates)[1].should == @second_update
      assigns(:status_updates)[2].should == @third_update
    end
  end

  describe "#ruby_related" do
    before do
      @first_update = Factory(:status_update, :original_text => "Ruby related")
      5.times { Factory(:status_update) } # not ruby-related
      @third_update = Factory(:status_update, :original_text => "also ruby-related")
      @second_update = Factory(:status_update, :original_text => "rubyist related")
      get :ruby_related
    end
    it "should be successful" do
      response.should be_success
    end
    it "should assign the @status_updates variable" do
      assigns(:status_updates).should_not be_nil
    end
    it "should only return updates about ruby" do
      assigns(:status_updates).length.should == 3
      assigns(:status_updates).should include(@first_update)
      assigns(:status_updates).should include(@second_update)
      assigns(:status_updates).should include(@third_update)
    end
  end

end
