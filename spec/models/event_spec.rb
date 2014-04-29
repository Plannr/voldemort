require 'spec_helper'
include EventHelper

describe Event do
  describe "validations" do
  	let(:event) { Event.make! }

  	it 'should require guest count' do
  		event.guest_count = nil
  		expect(event).to_not be_valid
  	end

  	context('date') do
  		['', ' ', nil, 'adfa', '999999999', formatted_date('9/15/1988'), formatted_date('04/20/2014'), Date.today, Date.today + 7.months].each do |d|
  			it "should be invalid for date: #{d.inspect}" do
  				event.date = d
  				expect(event).to_not be_valid
  			end
  		end

  		[Date.today + 2.weeks, Date.today + 2.months].each do |d|
  			it "should be valid for date: #{d.inspect}" do
  				event.date = d
  				expect(event).to be_valid
  			end
  		end
  	end
  end
end