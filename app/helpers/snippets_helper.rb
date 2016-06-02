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

  def single_snippet_path(type = "snippet", snippet = nil, action = nil)
    "snippets/snippet/#{type.downcase}"
  end

  def single_snippet_locals(type = "snippet", snippet = nil, action = nil)
    "#{@type.downcase}: @snippet"
  end

end
