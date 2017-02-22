require 'rails_helper'

RSpec.describe UsersController, type: :controller do



  describe "POST #create" do
    context "with valid params" do



      it "redirects to index page" do
        post :create, user: {username: "jack_bruce", password: "password123"}
        expect(response).to redirect_to(user_url(User.find_by_username("jack_bruce")))
      end
    end

    context "with invalid params" do
      it "render sign in page" do
        post :create, user: {username: "jack_bruce", password: ""}
        expect(response).to render_template(:new)
        expect(flash[:error]).to be_present
      end
    end
  end

  describe "GET #new" do
    it "returns http success" do
      get :new
      expect(response).to render_template(:new)
    end
  end

end
