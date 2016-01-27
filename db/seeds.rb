# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


Post.create(name: 'first one', published: true , featured: true)
Post.create(name: 'second one', published: false , featured: false)
Post.create(name: 'third one', published: true , featured: false)
Post.create(name: 'fourth one', published: false , featured: true)
Post.create(name: 'fifth one', published: true , featured: true)
