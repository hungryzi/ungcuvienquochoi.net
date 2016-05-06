class Province < ActiveRecord::Base
  has_many :electorates

  def normalized_slug
    name.to_slug.normalize(transliterations: :vietnamese).to_s
  end
end
