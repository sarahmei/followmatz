require File.expand_path(File.join(File.dirname(__FILE__), '..', 'spec_helper.rb'))

describe StatusUpdate do
  describe "validations" do
    it { should belong_to(:rubyist) }
  end
end