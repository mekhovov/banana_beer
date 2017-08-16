# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

categories = [
  { name: 'Development',  slug: 'development', position: 1,   category_css_class: 'text-info',   icon_css_class: 'fa-laptop'},
  { name: 'Life',       slug: 'life',      position: 2,   category_css_class: 'text-danger',  icon_css_class: 'fa-heart'},
  { name: 'Travel',     slug: 'travel',     position: 3,    category_css_class: 'text-success', icon_css_class: 'fa-suitcase'},
  { name: 'Photography',  slug: 'photo',     position: 4,   category_css_class: 'text-warning',   icon_css_class: 'fa-camera'},
  { name: 'Unsorted',   slug: 'unsorted',    position: 5,   category_css_class: 'text-default',   icon_css_class: 'fa-question'},
]

categories.each do |category_params|
  PostCategory.find_or_create_by!(category_params)
end