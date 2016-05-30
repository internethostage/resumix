module SnippetsHelper

  def sti_snippet_path(type = "snippet", snippet = nil, action = nil)
    send "#{format_sti(action, type, snippet)}_path", snippet
  end

  def format_sti(action, type, snippet)
    action || snippet ? "#{format_action(action)}#{type.underscore}" : "#{type.underscore.pluralize}"
  end
  
  def format_action(action)
    action ? "#{action}_" : ""
  end

end
