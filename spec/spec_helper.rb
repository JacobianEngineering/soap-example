# spec/spec_helper.rb
require 'rack/test'
require 'rspec'
require 'byebug'
require 'savon'
require "savon/mock/spec_helper"

ENV['RACK_ENV'] = 'test'

require File.expand_path '../../app.rb', __FILE__

module RSpecMixin
  HTTPI.adapter = :rack
  HTTPI::Adapter::Rack.mount 'application', App

  include Rack::Test::Methods
  def app
    described_class 
  end

  def soap_client
    Savon::Client.new wsdl: 'http://application/wsdl'
  end

end

RSpec.configure { |c| c.include RSpecMixin }