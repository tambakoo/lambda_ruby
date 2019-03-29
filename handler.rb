require 'json'
require 'net/ping'
require 'nokogiri'
require 'open-uri'
require 'aws-sdk'
require 'aws-sdk-lambda'  # v2: require 'aws-sdk'

lambda_boy = Aws::Lambda::Client.new(region: 'us-east-2')

def hello(event:, context:)
	puts event
	# name1 = event["pathParameters"]["name"] : nil
  { statusCode: 200, body: JSON.generate("Hello  ") }
end

def get_data_proxy(event:, context:)
	Aws::Lambda::Client.new(region: 'us-east-2').invoke({
                         function_name: 'portal-poetry-dev-get_data'
                       })

	# system("sls invoke local -f get_data -d '#{event}'")
end

def get_data(event:, context:)
	return "It purr-fect"
	# data = data_scraper(event)
	# return data.css('.HeroContent').css('.HeroTextContent').text.strip
end

def up?(event:, context:)
	foo
	# Net::Ping::External.new(event).ping?
end

def data_scraper(url)
	@crash = false
	begin
  	Nokogiri::HTML(open(url))
	rescue 
		@crash = true
  end
end