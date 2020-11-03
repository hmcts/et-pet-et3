class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable
  has_one :store


  def assign_reference
    self.reference = unique_application_reference if reference.empty?
  end

  private

  def unique_application_reference
    loop do
      ref = ApplicationReferenceService.call
      return ref unless self.class.exists?(reference: ref)
    end
  end
end
