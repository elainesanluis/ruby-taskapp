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
      end

      test "creating a new category" do
        visit categories_url
        click_on "Add Category"
        fill_in "Name", with: "New-Category"
        click_on "Create Category" 
        assert_link "New-Category"
      end

      test "deleting a category" do
        visit categories_url
        assert_text @category.name
        click_on "Delete", match: :first
        assert_no_text @category.name
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
