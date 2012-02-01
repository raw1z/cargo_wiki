Given /^I changed the title of one of them$/ do
  step %{I visit its show page}
  step %{I click on 'Edit'}
  step %{I change the title to 'New Title'}
  step %{I write a valid commit message}
  step %{I click on 'Update'}
end

When /^I visit the history page$/ do
  visit '/cargo_wiki/versions'
end

Then /^I should see two changes on the last modified article$/ do
  versions = CargoWiki::Article.last.versions
  versions.count.should == 2
  versions.each do |version|
    within('.versions') do
      within("#version-#{version.id}") do
        page.should have_content(version.item.title)
        page.should have_content(version.commit_message)
        page.should have_content(@user.username)
        page.should have_content(I18n.l(version.created_at, :format => :short))
      end
    end
  end
end

Then /^I should see one change on the other one$/ do
  article = CargoWiki::Article.first
  article.versions.count.should == 1
  version = article.versions[0]
  within('.versions') do
    within("#version-#{version.id}") do
      page.should have_content(version.item.title)
      page.should have_content(version.commit_message)
      page.should have_content(@user.username)
      page.should have_content(I18n.l(version.created_at, :format => :short))
    end
  end
end

Given /^I changed its title$/ do
  step %{I visit its show page}
  step %{I click on 'Edit'}
  step %{I change the title to 'New Title'}
  step %{I write a valid commit message}
  step %{I click on 'Update'}
end

When /^I visit the article history page$/ do
  @article = CargoWiki::Article.last
  visit "/cargo_wiki/articles/#{@article.id}/versions"
end

Then /^I should see my changes on that article$/ do
  @article.versions.each do |version|
    within('.versions') do
      within("#version-#{version.id}") do
        page.should_not have_content(version.item.title)
        page.should have_content(version.commit_message)
        page.should have_content(@user.username)
        page.should have_content(I18n.l(version.created_at, :format => :short))
      end
    end
  end
end

Then /^I should be able to return to the article show page$/ do
  click_link "Back to article"
  current_path.should == "/cargo_wiki/articles/#{CargoWiki::Article.last.id}"
end