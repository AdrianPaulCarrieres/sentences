defmodule SentencesWeb.PageLive do
  use SentencesWeb, :live_view

  @impl true
  def mount(_params, _session, socket) do
    case Sentences.Messages.Message |> Ecto.Query.last |> Sentences.Repo.one do
      nil -> {:ok, assign(socket, text: "", message: "Welcome, first publisher :)")}
      last_message ->
        message = Enum.random(1 .. last_message.id)
        |> Sentences.Messages.get_message!()
        {:ok, assign(socket, text: "", message: message.message)}
    end
  end

  @impl true
  def handle_event("publish", %{"text" => message}, socket) do
    case Sentences.Messages.create_message(%{"message" => message}) do
      {:ok, message} ->
        {:noreply,
          socket
          |> assign(text: "", message: message.message)
        }

      _ ->
        {:noreply,
         socket
         |> put_flash(:error, "An error occured.")
         |> assign(message: "")
        }
    end
  end
end
