class User < ActiveRecord::Base
  has_secure_password
  
  validates :username, 
            :presence => {:message => "Du måste ange ett användarnamn"},  
            :uniqueness => {:message => "Användarnamnet finns redan, välj ett annat."}, 
            length: { minimum: 5, message: "Användarnamnet är för kort, ange minst 6 tecken." }, 
            format: { with: /\A[a-zåäöA-ZÅÄÖ]+\z/, message: "Fältet 'användarnamn' innehåller otillåtna karaktärer" }
  
  validates :email, 
            :presence => {:message => "Du måste ange en epost"}, 
            :uniqueness => {:message => "E-posten finns redan, välj ett annat."},
            format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, message: "Fältet 'email' innehåller otillåtna karaktärer" }
  
  validates :password, 
            :presence => {:message => "Du måste ange ett lösenord"},   
            confirmation: true, 
            length: { minimum: 6, message: "Lösenordet är för kort, ange minst 6 tecken." }, 
            format: { with: /\A[a-zåäöA-ZÅÄÖ]+\z/, message: "Fältet 'lösenord' innehåller otillåtna karaktärer." }
  
  validates :password_confirmation, 
            :presence => {:message => "Du måste upprepa ditt lösenord."}
end
