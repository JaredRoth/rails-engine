require "rails_helper"

RSpec.describe Customer, type: :model do
  describe "validations" do
    # it { is_expected.to validate_presence_of(:email) }
    # it { is_expected.to validate_presence_of(:password) }
    # it { is_expected.to validate_presence_of(:name) }
    # it { is_expected.to validate_uniqueness_of(:email) }
  end

  describe "associations" do
    # it { is_expected.to have_many(:orders) }
    # it { is_expected.to have_many(:order_items) }
    # it { is_expected.to have_many(:items) }
  end
end
