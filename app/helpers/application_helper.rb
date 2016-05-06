module ApplicationHelper
  def google_search_link(name)
    name = url_encode("\"#{name}\"")
    link_to I18n.t('candidates.links.google'), "http://google.com/search?q=#{name}", target: '_blank'
  end

  def facebook_profile_link(candidate)
    candidate_link(candidate.facebook_profile_link, 'facebook-official')
  end

  def wiki_profile_link(candidate)
    candidate_link(candidate.wiki_profile_link, 'wikipedia-w')
  end

  def dbqh_profile_link(candidate)
    candidate_link(candidate.dbqh_profile_link)
  end

  def website_link(candidate)
    candidate_link(candidate.website)
  end

  private

  def candidate_link(link, icon_name='external-link')
    if link.present?
      link_to link, target: '_blank' do
        icon(icon_name)
      end
    else
      content_tag 'span', data: { toggle: 'tooltip', placement: 'top' }, title: I18n.t('candidates.links.missing') do
        icon(icon_name)
      end
    end
  end
end
