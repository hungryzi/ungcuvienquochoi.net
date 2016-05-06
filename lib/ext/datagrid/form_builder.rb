require "action_view"

module Datagrid
  module FormBuilder
    def datagrid_enum_filter(attribute_or_filter, options = {}, &block)
      filter = datagrid_get_filter(attribute_or_filter)
      if filter.checkboxes?
        partial = partial_path(options, 'enum_checkboxes')
        options = add_html_classes(options, 'checkboxes')
        elements = object.select_options(filter).map do |element|
          text, value = @template.send(:option_text_and_value, element)
          checked = enum_checkbox_checked?(filter, value)
          [value, text, checked]
        end
        @template.render(
          :partial => partial,
          :locals => {
            :elements => elements,
            :form => self,
            :filter => filter,
            :options => options,
          }
        )
      else
        if !options.has_key?(:multiple) && filter.multiple?
          options[:multiple] = true
        end
        select(
          filter.name,
          object.select_options(filter) || [],
          {:include_blank => filter.include_blank,
           :prompt => filter.prompt,
           :include_hidden => false,
           :label => filter.header},
           options, &block
        )
      end
    end
  end
end
