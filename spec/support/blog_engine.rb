def create_author
  @author = BlogEngine::Author.create!(
    :username => Faker::Name.first_name,
    :first_name => Faker::Name.first_name,
    :last_name => Faker::Name.last_name,
    :email => Faker::Internet.email,
    :password => 'foobar')
end

def author_sign_in
  visit new_author_session_path

  fill_in 'Username', :with => @author.username
  fill_in 'Password', :with => @author.password
  click_button 'Sign in'
end

def author_sign_out
  visit destroy_author_session_path
end

def create_category title = nil
  visit new_blog_engine_category_path
  fill_in 'Title', :with => (title.nil?)? Faker::Lorem.sentence(1) : title
  click_button 'Save Category'
end

def submit_draft title = "My new article", content = "this is a cool blog", tags = nil, categories = nil, publish_date = Date.tomorrow.next_week
  visit new_blog_engine_article_path
  fill_in 'Title', :with => title
  fill_in 'Content', :with => content
  
  unless tags.nil?
     fill_in 'Tags', :with => tags
  end
  
  fill_in 'Published at', :with => publish_date.to_s
  
  unless categories.nil?
     categories.split(', ').each do |category|
      check category
     end
  end
  click_button 'Save Draft'
end

def publish_article title = "My new article", content = "this is a cool blog", tags = nil, categories = nil
  visit new_blog_engine_article_path
  fill_in 'Title', :with => title
  fill_in 'Content', :with => content
  
  unless tags.nil?
     fill_in 'Tags', :with => tags
  end
  
  unless categories.nil?
     categories.split(', ').each do |category|
      check category
     end
  end
  click_button 'Publish'
end
