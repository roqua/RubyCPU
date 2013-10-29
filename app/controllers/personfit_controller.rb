class PersonfitController < ApplicationController
  @@OcpuService = OcpuService.new("https://public.opencpu.org")
  
  def index
    
  end
  
  def new
     @calculation_request = CalculationRequest.new
     load_packages
  end
  
  def create
    @calculation_request = CalculationRequest.new(calculation_request_params)
     if(@calculation_request.valid?) then
       @result = @@OcpuService.calculate_and_retrieve @calculation_request
       logger.info @result
       render :show
     else
       load_packages
       render :new
     end
  end
  
  private
    
    def load_packages 
      @packages = @@OcpuService.all_packages
    end
  
    def calculation_request_params
      params.require(:calculation_request).permit(:package, :function, :data)
    end
  
end
