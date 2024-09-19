namespace :dev do
  desc 'Create data'
  task setup: :environment do
    if State.count.zero?

      State.create!(
        name: 'Paraná',
        acronym: 'PN'
      )

      State.create!(
        name: 'Santa Catarina',
        acronym: 'SC'
      )

      State.create!(
        name: 'Rio Grande do Sul',
        acronym: 'RS'
      )

    end
  end
end
