#!/usr/bin/env ruby

require "sinatra"

configure do
  enable :inline_templates
end

helpers do
  include ERB::Util
end

set :environment, :production

get "/" do
  @title = "Sew"
  @user = params["user"].to_s
  unless @user.empty?
    if @user.include? ";" or @user.include? "&" or @user.include? "|" or @user.include? "\n"
      @msg = "Invalid User"
    else
      @cmd = "id " + @user
      @msg = "Command: #{@cmd}"
      @output = `#{@cmd}`
    end
  end
  erb :index
end


__END__

@@ layout
<!doctype html>
<html>
 <head>
  <title><%= h @title %></title>
 </head>
 <body>
  <div class="box">
    <h1><%= h @title %></h1>
    <%= yield %>
  </div>
 </body>
</html>

@@ index
<form action="." method="get">
 <input name="user" />
 <br />
 <input type="submit" value="User Lookup" />
</form>
<hr />

<% if @msg %>
 <%= h @msg %>
 <br />
<% end %>

<% if @output %>
 <textarea cols="100" rows="30">
  <%= h @output %>
 </textarea>
<% end %>
