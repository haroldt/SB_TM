require 'TM_Log.rb'

def anonimize_data(record)

  name_loc = record.index("Name:")+1
  phone_loc = record.index("Home Phone:")+1
  dob_loc = record.index("Date of Birth:")+1
  age_loc = record.index("Age:")+1

  age = record[age_loc].to_i
  record[dob_loc] = Faker::Date.between((age+1).years.ago, age.years.ago).strftime('%m/%d/%y')
  record[name_loc] = Faker::Name.name.split[0..1].reverse.join(',')
  record[phone_loc] = Faker::PhoneNumber.cell_phone

  record

end

def anonimize_scouts( scout, record)
  name_loc = record.index("Name:")+1
  phone_loc = record.index("Home Phone:")+1
  dob_loc = record.index("Date of Birth:")+1
  age_loc = record.index("Age:")+1
  
  name = record[name_loc].split(",")
  scout[:last_name] = name[0]
  scout[:first_name] = name[1]
  scout
end

def log_header
  ["BSA Member ID","First Name","Middle Name","Last Name","Log Type","Date","Nights","Days","Miles","Hours","Frost Points","Location/Name","Notes"]
end



  
  
