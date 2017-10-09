require "savon"

client = Savon.client(wsdl: "http://127.0.0.1:9393/wsdl")

puts client.operations

puts client.call(:test, message: { :hello => :world })
puts client.call(:test, message: { :should => :fail })
