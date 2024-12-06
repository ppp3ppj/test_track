defmodule TestTrackWeb.HiWidgetLive do
  use TestTrackWeb, :live_view
  on_mount {TestTrackWeb.UserAuth, :mount_current_user}

  def render(assigns) do
    if assigns[:current_user] do
      ~H"""
      <div>👋 Hi, {@current_user.email}</div>
      """
    else
      ~H"""
      <div>🤔 Do I know you?</div>
      """
    end
  end

  def mount(_params, session, socket) do
    with token when is_bitstring(token) <- session["user_token"],
         user when not is_nil(user) <- TestTrack.Accounts.get_user_by_session_token(token) do
      {:ok, assign(socket, current_user: user)}
    else
      _ -> {:ok, socket}
    end
  end
end
