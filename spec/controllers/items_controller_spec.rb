require 'rails_helper'

RSpec.describe ItemsController, type: :controller do

    let :user  {FactoryGirl.create(:user)}
    let(:item) {FactoryGirl.create(:item)}
  
    
    def sign_in(user)
        request.session[:user_id] = user.id
    end

    def valid_post
		post :create, params: { item: FactoryGirl.attributes_for(:item) }
    end

    def invalid_post
        post :create, params: {item: FactoryGirl.attributes_for(:item, title: nil)}
    end


  describe '#new' do

    context 'with no user signed in' do
        it 'redirects to the sign in page' do
            get :new
            expect(response).to redirect_to(new_session_path)
        end
    end

    context 'with user signed in' do
        before { sign_in(user) }

        it 'renders new template' do
      
            get :new
            expect(response).to render_template(:new)
        end
    end
  end

# CREATE ACTION TESTS
  describe '#create' do
    context 'with valid attributes' do
        before { sign_in(user) }
    
      it 'creates a new auction in database' do
        count_before = Item.count
        valid_post
        count_after = Item.count
        expect(count_after).to eq(count_before + 1)
      end          
    end

  end
  
  describe "#index" do
    it "renders auctions template" do
      get :index
      expect(response).to render_template(:index)
    end
  end

end
