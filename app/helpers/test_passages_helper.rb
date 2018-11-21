module TestPassagesHelper

  def result_message
    if @test_passage.success?
      "<font color=\"green\">#{@test_passage.success_percent}%</font><br>
            Congratulations! You passed the test".html_safe
    else
      "<font color=\"red\">#{@test_passage.success_percent}%>%</font><br>
            We sorry. You failed the test".html_safe
    end      
  end
end
