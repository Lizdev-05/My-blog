require 'rails_helper'

RSpec.describe 'Render the post show page', type: :request do
    before(:each) do
        @user = User.create(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico.',
                            posts_counter: 0)
        
        @first_post = Post.create(title: 'First post', content: 'This is the first post.', user_id: @user.id, likes_counter: 0, comments_counter: 0)

        5times do
            Comment.create(content: 'This is a comment', user_id: @user.id, post_id: @first_post.id)
        end

        visit user_post_path(@first_post.author, @first_post)
    end

    scenario 'Displays the post title' do
        expect(page).to have_content(@first_post.title)
    end

    scenario 'Displays the post content' do
        expect(page).to have_content(@first_post.content)
    end

    scenario 'Displaumber of likes' do
        expect(page).to have_content(@first_post.likes_counter)
    end

   scenario 'Displays the comments' do
        expect(page).to have_content('Here are the comments')
   end
    end
