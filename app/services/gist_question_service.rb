class GistQuestionService

  attr_reader :result

  def initialize(question, client: nil)
    @question = question
    @test = @question.test
    @client = client || Octokit::Client.new(access_token: ENV['ACCESS_TOKEN'])
  end

  def call
    @result = @client.create_gist(gist_params)
  end

  def success_call?
    @client.last_response.status == 201
  end

  private

  def gist_params
    {
      "description": I18n.t('.description', title: @test.title),

      "files": {
         'test-guru-question.txt' => {
            content: gist_content
         }               
      }
    }
  end

  def gist_content
    content = [@question.body]
    content += @question.answers.pluck(:body)
    content.join("\n")
  end
end
