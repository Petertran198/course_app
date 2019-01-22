class Student < ApplicationRecord
  has_many :student_courses
  has_many :courses, through: :student_courses

  before_save {self.email = email.downcase }
  #The code above is saying before the email hits the database it gets turn lowercase

  validates :name, presence: true, length: {maximum: 30}
  #This method is provided by rails for securing password
  has_secure_password
  #The code below shows how the email should be structured "Email_regex" & that the email is unique 
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i  
  validates :email, presence: true, length: { maximum: 105 },            
                         uniqueness: { case_sensitive: false },            
                          format: { with: VALID_EMAIL_REGEX }





end