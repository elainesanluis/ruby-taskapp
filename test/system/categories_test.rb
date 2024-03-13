require "application_system_test_case"

class CategoriesTest < ApplicationSystemTestCase
    setup do
        @user = users(:user_one)
        @category = categories(:cat_one)
    
        login
      end    

      test "visiting the index" do
        visit categories_url

        assert_selector "h1", text: "My Tasks"
        assert_link "Add Category", href: new_category_path  
      end
    

      private

      def login
        visit root_path
        fill_in "Email", with: @user.email
        fill_in "Password", with: "123456"
        click_on "Log in"

        assert_selector "h1", text: "My Tasks"
      end
    
end
