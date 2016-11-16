class DataEngine
  def initialize
    @people = []
  end

  def search

  end
  def banner (message)
    puts "*" * (4 + message.length)
    puts "* #{message} *"
    puts "*" * (4 + message.length)
  end

  def prompt_for_search
    puts
    puts "Who would you like to search for in database?"
    puts
    search_name = gets.chomp

    index = 0
    loop do
      if index >= @people.length
        puts
        banner "Sorry, that person doesn't pary with us!"
        puts
        break
      end

      person = @people[index]

      if search_name == person.name
        puts
        puts "Found the life of the party!"
        puts
        puts person.address
        puts
        puts person.phone_number
        puts
        puts person.position
        puts
        puts person.salary
        puts
        puts person.slack_account
        puts
        puts person.github_account
        puts
        break
      end
      index = index + 1
    end
  end

  def prompt_for_add
    puts
    puts "Who would you like to add to database?"
    puts
    name = gets.chomp

    person = Person.new(name)

    puts
    puts "What is #{name}'s address?"
    puts
    person.address = gets.chomp
    puts
    puts "What is #{name}'s phone_number?"
    puts
    person.phone_number = gets.chomp
    puts "What is #{name}'s position?"
    puts
    person.position = gets.chomp
    puts
    puts "What is #{name}'s salary?"
    puts
    person.salary = gets.chomp
    puts
    puts "What is #{name}'s slack_account"
    puts
    person.slack_account = gets.chomp
    puts
    puts "What is #{name}'s github_account?"
    puts
    person.github_account = gets.chomp

    @people << person
  end

  def prompt_for_delete
    puts
    puts "Who do you wish to delete from database?"
    puts
    delete_name = gets.chomp

    index = 0
    loop do
      if index >= @people.length
        puts
        puts "Sorry, that person doesn't pary with us!"
        puts
        break
      end

      person = @people[index]
      if delete_name == person.name
        puts
        puts "Found the person, removing #{person.name}"
        puts
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
