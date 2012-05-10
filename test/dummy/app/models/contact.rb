class Contact < ActiveRecord::Base
  attr_accessible :address, :country, :fax, :person_id, :phone
end
