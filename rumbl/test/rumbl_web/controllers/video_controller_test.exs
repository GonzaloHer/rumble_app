# defmodule RumblWeb.VideoControllerTest do

#   setup %{conn: conn, login_as: username} do
#   user = user_fixture(username: username)
#   conn = assign(conn, :current_user, user)
# {:ok, conn: conn, user: user}
# end
# test "lists all user's videos on index", %{conn: conn, user: user} do
# user_video = video_fixture(user, title: "funny cats")
# other_video = video_fixture(
# user_fixture(username: "other"),
# title: "another video")

# conn = get conn, Routes.video_path(conn, :index)
# assert html_response(conn, 200) =~ ~r/Listing Videos/
# assert String.contains?(conn.resp_body, user_video.title)
# refute String.contains?(conn.resp_body, other_video.title)
# end

# end
