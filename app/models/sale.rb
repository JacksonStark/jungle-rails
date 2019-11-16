class Sale < ActiveRecord::Base

  # Scoped to Active Record
  def self.active
    where("sales.starts_on <= ? AND sales.ends_on >= ?",
    Date.current, Date.current)
  end

  # COMPLETED SALE
  def finished?
    ends_on < Date.current
  end

  # UPCOMING SALE
  def upcoming?
    starts_on > Date.current
  end

  # CURRENT SALE
  def active?
    !upcoming? && !finished?
  end

end
