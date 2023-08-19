# require 'rails_helper'

# RSpec.describe Like, type: :model do
#     let(:user) { User.create(id: 1, name: 'Harry') }
#     let(:post) { Post.create(id: 1, title: 'Sample title') }  
#     subject do
#         Like.new(author_id: user.id, post_id: post.id)
#     end
#     describe "Check methods" do
#         it 'validates update like counter method' do
#             subject.update_likes_counter
#             expect(post.likes_counter).to eq(1)
#         end
#     end
# end
