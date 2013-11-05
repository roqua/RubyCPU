require 'spec_helper'

describe String do

  before do
    @data = "test"
    @data_pre = "/#{@data}"
    @data_ap = "#{@data}/"
    @data_both = "/#{@data}/"
    @data_both_multi = "/#{@data}/#{@data}/#{@data}/#{@data}/"
  end

  it "remove a prepended char" do
    result = @data_pre.trim "/"
    result.should eq @data
  end

  it "remove a apended char" do
    result = @data_ap.trim "/"
    result.should eq @data
  end

  it "remove both pre- and apended char" do
    result = @data_both.trim "/"
    result.should eq @data
  end

  it "remove not remove inner chars" do
    result = @data_both_multi.trim "/"
    result.should eq "#{@data}/#{@data}/#{@data}/#{@data}"
  end

end
