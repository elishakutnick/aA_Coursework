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
require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
