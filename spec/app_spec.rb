require 'spec_helper'

describe App do
include Savon::SpecHelper
  it "has operations" do
    expect(soap_client.operations).to include(:cup)
  end

end