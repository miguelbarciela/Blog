class Article < ApplicationRecord
    has_rich_text :content
    belongs_to :user
    has_many :has_categories
    has_many :categories, through: :has_categories #relacion muchoas a muchos entre articles y categories

    attr_accessor :category_elements #define propiedad que puedo leer y escribir

    def save_categories
        #category_elements 1,2,3
        #convertir en un arreglo 1,2,3 => [1,2,3]
        categories_array = category_elements.split(",")
        #iterar ese arreglo
        categories_array.each do |category_id|
            #crear HasCategory HasCategory<article_id: 1, category_id: 2>
            HasCategory.find_or_create_by(article: self, category_id: category_id)
            #evita que se creen duplicados
        end
        
    end

end
