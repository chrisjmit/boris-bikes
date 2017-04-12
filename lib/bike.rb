class Bike
  def working?
    true
  end

  def report_broken
      @broken = true
  end

  def broken?
    fail "Bikes are broken" if @broken == false
    @broken
  end
end
