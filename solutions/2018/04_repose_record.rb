class ReposeManager
  def initialize(records)
    @records = records.sort_by {|record| record[1..16] }
    @guards = Hash.new {|h,k| h[k] = Array.new(60){0}}

    init_guards
  end

  def sleepiest_guard
    guard = {}

    id = @guards.map.max_by{ |key, minutes_asleep| minutes_asleep.sum }[0]
    minute = @guards[id].map.with_index.sort.map(&:last).last

    guard['id'] = id
    guard['minute'] = minute

    guard
  end

  def most_consistent_sleepy_guard
    guard = {}

    id = @guards.sort_by { |id, minutes_asleep| minutes_asleep.max }.last[0]
    minute = @guards[id].find_index(@guards[id].max)

    guard['id'] = id
    guard['minute'] = minute

    guard
  end


  private

  def init_guards
    id = nil
    time_start = 0

    @records.each do |record|
      case record.split[2]
      when 'Guard'
        id = record.split[3][1..-1].to_i
        time_start = 0
      when 'falls'
        time_end = record.split[1][3..-2].to_i
        time_start = time_end
      when 'wakes'
        time_end = record.split[1][3..-2].to_i - 1
        (time_start..time_end).each do |min|
          @guards[id][min] += 1
        end

        time_start = time_end
      end
    end
  end
end
