require 'test_helper'

class TeamTest < ActiveSupport::TestCase
  setup do
    @team = Team.new(name: 'TeamName',
                    number: '1234',
                    program: 'FRC')
  end

  test 'programs FTC and FRC will pass validations' do
    @team.program = 'FTC'
    assert @team.save
    @team.program = 'FRC'
    assert @team.save
  end

  test 'program other than FTC or FRC will not pass validations' do
    @team.program = 'FLL'
    refute @team.save
    @team.program = 'FT'
    refute @team.save
    @team.program = 'fRC'
    refute @team.save
  end

  test "team with whitespace in name stripped" do
    @team.name = "\t\n\r   Coolest     team \r"
    assert @team.save
    assert @team.name == "Coolest     team"
  end
end
