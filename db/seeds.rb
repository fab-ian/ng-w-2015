puts "Seeds: start"

SubjectItemNote.destroy_all
SubjectItem.destroy_all
Teacher.destroy_all
Tuition.destroy_all
Student.destroy_all
User.destroy_all

puts "Seeds: deleted" 

TEACHER_TITLES = %w(Dr. Prof. TA)
User.create!(email: 'admin@admin.com',password: 'adminadmin')

3.times do
  Teacher.create!(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    academic_title: TEACHER_TITLES.sample
  )
end

teachers = Teacher.all
5.times do
  SubjectItem.create!(
    title: Faker::Lorem.sentence,
    teacher_id: teachers.sample.id
  )
end

25.times do
  Student.create!(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name
  )
end

students = Student.all
SubjectItem.all.each do |subject_item|
  subject_item.students << students.sample(rand(1..4))
end

SubjectItem.all.each do |subject_item|
  subject_item.students.each do |student|
    rand(1..5).times do
      subject_item.subject_item_notes << SubjectItemNote.create(student: student,
                                                    subject_item_id: subject_item,
                                                                value: rand(1..6))            
    end
  end
end

Student.all.each do |student|
  student_id = student.id
  period = '2015 / 10'
  payment = ''
  paid = false
  
  r = rand(2)
  if r == 1
    payment = "2015-09-#{rand(31)}"
    paid = true
  end

  Tuition.create(student_id: student_id, period: period, payment: payment, paid: paid) 
end

puts "Seeds: done"
