class NyCongress::CLI

  def call
    list_districts
    menu
    goodbye
  end

  def list_districts
    puts "Here's a list of all the Congressinal districts in NY state:"

    NyCongress::District.scrape
     @districts = NyCongress::District.all
     @districts.each do |d|
       puts "#{d.number}"
     end

  end

  def menu
    input = nil
    @districts
    while input != "exit"
      puts "Enter the number of the district you'd like more info on, type list to see list of districts again, or type exit"
      input = gets.strip.downcase
      if input.to_i > 0
        dis_info(input)
        # puts "District #{@districts[input.to_i - 1].number} is represented by: #{@districts[input.to_i - 1].representative} who is a #{@districts[input.to_i - 1].party}."
        # puts "If you'd like to contact them. They can be reached at: #{@districts[input.to_i - 1].contact}."

      elsif input == "list"
        list
      else
        puts "Not sure what you want, type list or exit"
      end
    end
  end

  def goodbye
    puts "Have a good day"
  end

  def list
    @districts.each do |d|
      puts "#{d.number}"
    end
  end

  def dis_info(input)
    puts "District #{@districts[input.to_i - 1].number} is represented by: #{@districts[input.to_i - 1].representative} who is a #{@districts[input.to_i - 1].party}."
    puts "If you'd like to contact them. They can be reached at: #{@districts[input.to_i - 1].contact}."
  end


end
