require "csv"

# Schools
schoolList = Array.new
unless School.first
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
departList = Array.new
unless Department.first
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
prefList = Array.new
unless Prefectural.first
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

# paper template
unless PaperTemplate.first
  CSV.foreach('db/paper_template.csv') do |row|
  record = {
    :name           => row[0],
    :en             => row[1],
    :path           => row[2],
    :cols           => row[3].to_i,
    :rows           => row[4].to_i,
    :margin_x       => row[5].to_i,
    :margin_y       => row[6].to_i,
    :gap_x          => row[7].to_i,
    :gap_y          => row[8].to_i,
  }
  p record
  PaperTemplate.create!(record)
  end
end

unless CardTemplate.first
  CSV.foreach('db/card_template.csv') do |row|
    record = {
      :name             => row[0],
      :en               => row[1],
      :path             => row[2],
      :size_x           => row[3].to_i,
      :size_y           => row[4].to_i,
      :fullname         => row[5].to_b,
      :fullname_kana    => row[6].to_b,
      :department       => row[7].to_b,
      :course           => row[8].to_b,
      :laboratory       => row[9].to_b,
      :email            => row[10].to_b,
      :tel              => row[11].to_b,
      :address_code     => row[12].to_b,
      :address_city     => row[13].to_b,
      :address_street   => row[14].to_b,
      :address_building => row[15].to_b,
      :twitter          => row[16].to_b,
      :facebook         => row[17].to_b,
      :url              => row[18].to_b,
      :free             => row[19].to_b,
    }
    p record
    CardTemplate.create!(record)
  end
end

