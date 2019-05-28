# adds 2 methods to the String class which can be used on any string. Use this for colouring outputs. Append output with .red or .green. 
class String
  def red;            "\e[31m#{self}\e[0m" end
  def green;          "\e[32m#{self}\e[0m" end
end

class CodeMaker 
    def ai_code_maker
        @ai_code = []
        4.times do
            @ai_code << 1 + rand(6)
        end
        @ai_code
    end
end

class CodeBreaker
    def code_guesser
        loop do                                                                         #the loop runs until 'break' is reached                                           
            @codebuilder_test_array = gets.chomp.split('').map { |n| n.to_i }             #take input from gets.chomp, separate input into individual numbers and pass into array as integers   
            @code_guess = []
            if @codebuilder_test_array.length == 4 && @codebuilder_test_array.max <= 6    #only when the array is 4 numbers in length and the max value is less than 6
                @codebuilder_test_array.each do |value| 
                    if value >= 1 && value <= 6                                         #every number is checked to make sure it is between 1 and 6
                        @code_guess << value
                    end
                end
                break                                                                   #triggered after the if which checks the array length, breaks out of the loop
            end
        puts "You need to enter a code of 4 digits between 1 and 6!"                    #runs with each loop iteration which only happens when the array length is not 4
        end
        @code_guess                                                                     #this runs when the loop has been exited via the 'break'
    end
end


class Game
    attr_accessor :ai_code_maker, :code_guesser
    def initialize                                                      #CHECK INITIAlIZE SPELLING BEFORE CHECKING ANY OTHER ERRORS!!!!!!
        @ai_code_maker = CodeMaker.new                                  #create a code from the ai_code_maker method in the CodeMaker class
        @code_guesser = CodeBreaker.new                                 #create a code guess array from the code guesser method in the CodeBreaker class
        @@rounds = 1                                                    #track the number of rounds 
        @@game_over = false
        display_welcome                                                 #run the display method from the Game class
        codebreaker_instructions                                        #run the code breaker instructions method from the Game class
        codemaker_choices                                               #show what was chosen by the maker and guesser [TEST PURPOSES]
        play_game                                                       #run the play game method from the Game class
    end

    def display_welcome
        puts "***************************************"
        puts "******* Welcome To Mastermind!  *******"
        puts "***************************************"
        puts "======================================="
    end

    def codebreaker_instructions
        puts "   Each time you enter your guesses...."
        puts "   The computer will give you a clue on"
        puts "   how close your guess is to the code."
        puts "***************************************"
        puts "*********** GUIDES TO CLUES ***********"
        puts "***************************************"
        puts "======================================="
        puts "1. If you get a digit correct and it is"
        puts "   in the correct position, the digit "
        puts "   will be colored #{"green".green}"
        puts "2. If you get a digit correct but in the"
        puts "   wrong position, the digit will stay white"
        puts "3. If you get the digit incorrect, the "
        puts "   digit will be colored #{"red".red}\n"
        puts "For example:"
        puts "If the secret code is:"
        puts "1523"
        puts "and your guess was:"
        puts "1562"
        puts "You will see the following result:"
        puts "#{"15".green}#{"6".red}2\n\n"
    end

    def codemaker_choices
        @code_makers_code = @ai_code_maker.ai_code_maker                #return the results of the said methods
        # p "code makers code ", @code_makers_code 
    end

    def codeguesser_instructions
        puts "=================================="
        puts "====  C O D E B R E A K E R   ===="
        if @@rounds == 1
            puts "====== MAKE YOUR 1st CHOICE ======"
        elsif @@rounds == 2
            puts "====== MAKE YOUR #{@@rounds}nd CHOICE ======"
        elsif @@rounds == 3
            puts "====== MAKE YOUR #{@@rounds}rd CHOICE ======"
        elsif @@rounds > 3 
            puts "====== MAKE YOUR #{@@rounds}th CHOICE ======"
        end
        puts "==================================\n\n"
    end

    def codeguesser_choices
        @code_guessers_code = @code_guesser.code_guesser                #both return arrays
        # p "code guessers code", @code_guessers_code
    end

    def hint_builder                                                     #displays hint with colours
        i = 0   
        hint = ""                                                                       #counter set to 0
        until i == 4 do                                                                 #allows for all 4 values to be compared
            if @code_guessers_code[i] ==  @code_makers_code[i]                          #if the value matches at given position
                hint << @code_guessers_code[i].to_s.green                               #adds the number at that position to the hint string in green
            elsif @code_makers_code.any? { |num| num == @code_guessers_code[i] }        #REMEMBER, enumerable methods (like any?) work on COLLECTIONS
                hint << @code_guessers_code[i].to_s                                     #number is found, but possition is wrong
            else
                hint << @code_guessers_code[i].to_s.red                                 #number has not been found, passed to hint in red
            end 
            i += 1                                                                      #once a full loop is complete, add 1 to counter
        end
        puts "_____________________________________"
        puts "__________COLOUR INDICATORS__________" 
        puts "---  ---  ---  #{hint}  ---  ---  ---"  
        puts "____________________________________ \n\n\n\n"
    end    
                                                                               
    def play_game
        
        5.times do
            unless @@game_over == true
                codeguesser_instructions
                codeguesser_choices
                hint_builder
                if @code_guessers_code == @code_makers_code
                    @@game_over = true
                    puts "+++++++++++++++++++++++++"
                    puts "++++++++++ The ++++++++++"
                    puts "++++++++ C O D E ++++++++"
                    puts "+++++ #{"B R E A K E R".green} +++++" 
                    puts "++++++++++ has ++++++++++"
                    puts "********** #{"WON!".green} *********"
                    break
                end
                @@rounds += 1
            end
        end  
        if @@rounds > 5
            @@game_over = true
            puts "+++++++++++++++++++++++++"
            puts "++++++++++ The ++++++++++"
            puts "++++++++ C O D E ++++++++"
            puts "+++++++ #{"M A K E R".red} +++++++" 
            puts "++++++++++ has ++++++++++"
            puts " --------- #{"WON!".green} ---------"
        end
    end
end

game = Game.new







