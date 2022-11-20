# frozen_string_literal: true

class Tag < ApplicationRecord
  belongs_to :article

  validates :name, presence: true
  validates_uniqueness_of :name, case_sensitive: false
end
