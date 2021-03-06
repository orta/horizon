class Project < ApplicationRecord
  belongs_to :organization
  has_many :stages, dependent: :destroy
  has_many :snapshots, dependent: :destroy
  belongs_to :snapshot, optional: true

  def fully_released?
    !!snapshot&.comparisons&.all?(&:released?)
  end
end
