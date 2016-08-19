class NyCongress::CLI

  def call
    list_districts
    menu
    goodbye
  end

  def list_districts
    puts "There are 27 congressional districts in New York:"

    #get districts

    # puts <<-DOC
    #   1         8         15          22
    #   2         9         16          23
    #   3         10        17          24
    #   4         11        18          25
    #   5         12        19          26
    #   6         13        20          27
    #   7         14        21
    #   DOC

      #what i ideally want: @districts = NyCongress::District.all

     @districts = NyCongress::District.all

     @districts.each.with_index(1) do |d, i|
       puts "#{i}: #{d.location}"
     end

  end

  def menu
    input = nil
    while input != "exit"
      puts "Enter the number of the district you'd like more info on, type list to see list of districts again, or type exit"
      input = gets.strip.downcase
      if input.to_i > 0
        puts @districts[input.to_i - 1]
      elsif input == "list"
        list_districts
      else





      # case input
      # when "1"
      #   puts "More info on district 1"
      # when "2"
      #   puts "more info on district 2"
      # when "3"
      #   puts "More info on district 3"
      # when "list"
      #   list_districts
      # else
        puts "Not sure what you want, type list or exit"
      end
    end
  end

  def goodbye
    puts "Have a good day"
  end


end
