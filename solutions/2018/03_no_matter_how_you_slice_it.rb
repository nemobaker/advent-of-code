class FabricManager
  def initialize(claims)
    @claims = format_claims(claims)
    @grid = Hash.new { |h, k| h[k] = [] }

    init_grid
  end

  def init_grid
    @claims.each do |claim|
      id, x_start, y_start, width, height = claim
      x, y = x_start, y_start

      while x < x_start + width do
        while y < y_start + height do
          @grid[[x,y]] << id
          y += 1
        end
        y = y_start
        x += 1
      end
    end
  end

  def overlap
    @grid.count do |coordinates, ids|
      ids.length > 1
    end
  end

  def non_overlapping_id
    claim_ids = {}
    @claims.each do |claim|
      id, *props = claim
      claim_ids[id] = true
    end

    @grid.each do |coordinates, ids|
      ids.each { |k| claim_ids.delete k } if ids.length > 1
    end

    claim_ids.keys.first
  end

  private

  def format_claims(claims)
    claims.map do |claim|
      claim.gsub(/[#@ ,:x\n]/, '-').split('-').reject(&''.method(:==)).map(&:to_i)
    end
  end
end
