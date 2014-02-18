require 'sinatra'
require 'json'

require_relative 'lib/flaky_fx_provider'

# Expected response should look like:
# {"from":"USD","to":"EUR","rate":0.73}
get '/rate/:from/:to' do
  {
    from: params[:from],
    to: params[:to],
    rate: FlakyFXProvider.lookup(params[:from], params[:to])
  }.to_json
end
