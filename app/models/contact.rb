class Contact < ActiveRecord::Base
  
  validates_presence_of :first_name, :last_name, :phone
  validates :email, :format => {:with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i}
  validates :order_number, :format => {:with => /(^$)|(^R\d{9}$)/i, :message => I18n.t("invalid_order_number")}
  
  belongs_to :topic
  
  def mark_as_read
    self.is_read = true
    self.save
  end
 
end