# == Schema Information
#
# Table name: questions
#
#  id      :bigint           not null, primary key
#  text    :string           not null
#  poll_id :integer          not null
#
class Question < ApplicationRecord
end
