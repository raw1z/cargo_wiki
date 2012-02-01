When /^I select this article$/ do
  @article = Cargo::Article.last
  within("#article-#{@article.id}") do
    click_link(@article.title)
  end
end

Then /^I should be redirected to the article show page$/ do
  current_path.should == "/cargo/articles/#{@article.id}"
end

Then /^I should see the title of the article$/ do
  page.should have_content(@article.title)
end

Then /^I should see the body of the article$/ do
  page.should have_content(@article.body)
end

Then /^I should be able to display the history of the article$/ do
  within('.toolbar') do
    page.should have_content('History')
  end
end

Then /^I should be able to go back to the articles index page$/ do
  within('.toolbar') do
    page.should have_content('Back to articles')
  end
end

Then /^I should not be able to edit the article$/ do
  within('.toolbar') do
    page.should have_no_content('Edit')
  end
end

Then /^I should be able to edit the article$/ do
  within('.toolbar') do
    page.should have_content('Edit')
  end
end

Then /^I should not be able to destroy the article$/ do
  within('.toolbar') do
    page.should have_no_content('Destroy')
  end
end

Then /^I should be able to destroy the article$/ do
  within('.toolbar') do
    page.should have_content('Destroy')
  end
end