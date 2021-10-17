namespace :db do
  desc "import stations"
  task import_stations: :environment do
    import_path = File.join(Rails.root, "db", "import", "*")
    Dir[import_path].each do |file|
      pp "Importing #{file}"
      service = ImportStationService.call(file: file)
      next if service.success?

      pp "[ERROR] #{service.errors.full_messages.to_sentence}"
    end
  end
end
