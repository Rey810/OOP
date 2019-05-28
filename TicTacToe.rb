#To Do List
# 1. only allow numbers between 1 and 9 to be added. array_choices set to an array containing 1-9 if array_choices.any?(choice)
# 2. add integer check as a method to the tictactoe class

  class TicTacToe
      attr_accessor :player, :choices_array
      attr_reader :game_over, :choose_again
      WIN_ARRAY = [
          [1, 2, 3], [4, 5, 6], [7, 8, 9],                        #ACROSS
          [1, 4, 7], [2, 5, 8], [3, 6, 9],                        #DOWN
          [1, 5, 9], [3, 5, 7]                                    #DIAGONAL
      ]           

      @@positions_chosen = []                                     #tracks the total choices made (both players combined)
      @@game_over = false                                         #this will be set to true when there is a winner
      @@choose_again = true                                       

      def self.positions_chosen                                   #creates a class method to allow the chosen positions to be viewed
        @@positions_chosen          
      end

      def self.game_over
        @@game_over
      end

      def self.choose_again
        @@choose_again
      end

      def initialize(name)                                        #instantiates an object
        @player = name                                            #two instance variables created linked with particular instance of the object
        @choices_array = []           
      end        


      def play(choice)  
        chosen_or_not = @@positions_chosen.include? choice.to_i   #checks if the total array contains the new choice being made
        if chosen_or_not == false                                 #if it does not contain that choice then false will be returned. if false then...
          self.choices_array << choice.to_i                       #if it doesnt include the choice, then the choice can be added to the players choices array
          @@positions_chosen << choice.to_i                       #the choice can also be added to the total positions chosen
          @@choose_again = false
        elsif chosen_or_not == true                               #if the choice matches whats already in the total array, 
          puts "Your position has already been chosen."              #tell the user so
          @@choose_again = true
        end 
        puts
        puts
        puts "The total moves so far: #{@@positions_chosen}."
        puts "#{@player}'s moves: #{choices_array}."    
        puts
      end

      def win(choices_array)
        choices_array.sort!                                       #sort the players choices_array and change the original (!)
        WIN_ARRAY.each do |winner|                                          
            if choices_array == winner                            #compares players array to the winning combos in the winning array
              puts                          
              3.times do                                          #print out a winning statement a couple of times
                puts "Hip-hip! Hooray!"
              end
              puts
              puts "#{@player} is the smartest!"
              puts "Goodbye!"
              puts
              @@game_over = true                                  #triggers game to quit
            end
        end
      end

  end


#player interface
  puts puts puts
  puts "Good day, you've entered the mythical world of command-line gaming"
  puts "I see you are ready to battle..."
  puts

  print "By what name do they call you? "
  playerA_name = gets.chomp
  player1 = TicTacToe.new(playerA_name)

  print "And your adversary? "
  playerB_name = gets.chomp
  player2 = TicTacToe.new(playerB_name)

  puts
  puts "Very well, Warrior #{playerA_name} and Warrior #{playerB_name}. Let us begin the game of..."
  puts puts
  puts "TIC   TAC    TOE..."
  puts 
  puts "Warrior #{playerA_name}, you will start our battle." 




#game loop
  until TicTacToe.game_over == true




    puts "#{playerA_name}, choose a grid position between 1 and 9." 
    puts "Make your choice wisely!"

      playerA_choice = gets.chomp                                             #add player1's choice to a variable
      integer_check = Integer(playerA_choice) rescue false                    #Integer() is stricter than .to_i. Returns nil if false
                                                                              #the rescue is there to prevent an ArgumentError
        if integer_check                                                      #if the input can be parsed then it is an integer and it returns true
          player1.play(playerA_choice)


        else                                                                  #if integer_check returns false, then run the until loop until it returns true
          until integer_check 
            puts "Comaaahn dude, enter a number" 
            playerA_choice = gets.chomp                        
            integer_check = Integer(playerA_choice) rescue false 
          end
          puts "After trying many times, Warrior (re: stupid) #{player1} has chosen a number! Sheesh. Took you long enough."
          player1.play(playerA_choice)
        end

      if TicTacToe.choose_again                                               #if true is returned in the play method, a new value needs to be chosen
        until TicTacToe.choose_again == false                                 #repeats until a new value has been chosen
          puts "CHOOSE SOMETHING THAT HASN'T BEEN CHOSEN, DUMBIE"
          playerA_choose_again = gets.chomp                                   #asks player to choose again
          player1.play(playerA_choose_again)
        end
      end

      player1_choices_array = player1.choices_array                           #saves the value of the choices_array to a variable
      player1.win(player1_choices_array)                                      #pass aforementioned variable into the win method
      if TicTacToe.game_over then return end  

      

    puts "Your turn, #{playerB_name}. Make it count..."
      playerB_choice = gets.chomp                                             #add player1's choice to a variable
      integer_check = Integer(playerB_choice) rescue false                    #Integer() is stricter than .to_i. Returns nil if false
                                                                              #the rescue is there to prevent an ArgumentError
        if integer_check                                                      #if the input can be parsed then it is an integer and it returns true
          player2.play(playerB_choice)
        else                                                                  #if integer_check returns false, then run the until loop until it returns true
          until integer_check 
            puts "Comaaahn dude, enter a number" 
            playerB_choice = gets.chomp                        
            integer_check = Integer(playerB_choice) rescue false 
          end
          puts "After trying many times, Warrior (re: stupid) #{player2} has chosen a number! Sheesh. Took you long enough."
          player2.play(playerB_choice)
        end

      
        player2_choices_array = player2.choices_array                         #saves the value of the choices_array to a variable
        player2.win(player2_choices_array)                                    #pass aforementioned variable into the win method
        if TicTacToe.game_over then return end




  end