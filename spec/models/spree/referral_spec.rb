require 'spec_helper'

RSpec.describe Spree::Referral, type: :model do
  it 'generates a code after created' do
    referral = FactoryBot.build(:referral)
    expect{referral.save}.to change{referral.code}
  end

  it 'returns a code' do
    user = FactoryBot.create(:user)
    referral = FactoryBot.create(:referral, user: user)
    expect(referral.code).to_not be_nil
  end

  context 'with user' do
    before(:each) do
      @user = FactoryBot.create(:user)
      @referred = FactoryBot.create(:user, referral_code: @user.referral.code)
      @order = FactoryBot.create(:order, user: @referred)
      @referred_no_purchase = FactoryBot.create(:user, referral_code: @user.referral.code)
    end

    it 'returns an associated user record' do
      expect(@user.referral.user).to_not be_nil
    end
    it 'returns referred records' do
      expect(@user.referral.referred_records.count).to eq(2)
    end
    it 'returns an array of referred users' do
      expect(@user.referral.referred_users).to eq([@referred, @referred_no_purchase])
    end
    it 'returns an array of referred orders' do
      expect(@user.referral.referred_orders).to eq([@order])
    end
    it 'returns an array of referral activated users with completed_orders' do
      referred_user_with_completed_order = FactoryBot.create(:user, referral_code: @user.referral.code)
      completed_order = FactoryBot.create(:order, completed_at: @user.created_at + 1.second, user: referred_user_with_completed_order)
      expect(@user.referral.referral_activated_users).to eq([referred_user_with_completed_order])
    end
  end
end
