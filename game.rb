require './player.rb'
require './enemy.rb'

def game
  puts 'game'
  player = Player.new("",150,15,['はやぶさぎり','めたるぎり'])
  enemy = Enemy.new('らすぼす',150,15)
  setting player
  battle(player,enemy)
end

def setting player
  puts '--------------'
  puts 'プレイヤーの名前を入力してください。'
  puts '--------------'
  player_name = gets.chomp
  player.name = player_name
end

def battle(player,enemy)
  puts '--------------'
  puts 'バトル開始'
  puts '--------------'
  loop do
    player_turn(player,enemy)
    game_is_over = judge(player,enemy)
    if game_is_over
      break
    end
    enemy_turn(player,enemy)
    game_is_over = judge(player,enemy)
    if game_is_over
      break
    end
  end
end

def player_turn(player,enemy)
  loop do
    puts '--------------'
    puts player.name
    puts player.name + 'のHP:' + player.hp.to_s
    puts '敵のHP:' + enemy.hp.to_s
    puts '--------------'
    puts '--------------'
    puts 'コマンドを入力してください。'
    puts 'たたかう(a)|とくぎ(s)|にげる(e)'
    puts '--------------'
    commend = gets.chomp

    case commend
    when 'たたかう','a'
        player.attack enemy
        break
      when 'とくぎ','s'
        player.skill enemy
        break
      when 'にげる','e'
        player.escape
        break
    else
      puts 'コマンドがありません。'
    end
  end
end

def enemy_turn(player,enemy)
  enemy.move player
end

def judge(player,enemy)
  game_is_over = false
  if player.hp <= 0
    puts player.name + 'はまけてしまった。'
    game_is_over = true
  end
  if enemy.hp <= 0
    puts player.name + 'はたたかいにかった!'
    game_is_over = true
  end
  return game_is_over
end

game
