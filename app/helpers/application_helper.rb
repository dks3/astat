module ApplicationHelper
  def error_messages_for(obj)
    render 'layouts/error_messages_for', obj: obj
  end

  def notice_messages
    render 'layouts/notice_messages'
  end

  def link_to_remove_fields(name, f)
    f.hidden_field(:_destroy) + link_to_function(name, "remove_fields(this)")
  end

  def link_to_add_fields(name, f, association)
    puts "________________________________________________"
    p f.object.class.reflect_on_association(association).class
    puts "________________________________________________"
    new_object = f.object.class.reflect_on_association(association).klass.new
    fields = f.fields_for(association, new_object, :child_index => "new_#{association}") do |builder|
      render(association.to_s.singularize + "_fields", :f => builder)
    end
    link_to_function(name, "add_fields(this, \"#{association}\", \"#{escape_javascript(fields)}\")")
  end


  def sortable(column, title = nil)
    title = title
    direction = column == sort_column && sort_direction == "asc" ? "desc" : "asc"
    link_to title, {:sort => column, :direction => direction, :time1 => @time1, :time2 => @time2}
  end


end
