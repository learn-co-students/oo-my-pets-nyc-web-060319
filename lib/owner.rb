class Owner
  @@all = []
  attr_reader :species
  attr_accessor :name, :pets
  
  def initialize(species)
    @species = species
    @pets = {
      fishes: [],
      cats: [],
      dogs: []
    }
    @@all << self
  end

  def say_species
    "I am a #{@species}."
  end

  def buy_fish(name)
    fish = Fish.new(name)
    @pets[:fishes] << fish
  end

  def buy_cat(name)
    cat = Cat.new(name)
    @pets[:cats] << cat
  end

  def buy_dog(name)
    dog = Dog.new(name)
    @pets[:dogs] << dog
  end

  def walk_dogs
      @pets[:dogs].each do |dog|
        dog.mood = 'happy'
      end
  end

  def play_with_cats
    @pets[:cats].each do |cat|
      cat.mood = 'happy'
    end
  end

  def feed_fish
    @pets[:fishes].each do |fish|
      fish.mood = 'happy'
    end
  end

  def sell_pets
    @pets.each do |pet_type, pet_array|
      pet_array.each do |pet|
        pet.mood = "nervous"
      end
    end
    @pets = {}
  end

  def list_pets
    num_fish = @pets[:fishes].size
    num_cats = @pets[:cats].size
    num_dogs = @pets[:dogs].size
    "I have #{num_fish} fish, #{num_dogs} dog(s), and #{num_cats} cat(s)."
  end


  def self.all
    @@all
  end

  def self.count
    @@all.size
  end

  def self.reset_all
    @@all = []
  end
end