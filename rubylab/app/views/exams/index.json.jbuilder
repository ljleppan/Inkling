json.array!(@exams) do |exam|
  json.extract! exam, :id, :course_id, :date, :type
  json.url exam_url(exam, format: :json)
end
