class Article < ApplicationRecord
 # Association # dependent option by rails to destroy meta data or article having comment inside article
  has_many :comments, dependent: :destroy
  validates :title, presence: true, length: { minimum: 5 }

  before_save do|article|
    puts "I called before commited into database"
  end

  after_save do|article|
    puts "I called after saving into database"
  end

  after_initialize do |article|
    puts "You have initialized an object!"
  end

  after_find do |article|
    puts "You have found an object!"
  end

  before_validation do |article|
    puts "I am run before validation check"
  end

  after_validation do |article|
    puts "I am run after validation check"
  end

  after_destroy do |article|
    puts "I am run after destroying record"
  end
end
