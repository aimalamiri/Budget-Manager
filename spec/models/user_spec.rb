require_relative '../rails_helper'

RSpec.describe "User", type: :model do
  subject { User.new(name: 'Aimal') }
  before { subject.save! }

  it "name is required" do
    subject.name = ''
    expect(subject).to_not be_valid
  end

  it "name should not be over 255 chars" do
    subject.name = 'aaa'*100
    expect(subject).to_not be_valid
  end
end
