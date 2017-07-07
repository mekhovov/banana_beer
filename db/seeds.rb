# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

categories = [
  { name: 'Dev', slug: 'dev'},
  { name: 'Projects', slug: 'project'},
  { name: 'Presentations', slug: 'presentation'},
  { name: 'Talks', slug: 'talk'},
  { name: 'Life', slug: 'life'},
  { name: 'Travel', slug: 'travel'},
  { name: 'Photos', slug: 'photo'},
  { name: 'Unsorted', slug: 'unsorted'}
]

categories.each do |category_params|
  PostCategory.find_or_create_by!(category_params)
end