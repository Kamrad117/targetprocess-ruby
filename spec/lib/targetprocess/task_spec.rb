require 'spec_helper'

require 'active_support/concern'
require 'active_model/dirty'

class Targetprocess::Task
  include ActiveModel::Dirty

  define_attribute_methods [:numeric_priority]

  def numeric_priority
    @numeric_priority
  end

  def numeric_priority=(val)
    numeric_priority_will_change! unless val == @numeric_priority
    @numeric_priority = val
  end

  def save
    @previously_changed = changes
    @changed_attributes.clear
  end
end

describe Targetprocess::Task do

  it 'allows to calculate integer values' do
    task_1 = Targetprocess::Task.new({'NumericPriority' => "2"})
    task_2 = Targetprocess::Task.new({'NumericPriority' => "3"})

    expect(task_1.numeric_priority + task_2.numeric_priority).to eq(5)
  end

  it 'recognizes changed attributes' do
    task = Targetprocess::Task.new
    task.numeric_priority = "2"
    task.save
    expect(task.numeric_priority_changed?).to be_false

    task.numeric_priority = "5"
    expect(task.numeric_priority_changed?).to be_true
  end

end
