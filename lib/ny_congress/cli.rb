class NyCongress::CLI

  def call
    list_districts
    menu
    goodbye
  end

  def list_districts
    puts "There are 27 congressional districts in New York:"

    NyCongress::District.scrape
     @districts = NyCongress::District.all
     @districts.each.with_index(1) do |d, i|
       puts "#{i}"
     end
  end

  def menu
    input = nil
    @districts
    while input != "exit"
      puts "Enter the number of the district you'd like more info on, type list to see list of districts again, or type exit"
      input = gets.strip.downcase
      if input.to_i > 0
        puts @districts[input.to_i - 1].representative
      elsif input == "list"
        list_districts
      else
        puts "Not sure what you want, type list or exit"
      end
    end
  end

  def goodbye
    puts "Have a good day"
  end


end
