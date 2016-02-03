10.times do |n|
	Qualification.create!(description: FFaker::Education.degree_short)
end

10.times do |n|
	Skill.create!(description: FFaker::Skill.specialty)
end

10.times do |n|
	Language.create!(description: FFaker::Locale.language)
end

10.times do |n|
	Location.create!(description: FFaker::Address.city)
end

SalaryRange.create!(min_amount: "0" , 	max_amount: "5000")
SalaryRange.create!(min_amount: "5001" , max_amount: "10000")
SalaryRange.create!(min_amount: "10001" , max_amount: "15000")
SalaryRange.create!(min_amount: "15001" , max_amount: "25000")
SalaryRange.create!(min_amount: "25001" , max_amount: "40000")
SalaryRange.create!(min_amount: "40001" , max_amount: "100000")

Industry.create!(description: "Software")
Industry.create!(description: "Textile")
Industry.create!(description: "Service")
Industry.create!(description: "Hospitality")
Industry.create!(description: "Mining")

JobStatus.create!(description: "Applied")
JobStatus.create!(description: "Saved")
JobStatus.create!(description: "Accepted")
JobStatus.create!(description: "Rejected")

User.create!(
	qualification_id: 3,
	name: "John",
	email: "john@example.com", 
	phone: "+91 1234567890",
	password: "qwertyui",
	password_confirmation: "qwertyui"#,
	# activated:    true,
	# activated_at: Time.zone.now
)
UserSkill.create!(	user_id: 1,	skill_id: 2	)
UserSkill.create!(	user_id: 1,	skill_id: 4	)
UserSkill.create!(	user_id: 1,	skill_id: 6	)

UserLanguage.create!(	user_id: 1,	language_id: 4	)
UserLanguage.create!(	user_id: 1,	language_id: 6	)
UserLanguage.create!(	user_id: 1,	language_id: 9	)

num_companies = 20
num_companies.times do |n|
	Company.create!(
	  	name: FFaker::Company.name, 
	  	address: FFaker::Address.street_address,
	  	phone: FFaker::PhoneNumber.short_phone_number,
		email: FFaker::Internet.safe_email,
	    password: "qwertyui",
  		password_confirmation: "qwertyui",
	    pan: FFaker::String.from_regexp(/\w\w\w\d\d\d\d\d/),
		is_verified: true #,
		# activated:    true,
		# activated_at: Time.zone.now
	)
end

2.times do |n|
	Job.create!(
		company_id: 1,
		industry_id: rand(1..5),
		location_id: rand(1..10),
		title: FFaker::Job.title,
		postal_code: FFaker::String.from_regexp(/\d\d\d\d\d\d/),
		salary_type: FFaker::String.from_regexp(/[wmf]/),
		salary_offered: 5000,
		job_description: FFaker::Lorem.sentence,
		contact_person_name: FFaker::Name.name,
		contact_person_phone: FFaker::PhoneNumber.short_phone_number,
		contact_person_email: FFaker::Internet.safe_email,
		is_online: true
	)
end

40.times do |n|
	Job.create!(
		company_id: rand(1..num_companies),
		industry_id: rand(1..5),
		location_id: rand(1..10),
		title: FFaker::Job.title,
		postal_code: FFaker::String.from_regexp(/\d\d\d\d\d\d/),
		salary_type: FFaker::String.from_regexp(/[wmf]/),
		salary_offered: 5000,
		job_description: FFaker::Lorem.sentence,
		contact_person_name: FFaker::Name.name,
		contact_person_phone: FFaker::PhoneNumber.short_phone_number,
		contact_person_email: FFaker::Internet.safe_email,
		is_online: true
	)
end

SavedAppliedJob.create(	user_id: 1,	job_id: 1, job_status_id: 1	)
SavedAppliedJob.create(	user_id: 1,	job_id: 3, job_status_id: 1	)
SavedAppliedJob.create(	user_id: 1,	job_id: 5, job_status_id: 2	)
SavedAppliedJob.create(	user_id: 1,	job_id: 9, job_status_id: 2	)


