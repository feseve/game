class Enemy
  attr_accessor :name, :hp, :atk

  def initialize(name, hp, atk)
    @name = name
    @hp = hp
    @atk = atk
  end

  def move player
    moves = ['こうげき','つよいこうげき','かいふく','わらう']
    move = moves[rand 0..3]
    case move
    when 'こうげき'
      puts @name + 'のこうげき!'
      player.hp = player.hp - @atk
      puts player.name + 'に' + @atk.to_s+ 'のダメージ!'
    when 'つよいこうげき'
      puts @name + 'のつよいこうげき!'
      damage = @atk * 2
      player.hp = player.hp - damage
      puts player.name + 'に' + damage.to_s+ 'のダメージ!'
    when 'かいふく'
      puts @name + 'のかいふく!'
      heal = 30
      @hp = @hp + heal
      puts @name + 'は' + heal.to_s+ 'かいふくした!'
    when 'わらう'
      puts @name + 'はわらっている'
    else
      puts 'エラー'
    end
  end
end
