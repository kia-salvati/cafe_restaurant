require 'rails_helper'

RSpec.describe UserRolesController, type: :request do
  describe '#create' do
    context 'valid requests' do
      it 'creates user_roles' do
        # Require data
        user_role   = create(:user_role)
        user = create(:user)
        cafe_restaurant_t = create(:cafe_restaurant_t)

        attributes  = FactoryBot.attributes_for(:user_role)
        attributes[:user_id] = user.id
        attributes[:cafe_restaurant_t_id] = cafe_restaurant_t.id

        # Request
        post "/user_roles", params: {
              user_role: attributes,
            }
        # byebug
        # Expects
        expect(response.status).to eql(200)
        expect(JSON.parse(response.body)['data']['attributes']['role_type']).to eql(attributes[:role_type])
      end

      it 'blank attributes' do
        # Require data
        user_role = create(:user_role)
        attributes = FactoryBot.attributes_for(:user_role, role_type: nil)

        # Request
        post "/user_roles", params: {
              user_role: attributes,
            }
        # Expects
        expect(response.status).to eql(422)
      end
    end
  end
end
