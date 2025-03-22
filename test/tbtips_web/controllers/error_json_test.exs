defmodule TbtipsWeb.ErrorJSONTest do
  use TbtipsWeb.ConnCase, async: true

  test "renders 404" do
    assert TbtipsWeb.ErrorJSON.render("404.json", %{}) == %{errors: %{detail: "Not Found"}}
  end

  test "renders 500" do
    assert TbtipsWeb.ErrorJSON.render("500.json", %{}) ==
             %{errors: %{detail: "Internal Server Error"}}
  end
end
