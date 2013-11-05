require 'spec_helper'

describe "An instance of", RubyCpu do

  before do
    @calculation_request = CalculationRequest.new
    @calculation_request.package = "stats"
    @calculation_request.function = "cor"
    @calculation_request.data = '{"x":[1,4,2,3,5,3], "y":[1,6,7,5,4,3]}'
    @correlation = [0.32733]

    @ocpu_package = OcpuPackage.new(@calculation_request.package)
  end

  before :each do
    @ruby_cpu = RubyCpu.new "https://public.opencpu.org"
  end

  it "should be properly initialized" do
    expect(@ruby_cpu).to be_a(RubyCpu)
    expect(@ocpu_package).to be_a(OcpuPackage)
    expect(@calculation_request).to be_a(CalculationRequest)
  end

  context "success" do
    it "returns information of a package" do
      data = @ruby_cpu.info @ocpu_package
      data.should be_a(String)
      data.should include "Information on package '#{@ocpu_package.name}'"
    end

    it "returns a list of packages" do
      result = @ruby_cpu.library
      expect(result).to be_a(Array)
      expect(result).not_to be_empty
    end

    it "returns an filled OcpuCallback object" do
      @callback = @ruby_cpu.calculate @calculation_request

      expect(@callback).to be_a(OcpuCallback)
      expect(@callback.source).not_to be_empty
      expect(@callback.value).not_to be_empty
      expect(@callback.stdout).not_to be_empty
      expect(@callback.console).not_to be_empty
      expect(@callback.info).not_to be_empty
    end

    it "should retrieve the correct results" do
      @callback = @ruby_cpu.calculate @calculation_request
      result = @ruby_cpu.retrieve_result @callback
      expect(result).to eq(@correlation)
    end

    it "should calculate the correlation in one go" do
      result = @ruby_cpu.calculate_and_retrieve @calculation_request
      expect(result).to eq(@correlation)
    end
  end
end
