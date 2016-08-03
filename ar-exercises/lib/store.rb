# class StoreValidator < ActiveModel::Validator
#   def validate(store)
#     unless store.mens_apparel || store.womens_apparel
#       store.errors[:mens_apparel] << "One of mens_apparel or womens_apparel must be true"
#       store.errors[:womens_apparel] << "One of mens_apparel or womens_apparel must be true"
#     end
#   end
# end

class Store < ActiveRecord::Base

  include ActiveModel::Validations

  has_many :employees
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
  validate :must_carry_some_apparel

  def must_carry_some_apparel
    unless mens_apparel || womens_apparel
      errors.add(:mens_apparel, "Must be some apparel at the store.")
      errors.add(:womens_apparel, "Must be some apparel at the store.")
    end
  end

end
