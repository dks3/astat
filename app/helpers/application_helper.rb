module ApplicationHelper
  def error_messages_for(obj)
    render 'layouts/error_messages_for', obj: obj
  end

  def notice_messages
    render 'layouts/notice_messages'
  end
end
