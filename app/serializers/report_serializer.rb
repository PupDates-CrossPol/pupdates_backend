class ReportSerializer
  include FastJsonapi::ObjectSerializer
  attributes :id, :user_id, :description
end
