module ApplicationHelper
  def html_submit(content=fa_icon('save', :text => "Save"), extra={})
    content_tag "button", content.html_safe,  submit_options(extra)
  end

  def submit_options(extra={})
    { "type" => "submit",  "class" => "btn  btn-primary  ", 'data-disable-with' => "<i class='fa fa-spinner fa-spin'></i> Please wait...".html_safe }.with_indifferent_access.merge(extra)
  end

  def birthday_format(d)
    d.strftime("#{d.day.ordinalize} %B %Y")
  end
end
