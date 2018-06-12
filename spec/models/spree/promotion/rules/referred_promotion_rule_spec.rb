require 'spec_helper'

describe Spree::Promotion::Rules::ReferredPromotionRule, type: :model do
  before(:each) do
    @rule = FactoryBot.build(:referred_promotion_rule)
    @user = FactoryBot.create(:user, email: FFaker::Internet.email)
    @referred = FactoryBot.create(:user, email: FFaker::Internet.email, referral_code: @user.referral.code)
    @organic_order = FactoryBot.create(:order, user: @user)
    @referred_order = FactoryBot.create(:order, user: @referred)
  end
  it 'is applicable for an order' do
    expect(@rule.applicable?(@referred_order)).to be_truthy
  end
  it 'is elegible for referred user' do
    expect(@rule.eligible?(@referred_order)).to be_truthy
  end
  it 'is not elegible for organic user' do
    expect(@rule.eligible?(@organic_order)).to be_falsy
  end
end
