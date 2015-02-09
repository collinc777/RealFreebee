collection [@point] => :points

attributes :id, :category, :description, :user_id
node(:date){|point| point.date.strftime("%m/%d/%y")}

node :links do |point|
  links = {}
  if params['action'] == 'index'
    links[:show_point] = api_v1_point_url(point.id)
  else
    links[:all_points] = api_v1_points_url
  end
  links
end

child :user do
  attributes :id, :name, :age, :city, :state
  node :links do |user|
    links = {}
    links[:show_user] = api_v1_user_url(user.id)
    links[:all_users] = api_v1_users_url
    links
  end
end
