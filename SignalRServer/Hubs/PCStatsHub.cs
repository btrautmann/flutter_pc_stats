using Microsoft.AspNetCore.SignalR;
using System.Data.Common;
using System.Diagnostics;

namespace SignalRServer.Hubs
{
    public class PCStatsHub : Hub
    {
        public async Task SendMessage(string message)
        {
            Console.WriteLine($"SendMessage: {message}");
            Dictionary<string, Dictionary<string, string>> summary = HardwareAccess.GetHardwareSummary();
            await Clients.All.SendAsync("ReceiveSummary", summary);
        }

        public async Task SendSummary(Dictionary<String, Dictionary<String, String>> summary)
        {
            Console.WriteLine($"SendSummary: {summary}");
            await Clients.All.SendAsync("ReceiveSummary", summary);
        }
    }
}
