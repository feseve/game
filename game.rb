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
  puts 'battle'
  player_turn(player,enemy)
  enemy_turn(player,enemy)
end

def player_turn(player,enemy)
  loop do
    puts '--------------'
    puts 'コマンドを入力してください。'
    puts '--------------'
    commend = gets.chomp

    case commend
      when 'たたかう'
        player.attack enemy
        break
      when 'とくぎ'
        player.skill enemy
        break
      when 'にげる'
        puts 'にげるをせんたく'
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

end

game
