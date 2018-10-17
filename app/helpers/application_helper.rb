module ApplicationHelper
  def current_year
    Time.current.year
  end

  def github_url(author, repo)
    link_to "TestGuru", "https://github.com/#{author}/#{repo}", target: :blank
  end

  def flash_messages
    flash.map do |type, message|
      content_tag :p, message, class: "flash #{type}"
    end.join("\n").html_safe
  end
end
