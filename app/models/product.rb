require 'csv'
class Product < ApplicationRecord
  has_many :photos
  def self.import(file)
    CSV.foreach(file.path, headers: true,
                           col_sep: ',',
                           header_converters: :symbol) do |row|

      product = Product.find_by(cod: row[:cod]) || new
      product.attributes = row.to_hash
      product.save
    end
  end
end