require 'rails_helper'

describe 'User' do
  describe 'can complete a form to edit a student' do
    it 'and it edits the student' do
      student = Student.create(name: "Bob")
      visit edit_student_path(student)

      new_name = "Not Bob"

      fill_in 'student[name]', with: "Not Bob"
      click_on 'Update Student'

      expect(current_path).to eq("/students/#{student.id}")
      expect(page).to have_content("You changed this students name to #{new_name}")
      expect(page).to have_content("Student Name: #{new_name}")
    end
  end
end
