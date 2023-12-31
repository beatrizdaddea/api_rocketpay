defmodule Rocketpay.NumbersTest do
  use ExUnit.Case

  alias Rocketpay.Numbers

  describe "sum_from_file/1" do
    test "when there is a with the given name, returns the sum of number" do
      response = Numbers.sum_from_file("numbers")

      expected_response =  {:ok, %{result: 37}}

      assert response == expected_response
    end

    test "when there is not a file with the given name, returns an error" do
      response = Numbers.sum_from_file("banana")

      expected_response =  {:error, %{message: "Invalid File"}}

      assert response == expected_response
    end
  end

end
