module ApplicationHelper
  def get_url(object)
    farm_id = object.farm
    server_id = object.server
    id = object.id
    secret = object.secret
    url = "https://farm#{farm_id}.staticflickr.com/#{server_id}/#{id}_#{secret}.jpg"
  end
end
