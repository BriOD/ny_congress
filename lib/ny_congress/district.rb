class NyCongress::District
  attr_accessor :number, :representative, :party, :contact

  @@all = []


  def initialize(number=nil, representative=nil, party=nil, contact=nil)
    @number = number
    @representative = representative
    @party = party
    @contact = contact
    @@all << self
  end


  def self.all
    @@all
  end


  def self.scrape
    page = Nokogiri::HTML(open('http://www.house.gov/representatives/#state_ne'))
    main_doc = page.xpath('//h2[@id="state_ny"]')
    doc = main_doc.first.next_element.children.children
    content = doc.map {|c| c.text.strip.split("\n").reject(&:empty?)}.reject(&:empty?)
    useable_content = content[1..28]
    useable_content.each do |d|
      if d[2] == "D"
        d[2] = "Democrat"
      elsif d[2] == "R"
        d[2] = "Republican"
      end

      NyCongress::District.new(d[0], d[1], d[2], d[4])


    end
  end

end
