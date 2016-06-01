require "rails_helper"

RSpec.describe Transaction, type: :model do
  describe "validations" do
    # it { is_expected.to validate_presence_of(:email) }
    # it { is_expected.to validate_presence_of(:password) }
    # it { is_expected.to validate_presence_of(:name) }
    # it { is_expected.to validate_uniqueness_of(:email) }
  end

  describe "associations" do
    it { is_expected.to belong_to(:invoice) }
    # it { is_expected.to belong_to(:merchant) }
    # it { is_expected.to have_many(:items) }
  end
end
