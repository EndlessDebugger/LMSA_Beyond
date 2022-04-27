# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
starter = Point.create([{name: 'General Meeting',  point_type: 'event', val: 4, desc:'Meetings that we hold reguarly to discuss topics'},
                        {name: 'Volunteering Meeting',  point_type: 'event', val: 3, desc:'Outreach meetings'},
                        {name: 'Fundraising Meeting',  point_type: 'event', val: 3, desc: 'Meetings where we try to raise for good causes'},
                        {name: 'Familia Social',  point_type: 'event', val: 3, desc:'Hang out meetings'},
                        {name: 'Study Social',  point_type: 'event', val: 3, desc:'Study meetings'},
                        {name: 'Othere Meeting',  point_type: 'event', val: 3, desc:'One-off meetings'},
                        {name: 'Friend Referral',  point_type: 'referral', val: 3, desc:'bringing friends to the org'},
                        {name: 'Professional Referral',  point_type: 'referral', val: 4, desc:'Bringing a medical profession to the org'},
                        {name: 'Merchandise',  point_type: 'other', val: 3, desc:'buying merch'},
                        {name: 'Volunteering Meeting',  point_type: 'event', val: 3, desc:'Outreach meetings'},
                        {name: 'Raffle',  point_type: 'other', val: 1, desc:'Spending dough on raffles'},
                        {name: 'Instagram Q&A',  point_type: 'other', val: 2, desc:'IG'},
                        {name: 'Instagram Q&A Form',  point_type: 'form', val: 1, desc:'Outreach meetings'},
                        {name: 'Opporunity Share',  point_type: 'form', val: 1, desc:'Outreach meetings'},
                        {name: 'Social Media Share',  point_type: 'other', val: 1, desc:'Outreach meetings'}
                        ])