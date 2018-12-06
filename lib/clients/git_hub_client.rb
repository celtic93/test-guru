class GitHubClient

  ROOT_ENDPOINT = 'https://api.github.com'
  ACCESS_TOKEN = 'e3dbacbfa1e688a9c2c91589eb3757e0b823cefd'

  def initialize
    @http_client = Octokit::Client.new(access_token: ACCESS_TOKEN)
  end

  def create_gist(params)
    @http_client.create_gist(params)
  end
end
