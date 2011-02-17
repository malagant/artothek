module ApplicationHelper
  def manager(user)
    if user.class == User
      return current_user && current_user == user
    elsif user.class == Fixnum
      return current_user.id == user
    end
    false
  end

  def submit_for(name, options={})
    button_for(name, :class => 'button', :type => 'submit')
  end

  def twitter_url(user_name)
    "http://twitter.com/#{user_name}"
  end

  private

  def button_for(name, options = {})
    content_tag(:button, content_tag(:span, name), :class => options[:class], :type => options[:type])
  end
end
