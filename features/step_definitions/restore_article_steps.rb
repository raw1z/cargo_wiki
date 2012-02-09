Given /^I see the unpublished article in the unpublished article list$/ do
  within('.unpublished-articles .list') do
    page.should have_css("#article-#{@article_id}")
  end
end

When /^I restore it$/ do
  within("#article-#{@article_id}") do
    click_link "Publish"
  end
end

Then /^I should see the (\d+) articles in the published articles list$/ do |arg1|
  within(".articles .list") do
    CargoWiki::Article.all.each do |article|
      within("#article-#{article.id}") do
        page.should have_content(article.title)
        page.should have_content(article.author.username)
        page.should have_content(article.last_update_by.username)
      end
    end
  end
end