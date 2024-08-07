module ApplicationHelper
  def current_year
    Time.current.year
  end

  def github_url(author, repo)
    link_to 'Github', "https://github.com/#{author}/#{repo}", :target => "_blank", :rel => "noopener noreferrer"
  end

  def flash_message
    content_tag :div, class: "flash-messages" do
      flash.map do |key, value| 
        content_tag :div, class: "alert alert-dismissable alert-#{key}" do 
          content_tag(:span, '&times;'.html_safe, class: :close, 'data-dismiss' => 'alert') + value
        end
      end.join().html_safe
    end
  end
end
