class VegasOdds::CLI

  def run
    opening_statement
    odds
    goodluck
  end

  def opening_statement
    puts "How you doing friend. Ready to lose some money? jk jk. Lets checkout the best odds we have for you today:"
    sports = VegasOdds::Sports.now
    sports.each {|sport| puts "#{sport.name}"}
  end

  def odds
    input = ""
    while input != "exit"
      input = gets.chomp

      case input   
      when "nfl"
        football
      when "boxing"
        boxing
      when "ufc"
        ufc_1
      when "bet"
        bet
      when "exit"
        break
      else
        puts "Error! Enter another input"
      end
    end
  end

  def goodluck
    puts "Those are our sports odds. Remember, we always win. So come back again to make some money."
  end

  def football
    football = VegasOdds::Sports.now[0]
    puts "#{football.title} will be hosted on #{football.date} on Fox sports."
    puts "#{football.away} vs. #{football.home}."
    puts "Do you want to see the odds of this game?:"
    input = gets.chomp
    if input == "yes"
      puts "#{football.away} #{football.odd} vs. #{football.home} #{football.odd_2}"
      puts "Do you want to bet on this game?"
      input = gets.chomp
      if input == "yes"
        bet
      else input == "no"
        football
      end
    else input == "no"
      opening_statement
    end
  end

  def boxing
    boxing = VegasOdds::Sports.now[1]
    puts "Our main event on #{boxing.date} will be:"
    puts "The challenger #{boxing.challenger} vs. the champion #{boxing.champion}."
    puts "Our main event on #{boxing.date_2} will be:"
    puts "The challenger #{boxing.challenger_2} vs. the champion #{boxing.champion_2}."
    puts "Do you want to see the odds for the first main event, the second main event, or both?:"
    input = gets.chomp
    if input == "first"
      puts "#{boxing.challenger} #{boxing.odd_2} vs. #{boxing.champion} #{boxing.odd}"
      puts "Do you want to place a bet on this fight?:"
      if input == "yes"
        bet
      else input == "no"
        opening_statement
      end
    elsif input == "second"
      puts "#{boxing.challenger_2} #{boxing.odd_4} vs. #{boxing.champion_2} #{boxing.odd_3}"
      puts "Do you want to place a bet on this fight?:"
      if input == "yes"
        bet
      else input == "no"
        opening_statement
      end
    elsif input == "both"
      puts "#{boxing.challenger} #{boxing.odd_2} vs. #{boxing.champion} #{boxing.odd}"
      puts "#{boxing.challenger_2} #{boxing.odd_4} vs. #{boxing.champion_2} #{boxing.odd_3}"
      puts "Do you want to place a bet on these fights?"
      input = gets.chomp
      if input == "yes"
        bet
      else input == "no"
        boxing
      end
    else "no"
      opening_statement
    end
  end

  def ufc_1
     ufc = VegasOdds::Sports.now[2]
    puts "History will be made on #{ufc.date}."
    puts "Our co-main event, the challenger #{ufc.challenger} vs. the champion #{ufc.champion}."
    puts "Our main event, the challenger #{ufc.challenger_2} vs. the champion #{ufc.champion_2}."
    puts "Do you want to see the odds for the main event, co-main event, or both?:"
    input = gets.chomp
    if input == "main event"
      puts "Challenger:#{ufc.challenger_2} #{ufc.odd_3} vs. Champion: #{ufc.champion_2} #{ufc.odd_4}"
      puts "Do you want to place a bet on this fight?"
      input = gets.chomp
      if input == "yes"
        bet
      else input == "no"
        ufc_1 
      end
    elsif input == "co-main event"
      puts "Challenger: #{ufc.challenger} #{ufc.odd} vs. Champion: #{ufc.champion} #{ufc.odd_2}"
      puts "Do you want to place a bet on this fight?"
      input = gets.chomp
      if input == "yes"
        bet
      else input == "no"
        ufc_1
      end
    elsif input == "both"
      puts "The co-main event: Challenger: #{ufc.challenger} #{ufc.odd} vs. Champion: #{ufc.champion} #{ufc.odd_2}"  
      puts "The main event: Challenger: #{ufc.challenger_2} #{ufc.odd_3} vs. Champion: #{ufc.champion_2} #{ufc.odd_4}"
      puts "Do you want to place a bet on these fights?"
      input = gets.chomp
      if input == "yes"
        bet
      else input == "no"
        ufc_1
      end
    else "no"
      opening_statement
    end
  end

  def bet
    puts "Who do you want to bet on?:"
    input = gets.chomp
    puts "How much do you want to bet #{input}?:"
    money = gets.chomp
    puts "Would you like an additional bet?:"
    answer = gets.chomp
    if answer == "yes"
      bet
    else answer == "no"
      nil
    end
    puts "You betted #{money} on #{input}."
    puts "Our odds are pretty accurate so betting on #{input} will surely make you rich. Goodluck!"
    opening_statement
  end

end