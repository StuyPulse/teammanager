module StudentsHelper
  def formatted_phone_number(phone)
    unless phone.nil? || phone.length < 9
      "(#{phone[0..2]}) #{phone[3..5]}-#{phone[5..8]}"
    end
  end
end
