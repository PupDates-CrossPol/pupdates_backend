class MatchSerializer
  include FastJsonapi::ObjectSerializer
  attributes :id, :user_id, :match_id, :status
end
