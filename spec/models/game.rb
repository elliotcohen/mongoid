class Game
  include Mongoid::Document
  field :high_score, :default => 500
  field :score, :type => Integer, :default => 0
  referenced_in :person
  enslave and cache
end
