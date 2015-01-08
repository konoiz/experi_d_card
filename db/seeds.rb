require "csv"

# Schools
unless School.first
  schoolList = Array.new
  CSV.foreach('db/schools.csv') do |row|
    record = {
      :id     => row[0].to_i,
      :name   => row[1],
      :en     => row[2],
      :short  => row[3],
    }
    p record
    name = School.create!(record)
    schoolList[name.id] = name
  end
end

# Departments
unless Department.first
  departList = Array.new
  CSV.foreach('db/departments.csv') do |row|
    record = {
      :id     => row[0].to_i,
      :school => schoolList[row[1].to_i],
      :name   => row[2],
      :en     => row[3],
      :short  => row[4],
    }
    p record
    name = Department.create!(record)
    departList[name.id] = name
  end
end

# Laboratories
unless Laboratory.first
  CSV.foreach('db/laboratories.csv') do |row|
    record = {
      :id           => row[0].to_i,
      :department   => departList[row[1].to_i],
      :name         => row[2],
      :teacher      => row[3],
    }
    p record
    Laboratory.create!(record)
  end
end

# Courses
unless Course
  CSV.foreach('db/courses.csv') do |row|
    record = {
      :id           => row[0].to_i,
      :department   => departList[row[1].to_i],
      :name         => row[2],
    }
    p record
    Course.create!(record)
  end
end

# Prefectural code
unless Prefectural.first
  prefList = Array.new
  CSV.foreach('db/prefecturals_name_seed.csv') do |row|
    record = {
      :id   => row[0].to_i,
      :name => row[1],
    }
    p record
    name = Prefectural.create!(record)
    prefList[name.id] = name
  end
end

# Area (Postal) code
unless Area.first
  CSV.foreach('db/postal_code_seed.csv') do |row|
    record = {
      :postal_code    => row[0],
      :prefectural    => prefList[row[1].to_i],
      :city           => row[3],
      :street         => row[4],
    }
    p record
    Area.create!(record)
  end
end
