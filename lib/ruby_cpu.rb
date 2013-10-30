class RubyCpu
  #include WebserviceHelper
  require 'rest_client'
  require 'json'

	require 'ruby_cpu/models/calculation_request'
	require 'ruby_cpu/models/ocpu_callback'
	require 'ruby_cpu/models/ocpu_package'
	
	require 'ruby_cpu/core_ext'
	
	require 'ruby_cpu/enums/return_type_enum'
  
  OCPU_PATH = "ocpu"
  LIBRARY_PATH = "library"
  LANGUAGE = "R"

  def initialize serviceLocation
    
    # Remove the trailing slash, if present
    serviceLocation.trim! "/"
    
    @service_location = serviceLocation
    
  end
  
  ##
  # Returns a list of package objects, retrieved from the OpenCPU server
  def library
    
   # Rails.logger.debug([@service_location, OCPU_PATH, LIBRARY_PATH].join("/"))
    
    packages = RestClient.get [@service_location, OCPU_PATH, LIBRARY_PATH].join("/")
    
    OcpuPackage.build_from_list packages
    
  end

	##
	# Returns information about a given +package+
	def info package

		data = RestClient.get [@service_location, OCPU_PATH, LIBRARY_PATH, package.name].join("/")
		
		data
		
	end
  
	##
	# Calls the given server, with the +calculation_request+ and directly returns the data
  def calculate_and_retrieve calculation_request
    
    data = calculate calculation_request
    
    retrieve_result data, ReturnTypeEnum::JSON
  
  end
  
  ##
  # Can handle a certain calculation request. The +calculation_request+ passed
  # to this function is sent to the OpenCPU service.
  # This function returns the URLS on which the data can be retrieved.
  def calculate calculation_request
    
    json_data = JSON.parse(calculation_request.data)

    result = RestClient.post [@service_location, OCPU_PATH, LIBRARY_PATH, calculation_request.package, LANGUAGE, calculation_request.function].join('/'), calculation_request.data , :content_type => :json, :accept => :json
    
    OcpuCallback.build_from_response result
    
  end
  
  ##
  # Retrieves the result from the given +session+ in the given +datatype+.
  #
  # OpenCPU first wants to store the data locally, in order to improve caching.
  # When the call is performed, one gets a callback URL on which a get request 
  # should be performed. This is done in this method.
  def retrieve_result session, return_type 
    
    result = "{}"
    
    result = JSON.parse(RestClient.get [@service_location, session.value, return_type].join("/")) if session.is_a? OcpuCallback
    
    result
    
  end
  
end