class Reunion
  
  attr_reader :activities
  
  def initialize(location)
    @location = location
    @activities = []
  end
  
  def add_activity(activity)
    activities << activity
  end
  
  def total_cost
    activities.map do |activity|
      activity.total_cost
    end.sum
  end
  
  def breakdown
    activities.reduce([]) do |total, activity|
      total + activity.amount_owed
    end
  end
end
