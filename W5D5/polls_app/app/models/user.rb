# == Schema Information
#
# Table name: users
#
#  id       :bigint           not null, primary key
#  username :string
#
# Indexes
#
#  index_users_on_username  (username) UNIQUE
#
class User < ApplicationRecord
  has_many :authored_polls,
    primary_key: :id,
    foreign_key: :poll_id,
    class_name: :Poll 

  has_many :responses,
    primary_key: :id,
    foreign_key: :response_id,
    class_name: :Response 
end
