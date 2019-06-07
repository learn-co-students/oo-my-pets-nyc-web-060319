require 'pry'

class Owner
  
  attr_accessor :name, :pets, :mood
  attr_reader :species
  @@all = []

  def initialize(species)
    @name = name
    @species = species
    @pets = {fishes: [], cats: [], dogs: []}
    @@all << self
  end

  def self.all
    @@all
  end

  def self.count
    @@all.count
  end

  def self.reset_all
    @@all.clear
  end

  def say_species
    "I am a #{self.species}."
  end

  def buy_fish(name)
    @pets[:fishes] << Fish.new(name) 
  end

  def buy_cat(name)
    @pets[:cats] << Cat.new(name) 
  end

  def buy_dog(name)
    @pets[:dogs] << Dog.new(name) 
  end

  def walk_dogs
    @pets[:dogs].each do |dog|
      dog.mood = "happy"
    end
  end

  def play_with_cats
    @pets[:cats].each do |cat|
      cat.mood = "happy"
    end
  end

  def feed_fish
    @pets[:fishes].each do |fish|
      fish.mood = "happy"
    end
  end

  def sell_pets
    @pets.each do |type, pets|
      pets.each do |pet|
       pet.mood = "nervous"
      end
    end
    @pets.clear
  end
 #  binding.pry

  def list_pets
    "I have #{@pets[:fishes].size} fish, #{@pets[:dogs].length} dog(s), and #{@pets[:cats].size} cat(s)."
  end

end