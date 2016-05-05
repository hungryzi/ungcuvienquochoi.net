module ApplicationHelper
  def google_search_link(name)
    name = url_encode("\"#{name}\"")
    link_to 'google search', "http://google.com/search?q=#{name}", target: '_blank'
  end
end
