class User < ApplicationRecord
    validates :name, :phone, presence: { message: 'obrigatório' }
    validates :email, email: { message: 'Inválido!' }
    validates :cpf, cpf: { message: 'Inválido!' }
end
