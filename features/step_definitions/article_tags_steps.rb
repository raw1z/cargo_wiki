Given /^I tag the article with "(.*)"$/ do |tags|
  fill_in 'article_tag_list', :with => tags
end

Then /^I should see the tags$/ do
  within('.article .tags_list') do
    ActsAsTaggableOn::Tag.all.each do |tag|
      page.should have_selector('.tag', :text => tag.name)
    end
  end
end