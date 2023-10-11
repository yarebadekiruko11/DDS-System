# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Admin.create!(
  email: "ab@cd",
  password: ENV['SECRET_KEY']
)

Instructor.create!(
 [
  {
    name: "五十嵐 歩",
    email: "ii@ii",
    password: "iiiiii"
  },
  {
    name: "相原 優",
    email: "aa@aa",
    password: "aaaaaa"
  },
  {
    name: "宇野 慎二",
    email: "uu@uu",
    password: "uuuuuu"
  },
  {
    name: "榎本 真由美",
    email: "ee@ee",
    password: "eeeeee"
  },
  {
    name: "小野 よう子",
    email: "oo@oo",
    password: "oooooo"
  }
 ]
)

Student.create!(
[
 {
    last_name: "相葉",
    first_name: "衛",
    last_name_kana: "アイバ",
    first_name_kana: "マモル",
    birthday: "2005.10.12",
    address: "青森県青森市",
    phone: "11-1111"
 },
 {
    last_name: "井戸",
    first_name: "進",
    last_name_kana: "イド",
    first_name_kana: "ススム",
    birthday: "2005.3.22",
    address: "岩手県盛岡市",
    phone: "22-2222"
 },
 {
    last_name: "宇都宮",
    first_name: "智",
    last_name_kana: "ウツノミヤ",
    first_name_kana: "サトシ",
    birthday: "2006.2.4",
    address: "茨城県宇都宮市",
    phone: "33-3333"
 },
 {
    last_name: "江守",
    first_name: "結衣",
    last_name_kana: "エモリ",
    first_name_kana: "ユイ",
    birthday: "2004.9.23",
    address: "愛媛県松山市",
    phone: "44-4444"
 },
 {
    last_name: "小川",
    first_name: "瑠衣",
    last_name_kana: "オガワ",
    first_name_kana: "ルイ",
    birthday: "2003.6.6",
    address: "大分県大分市",
    phone: "55-5555"
 }
]
)