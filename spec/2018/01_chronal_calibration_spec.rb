require_relative "../../solutions/2018/01_chronal_calibration"

RSpec.describe ChronalFrequencies do
  let(:input_file_path) { '~/advent-of-code/inputs/2018/01_chronal_calibration_input.txt'.freeze }
  let(:frequency_change_array) { File.open(File.expand_path(input_file_path), 'r').map(&:to_i) }
  let(:chronal_frequencies) { ChronalFrequencies.new(frequency_change_array) }

  describe 'Part 1 - Sum Frequencies' do
    it 'returns sum of all frequencies' do
      expect(chronal_frequencies.sum_all).to eq 516
    end
  end

  describe 'Part 2 - First Repeating Frequency Sum' do
    context 'when frequency sum will repeat' do
      it 'returns first repeating frequency sum' do
        expect(chronal_frequencies.repeat_sum).to eq 71892
      end
    end

    context 'when frequency sum will not repeat' do
      let(:chronal_frequencies) { ChronalFrequencies.new([1]) }

      context 'without default cycle max' do
        it 'raises error with correct message' do
          expect{ chronal_frequencies.repeat_sum }.
            to raise_error "no repeating frequency after 1000 cycles"
        end
      end

      context 'with default cycle max' do
        let(:cycle_max) { 20 }

        it 'raises error with correct message' do
          expect{ chronal_frequencies.repeat_sum(1, cycle_max) }.
            to raise_error("no repeating frequency after #{cycle_max} cycles")
        end
      end
    end
  end
end