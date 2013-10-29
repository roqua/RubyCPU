require 'spec_helper'

describe "An instance of", OcpuService do
    
	let!(:calculation_request) { CalculationRequest.create(package: package, function: function, data: data) }
    let(:package) { 'stats' }
    let(:function) { 'cor' }
    let(:data) { '{"x":[1,4,2,3,5,3], "y":[1,6,7,5,4,3]}'}
  
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
      
      	it "returns an filled ocpu_callback object" do
        
        	@callback = @ocpu_service.calculate calculation_request
        	expect(@callback).to be_a(OcpuCallback)
        	expect(@callback.source).not_to be_empty
        	expect(@callback.value).not_to be_empty
        	expect(@callback.stdout).not_to be_empty
        	expect(@callback.console).not_to be_empty
        	expect(@callback.info).not_to be_empty
        
      	end

		context "success" do
     		
			it "should retrieve the correct results" do
				result = @ocpu_service.retrieve_result @callback, "json"
      		end

		end
      
    end

end
