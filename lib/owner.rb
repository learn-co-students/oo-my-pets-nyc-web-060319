class Owner

  attr_accessor :pets, :name
  attr_reader :species

  @@all = []

  def initialize(species)
    @name = name
    @species = species
    @pets = {fishes:[], cats:[], dogs:[]}
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
    "I am a #{@species}."
  end

  def buy_fish(name)
    fish = Fish.new(name)
    @pets[:fishes] << fish
    fish.owner = self
  end

  def buy_dog(name)
    dog = Dog.new(name)
    @pets[:dogs] << dog
    dog.owner = self
  end

  def buy_cat(name)
    cat = Cat.new(name)
    @pets[:cats] << cat
    cat.owner = self
  end

  def walk_dogs
    @pets[:dogs].each {|dog| dog.mood = "happy"}
  end

  def play_with_cats
    @pets[:cats].each {|cat| cat.mood = "happy"}
  end

  def feed_fish
    @pets[:fishes].each {|fish| fish.mood = "happy"}
  end

  def sell_pets
    @pets.each do |type, pets|
      pets.each {|pet| pet.mood = "nervous"}
    end

    @pets.clear
  end

  def list_pets
    num_fish = @pets[:fishes].size
    num_dog = @pets[:dogs].size
    num_cat = @pets[:cats].size

    "I have #{num_fish} fish, #{num_dog} dog(s), and #{num_cat} cat(s)."
  end

end