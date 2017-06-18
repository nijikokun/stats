require "spec"
require "../src/stats.cr"

describe "Stats" do
  describe "#mean" do
    it "should accept an array of Int32" do
      Stats.mean([1,2,3,4,5]).should eq 3.0
    end
    
    it "should accept an array of Float64" do
      Stats.mean([1.0,2.0,3.0,4.0,5.0]).should eq 3.0
    end
    
    it "should accept an array of Int32 | Float64" do
      Stats.mean([1.0,2.0,3.0,4,5.0]).should eq 3.0
    end
  end
  
  describe "#median" do
    it "should accept an array of Int32" do
      Stats.median([1,2,3,4,5]).should eq 3.0
    end
    
    it "should accept an array of Float64" do
      Stats.median([1.0,2.0,3.0,4.0,5.0]).should eq 3.0
    end
    
    it "should accept an array of Int32 | Float64" do
      Stats.median([1.0,2.0,3.0,4,5.0]).should eq 3.0
    end
  end
  
  describe "#mode" do
    it "should accept an array of Int32" do
      Stats.mode([1,2,2,3]).should eq 2.0
    end
    
    it "should accept an array of Float64" do
      Stats.mode([1.0,3.0,4.0,5.0,5.0]).should eq 5.0
    end
    
    it "should accept an array of Int32 | Float64" do
      Stats.mode([1,3.0,4.0,5,5]).should eq 5.0
    end
    
    it "should accept first match in draw" do
      Stats.mode([1,3.0,3.0,5,5]).should eq 3.0
    end
  end
end