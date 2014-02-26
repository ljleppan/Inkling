json.array!(@courses) do |course|
  json.extract! course, :id, :name_fi, :name_en, :name_se, :hy_id, :active
  json.url course_url(course, format: :json)
end
