if rubyist_one = Rubyist.find_by_id(1)
  rubyist_one.update_attributes(:twitter_name => "yukihiro_matz") unless rubyist_one.twitter_name == "yukihiro_matz"
elsif matz = Rubyist.find_by_twitter_name("yukihiro_matz")
  matz.update_attributes(:id => 1) unless matz.id == 1
else
  matz = Rubyist.create(:twitter_name => "yukihiro_matz")
  matz.update_attributes(:id => 1) unless matz.id == 1
end
