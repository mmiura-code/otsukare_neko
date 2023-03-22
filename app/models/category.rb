class Category < ApplicationRecord
    #絵文字のエンコーディング
    def name
        read_attribute(:name).try(:force_encoding, 'UTF-8')
    end
end
