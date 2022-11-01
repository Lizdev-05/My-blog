require 'rails_helper'

RSpec.describe 'Users Index Page', type: :feature do
  describe 'User Index Page' do
    before(:example) do
      @user = User.create(name: 'Oyinlade', photo: 'https://unsplash.com/photos/F_-0BxGuVvo',
                          bio: 'I am a Full-stack developer', posts_counter: 0)

      visit users_path
    end

    it 'should display the user name' do
      expect(page).to have_content(@user.name)
    end

    it 'displays all users profile photo' do
      find("img[src='https://unsplash.com/photos/F_-0BxGuVvo']", match: :first)
    end

    it 'displays number of posts' do
      expect(page).to have_content(@user.posts_counter)
    end

    it 'renders the user show page' do
      click_link @user.name
      expect(page).to have_current_path(user_path(@user))
    end
  end

 
end
