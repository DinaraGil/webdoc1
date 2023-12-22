module ApplicationHelper
    def bootstrap_labeled_text_field(name, label_text)
        content_tag(:div, class: 'form-group') do
          concat(label_tag("#{label_text}", nil, class: 'control-label col-md-2'))
          concat(content_tag(:div, class: 'col-md-10') do
            text_field_tag(name, nil, class: 'form-control')
          end)
        end
    end

    def bootstrap_labeled_date_field(name, label_text)
        content_tag(:div, class: 'form-group') do
          concat(label_tag("#{label_text}", nil, class: 'control-label col-md-2'))
          concat(content_tag(:div, class: 'col-md-10') do
            date_field_tag(name, nil, class: 'form-control')
          end)
        end
    end
end
