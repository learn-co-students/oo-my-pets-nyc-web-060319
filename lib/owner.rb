require "pry"
class Owner

  attr_accessor :name, :pets
  attr_reader :species
  @@count = 0
  @@all = []
  
  def initialize(species)
    @@count +=1
    @species = species
    @@all << self
    @pets = {:fishes => [], :dogs => [], :cats => []}
  end

  def self.all
    @@all
  end

  def self.count
    @@count
  end

  def self.reset_all
    @@count = 0
  end

  def species
    @species
  end

  def say_species
    "I am a #{@species}."
  end

  def pets
    @pets
  end

  def buy_fish(name)
    f1 = Fish.new(name)
    @pets[:fishes] << f1
  end

  def buy_cat(name)
    c1 = Cat.new(name)
    @pets[:cats] << c1
  end

  def buy_dog(name)
    d1 = Dog.new(name)
    @pets[:dogs] << d1
  end

  def walk_dogs
    @pets[:dogs][0].mood = "happy"
  end

  def play_with_cats
    @pets[:cats][0].mood = "happy"
  end

  def feed_fish 
    @pets[:fishes][0].mood = "happy"
  end

  
  def list_pets
    #binding.pry
    "I have #{@pets[:fishes].length} fish, #{@pets[:dogs].length} dog(s), and #{@pets[:cats].length} cat(s)."
  end
  
  def sell_pets
    @pets.each do |animal, pet|
      pet.map do |friend|
        friend.mood = "nervous"
      end
    end
 
    
    @pets.each do |animal, pet|
      pet.clear
    end
  end
end