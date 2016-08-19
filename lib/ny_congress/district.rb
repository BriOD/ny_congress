class NyCongress::District
  attr_accessor :number, :location, :representative, :contact

@@all = [  ]


  def self.all
    puts <<-DOC
      1         8         15          22
      2         9         16          23
      3         10        17          24
      4         11        18          25
      5         12        19          26
      6         13        20          27
      7         14        21
      DOC
  end



end
