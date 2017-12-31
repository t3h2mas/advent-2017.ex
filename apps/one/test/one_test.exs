defmodule OneTest do
  use ExUnit.Case

  test "return of 1122" do
    assert One.captcha(1122) == 3
  end
  test "return of 1111" do
    assert One.captcha(1111) == 4
  end
  test "return of 1234" do
    assert One.captcha(1234) == 0
  end
  test "return of 91212129" do
    assert One.captcha(91212129) == 9
  end
end
