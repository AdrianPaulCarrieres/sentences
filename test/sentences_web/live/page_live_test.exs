defmodule SentencesWeb.PageLiveTest do
  use SentencesWeb.ConnCase

  import Phoenix.LiveViewTest

  test "disconnected and connected render", %{conn: conn} do
    {:ok, page_live, disconnected_html} = live(conn, "/")
    assert disconnected_html =~ "Welcome to Sentences!"
    assert render(page_live) =~ "Welcome to Sentences!"
  end
end
