module StudentsHelper
  def formatted_phone_number(phone)
    "(#{phone[0..2]})-#{phone[3..5]}-#{phone[5..8]}" unless phone.length < 9
  end
end
