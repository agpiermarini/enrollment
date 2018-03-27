require 'rails_helper'

describe 'User' do
  describe 'can submit new student form' do
    it 'and it creates new student' do
      visit new_student_path

      fill_in 'student[name]', with: "Bob"
      click_on 'Create Student'

      expect(current_path).to eq("/students/#{Student.last.id}")
      expect(page).to have_content("You created a new student named: #{Student.last.name}")
      expect(page).to have_content("Student Name: #{Student.last.name}")
    end
  end
end
