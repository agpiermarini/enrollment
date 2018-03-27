require 'rails_helper'

describe 'User' do
  describe 'can complete a new address form' do
    it 'and it creates a new address' do
      student = Student.create(name: "Bob")
      visit new_student_address_path(student.id)

      test_description = "Bob's House"
      test_street = "1 Main Street"
      test_city = "Denver"
      test_state = "CO"
      test_zip = 80205

      fill_in 'address[description]', with: test_description
      fill_in 'address[street]', with: test_street
      fill_in 'address[city]', with: test_city
      fill_in 'address[state]', with: test_state
      fill_in 'address[zip_code]', with: test_zip
      click_on 'Create Address'

      expect(current_path).to eq("/students/#{student.id}")
      expect(page).to have_content("You created a new address for #{Student.last.name}")
      expect(page).to have_content(test_description)
      expect(page).to have_content(test_street)
      expect(page).to have_content(test_city)
      expect(page).to have_content(test_state)
      expect(page).to have_content(test_zip)
    end
  end
end
