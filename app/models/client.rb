class Client < ActiveRecord::Base
  belongs_to :user
  has_one :address, :as => :addressable, :dependent => :destroy
  has_one :report, :dependent => :destroy
  accepts_nested_attributes_for :address

  default_scope {order('id DESC')}
end
