require 'test_helper'

class ParentTest < ActiveSupport::TestCase
  setup do
    @parent = parents(:mom)
  end

  test "parent with whitespace in fields stripped" do
    @parent.first_name = "\t\tmary \n"
    assert @parent.save
    assert @parent.first_name == "mary"

    @parent.last_name = "\t\r\n   kim-kim \n"
    assert @parent.save
    assert @parent.last_name == "kim-kim"

    @parent.email = "\t\r\n   mary@example.com \n"
    assert @parent.save
    assert @parent.email == "mary@example.com"

    @parent.preferred_language = "\t\r\n  English \n"
    assert @parent.save
    assert @parent.preferred_language == "English"
  end
end
