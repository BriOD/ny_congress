class NyCongress::District
  attr_accessor :number, :representative, :party, :contact

  def initialize(number=nil, representative=nil, party=nil, contact=nil)
    @number = number
    @representative = representative
    @party = party
    @contact = contact
    @@all << self

  end

@@all = []


  def self.all
    # puts <<-DOC
    #   1         8         15          22
    #   2         9         16          23
    #   3         10        17          24
    #   4         11        18          25
    #   5         12        19          26
    #   6         13        20          27
    #   7         14        21
    #   DOC
#
#       d_1 = self.new
#       d_1.number = "1"
#       d_1.location = "Floral Park"
#       d_1.representative = "Brian OD"
#       d_1.contact = "7187574474"
#
#       d_2 = self.new
#       d_2.number = "2"
#       d_2.location = "Bayside"
#       d_2.representative = "Brian OD"
#       d_2.contact = "7187574474"
#
# [d_1, d_2]

  end

  # def self.scrape_districts
  #   districts = []
  #
  #   districts << self.scrape_wiki
  #
  #   districts
  #
  # end

  def self.scrape
    page = Nokogiri::HTML(open('http://www.house.gov/representatives/#state_ne'))
    main_doc = page.xpath('//h2[@id="state_ny"]')
    doc = main_doc.first.next_element.children.children
    content = doc.map {|c| c.text.strip.split("\n").reject(&:empty?)}.reject(&:empty?)
    content.each {|c| c.pop }
    binding.pry





  end





end
