class NyCongress::District
  attr_accessor :number, :representative, :party, :contact

  @@all = []

  def initialize(number=nil, representative=nil, party=nil, contact=nil)
    @number = number
    @representative = representative
    @party = party
    @contact = contact
    save
  end

  def save
    @@all << self
  end


  def self.all
    @@all
  end

end

class NyCongress::Scraper

  def self.scrape
    page = Nokogiri::HTML(open('http://www.house.gov/representatives/#state_ne'))
    main_doc = page.xpath('//h2[@id="state_ny"]')
    doc = main_doc.first.next_element.children.children
    content = doc.map {|c| c.text.strip.split("\n").reject(&:empty?)}.reject(&:empty?)

    content[1..28].each do |district|
      if district[2] == "D"
        district[2] = "Democrat"
      elsif district[2] == "R"
        district[2] = "Republican"
      end

      NyCongress::District.new(district[0], district[1], district[2], district[4])

    end
  end

end
