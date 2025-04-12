Appointement.destroy_all
Note.destroy_all
Section.destroy_all

Appointement.create!([{
  id: 1,
  title: "Therapy Session with Dave",
  start_time: 2.hours.ago,
  end_time: 1.hour.ago
},
{
  id: 2,
  title: "Therapy Session with Mike",
  start_time: 5.hours.ago,
  end_time: 3.hours.ago
}
])

Note.create!([{
  id: 1,
  title: "Therapy Session with Dave",
  status: "Draft",
  appointement_id: 1
},
{
  id: 2,
  title: "Therapy Session with Mike",
  status: "Draft",
  appointement_id: 2
},
{
  id: 3,
  title: "Therapy Session with Mike x2",
  status: "Signed",
  appointement_id: 2
}
])

Section.create!([{
  id: 1,
  text: "Family Trauma",
  notes_id: 1
},
{
  id: 2,
  text: "Friend Notes",
  notes_id: 2
},
{
  id: 3,
  title: "Context",
  notes_id: 3
}
])


p "Created #{Appointement.count} Appointements"
p "Created #{Note.count} Notes"
p "Created #{Section.count} Sections"
