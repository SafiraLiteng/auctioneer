# require 'rails_helper'

# RSpec.describe IdeasController, type: :controller do

#   let :idea {FactoryGirl.create(:idea)}

#   def valid_post
#     post :create, params: { idea: FactoryGirl.attributes_for(:idea) }
#   end


#   describe '#new' do
    
#     it 'renders the new template' do
        
#         get :new
#         expect(response).to render_template(:new)
#     end

#     it 'assigns a idea instance variable to a new idea' do
#         get :new
#         expect(assigns(:idea)).to(be_a_new(Idea))
#     end
    
#   end

#   describe '#create' do
#     # context 'without a signed user' do
#     #   it 'redirects to the sign in page' do
#     #     post :create
#     #     expect(response).to redirect_to(new_session_path)
#     #   end
#     # end

#     context 'with a signed in user' do
#     #   before { request.session[:user_id] = user.id }

#       context 'with valid attributes' do
#         it 'creates a new idea in the database' do
#           count_before = Idea.count
#           valid_post
#           count_after = Idea.count

#           expect(count_after).to eq(count_before + 1)
#         end

#         it 'redirect to the idea show page' do
#           valid_post
#           expect(response).to redirect_to(idea_path(Idea.last))
#         end
#       end

#     #   context 'with invalid attributes' do
#     #     it 'doesnt\'t create a campaign in the database'
#     #     it 'renders new template'
#     #     it 'alerts the user that there was an error'
#     #   end
#     end
#   end


# end
