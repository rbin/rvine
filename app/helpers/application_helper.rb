module ApplicationHelper

  def render_flash_messages
    [:error, :success, :info].map do |type|
      content_tag(:div, :class => "alert alert-#{type} row-fluid") do
        "<strong>#{type.capitalize}</strong> #{flash[type]}".html_safe
      end if flash[type].present?
    end.join.html_safe
  end

end
