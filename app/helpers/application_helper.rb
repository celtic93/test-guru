module ApplicationHelper

  def current_year
    Time.current.year
  end

  def github_url(author, repo)
    link_to('Проект TestGuru', "https://github.com/#{author}/#{repo}", target: '_blank', rel: 'noopener noreferrer')
  end

  def flash_message
    flash.map do |key, msg|
      content_tag :p, msg, class: "flash #{key}"
    end.join.html_safe
  end
end
