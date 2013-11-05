class OcpuCallback
  include Virtus.model

  attribute :value
  attribute :stdout
  attribute :source
  attribute :console
  attribute :info

  VALUE_LOCATION = 0
  STDOUT_LOCATION = 1
  SOURCE_LOCATION = 2
  CONSOLE_LOCATION = 3
  INFO_LOCATION = 4

  def self.build_from_response response_urls
    response_urls = response_urls.split("\n")

    if response_urls.length >= 5
      new(value: response_urls[OcpuCallback::VALUE_LOCATION].trim("/"),
          stdout: response_urls[OcpuCallback::STDOUT_LOCATION].trim("/"),
          source: response_urls[OcpuCallback::SOURCE_LOCATION].trim("/"),
          console: response_urls[OcpuCallback::CONSOLE_LOCATION].trim("/"),
          info: response_urls[OcpuCallback::INFO_LOCATION].trim("/"))
    else
      new
    end
  end

  def session_code
    value.split("/")[3]
  end

end
