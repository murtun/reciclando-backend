require 'rails_helper'

RSpec.describe User, type: :model do
  let!(:organization) { FactoryBot.create(:organization) }
  let!(:user) { FactoryBot.build(:user, organization: organization) }
  let(:u_serializer) { UserSerializer }

  describe 'validations' do
    context 'validations wrong cases' do
      it 'does not let create a new one, nil name value' do
        user.name = nil
        expect(user).not_to be_valid
      end
      it 'does not let create a new one, nil surname value' do
        user.surname = nil
        expect(user).not_to be_valid
      end
      it 'does not let create a new one, wrong ci format value' do
        user.ci = '44a4455t'
        expect(user).not_to be_valid
      end
      it 'does not let create new one, wrong name format value' do
        user.name = 'th0m45'
        expect(user).not_to be_valid
      end
      it 'does not let create new one, without @ character in email value' do
        user.email = 'hitest.com'
        expect(user).not_to be_valid
      end
      it 'does not let create a new one, without specified domain in email' do
        user.email = 'hi@test'
        expect(user).not_to be_valid
      end
    end
  end

  describe 'serializer' do
    it 'does return users, as specified in the serializer' do
      expect(u_serializer.new(user).attributes.keys).to eq %i[id name surname email ci]
    end
  end
end
