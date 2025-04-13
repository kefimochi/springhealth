# SpringHealth Challenge

After running `rails bundle install` & `rake db:reset db:migrate` feel free to play around with these commands:

- Appointement.find(1)
- Appointement.create!(start_time: 2.hours.ago, end_time: 1.minute.ago, title: "Dave Session")

If you run `rails server` and go to `http://localhost:3000/appointements` you can also see the entire data structure.
