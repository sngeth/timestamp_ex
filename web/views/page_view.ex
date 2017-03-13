defmodule TimestampEx.PageView do
  use TimestampEx.Web, :view

  def render("index.json", %{date: date}) do
    case Integer.parse(date) do
      {_int_val, _} ->
        get_natural_time(date)
      _ ->
        get_unix_time(date)
    end
  end

  defp get_unix_time(date) do
    { :ok, dt } = Timex.parse("December 15, 2015", "%B %d, %Y", :strftime)

    %{ unix: (DateTime.to_unix(%DateTime{ year: dt.year,
        month: dt.month,
        day: dt.day,
        zone_abbr: "UTC",
        hour: 0,
        minute: 0,
        second: 0,
        microsecond: {0, 0},
        utc_offset: 0,
        std_offset: 0,
        time_zone: "Etc/UTC"})), natural: date }
  end

  defp get_natural_time(date) do
    natural_time = parse_unix_time(date)
    %{ unix: String.to_integer(date), natural: natural_time }
  end

  defp parse_unix_time(date) do
    %{month: month, day: day, year: year} = String.to_integer(date) |> DateTime.from_unix!
    "#{Timex.month_name(month)} #{day}, #{year}"
  end
end
