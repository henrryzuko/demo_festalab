class User < ApplicationRecord
    validates :name, presence: { message: 'obrigatório' }
    validates :phone, phone: { message: 'Inválido!' }
    validates :email, email: { message: 'Inválido!' }
    validates :cpf, cpf: { message: 'Inválido!' }
end
