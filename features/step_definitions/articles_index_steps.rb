When /^I visit the articles index page$/ do
  visit '/cargo/articles'
end

Then /^I should see the articles list$/ do
  page.should have_content("Articles")
  within(".articles.list") do
    Cargo::Article.all.each do |article|
      within("#article-#{article.id}") do
        page.should have_content(article.title)
        page.should have_content(article.author.username)
        page.should have_content(article.last_update_by.username)
      end
    end
  end
end

Then /^I should be able to display the history for each article$/ do
  Cargo::Article.all.each do |article|
    within("#article-#{article.id} .actions") do
      page.should have_content('History')
    end
  end
end

Then /^I should not be able to add\/edit\/destroy an article$/ do
  page.should have_no_content('New Article')
  Cargo::Article.all.each do |article|
    within("#article-#{article.id} .actions") do
      page.should have_no_content('Edit')
      page.should have_no_content('Destroy')
    end
  end
end

Then /^I should be able to add\/edit\/destroy an article$/ do
  page.should have_content('New Article')
  Cargo::Article.all.each do |article|
    within("#article-#{article.id} .actions") do
      page.should have_content('Edit')
      page.should have_content('Destroy')
    end
  end
end

Then /^I should be able to add\/edit an article$/ do
  page.should have_content('New Article')
  Cargo::Article.all.each do |article|
    within("#article-#{article.id} .actions") do
      page.should have_content('Edit')
    end
  end
end

Then /^I should not be able to destroy an article$/ do
  Cargo::Article.all.each do |article|
    within("#article-#{article.id} .actions") do
      page.should have_no_content('Destroy')
    end
  end
end
