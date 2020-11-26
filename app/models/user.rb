class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :timeoutable, timeout_in: 1.hour
  has_one :store
  validates :password, presence: true, on: :create
  after_initialize :assign_reference, if: :new_record?

  private

  def assign_reference
    self.reference = unique_application_reference if reference.empty?
  end

  def unique_application_reference
    loop do
      ref = ApplicationReferenceService.call
      return ref unless self.class.exists?(reference: ref)
    end
  end
end
