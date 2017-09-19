
User.create(name: "Antoine", email: "Dember224@gmail.com", expertise: "Expert", career: Career.first, description: "I'm a simple hobbyist trying to create the things that don't exist but should.", password: "dekaos")

professions = ["Medicine/Healthcare", "Education", "Engineering", "Scientist", "Software", "Social Work", "Entrepreneur", "Entertainment", "Politics", "Law", "Marketing", "Athletics/Training", "Public Policy", "Real Estate", "Finance", "Military", "Law Enforcement", "Culinary Arts", "Art", "Authorship/Publishing", "Journalism"]

professions.each do |jobs|
  Career.create(job: jobs)
end
