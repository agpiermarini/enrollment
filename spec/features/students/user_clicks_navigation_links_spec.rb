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

  describe 'visits student index and clicks on students name' do
    it 'and is redirected to that student_path' do
      student_1 = Student.create(name: "Cindy")
      student_2 = Student.create(name: "Bob")

      visit students_path
      click_on "#{student_1.name}"

      expect(current_path).to eq(student_path(student_1))
    end
  end
end
