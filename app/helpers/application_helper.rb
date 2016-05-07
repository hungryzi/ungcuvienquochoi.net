module ApplicationHelper
  def google_search_link(candidate)
    name = url_encode("\"#{candidate.name}\"")
    url = intercept_link(
      candidate_id: candidate.id,
      url: "http://google.com/search?q=#{name}"
    )
    link_to I18n.t('candidates.links.google'), url, target: '_blank', rel: 'nofollow'
  end

  def facebook_profile_link(candidate)
    candidate_link(
      candidate_id: candidate.id,
      url: candidate.facebook_profile_link,
      icon_name: 'facebook-official'
    )
  end

  def wiki_profile_link(candidate)
    candidate_link(
      candidate_id: candidate.id,
      url: candidate.wiki_profile_link,
      icon_name: 'wikipedia-w'
    )
  end

  def dbqh_profile_link(candidate)
    candidate_link(
      candidate_id: candidate.id,
      url: candidate.dbqh_profile_link
    )
  end

  def website_link(candidate)
    candidate_link(
      candidate_id: candidate.id,
      url: candidate.website
    )
  end

  private

  def intercept_link(candidate_id:, url:)
    url = Base64.encode64(url)
    redirect_path(candidate_id: candidate_id, url: url)
  end

  def candidate_link(candidate_id:, url:, icon_name: 'external-link')
    if url.present?
      link_to intercept_link(candidate_id, url), target: '_blank', rel: 'nofollow' do
        icon(icon_name)
      end
    else
      content_tag 'span', data: { toggle: 'tooltip', placement: 'top' }, title: I18n.t('candidates.links.missing') do
        icon(icon_name)
      end
    end
  end
end
