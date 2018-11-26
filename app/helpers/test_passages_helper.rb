module TestPassagesHelper

  def result_message(test_passage)
    if @test_passage.success?
      content_tag(:h2) do
        concat("The percentage of correct answers is ")
        concat(content_tag(:font, "#{test_passage.success_percent}%", color: "green"))
        concat(tag.br)
        concat("Congratulations! You passed the test")
      end
    else
      content_tag(:h2) do
        concat("The percentage of correct answers is ")
        concat(content_tag(:font, "#{test_passage.success_percent}%", color: "red"))
        concat(tag.br)
        concat("We sorry. You failed the test")
      end
    end      
  end
end
