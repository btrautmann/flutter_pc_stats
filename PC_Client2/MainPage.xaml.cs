using Microsoft.AspNetCore.SignalR.Client;
using System.Diagnostics;

namespace PC_Client2;

public partial class MainPage : ContentPage
{
	private readonly HubConnection _connection;

	public MainPage()
	{
		InitializeComponent();
        var PORT = Environment.GetEnvironmentVariable("PC_STATS_PORT");
        _connection = new HubConnectionBuilder().WithUrl($"https://localhost:{PORT}/pcstats").Build();
		_connection.On<string>("MessageReceived", (message) =>
			{
				Debug.Write($"MessageReceived: {message}");
				Dictionary<string, Dictionary<string, string>> summary = HardwareAccess.GetHardwareSummary();
				_connection.SendAsync("SendSummary", summary);
        });
		Task.Run(() =>
		{
			Dispatcher.Dispatch(async () => await _connection.StartAsync());
		});
	}
}

