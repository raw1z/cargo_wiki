Given /^I see the two articles$/ do
  CargoWiki::Article.all.each do |article|
    within('.articles') do
      within("#article-#{article.id}") do
        page.should have_content(article.title)
        page.should have_content(article.author.username)
        page.should have_content(article.last_update_by.username)
      end
    end
  end
end

When /^I unpublish one of them$/ do
  @article_id = CargoWiki::Article.last.id
  within("#article-#{@article_id}") { click_link("Unpublish") }
end

Then /^I should be redirected to the articles index page$/ do
  current_path.should == "/cargo_wiki/articles"
end

Then /^I should see the unpublished article in the unpublished article list$/ do
  within('.unpublished-articles .list') do
    page.should have_css("#article-#{@article_id}")
  end
end

Then /^I should see the other one in the published articles list$/ do
  article = CargoWiki::Article.first
  within('.articles .list') do
    within("#article-#{article.id}") { page.should have_content(article.title) }
  end
end