class Book < ApplicationRecord

  has_one_attached :profile_image
  belongs_to :user

  def get_image
    unless profile_image.attachhed?
      file_path = Rsils.root.join('app/assets/images/no_image.jpg')
        profile_image.attach(io: File.open(file_path),filename: 'default_image.jpg',contet_t_type: 'image/jpeg')
    else
      image
    end
  end

end
