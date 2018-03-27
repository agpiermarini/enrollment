require 'rails_helper'

describe 'User' do
  describe 'user clicks all students link' do
    it 'and is redirected to students_path' do
      student = Student.create(name: "Bob")

      visit student_path(student)
      click_on "All Students"

      expect(current_path).to eq(students_path)

      visit new_student_path
      click_on "All Students"

      expect(current_path).to eq(students_path)
    end
  end

  describe 'user clicks create student link' do
    it 'and is redirected to new_student_path' do
      student = Student.create(name: "Bob")

      visit student_path(student)
      click_on "Create New Student"

      expect(current_path).to eq(new_student_path)

      visit students_path
      click_on "Create New Student"

      expect(current_path).to eq(new_student_path)
    end
  end
end
