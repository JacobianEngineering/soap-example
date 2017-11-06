require 'sinatra/base'
require 'sinatra/soap'

class App < Sinatra::Base
  register Sinatra::Soap

  set :service, "sinatra"
  set :namespace, "http://schemas.xmlsoap.org/wsdl/"
  set :endpoint, '/action'
  set :wsdl_route, '/wsdl'

  soap :public, in: { argString: :string, argInt: :integer }, out: nil do
    raise "Failed!!!!" if Integer(params[:argInt]) > 10
    params
  end

  soap :secret, in: { argString: :string }, out: nil do
    puts "Should not be called"
    params
  end

end
