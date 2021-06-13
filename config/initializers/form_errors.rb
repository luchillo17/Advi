# frozen_string_literal: true

# Be sure to restart your server when you modify this file.
ActionView::Base.field_error_proc = proc do |html_tag, _instance|
  if html_tag.exclude?('class')
    html_tag[' '] = " class='invalid red-text' ".html_safe
    next html_tag
  end

  html_tag['class="'] = 'class="invalid red-text '.html_safe
  html_tag
end