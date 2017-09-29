require 'test_helper'

class TeamTest < ActiveSupport::TestCase
  test 'program FTC will pass validations' do
    team = Team.new(name: 'TeamName',
                    number: '1234')
    team.program = 'FTC'
    assert team.save
  end

  test 'program FRC will pass validations' do
    team = Team.new(name: 'TeamName',
                    number: '1234')
    team.program = 'FRC'
    assert team.save
  end

  test 'program other than FTC or FRC will not pass validations' do
    team = Team.new(name: 'TeamName',
                    number: '1234')
    team.program = 'FLL'
    refute team.save
    team.program = 'FT'
    refute team.save
    team.program = 'fRC'
    refute team.save
  end
end