Questionnaire.create!(job_id: 1, question: "What is 2 + 2?")
Questionnaire.create!(job_id: 1, question: "Select capital of Karnataka.")
Questionnaire.create!(job_id: 1, question: "Who is the captian of the Indian Cricket Team?")
Questionnaire.create!(job_id: 1, question: "When was Indian Independance declared?")
Questionnaire.create!(job_id: 2, question: "Who are the founders of Google?")
Questionnaire.create!(job_id: 2, question: "What is Fibonacci series?")
Questionnaire.create!(job_id: 2, question: "Pick the correct statement.")
Questionnaire.create!(job_id: 2, question: "What is pi?")


QuestionnaireOption.create!(questionnaire_id: 1, option: "22", isRight: false)
QuestionnaireOption.create!(questionnaire_id: 1, option: "4", isRight: true)
QuestionnaireOption.create!(questionnaire_id: 1, option: "12", isRight: false)
QuestionnaireOption.create!(questionnaire_id: 1, option: "-2", isRight: false)

QuestionnaireOption.create!(questionnaire_id: 2, option: "Hosakote", isRight: false)
QuestionnaireOption.create!(questionnaire_id: 2, option: "Belgaum", isRight: false)
QuestionnaireOption.create!(questionnaire_id: 2, option: "Bangalore", isRight: true)
QuestionnaireOption.create!(questionnaire_id: 2, option: "Kolar", isRight: false)

QuestionnaireOption.create!(questionnaire_id: 3, option: "Sachin", isRight: false)
QuestionnaireOption.create!(questionnaire_id: 3, option: "Dhoni", isRight: true)
QuestionnaireOption.create!(questionnaire_id: 3, option: "Dravid", isRight: false)
QuestionnaireOption.create!(questionnaire_id: 3, option: "Yuvraj", isRight: false)

QuestionnaireOption.create!(questionnaire_id: 4, option: "1947", isRight: true)
QuestionnaireOption.create!(questionnaire_id: 4, option: "1847", isRight: false)
QuestionnaireOption.create!(questionnaire_id: 4, option: "1874", isRight: false)
QuestionnaireOption.create!(questionnaire_id: 4, option: "1989", isRight: false)

QuestionnaireOption.create!(questionnaire_id: 5, option: "Ramesh and Suresh", isRight: false)
QuestionnaireOption.create!(questionnaire_id: 5, option: "Larry and Sergey", isRight: true)
QuestionnaireOption.create!(questionnaire_id: 5, option: "Veer and Zaara", isRight: false)
QuestionnaireOption.create!(questionnaire_id: 5, option: "John and Pascal", isRight: false)

QuestionnaireOption.create!(questionnaire_id: 6, option: "Each number is greater than the number before it.", isRight: false)
QuestionnaireOption.create!(questionnaire_id: 6, option: "Each number is smaller than the number before it.", isRight: false)
QuestionnaireOption.create!(questionnaire_id: 6, option: "Series of square roots of natural numbers", isRight: false)
QuestionnaireOption.create!(questionnaire_id: 6, option: "Series of numbers where the next number is found by adding up the two numbers before it", isRight: true)

QuestionnaireOption.create!(questionnaire_id: 7, option: "Mary had a little cow.", isRight: false)
QuestionnaireOption.create!(questionnaire_id: 7, option: "Jack and Jill went down the valley.", isRight: false)
QuestionnaireOption.create!(questionnaire_id: 7, option: "Humpty Dumpty sat on a bridge.", isRight: false)
QuestionnaireOption.create!(questionnaire_id: 7, option: "Twinkle twinkle little star.", isRight: true)

QuestionnaireOption.create!(questionnaire_id: 8, option: "3.1428", isRight: false)
QuestionnaireOption.create!(questionnaire_id: 8, option: "3.1415", isRight: false)
QuestionnaireOption.create!(questionnaire_id: 8, option: "Ratio of circumference to diameter of a circle.", isRight: true)
QuestionnaireOption.create!(questionnaire_id: 8, option: "6.12123", isRight: false)




AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password')