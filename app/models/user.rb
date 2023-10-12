class User < ApplicationRecord
    validates :name, presence: { message: 'Obrigatório!' }
    validates :phone, phone: { message: 'Inválido!' }
    validates :email, email: { message: 'Inválido!' }
    validates :cpf, cpf: { message: 'Inválido!' }

    def self.search(query)
        query = "%#{query}%"
        where("name like ? or email like ? or phone like ? or cpf like ?", query, query, query, query)
    end
end
