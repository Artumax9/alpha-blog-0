# app/helpers/form_errors_helper.rb

module FormErrorsHelper
  def form_group_with_errors(f, attribute, &block)
    has_error = f.object.errors[attribute].any?
    content_tag :div, class: "form-group #{"has-error" if has_error}" do
      capture(&block)
      if has_error
        content_tag(:div, f.object.errors[attribute].first, class: "text-danger small")
      end
    end
  end
end
