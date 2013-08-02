require 'spec_helper'

describe Targetprocess::Task do

  it 'allows to calculate integer values' do
    task_1 = Targetprocess::Task.new({'NumericPriority' => "2"})
    task_2 = Targetprocess::Task.new({'NumericPriority' => "3"})

    expect(task_1.numeric_priority + task_2.numeric_priority).to eq(5)
  end

end
