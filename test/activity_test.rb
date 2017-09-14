require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/activity'

class ActivityTest < Minitest::Test
  
  attr_reader :activity
  
  def setup
    @activity = Activity.new("Water World")
  end
  
  def test_it_exists
    assert_instance_of Activity, activity
  end
  
  def test_activity_has_a_name
    assert_equal "Water World", activity.name
  end
  
  def test_participants_is_initialized_as_an_empty_collection
    assert activity.participants.empty?
    assert_instance_of Array, activity.participants
  end
  
  def test_add_participants_adds_to_participants_collection
    activity.add_participant({'Bertha' => 20})
    
    assert_equal [{'Bertha' => 20}], activity.participants
  end
  
  def test_add_multiple_participants_adds_to_participants_collection
    activity.add_participant({'Bertha' => 20})
    activity.add_participant({'Olga' => 30})
    
    assert_equal [{'Bertha' => 20}, {'Olga' => 30}], activity.participants
  end
  
  def test_total_cost_returns_total_amounts_paid
    activity.add_participant({'Bertha' => 20})
    activity.add_participant({'Olga' => 30})
        
    assert_equal 50, activity.total_cost
  end
  
  def test_split_bill_gives_a_fair_share_value_for_all_participants
    activity.add_participant({'Bertha' => 20})
    activity.add_participant({'Olga' => 30})
        
    assert_equal 25, activity.split_bill
  end
  
  def test_amount_owed_returns_array
    activity.add_participant({'Bertha' => 20})
    activity.add_participant({'Olga' => 30})
        
    assert_equal [{"Bertha" => 5}, {"Olga" => -5}], activity.amount_owed
  end
end
