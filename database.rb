#create loop that contains search, add and delete.
class DataEngine
  def initialize
    @people = []
  end

  def search

  end

  def prompt_for_search
    puts "Who would you like to search for in database?"
    search_name = gets.chomp

    index = 0
    loop do
      if index >= @people.length
        puts "Sorry, that person doesn't pary with us!"
        break
      end

      person = @people[index]

      if search_name == person.name
        puts "Found the life of the party!"
        puts person.address
        puts person.phone_number
        puts person.position
        puts person.salary
        puts person.slack_account
        puts person.github_account
        break
      end
      index = index + 1
    end
  end

  def prompt_for_add
    puts "Who would you like to add to database?"
    name = gets.chomp

    person = Person.new(name)

    puts "What is #{name}'s address?"
    person.address = gets.chomp
    puts "What is #{name}'s phone_number?"
    person.phone_number = gets.chomp
    puts "What is #{name}'s position?"
    person.position = gets.chomp
    puts "What is #{name}'s salary?"
    person.salary = gets.chomp
    puts "What is #{name}'s slack_account"
    person.slack_account = gets.chomp
    puts "What is #{name}'s github_account?"
    person.github_account = gets.chomp

    @people << person
  end

  def prompt_for_delete
    puts "Who do you wish to delete from database?"
    delete_name = gets.chomp

    index = 0
    loop do
      if index >= @people.length
        puts "Sorry, that person doesn't pary with us!"
        break
      end

      person = @people[index]
      if delete_name == person.name
        puts "Found the person, removing #{person.name}"
        @people.delete(person)
        break
      end
      index = index + 1
    end
  end

  def menu
    loop do
      puts "Welcome to The Iron Yard database! The people count is #{@people.length}"
      answer = gets.chomp
      case answer
      when "D", "Delete"
          prompt_for_delete
        when "A", "Add"
          prompt_for_add
        when "S", "Search"
          prompt_for_search
          next
        else
          puts "I didn't quite understand your request"
      end
    end
  end
end

require 'csv'
  CSV.open("people.csv", "w") do |csv|
  csv << ["name", "address", "position", "phone_number", "salary", "slack_account", "github_account"]
end

class Person
  attr_accessor :name, :address, :position, :phone_number, :salary, :slack_account, :github_account

  def initialize(name)
    @name = name
  end
end

my_database = DataEngine.new
my_database.menu
