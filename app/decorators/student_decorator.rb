class StudentDecorator < BaseDecorator
  def full_name
    "#{first_name} #{last_name}"
  end

  def avg_notes(subject_item)
    sum = 0.00
    i = 0
    avg = 0
    sin = SubjectItemNote.where(student_id: student.id, subject_item_id: subject_item.id)
    
    sin.each do |subject_note|
      sum += subject_note.value
      i += 1
    end

    avg = (sum / i) if sum > 0
    '%.2f' % avg
  end

  def birthday
    object.birthday.strftime('%Y-%m_%d') if object.birthday
  end
end
