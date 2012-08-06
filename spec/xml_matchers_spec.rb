require 'spec_helper'

describe XMLMatchers do
  describe '#have_xpath' do
    it 'should pass if the xpath exists containing the supplied text' do
      "<node>HAI</node>".should have_xpath('/node').with_text('HAI')
    end

    it "should fail if the xpath does not exist" do
      lambda { "<node>HAI</node>".should have_xpath('/ne').with_text('HAI')}.
        should raise_error(RSpec::Expectations::ExpectationNotMetError)
    end

    it 'should fail if the xpath does not contain the supplied text' do
      lambda { "<node>HAI</node>".should have_xpath('/ne').with_text('HI')}.
        should raise_error(RSpec::Expectations::ExpectationNotMetError)
    end
  end
end
