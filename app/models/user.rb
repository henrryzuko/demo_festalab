class User < ApplicationRecord
    validates :name, :email, :phone, :cpf, presence: { message: 'obrigatório' }
    # validates :cpf, length: { is: 11, wrong_length: "inválido" }
    validates :cpf, cpf: { message: 'Inválido!' }
end
