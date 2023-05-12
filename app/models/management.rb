class Management < ApplicationRecord
belongs_to :user


extend ActiveHash::Associations::ActiveRecordExtensions 
  belongs_to_active_hash :record
  
end
