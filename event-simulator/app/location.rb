class Location
  MIN_LAT = -6.178005
  MAX_LAT = -6.243066
  MIN_LONG = 106.7811183
  MAX_LONG = 106.7881563

  # Data sample Boundary:
  # kiri atas:
  # -6.178005,106.7881563 (mall taman anggrek)
  # kiri bawah:
  # -6.245029,106.7811183 (gandaria city)
  # kanan atas:
  # -6.170154,106.8293123 (masjid istiqlal)
  # kanan bawah:
  # -6.243066,106.8414573 (patung pancoran)

  def self.generate
    ran = Random.new
    lat = MIN_LAT + ran.rand * (MAX_LAT - MIN_LAT)
    long = MIN_LONG + ran.rand * (MAX_LONG - MIN_LONG)

    [lat,long]
  end

end
