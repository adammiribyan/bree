# encoding: utf-8

require 'test_helper'

class PatientsControllerTest < ActionController::TestCase
  setup do
    @patient = Factory(:patient)
  end

  test "should get index" do 
    get :index
    assert_response :success
    assert_not_nil assigns(:patients)
  end

  test "should get new" do
    get :new
    assert_response :success
    assert true
  end

  test "should create patient" do
    assert_difference('Patient.count') do
      post :create, :patient => @patient.attributes
    end

    assert_redirected_to patient_path(assigns(:patient))
  end
  
  test "should form and save patient's full name" do
    post :create, :patient => Factory(:patient, :first_name => "Harry", :last_name => "Potter", :middle_name => "James").attributes
    
    assert_equal "Potter Harry James", assigns(:patient).full_name
  end
  
  test "should correctly titleize patient's title" do
    patient = Factory(:patient, :title => "архитектор")
    get :show, :id => patient.to_param
    
    assert_select ".title", "Архитектор"
  end
  
  test "should create teeth_chart when creating new patient" do
    post :create, :patient => @patient.attributes
    
    assert_not_nil assigns(:patient).teeth_chart
  end

  test "should show patient" do
    get :show, :id => @patient.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @patient.to_param
    assert_response :success
  end

  test "should update patient" do
    put :update, :id => @patient.to_param, :patient => @patient.attributes
    assert_redirected_to patient_path(assigns(:patient))
  end

  test "should destroy patient" do
    assert_difference('Patient.count', -1) do
      delete :destroy, :id => @patient.to_param
    end

    assert_redirected_to patients_path
  end
end
