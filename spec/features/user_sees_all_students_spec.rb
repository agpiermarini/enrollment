require 'rails_helper'

describe 'User' do
  describe 'user visits student index' do
    it 'and sees information for all students' do
      student_1 = Student.create(name: "Cindy")
      student_2 = Student.create(name: "Bob")

      visit students_path

      expect(page).to have_content("All Students")
      expect(page).to have_content(student_1.name)
      expect(page).to have_content(student_2.name)
    end
  end
end
