module Sinatra
	module FormHelper
		def form_open(record, options={})
			if options[:method]
				method = options[:method]
			else
				method = record.persisted? ? 'get' : 'post'
			end
      action = resource_index_path(record.class.to_s.downcase)
      open_form_tag(action, method, record)
    end

    def open_form_tag(action, method, record)
      full_action = [action, record.id].compact.join("/")
      str = ""
      if ["delete", "patch", "put"].include?(method)
        str << "<form action='#{full_action}' method='post'>"
        str << "<input type='hidden' name='_method' value='#{method}'>"
      else
        str << "<form action='#{full_action}' method='#{method}'>"
      end
    end

    def input_tag(options={})
      type = options[:type]
      resource = options[:resource]
      name = options[:name]
      value = options[:value]
      placeholder = options[:placeholder]
      min = options[:min]
      max = options[:max]
      "<input type='#{type}' name='#{resource}[#{name}]' value='#{value}' placeholder='#{placeholder}' min='#{min}' max='#{max}'>"

    end

    def select_tag(options={})
      values = options[:values]
      resource = options[:resource]
      name = options[:name]
      "<select name='#{resource}[#{name}]'>"
    end

    def select_tag_options(options={})
      values = options[:values]
      values.map do |val|
        "<option value='#{val}'>#{val.capitalize}</option>"
      end
    end

    def select_close
      "</select>"
    end

    def form_close
      "</form>"
    end
  end
  helpers FormHelper
end