require_relative "../../solutions/2018/04_repose_record"

RSpec.describe ReposeManager do
  let(:input_file_path) { '~/advent-of-code/inputs/2018/04_repose_record_input.txt'.freeze }
  let(:records) { File.open(File.expand_path(input_file_path), 'r')}
  let(:repose_manager) { ReposeManager.new(records) }

  describe 'Part 1 - Sleepiest Guard ' do
    let(:sleepiest_guard_id) {repose_manager.sleepiest_guard['id']}
    let(:sleepiest_guard_minute) {repose_manager.sleepiest_guard['minute']}

    xit 'returns id and minute of guard who spend the most time asleep' do
      expect(sleepiest_guard_id).to eq 727
      expect(sleepiest_guard_minute).to eq 29
      expect(sleepiest_guard_id * sleepiest_guard_minute).to eq 21083
    end
  end

  describe 'Part 2 - Sleepiest Guard per minute ' do
    let(:most_consistent_sleepy_guard_id) {repose_manager.most_consistent_sleepy_guard['id']}
    let(:most_consistent_sleepy_guard_minute) {repose_manager.most_consistent_sleepy_guard['minute']}

    it 'returns guard and id of guard most frequently alseep on the same minute' do
      expect(most_consistent_sleepy_guard_id).to eq 1657
      expect(most_consistent_sleepy_guard_minute).to eq 32
      expect(most_consistent_sleepy_guard_id * most_consistent_sleepy_guard_minute).to eq 53024
    end
  end
end