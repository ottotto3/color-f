# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Admin.find_or_create_by(email: 'admin@admin') do |admin|
   admin.password = "admin1"
   admin.password_confirmation = "admin1"
end


Item.create!(
 [
    {
      name: "フローラルファンタジー",
      price: 3500,
      capacity: 15,
      is_active: true,
      image: ActiveStorage::Blob.create_after_upload!(
       io: File.open(Rails.root.join('app/assets/images/pf/color3.jpg')),
       filename: 'color3.jpg',
       content_type: 'image/jpeg'
      ).signed_id
    },
    {
      name: "クリスタルエンチャント",
      price: 2500,
      capacity: 15,
      is_active: true,
      image: ActiveStorage::Blob.create_after_upload!(
       io: File.open(Rails.root.join('app/assets/images/pf/color4.jpg')),
       filename: 'color4.jpg',
       content_type: 'image/jpeg'
      ).signed_id
    },
    {
      name: "グレイシャルミスト",
      price: 3000,
      capacity: 15,
      is_active: true,
      image: ActiveStorage::Blob.create_after_upload!(
       io: File.open(Rails.root.join('app/assets/images/pf/color5.jpg')),
       filename: 'color5.jpg',
       content_type: 'image/jpeg'
      ).signed_id
    },
    {
      name: "マジカルムーンストーン",
      price: 3000,
      capacity: 15,
      is_active: true,
      image: ActiveStorage::Blob.create_after_upload!(
       io: File.open(Rails.root.join('app/assets/images/pf/color6.jpg')),
       filename: 'color6.jpg',
       content_type: 'image/jpeg'
      ).signed_id
    },
    {
      name: "ゴールデンサンセット",
      price: 1500,
      capacity: 15,
      is_active: true,
      image: ActiveStorage::Blob.create_after_upload!(
       io: File.open(Rails.root.join('app/assets/images/pf/color7.jpg')),
       filename: 'color7.jpg',
       content_type: 'image/jpeg'
      ).signed_id
    },
    {
      name: "サマーブリーズメロディ",
      price: 2000,
      capacity: 15,
      is_active: true,
      image: ActiveStorage::Blob.create_after_upload!(
       io: File.open(Rails.root.join('app/assets/images/pf/color8.jpg')),
       filename: 'color8.jpg',
       content_type: 'image/jpeg'
      ).signed_id
    },
    {
      name: "エターナルブルーム",
      price: 3000,
      capacity: 15,
      is_active: true,
      image: ActiveStorage::Blob.create_after_upload!(
       io: File.open(Rails.root.join('app/assets/images/pf/color9.jpg')),
       filename: 'color9.jpg',
       content_type: 'image/jpeg'
      ).signed_id
    },
    {
      name: "ラストリゾートローズ",
      price: 4000,
      capacity: 15,
      is_active: true,
      image: ActiveStorage::Blob.create_after_upload!(
       io: File.open(Rails.root.join('app/assets/images/pf/color10.jpg')),
       filename: 'color10.jpg',
       content_type: 'image/jpeg'
      ).signed_id
    },
    {
      name: "ムーンライトミスティック",
      price: 1500,
      capacity: 15,
      is_active: true,
      image: ActiveStorage::Blob.create_after_upload!(
       io: File.open(Rails.root.join('app/assets/images/pf/color11.jpg')),
       filename: 'color11.jpg',
       content_type: 'image/jpeg'
      ).signed_id
    },
    {
      name: "ミッドナイトマジック",
      price: 3500,
      capacity: 15,
      is_active: true,
      image: ActiveStorage::Blob.create_after_upload!(
       io: File.open(Rails.root.join('app/assets/images/pf/color12.jpg')),
       filename: 'color12.jpg',
       content_type: 'image/jpeg'
      ).signed_id
    }
 ]
)