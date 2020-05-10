# == Schema Information
#
# Table name: responses
#
#  id               :bigint           not null, primary key
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  answer_choice_id :integer          not null
#  voter_id         :integer          not null
#
require 'test_helper'

class ResponseTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
