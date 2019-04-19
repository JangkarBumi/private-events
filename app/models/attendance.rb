# frozen_string_literal: true

# Attendance model
class Attendance < ApplicationRecord
  belongs_to :user
  belongs_to :event
end
