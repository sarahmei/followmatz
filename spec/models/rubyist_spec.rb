require File.expand_path(File.join(File.dirname(__FILE__), '..', 'spec_helper.rb'))

describe Rubyist do
  describe "validations" do
    it { should have_many(:status_updates, :order => "twitter_date DESC") }
  end
end