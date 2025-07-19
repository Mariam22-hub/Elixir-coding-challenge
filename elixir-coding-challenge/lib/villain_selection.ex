defmodule VillainSelection do
  @donald "Donald Duck"
  @vader "Darth Vader"
  @opposite_modes ["closest-first", "furthest-first"]

  @spec select(String.t()) :: {:ok, String.t()} | {:error, any()}
  def select(input) do
    with {
         :ok, %{"attack_modes" => modes, "radar" => radar}} <- Jason.decode(input),
         :ok <- validate_modes(modes),
         :ok <- validate_villains(radar),
         filtered <- apply_modes(radar, modes),
         {:ok, best_position} <- pick_target(filtered, modes),

         result <- %{
           position: best_position["position"],
           villains:
             best_position["villains"]
             |> Enum.filter(&Map.has_key?(&1, "malice"))
             |> sort_villains(modes)
             |> Enum.map(& &1["costume"])
         },

         {:ok, json} <- Jason.encode(result) do
      {:ok, json}

    else
      {:error, reason} -> {:error, reason}
      _ -> {:error, "Invalid input"}

    end
  end

  defp validate_modes(modes) do
    cond do
      Enum.any?(modes, &(&1 not in supported_modes())) ->
        {:error, "Unsupported attack mode"}

      Enum.all?(@opposite_modes, &(&1 in modes)) ->
        {:error, "Conflicting attack modes"}

      true ->
        :ok
    end
  end

  defp validate_villains(radar) do
    if Enum.any?(radar, fn entry ->
         Enum.any?(entry["villains"] || [], fn v ->
           Map.has_key?(v, "malice") and v["malice"] < 0
         end)
       end) do
      {:error, "Negative malice is invalid"}
    else
      :ok
    end
  end

  defp supported_modes do
    [
      "closest-first",
      "furthest-first",
      "avoid-crossfire",
      "prioritize-vader"
    ]
  end

  defp apply_modes(radar, modes) do
    radar
    |> Enum.filter(&Map.has_key?(&1, "position"))
    |> filter_avoid_crossfire(modes)
    |> filter_prioritize_vader(modes)
    |> Enum.map(fn entry ->
      villains = entry["villains"] || []

      sorted_villains =
        villains
        |> Enum.filter(&Map.has_key?(&1, "malice"))
        |> sort_villains(modes)

      Map.put(entry, "villains", sorted_villains)
    end)
    |> sort_by_distance(modes)
  end

  defp filter_avoid_crossfire(radar, modes) do
    if "avoid-crossfire" in modes do
      Enum.filter(radar, fn entry ->
        villains = entry["villains"] || []
        not Enum.any?(villains, fn v -> v["costume"] == @donald end)
      end)
    else
      radar
    end
  end


  defp filter_prioritize_vader(radar, modes) do
    if "prioritize-vader" in modes do
      Enum.filter(radar, fn entry ->
        Enum.any?(entry["villains"] || [], &(&1["costume"] == @vader))
      end)
    else
      radar
    end
  end

  defp sort_by_distance(radar, modes) do
    cond do
      "closest-first" in modes -> Enum.sort_by(radar, &distance(&1["position"]))
      "furthest-first" in modes -> Enum.sort_by(radar, &distance(&1["position"]), :desc)
      true -> radar
    end
  end

  defp distance(%{"x" => x, "y" => y}), do: :math.sqrt(x * x + y * y)

  defp pick_target([], _modes), do: {:error, "No valid targets"}

defp pick_target(radar, modes) do
  if modes == ["avoid-crossfire"] do
    # select the entry with the highest total malice
    best =
      Enum.max_by(radar, fn entry ->
        entry["villains"]
        |> Enum.filter(&Map.has_key?(&1, "malice"))
        |> Enum.map(& &1["malice"])
        |> Enum.sum()
      end)

    {:ok, best}
  else
    {:ok, hd(radar)}
  end
end


  defp sort_villains(villains, modes) do
    prioritize = "prioritize-vader" in modes

    Enum.sort_by(villains, fn villain ->
      vader_priority =
        if prioritize and villain["costume"] == @vader do
          0
        else
          1
        end

      {vader_priority, -villain["malice"], villain["costume"]}
    end)
  end
end
