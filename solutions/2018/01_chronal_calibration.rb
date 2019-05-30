class ChronalFrequencies
  DEFAULT_CYCLE_MAXIMUM = 1000

  def initialize(frequency_change_array)
    @frequency_change_array = frequency_change_array
  end

  def sum_all
    @frequency_change_array.sum
  end

  def repeat_sum(repeat_count = 1, cycle_max = DEFAULT_CYCLE_MAXIMUM)
    results = { 0 => 1}
    sum = 0

    @frequency_change_array.cycle(cycle_max) do |f|
      sum += f
      return sum if results[sum] == repeat_count
      results[sum] = results[sum].to_i + 1
    end

    raise "no repeating frequency after #{cycle_max} cycles"
  end
end
