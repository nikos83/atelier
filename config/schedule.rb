#config/schedule.rb
every 1.day, at: '9:00 am' do
	rake 'reservation_reminder:reservations_hanlder', environment: 'development'
end