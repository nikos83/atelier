require "rails_helper"

RSpec.describe BookTakenMailer, type: :mailer do
 
  it 'should send an email' do
    ActionMailer::Base.deliveries.count.should == 1
  end
end
