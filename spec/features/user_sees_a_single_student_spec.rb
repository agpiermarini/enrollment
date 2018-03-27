require 'rails_helper'

describe 'User' do
  describe 'user visits student_path' do
    it 'and sees a students informatino' do
      student = Student.create(name: "Bob")

      visit student_path(student)

      expect(page).to have_content(student.name)
    end
  end
end
