require 'spec_helper'

describe Cregexp do
	describe "url" do 
		it "should validate http://www.google.com" do 
			string = "http://www.google.com"
			result = string =~ described_class.url
			result.should == 0			
		end		

		it "should validate http://localhost" do 
			url = "http://localhost"
			result = url =~ described_class.url
			#result.should_not == nil			
		end				
	end
	
	describe "ip" do 
		it "should validate 192.168.0.1" do 
			string = "192.168.0.1"
			result = string =~ described_class.ip
			result.should == 0			
		end		

		it "should not validate 256.255.255.255" do 
			string = "256.255.255.255"
			result = string =~ described_class.ip
			result.should == nil			
		end				
	end	
	
	describe "match" do
		it "should return true with url matcher and valid url" do
			described_class.match("http://www.google.com", :url).should == true
		end

		it "should return false with url matcher and invalid url" do
			described_class.match("httpz://invalid", :url).should == false
		end		
	end
end  
