class StoreValidator < ActiveModel::Validator
  def validate(store)
    unless store.mens_apparel || store.womens_apparel
      store.errors[:mens_apparel] << "One of mens_apparel or womens_apparel must be true"
      store.errors[:womens_apparel] << "One of mens_apparel or womens_apparel must be true"
    end
  end
end

class Store < ActiveRecord::Base

  include ActiveModel::Validations

  has_many :employees
  validates_with StoreValidator
  validates :name,
    presence: true,
    length: {
      minimum: 3
    }
  validates :annual_revenue,
    presence: true,
    numericality: {
      only_integer: true,
      greater_than: 0
    }

end
