require_relative "../../solutions/2018/03_no_matter_how_you_slice_it"

RSpec.describe FabricManager do
  let(:input_file_path) { '~/advent-of-code/inputs/2018/03_no_matter_how_you_slice_it_input.txt'.freeze }
  let(:claims) { File.open(File.expand_path(input_file_path), 'r')}
  let(:fabric_manager) { FabricManager.new(claims) }

  describe 'Part 1 - Sum Frequencies' do
    it 'returns number of square inches with more than one claim' do
      expect(fabric_manager.overlap).to eq 116491
    end
  end

  describe 'Part 2 - Sum Frequencies' do
    it 'returns id of the claim that doesn\'t overlap' do
      expect(fabric_manager.non_overlapping_id).to eq 707
    end
  end
end