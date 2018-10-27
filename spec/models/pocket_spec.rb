require 'rails_helper'

RSpec.describe Pocket, type: :model do
  let!(:organization) { create(:organization) }
  let!(:user) { create(:user, organization: organization) }
  let!(:route) { create(:route, user: user) }
  let!(:container) { create(:container, organization: organization) }
  let!(:collection) { create(:collection, route: route, collection_point: container) }

  describe 'serializer' do
    let!(:pocket) { create(:pocket, organization: organization, collection: collection) }
    let(:serializer) { PocketSerializer }

    it 'does return pockets as specified in the serializer' do
      expect(serializer.new(pocket).attributes.keys).to eq %i[id serial_number state weight check_in]
    end
  end

  describe 'validations' do
    let(:pocket) { build(:pocket, organization: organization, collection: collection) }
    let(:negative_weight) { Faker::Number.negative }

    it 'is valid with valid attributes' do
      expect(pocket).to be_valid
    end

    it 'is not valid without serial number' do
      pocket.serial_number = nil
      expect(pocket).not_to be_valid
    end

    it 'is not valid with an invalid wieght' do
      pocket.weight = 0
      expect(pocket).not_to be_valid
    end

    it 'is not valid with an invalid wieght' do
      pocket.weight = negative_weight
      expect(pocket).not_to be_valid
    end
  end
end
