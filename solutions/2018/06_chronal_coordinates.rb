class ChronalCoordinates
  def initialize(coordinates)
    @coordinates = coordinates.map{|point| point.strip.split(', ').map(&:to_i)}
    @grid = Hash.new { |h, k| h[k] = nil }
    @x_max = @coordinates.map(&:first).max
    @y_max = @coordinates.map(&:last).max
    @edge_indexes = []
    init_grid
  end

  def largest_finite_area
    grid_checksum.reject!{|h,k| @edge_indexes.include?(h)}.values.max
  end

  def safe_area(max_range = 10000)
    @grid.keys.select do |point|
      total_coordinate_distance(point) < max_range
    end.count
  end

  def grid_checksum
    checksum = Hash.new { |h, k| h[k] = 0 }

    @grid.each do |coordinate, point|
      checksum[point] += 1 unless point.nil?
    end

    checksum
  end

  def edge_indices
    @grid.map do |coordinates, closest_point|
      closest_point if on_edge(coordinates)
    end.compact.uniq
  end

  def on_edge(coordinates)
    coordinates[0] == 0 ||
        coordinates[0] == @x_max ||
        coordinates[1] == 0 ||
        coordinates[1] == @y_max
  end

  def init_grid
    point = [0,0]

    while point[0] <= @x_max do
      while point[1] <= @y_max do
        @grid[[point[0],point[1]]] = closest_point(point)
        @edge_indexes << closest_point(point) if on_edge([point[0],point[1]])
        point[1] += 1
      end
      point[1] = 0
      point[0] += 1
    end

    @edge_indexes = @edge_indexes.compact.uniq
  end

  def closest_point(point)
    distances = []

    @coordinates.each do |target|
      distances << [manhattan_distance(target, point), @coordinates.find_index(target)]
    end

    min_distance = distances.map(&:first).min
    closest_point = distances.select {|distance| distance[0] == min_distance}.first.last

    return closest_point unless distances.map(&:first).count(min_distance) > 1
  end

  def total_coordinate_distance(point)
    @coordinates.reduce(0){ |sum, coordinate| sum + manhattan_distance(point, coordinate)}
  end

  def manhattan_distance(point1, point2)
    (point1[0] - point2[0]).abs + (point1[1] - point2[1]).abs
  end
end
