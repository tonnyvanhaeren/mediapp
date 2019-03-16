# ActionView::Base.field_error_proc = Proc.new do |html_tag, instance|
#   if instance.error_message.kind_of?(Array)
#     %(#{html_tag}<span class="validation-error">&nbsp;
#       #{instance.error_message.join(',')}</span>).html_safe
#   else
#     %(#{html_tag}<span class="validation-error">&nbsp;
#       #{instance.error_message}</span>).html_safe
#   end
# end

ActionView::Base.field_error_proc = proc do |html_tag, _instance|
  class_attr_index = html_tag.index 'class="'

  if class_attr_index
    html_tag.insert class_attr_index + 7, 'is-invalid '
  else
    html_tag.insert html_tag.index('>'), ' class="is-invalid"'
  end
end