class Player
  attr_accessor :name, :hp,  :atk, :sklls

  def initialize(name, hp, atk, skills)
    @name = name
    @hp = hp
    @atk = atk
    @skills = skills
  end

  def attack enemy
    puts @name + 'のこうげき!'
    enemy.hp = enemy.hp - @atk
    puts enemy.name + 'に' + @atk.to_s + 'のダメージ！'
  end

  def skill enemy
    loop do
      puts
      puts '--------------'
      puts '使いたいとくぎ名を入力してください。'
      puts '--------------'
      puts @skills
      value = gets.chomp
      case value
      when 'はやぶさぎり'
        puts @name + 'のはやぶさぎり!'
        damage = @atk*2
        enemy.hp = enemy.hp - damage
        puts enemy.name + 'に' + damage.to_s + 'のダメージ!'
        break
      when 'めたるぎり'
        puts @name + 'のはやぶさぎり!'
        damage = 1
        @atk.times do
          enemy.hp = enemy.hp - damage
        end
        puts enemy.nam + 'に' + @atk.to_s + 'のダメージ!'
        break
      else
        puts '不正な入力です。とくぎ名を入力してください。'
      end
    end
  end
end
