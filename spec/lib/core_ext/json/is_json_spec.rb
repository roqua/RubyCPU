require 'spec_helper'

describe JSON do

  before do
    @json = '{"x":[1,4,2,3,5,3], "y":[1,6,7,5,4,3]}'
    @not_json = "{x:[1,2,3,4],y:[4,3,2,1]}"
  end

  it "should detect a string as being valid json" do
    result = JSON.is_json? @json
    result.should eq true
  end

  it "should detect a string as being invalid json" do
    result = JSON.is_json? @not_json
    result.should eq false
  end

end
