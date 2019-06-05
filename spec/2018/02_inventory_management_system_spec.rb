require_relative "../../solutions/2018/02_inventory_management_system"

RSpec.describe InventoryManager do
  let(:input_file_path) { '~/advent-of-code/inputs/2018/02_inventory_management_system_input.txt'.freeze }
  let(:box_ids) { File.open(File.expand_path(input_file_path), 'r').map(&:strip) }
  let(:inventory_manager) { InventoryManager.new(box_ids) }

  describe 'Part 1 - Checksum' do
    it 'returns correct checksum' do
      expect(inventory_manager.checksum).to eq 7872
    end
  end

  describe 'Part 2 - Close Match' do
    it 'returns the letters that the closely matching Box IDs share' do
      expect(inventory_manager.close_match).to eq 'tjxmoewpdkyaihvrndfluwbzc'
    end
  end
end