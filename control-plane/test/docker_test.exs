defmodule DockerTest do
  use ExUnit.Case
  
  test "list_containers returns a list of containers" do
    assert {:ok, _response} = Docker.list_containers()
  end
end