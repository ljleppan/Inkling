json.array!(@exercises) do |exercise|
  json.extract! exercise, :id, :points, :question, :answer, :criteria
  json.url exercise_url(exercise, format: :json)
end
