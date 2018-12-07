class GitHubClient

  ACCESS_TOKEN = ENV['ACCESS_TOKEN']

  def initialize
    @http_client = Octokit::Client.new(access_token: ACCESS_TOKEN)
  end

  def create_gist(params)
    @http_client.create_gist(params)
  end

  def last_response
    @http_client.last_response
  end
end
