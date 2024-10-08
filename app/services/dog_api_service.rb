class DogApiService
  include HTTParty
  base_uri 'https://api.thedogapi.com/v1'

  def initialize
    @api_key = 'live_mu73nFXmSeCCFjme0jRozwZjZdVm9dDx9m8rLeepgRVEZpVBFzNJagYq9SjM6erf'
  end

  def fetch_dogs(limit = 20)
    self.class.get('/breeds', headers: { "x-api-key" => @api_key }, query: { limit: })
  end
end
