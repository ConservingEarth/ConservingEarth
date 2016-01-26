module ApplicationHelper

  def flash_class(level)
    case level.to_sym
      when :notice then "alert alert-success"
      when :info then "alert alert-info"
      when :alert then "alert alert-danger"
      when :warning then "alert alert-warning"
    end
  end

 def active_class(link_path)
  current_page?(link_path) ? "active" : ""
 end

 def broadcast(channel, &block)
  message = {:channel => channel, :data => capture(&block), :ext => {:auth_token => FAYE_TOKEN}}
  uri = URI.parse("http://localhost:9292/faye")
  Net::HTTP.post_form(uri, :message => message.to_json)
end


end
