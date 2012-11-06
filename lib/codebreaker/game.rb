module Codebreaker
  class Game
    def initialize(output)
      @output = output
    end
    
    def start(secret)
      @secret = secret
      @output.puts 'Welcome to Codebreaker!'
      @output.puts 'Enter guess:'
    end
   
    def guess(guess)
      marker = Marker.new(@secret, guess)
      @output.puts  '+'*marker.exact_match_count + 
                    '-'*marker.number_match_count
    end
  end
  
  class Marker
    def initialize(secret, guess)
      @secret, @guess = secret, guess
    end
    
    def number_match_count
      total_match_count - exact_match_count
    end
    
    def total_match_count
      count = 0
      secret = @secret.split('')
      @guess.split('').map do |n|
        if secret.include?(n)
          secret.delete_at(secret.index(n))
          count += 1
        end
      end
      count
    end
    
    def exact_match_count
      (0..3).inject(0) do |count, index|
        count += (exact_match?(index) ? 1 : 0)
      end
    end
    
    def exact_match?(index)
      @guess[index] == @secret[index]
    end
    
    def number_match?(index)
      @secret.include?(@guess[index]) && !exact_match?(index)
    end
  end
end