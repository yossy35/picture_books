# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

%i[
  噛みぐせ
  叩きぐせ
  食事中の遊びぐせ
  外でのかんしゃく
  うそをつく
  テレビを見たがる
  物をこわす
  道路にとびだす
  なかなか寝ない
  トイレトレーニング
].each { |name| Genre.find_or_create_by(name: name) }




