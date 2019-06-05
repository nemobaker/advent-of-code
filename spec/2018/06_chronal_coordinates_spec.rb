require_relative "../../solutions/2018/06_chronal_coordinates"

RSpec.describe ChronalCoordinates do
  let(:input_file_path) { '~/advent-of-code/inputs/2018/06_chronal_coordinates_input.txt'.freeze }
  let(:coordinates) { File.open(File.expand_path(input_file_path), 'r')}
  let(:chronal_coordinates) { ChronalCoordinates.new(coordinates) }

  describe 'Part 1 - Largest Finite Area' do
    it 'is the size of the largest finite area' do
      expect(chronal_coordinates.largest_finite_area).to eq 3840
    end
  end

  describe 'Part 2 - Safe Area Size' do
    it 'returns the region containing all locations which have a total distance to all given coordinates of less than 10000 ' do
      expect(chronal_coordinates.safe_area).to eq 46542
    end
  end
end