
class Game
  def initialize
    @hand = ""
  end

  def janken
    puts "じゃんけん．．．"
    puts "0(グー)1(チョキ)2(パー)3(戦わない)"
    @janken_choice = gets.chomp.to_i
    @janken_opponent = rand(2)
  end

  def hand
    #じゃんけん
    case @janken_choice
    when 0
      @hand_janken_choice = "グー"
    when 1
      @hand_janken_choice = "チョキ"
    when 2
      @hand_janken_choice = "パー"
    end

    case @janken_opponent
    when 0
      @hand_janken_opponent = "グー"
    when 1
      @hand_janken_opponent = "チョキ"
    when 2
      @hand_janken_opponent = "パー"
    end

    # あっち向いてホイ
    case @facing_choice
    when 0
      @hand_facing_choice = "上"
    when 1
      @hand_facing_choice = "右"
    when 2
      @hand_facing_choice = "下"
    when 3
      @hand_facing_choice = "左"
    end

    case @facing_opponent
    when 0
      @hand_facing_opponent = "上"
    when 1
      @hand_facing_opponent = "右"
    when 2
      @hand_facing_opponent = "下"
    when 3
      @hand_facing_opponent = "左"
    end
  end
  
  def janken_judgement
    puts "あなた:#{@hand_janken_choice}"
    puts "相手:#{@hand_janken_opponent}"
    puts "-----------------"
  end

  def facing(flag)
    if flag == 0
      puts "指で指す方向を決めてください"
    else
      puts "顔を向ける方向を決めてください"
    end

    puts "あっち向いて〜"
    puts "0(上)1(右)2(下)3(左)"
    @facing_choice = gets.chomp.to_i
    @facing_opponent = rand(3)
    puts "ホイ！"
    puts "-----------------"
  end

  def facing_judgement
    puts "あなた:#{@hand_facing_choice}"
    puts "相手:#{@hand_facing_opponent}"
  end

  def janken_result(flag)
    if @janken_choice <= 2
      puts "ポン！"
      if @janken_choice == @janken_opponent
        puts "------あいこ------"
        return flag = 1
      elsif (@janken_choice == 0 && @janken_opponent == 1) || (@janken_choice == 2 && @janken_opponent == 0) || (@janken_choice == 1 && @janken_opponent == 2)
        puts "-------勝ち--------"
        return flag = 0
      else
        puts "-------負け--------"
        return flag = 2
      end
    else
      exit
    end
  end

  def facing_result(flag)
    if flag == 0 #じゃんけんで勝った処理
      if @facing_choice == @facing_opponent
        puts "-------勝ち--------"
        return flag = 3
      else 
        puts "-----引き分け------"
        return flag = 1             #flag = 0 にすると勝敗わかるまであっち向いてホイができる
      end
    else #じゃんけんで負けた処理
      if @facing_choice == @facing_opponent
        puts "-------負け--------"
        return flag = 3
      else
        puts "-----引き分け------"
        return flag = 1             #flag = 0 にすると勝敗わかるまであっち向いてホイができる
      end
    end

  end

end



game = Game.new()
game.janken()
game.hand()
flag = game.janken_result(0)
game.janken_judgement()  
while flag == 0 || flag == 1 || flag == 2 do
  while flag == 1 do
    game.janken()
    game.hand()
    flag = game.janken_result(0)
    game.janken_judgement()
  end
  game.facing(flag)
  game.hand()
  game.facing_judgement()
  flag = game.facing_result(flag)
end