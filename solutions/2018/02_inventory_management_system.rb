class InventoryManager
  def initialize(box_ids)
    @box_ids = box_ids
  end

  def checksum
    twos_count = threes_count = 0

    @box_ids.each do |id|
      twos_count += 1 if has_any_element_frequency?(id, 2)
      threes_count += 1 if has_any_element_frequency?(id, 3)
    end

    twos_count * threes_count
  end

  def close_match
    @box_ids.combination(2).each do |pair|
      first_id = pair.first
      last_id = pair.last

      merged_id = first_id.chars.zip(last_id.chars)
                      .select { |x, y| x == y }
                      .map(&:first)
                      .join

      return merged_id if merged_id.length == first_id.length - 1
    end

  end

  private

  def has_any_element_frequency?(string, count)
    string.chars.uniq.any? { |x| string.count(x) == count }
  end
end
