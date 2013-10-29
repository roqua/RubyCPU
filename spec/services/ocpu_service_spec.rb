require 'spec_helper'

describe "An instance of", OcpuService do
    before :each do
      @ocpu_service = OcpuService.new "https://public.opencpu.org"
    end
    
    it "should be properly initialized" do
      expect(@ocpu_service).to be_a(OcpuService)
    end
    
    context "when new" do
      it "returns a list of packages" do
        result = @ocpu_service.all_packages
        expect(result).to be_a(Array)
        expect(result).not_to be_empty
        
      end

    end

end
