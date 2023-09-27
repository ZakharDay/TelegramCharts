raw_text = 'Дом Наркомфина — один из знаковых памятников архитектуры советского авангарда и конструктивизма. Построен в 1928—1930 годах по проекту архитекторов Моисея Гинзбурга, Игнатия Милиниса и инженера Сергея Прохорова для работников Народного комиссариата финансов СССР (Наркомфина). Автор замысла дома Наркомфина Гинзбург определял его как «опытный дом переходного типа». Дом находится в Москве по адресу: Новинский бульвар, дом 25, корпус 1. С начала 1990-х годов дом находился в аварийном состоянии, был трижды включён в список «100 главных зданий мира, которым грозит уничтожение». В 2017—2020 годах отреставрирован по проекту АБ «Гинзбург Архитектс», функционирует как элитный жилой дом. Отдельно стоящий «Коммунальный блок» (историческое название) планируется как место проведения публичных мероприятий.'
@words = raw_text.downcase.gsub(/[—.—,«»:()]/, '').gsub(/  /, ' ').split(' ')

@category_names = [
    "Football",
    "Soccer",
    "Baseball & Softball",
    "Basketball",
    "Lacrosse",
    "Tennis & Racquet",
    "Hockey",
    "More Sports",
    "Cardio Equipment",
    "Strength Training",
    "Fitness Accessories",
    "Boxing & MMA",
    "Electronics",
    "Yoga & Pilates",
    "Training by Sport",
    "As Seen on  TV!",
    "Cleats",
    "Men's Footwear",
    "Women's Footwear",
    "Kids' Footwear",
    "Featured Shops",
    "Accessories",
    "Men's Apparel",
    "Women's Apparel",
    "Boys' Apparel",
    "Girls' Apparel",
    "Accessories",
    "Top Brands",
    "Shop By Sport",
    "Men's Golf Clubs",
    "Women's Golf Clubs",
    "Golf Apparel",
    "Golf Shoes",
    "Golf Bags & Carts",
    "Golf Gloves",
    "Golf Balls",
    "Electronics",
    "Kids' Golf Clubs",
    "Team Shop",
    "Accessories",
    "Trade-In",
    "Bike & Skate Shop",
    "Camping & Hiking",
    "Hunting & Shooting",
    "Fishing",
    "Indoor/Outdoor Games",
    "Boating",
    "Water Sports",
    "MLB",
    "NFL",
    "NHL",
    "NBA",
    "NCAA",
    "MLS",
    "International Soccer",
    "World Cup Shop",
    "MLB Players",
    "NFL Players"
]

def seed
  reset_db
  create_categories
  create_telegrams(1000)
end

def reset_db
  Rake::Task['db:drop'].invoke
  Rake::Task['db:create'].invoke
  Rake::Task['db:migrate'].invoke
end

def create_sentence(quantity)
  sentence_words = []

  quantity.to_a.sample.times do
    sentence_words << @words.sample
  end

  sentence = sentence_words.join(' ').capitalize + '.'
end

def upload_random_avatar
  uploader = AvatarUploader.new(Telegram.new, :avatar)
  uploader.cache!(File.open(Dir.glob(File.join(Rails.root, 'public/autoupload/images', '*')).sample))
  uploader
end

def upload_random_cover
  uploader = CoverUploader.new(Telegram.new, :cover)
  uploader.cache!(File.open(Dir.glob(File.join(Rails.root, 'public/autoupload/images', '*')).sample))
  uploader
end

def create_categories
  @category_names.each do |category_name|
    category = Category.create(name: category_name)
    puts "Category with id #{category.id} and name #{category.name} just created"
  end
end

def create_telegrams(quantity)
  quantity.times do
    # t.string "name"
    # t.text "description"
    # t.string "url"
    # t.string "avatar"
    # t.string "cover"
    telegram = Telegram.create(
      name: create_sentence(1..3),
      description: create_sentence(4..20),
      url: "https://t.me/#{@words.sample}",
      avatar: upload_random_avatar,
      cover: upload_random_cover
    )

    puts "Telegram with id #{telegram.id} and url #{telegram.url} just created"
  end
end

seed