# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
def dot
  print "."
end


puts "Generating Seed Data"
if Rails.env.development?
  user = User.find_or_create_by(email: "awesome.owner@bookmaker.com") do |usr|
    usr.password = "secret123"
    usr.password_confirmation = "secret123"
  end
  puts "# Created a user"
  user.confirm!
  puts "## Confirmed the user"

  book = Book.find_or_create_by(title: "My Little book of awesomeness", owner_id: user.id)
  puts "# Created a book"

  puts "## Seeding book content"
  (10 - book.chapters.count).times do
    chapter = book.chapters.create(title: Faker::Book.title)
    sections_count = 5 + rand(6)
    (sections_count - chapter.sections.count).times do
      content = Faker::Hipster.paragraphs(1 + rand(3)).join("\n\n")
      chapter.sections.create(title: Faker::Book.title, content: content)
      dot
    end
    dot
  end
end

puts ""
puts "Done"
