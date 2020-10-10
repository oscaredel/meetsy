class Response < ApplicationRecord
  belongs_to :event
  belongs_to :contact, dependent: :destroy

  enum attendance: { yes: 1, maybe: 2, no: 0 }

  validates :attendance, presence: true

  # Validation for only allowing responses with contact.emails that have not responsed yet.
  # validate :uniqueness_of_response_contact_email

  # private

  # def uniqueness_of_response_contact_email
  #   # Validates that the given contact.email is not in @event.responses.contact.email
  #   response_emails = event.responses.map do |response|
  #     response.contact.email.downcase
  #   end

  #   if response_emails.include? contact.email.downcase
  #     errors.add(:base, "#{contact.email} has already responded. Check your e-mail to manage your response")
  #   end
  # end
end
