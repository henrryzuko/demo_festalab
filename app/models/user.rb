class User < ApplicationRecord
    validates :name, presence: { message: 'Obrigatório!' }
    validates :phone, phone: { message: 'Inválido!' }
    validates :email, email: { message: 'Inválido!' }
    validates :cpf, cpf: { message: 'Inválido!' }

    def self.search(query)

        name = "%#{query[:name]}%"
        email = "%#{query[:email]}%"
        phone = "%#{query[:phone].gsub(/[^0-9]/i, '')}%"
        cpf = "%#{query[:cpf].gsub(/[^0-9]/i, '')}%"

        where("( :nameq = '%%' or name like :nameq )
            and ( :emailq = '%%' or email like :emailq )
            and ( :phoneq = '%%' or phone like :phoneq )
            and ( :cpfq = '%%' or cpf like :cpfq )",
                nameq: name,
                emailq: email,
                phoneq: phone,
                cpfq: cpf
        )
    end
end
