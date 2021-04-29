module ApplicationHelper
  def path_only(url)
    return nil if url.nil?

    URI.parse(url).tap do |uri|
      uri.host = nil
      uri.port = nil
      uri.scheme = nil
    end.to_s
  end
end
