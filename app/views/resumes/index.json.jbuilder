json.array!(@resumes) do |resume|
  json.extract! resume, :id
  json.url resume_url(resume, format: :json)
end
