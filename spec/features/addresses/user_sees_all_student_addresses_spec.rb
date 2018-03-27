require 'rails_helper'

describe 'User' do
  describe 'can visit a students page' do
    it 'and can see all student addresses' do
      student = Student.create(name: "Bob")
      student.addresses.create(description: "Address 1", street: "Street 1", city: "City 1", state: "State 1", zip_code: "Zip 1")
      student.addresses.create(description: "Address 2", street: "Street 2", city: "City 2", state: "State 2", zip_code: "Zip 2")

      visit student_path(student)

      expect(page).to have_content("Address 1")
      expect(page).to have_content("Street 1")
      expect(page).to have_content("Address 2")
      expect(page).to have_content("Street 2")
    end
  end
end
