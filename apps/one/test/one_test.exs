defmodule OneTest do
  use ExUnit.Case

  test "captcha return of 1122" do
    assert One.captcha(1122) == 3
  end
  test "captcha return of 1111" do
    assert One.captcha(1111) == 4
  end
  test "captcha return of 1234" do
    assert One.captcha(1234) == 0
  end
  test "captcha return of 91212129" do
    assert One.captcha(91212129) == 9
  end

  test "catpcha2 return of 1122" do
    assert One.captcha2(1122) == 3
  end
  test "captcha2 return of 1111" do
    assert One.captcha2(1111) == 4
  end
  test "captcha2 return of 1234" do
    assert One.captcha2(1234) == 0
  end
  test "captcha2 return of 91212129" do
    assert One.captcha2(91212129) == 9
  end
end
