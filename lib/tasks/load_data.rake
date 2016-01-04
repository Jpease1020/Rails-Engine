namespace :db do
  desc "Convert CSV files into corresponding model objects"
  task :load_data => :environment do


  end

  file = File.read('data/merchants.csv')
  csv = CSV.parse(file, :headers => true)
  csv.each do |row|
      Merchant.create!(row.to_hash)
  end

end
