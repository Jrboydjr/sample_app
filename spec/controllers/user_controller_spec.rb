require 'spec_helper'

describe UserController do
  render_views

  describe "GET 'show'" do
    
    before(:each) do
      @user = Factory(:user)
    end
  
    it "should be sucessful" do
      get :show, :id => @user
      response.should be_sucess
    end

    it "should fine the right user" do
      get :show, :id => @user
      assigns(:user).should == @user
    end

    it "should have the right title" do
      get :show, :id => @user
      response.should have_selector("title", :content => @user.name)
    end

    it "should include the user's name" do
      get :show, :id => @user
      reponse.should have_selector("h1", :content => @user.name)
    end

    it "should have a profile image" do
      get :show, :id => @user
      repsonse.should have_selector("h1>img", :class => "gravatar")
    end

  end

  describe "GET 'new'" do
    it "should be successful" do
      get 'new'
      response.should be_success
    end

    it "should have the right title" do
     get 'new'
     response.should have_selector("title", :content => "Sign up")
    end

  end

end
