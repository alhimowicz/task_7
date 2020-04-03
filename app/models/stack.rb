class Stack < ApplicationRecord
    mount_uploaders :images, ImageUploader
    validate :images,  presence: true, length: { is: 10 }
    validate :tilte, presence: true, length: { minimum: 2 }
    
    #Cant use sessions from callbacks methods
end
