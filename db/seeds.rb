
User.create(name: "Antoine", email: "Dember224@gmail.com", expertise: "Expert", career: Career.first, description: "I'm a simple hobbyist trying to create the things that don't exist but should.", password: "dekaos")

professions = ["Doctor", "Nurse", "Teacher", "Engineer", "Scientist", "Software Developer","Social Work", "Entrepreneur", "Acting/Directing", "Politics", "Law", "Marketing", "Athletics/Training"]

professions.each do |jobs|
  Career.create(job: jobs)
end
