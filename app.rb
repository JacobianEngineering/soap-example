require 'sinatra/base'
require 'sinatra/soap'

class App < Sinatra::Base
  register Sinatra::Soap

  set :service, "sinatra"
  set :namespace, "http://schemas.xmlsoap.org/wsdl/"
  set :endpoint, '/action'
  set :wsdl_route, '/wsdl'

  soap :cup, in: { hello: :string }, out: nil do
    params
  end

end
