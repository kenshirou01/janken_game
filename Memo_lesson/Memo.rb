require "csv"

def info_text
  puts "メモしたい内容を記入してください"
  puts "完了したらCtrl ＋ Dをおします"
end

def info_fail
  puts "拡張子を除いたファイルを入力してください"
end

#メイン処理
puts "1(新規でメモを作成) 2(既存のメモ編集する)"
memo_type = gets.chomp.to_s

until memo_type == "1" || memo_type == "2" do
  puts "1(新規でメモを作成) か 2(既存のメモ編集する) を入力して下さい"
  memo_type = gets.chomp.to_s
end

case memo_type
  when "1"
    info_fail
    fail_name = gets.chomp.to_s
    info_text
    memo_texts = readlines

    CSV.open("#{fail_name}.csv","w") do |row|
      row << memo_texts
    end

  when "2"
    info_fail
    fail_name = gets.chomp.to_s

    begin
      puts "---------------"
      CSV.foreach("#{fail_name}.csv") do |row|
        puts row
      end
      puts "---------------"
    rescue
      puts "エラーです！このディレクトリ名は存在しません。"
      exit
    end
    
    info_text
    memo_texts = readlines

    CSV.open("#{fail_name}.csv","a") do |row|
     row << memo_texts
    end

end

# ------------------
 
# texts = readlines
# p texts

# CSV.open('test.csv','w') do |test|
#   texts.each do |text|
#     test << text
#   end
# end

#   test << ["id","name","age"]
#   test << ["1","田中","20"]
#   test << ["10001","鈴木","30"]

# eachでから配列に代入
# texts = ["id","name","age"]
# test = Array.new
# i = 0
# texts.each do |text|
#   test[i] << text
#   i += 1
# end

# CSV書き込み
# texts = readlines
# p texts
# CSV.open('test.csv','w') do |csv|
#   csv << texts
# end
