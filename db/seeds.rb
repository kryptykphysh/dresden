# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

skill_levels = SkillLevel.create(
  [
    { 
      name:     'Mediocre',
      modifier: 0
    },
    {
      name:     'Average',
      modifier: 1 
    },
    {
      name:     'Fair',
      modifier: 2 
    },
    {
      name:     'Good',
      modifier: 3 
    },
    {
      name:     'Great',
      modifier: 4 
    },
    {
      name:     'Superb',
      modifier: 5 
    }
  ]
)

power_levels = PowerLevel.create(
  [
    {
      name:         'Feet in the Water',
      refresh:      6,
      skill_points: 20,
      skill_cap_id: SkillLevel.find_by(name: 'Great').id
    },
    {
      name:         'Up to Your Waist',
      refresh:      7,
      skill_points: 25,
      skill_cap_id: SkillLevel.find_by(name: 'Great').id
    },
    {
      name:         'Chest-Deep',
      refresh:      8,
      skill_points: 30,
      skill_cap_id: SkillLevel.find_by(name: 'Superb').id
    },
    {
      name:         'Submerged',
      refresh:      10,
      skill_points: 35,
      skill_cap_id: SkillLevel.find_by(name: 'Superb').id
    }
  ]
)

phases = Phase.create(
  [
    {
      name:     'Background',
      question: 'Where did you come from?'
    },
    {
      name:     'Rising Conflict',
      question: 'What shaped you?'
    },
    {
      name:     'The Story',
      question: 'What was your first adventure?'
    },
    {
      name:     'Guest Starring',
      question: 'Whose path have you crossed?'
    },
    {
      name:     'Guest starring redux',
      question: "Who else's path have you crossed?"
    },
  ]
)
