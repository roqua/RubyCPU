module WebserviceHelper
  
  def get(url)
    
    require 'net/http'
    
    uri = URI.parse(url)
    
    resp = Net::HTTP.get_response(uri)
    
    # If the result was MovedPermanently, call the redirect url
    return get(resp.header['Location']) if resp.is_a? Net::HTTPMovedPermanently or resp.is_a? Net::HTTPMovedTemporarily
    
    return resp.body || "", url if resp.is_a? Net::HTTPSuccess
    
  end
  
  def post url, data

     require 'net/http'

     uri = URI.parse(url)
     
     data = JSON.parse(data)

     resp = Net::HTTP.post_form(uri, data)

     # If the result was MovedPermanently, call the redirect url
     return get(resp.header['Location']) if(resp.is_a? Net::HTTPMovedPermanently)

     return resp.body || "", url 

   end
  
end