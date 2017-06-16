module PhotosHelper
  #Хелпер добаваляющий атрибут к фотографии, чтобы заработала галерея lightbox
  # и показ фоточек на js на lightbox
  def photo_title(photo)

    photo_title = "Добавил: #{render partial: 'users/user', object: photo.user}"
    if current_user_can_edit?(photo)
      photo_title += link_to(
          fa_icon('trash'),
          event_photo_path(photo.event, photo),
          method: :delete,
          data: {confirm: 'Вы точно хотите удалить эту фотографию?'}
      )
    end
    return photo_title
  end

end