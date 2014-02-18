ENV['RACK_ENV'] = 'test'

require_relative '../app'
require 'minitest/autorun'
require 'minitest/spec'
require 'rack/test'
require 'json'

describe "rate lookup" do
  include Rack::Test::Methods

  def app
    Sinatra::Application
  end

  it "returns '1' for identical currencies" do
    get '/rate/USD/USD' do |r|
      data = JSON.parse(r.body)
      data.must_equal({
        'from' => 'USD',
        'to' => 'USD',
        'rate' => 1
      })
    end
  end

  it "returns rate for USD=>EUR" do
    skip 'untested'
  end

  it "returns rate for EUR=>USD" do
    skip 'untested'
  end

  it "returns rate for EUR=>GBP" do
    skip 'untested'
  end

  it "returns rates within an acceptable time frame" do
    skip 'untested'
  end
end
