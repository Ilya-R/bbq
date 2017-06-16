# == Schema Information
#
# Table name: events
#
#  id          :integer          not null, primary key
#  title       :string
#  description :text
#  address     :string
#  datetime    :datetime
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  user_id     :integer
#

# (с) goodprogrammer.ru
#
# Модель события
class Event < ActiveRecord::Base
  # событие всегда принадлежит юзеру
  belongs_to :user
  has_many :comments
  has_many :subscriptions
  has_many :subscribers, through: :subscriptions, source: :user
  has_many :photos

  # юзера не может не быть
  validates :user, presence: true

  # заголовок должен быть, и не длиннее 255 букв
  validates :title, presence: true, length: {maximum: 255}

  validates :address, presence: true
  validates :datetime, presence: true

  # Метод, который возвращает всех, кто пойдет на событие:
  # всех подписавшихся и организатора
  def visitors
    (subscribers + [user]).uniq
  end
end

