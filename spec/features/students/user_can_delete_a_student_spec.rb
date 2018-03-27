require 'rails_helper'

describe 'User' do
  describe 'can delete a student' do
    it 'and it destroys student' do
      student = Student.create(name: "Bob")
      visit students_path

      click_on 'Delete'

      expect(current_path).to eq("/students")
      expect(page).to have_content("#{student.name} has been destroyed :(")
      expect(page).to_not have_content("Student Name: #{student.name}")
    end
  end
end
