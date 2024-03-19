defmodule Docker do
  @moduledoc """
  A module to interact with the Docker API.
  """
  
  require HTTPoison
  
  @docker_url "http://localhost:2375/v4.27.2"
  
  def list_containers do
    @docker_url
    |> HTTPoison.get!("/containers/json")
    |> parse_response
  end
  
  defp parse_response(%HTTPoison.Response{status_code: 200, body: body}) do
    {:ok, Poison.decode!(body)}
  end
  
  defp parse_response(%HTTPoison.Response{status_code: status_code}) do
    {:error, "Failed to list containers. Status code: #{status_code}"}
  end
end