require 'minitest'
require 'minitest/test'
require 'minitest/autorun'
require './lib/reunion'
require './lib/activity'

class ReunionTest < Minitest::Test
  
  def test_it_exists
    reunion = Reunion.new('London')
    
    assert_instance_of Reunion, reunion
  end
  
  def test_reunion_is_initialized_with_activities_empty_collection
    reunion = Reunion.new('London')
    
    assert_equal [], reunion.activities
  end
  
  def test_add_activity_increases_activities_collection
    reunion = Reunion.new('London')
    activity = Activity.new("Water World")
    reunion.add_activity(activity)

    assert_instance_of Activity, reunion.activities.first
    assert_equal 1, reunion.activities.count
    assert_equal "Water World", reunion.activities.first.name
  end
  
  def test_total_cost_returns_total_of_all_activities
    reunion = Reunion.new('London')
    activity = Activity.new("Water World")
    activity2 = Activity.new("Skydiving")
    reunion.add_activity(activity)
    reunion.add_activity(activity2)
    activity.add_participant({'jobob' => 50})
    activity.add_participant({'bob' => 20})
    activity2.add_participant({'shayla' => 30})

    assert_equal 100, reunion.total_cost
  end
  
  def test_breakdown_returns_participants_and_total_owed
    reunion = Reunion.new('London')
    activity = Activity.new("Water World")
    activity2 = Activity.new("Skydiving")
    reunion.add_activity(activity)
    reunion.add_activity(activity2)
    activity.add_participant({'jobob' => 70})
    activity.add_participant({'bob' => 20})
    activity2.add_participant({'shayla' => 30})

    assert_equal [{'jobob' => -25}, {'bob' => 25}, {'shayla' => 0}], reunion.breakdown
  end
end
