class Activity
  
  attr_reader :name, :participants
    
  def initialize(name)
    @name = name
    @participants = []
  end
  
  def add_participant(participant)
    participants << participant
  end
  
  def total_cost
    participants.map do |participant| 
      participant.values.first
    end.sum 
  end
  
  def split_bill
    total_cost / participants.count
  end
  
  def amount_owed
    owed = []
    participants.each do |participant|
      owed << {participant.keys.first => split_bill - participant.values.first}
    end
    
    owed
  end
end
