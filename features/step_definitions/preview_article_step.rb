When /^I click on 'Preview'$/ do
  click_link "Preview"
end

Then /^I should see a preview of new body$/ do
  within('#article-preview .body') do
    page.should have_content('Lorem ipsum dolor sit amet.')
  end
end

Given /^I see a preview of new body$/ do
  within('#article-preview .body') do
    page.should have_content('Lorem ipsum dolor sit amet.')
  end
end

When /^I click on 'Back to Edit'$/ do
  click_link 'Back to Edit'
end

Then /^the preview should be hidden$/ do
  page.should_not have_selector('#article-preview')
end

Then /^I should see the edit form again$/ do
  within('form.article') do
    page.should have_selector('textarea#article_body', :value => "Lorem ipsum dolor sit amet.")
  end
end