require "application_system_test_case"

class TaskappsTest < ApplicationSystemTestCase
  setup do
    @user = users(:user_one)
    @category = categories(:cat_one)
    login
  end

  test "creating a task" do 
    visit category_path(@category)
    click_on "New Task"
    
    fill_in "Title", with: "New Task Title"
    fill_in "Description", with: "New Task Description"
    select "Not Started", from: "Status"
    fill_in "taskapp[due_date]", with: "2024-03-31"
    click_on "Update Task"

    assert_text "New Task Title"
    assert_text "Not Started"

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
