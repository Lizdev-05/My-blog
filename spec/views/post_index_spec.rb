require 'rails_helper'

RSpec.describe 'Posts', type: :feature do
  describe 'index page' do
    before(:example) do
      @user = User.create(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico.',
                          posts_counter: 0)
      @post1 = Post.create(author: @user, title: 'Hello One', text: 'This is my first post', likes_counter: 0,
                           comments_counter: 0)
      @post2 = Post.create(author: @user, title: 'Hello Two', text: 'This is my second post', likes_counter: 0,
                           comments_counter: 0)
      @post3 = Post.create(author: @user, title: 'Hello Three', text: 'This is my third post', likes_counter: 0,
                           comments_counter: 0)
      @post4 = Post.create(author: @user, title: 'Hello Fourth', text: 'This is my fourth post', likes_counter: 0,
                           comments_counter: 0)
      @comment1 = Comment.create(author: @user, post: @post2, text: 'I like this post')
      @comment2 = Comment.create(author: @user, post: @post2, text: 'I like this post')
      @comment3 = Comment.create(author: @user, post: @post1, text: 'I like this post')
      @comment4 = Comment.create(author: @user, post: @post1, text: 'I like this post')
      @comment5 = Comment.create(author: @user, post: @post1, text: 'I like this post')

      visit user_posts_path(@user)
    end

    it "renders user's profile picture" do
      find("img[src='#{@user.photo}']")
    end

    it "renders the user's username" do
      expect(page).to have_content(@user.name)
    end

    it "renders the user's post count" do
      expect(page).to have_content(@user.posts_counter)
    end

    it "renders the user's posts" do
      expect(page).to have_content(@post1.title)
      expect(page).to have_content(@post2.title)
      expect(page).to have_content(@post3.title)
    end

    it "renders some of the post's body" do
      expect(page).to have_content(@post1.text[0, 50])
      expect(page).to have_content(@post2.text[0, 50])
      expect(page).to have_content(@post3.text[0, 50])
    end

    it 'renders first comments on a post' do
      expect(page).to have_content(@comment1.text)
      expect(page).to have_content(@comment2.text)
    end

    it 'renders comments count on a post' do
      expect(page).to have_content(@post1.comments_counter)
      expect(page).to have_content(@post2.comments_counter)
      expect(page).to have_content(@post3.comments_counter)
    end

    it 'renders likes count on a post' do
      expect(page).to have_content(@post1.likes_counter)
      expect(page).to have_content(@post2.likes_counter)
      expect(page).to have_content(@post3.likes_counter)
    end

    it 'renders pagination section if posts are more than 3' do
      expect(page).to have_content('Next →')
    end

    it "redirects to a post's show page" do
      click_link @post1.title
      expect(page).to have_current_path(user_post_path(@user, @post1))
    end
  end

  describe 'show page' do
    before(:example) do
      @user = User.create(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico.',
                          posts_counter: 0)
      @user2 = User.create(name: 'Mohammed', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher Pakistan.',
                           posts_counter: 0)
      @post = Post.create(author: @user, title: 'Hello One', text: 'This is my first post', likes_counter: 0,
                          comments_counter: 0)
      @comment1 = Comment.create(author: @user, post: @post, text: 'I like this post comment one')
      @comment2 = Comment.create(author: @user2, post: @post, text: 'I like this post comment two')
      @comment3 = Comment.create(author: @user2, post: @post, text: 'I like this post comment three')
  
      visit user_post_path(@user, @post)
    end
  
    it "renders the post's title" do
      expect(page).to have_content(@post.title)
    end
  
    it "renders the post's author" do
      expect(page).to have_content(@user.name)
    end
  
    it 'renders comments count of the post' do
      expect(page).to have_content(@post.comments_counter)
    end
  
  #   it 'renders likes count of the post' do
  #     expect(page).to have_content(@post.likes_counter)
  #   end
  
  #   it "renders the post's body" do
  #     expect(page).to have_content(@post.text)
  #   end
  
  #   it 'renders the username of each commenter' do
  #     expect(page).to have_content(@user2.name)
  #     expect(page).to have_content(@user.name)
  #   end
  
  #   it 'renders all comments of the post' do
  #     expect(page).to have_content(@comment1.text)
  #     expect(page).to have_content(@comment2.text)
  #     expect(page).to have_content(@comment3.text)
  #   end
  # end
end