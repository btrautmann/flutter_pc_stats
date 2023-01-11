using Microsoft.AspNetCore.SignalR;

namespace SignalRServer.Hubs
{
    public class PCStatsHub : Hub
    {
        public async Task SendMessage(string message)
        {
            Console.WriteLine($"SendMessage: {message}");
            await Clients.All.SendAsync("MessageReceived", message);
        }

        public async Task SendSummary(Dictionary<String, Dictionary<String, String>> summary)
        {
            Console.WriteLine($"SendSummary: {summary}");
            await Clients.All.SendAsync("ReceiveSummary", summary);
        }
    }
}
