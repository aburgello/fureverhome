class CatApiService
  include HTTParty
  base_uri 'https://api.thecatapi.com/v1'

  def initialize
    @api_key = 'live_a3OSAAo72Ajbn3kcIFD07MnuOe3lAZjhTAmj1lxMJp3Jvov8gb2L7vCbYhggDvVa'
  end

  def fetch_cats(limit = 20)
    self.class.get('/breeds', headers: { "x-api-key" => @api_key }, query: { limit: })
  end
end
