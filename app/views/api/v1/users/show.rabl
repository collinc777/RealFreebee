collection [@user] => :users

attributes :id, :name, :age, :city, :state

node :links do |user|
  links = {}
  if params['action'] == 'index'
    links[:show_user] = api_v1_user_url(user.id)
  else
    links[:all_users] = api_v1_users_url
  end
  links
end

child :points do
  attributes :id, :category, :description
  node(:date){|date| date.date.strftime("%m/%d/%y")}
  node :links do |point|
    links = {}
    links[:show_point] = api_v1_point_url(point.id)
    links[:all_points] = api_v1_points_url
    links
  end
end

# node :links do |user|
#   links = {}

#   links
# end
