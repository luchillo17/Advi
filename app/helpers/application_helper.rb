module ApplicationHelper
  def link_to_with_locale(*args, &block)
    locale_param = params.permit(:locale)
    return link_to(*args, &block) unless locale_param.has_key?(:locale)

    # If block means the name is the block and the url position shifts to the left
    path_index = block_given? ? 0 : 1

    uri = URI.parse(args[path_index])
    uri.query = [uri.query, locale_param.to_query].compact.join('&')
    args[path_index] = uri.to_s

    link_to(*args, &block)
  end
end
