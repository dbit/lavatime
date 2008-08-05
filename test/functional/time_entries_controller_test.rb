require 'test_helper'

class TimeEntriesControllerTest < ActionController::TestCase
  def test_should_get_index
    get :index
    assert_response :success
    assert_not_nil assigns(:time_entries)
  end

  def test_should_get_new
    get :new
    assert_response :success
  end

  def test_should_create_time_entry
    assert_difference('TimeEntry.count') do
      post :create, :time_entry => { }
    end

    assert_redirected_to time_entry_path(assigns(:time_entry))
  end

  def test_should_show_time_entry
    get :show, :id => time_entries(:one).id
    assert_response :success
  end

  def test_should_get_edit
    get :edit, :id => time_entries(:one).id
    assert_response :success
  end

  def test_should_update_time_entry
    put :update, :id => time_entries(:one).id, :time_entry => { }
    assert_redirected_to time_entry_path(assigns(:time_entry))
  end

  def test_should_destroy_time_entry
    assert_difference('TimeEntry.count', -1) do
      delete :destroy, :id => time_entries(:one).id
    end

    assert_redirected_to time_entries_path
  end
end
