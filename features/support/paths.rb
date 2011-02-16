module NavigationHelpers
  # Maps a name to a path. Used by the
  #
  #   When /^I go to (.+)$/ do |page_name|
  #
  # step definition in web_steps.rb
  #
  def path_to(page_name)
    case page_name

    when /the home\s?page/i
      root_path
    #
    # Users
    #
    when /the sign\s?up page/i
      new_user_registration_path
    when /the sign\s?in page/i
      new_user_session_path
    when /the sign\s?out page/i
      destroy_user_session_path
    #
    # Artists
    #
    when /the new artist page/i
      new_user_artist_path(1)
    #
    # Albums
    #
    when /the new album page/i
      new_user_artist_album_path(1,1)
    #
    # Tracks
    #
    when /the new album track page/i
      new_album_track_path(1)


    # Add more mappings here.
    # Here is an example that pulls values out of the Regexp:
    #
    #   when /^(.*)'s profile page$/i
    #     user_profile_path(User.find_by_login($1))

    else
      begin
        page_name =~ /the (.*) page/
        path_components = $1.split(/\s+/)
        self.send(path_components.push('path').join('_').to_sym)
      rescue Object => e
        raise "Can't find mapping from \"#{page_name}\" to a path.\n" +
          "Now, go and add a mapping in #{__FILE__}"
      end
    end
  end
end

World(NavigationHelpers)
