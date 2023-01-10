using Microsoft.AspNetCore.SignalR;

namespace PC_Client.Hubs
{
    public class PCStatsHub : Hub
    {
        public async Task SendMessage(string user, string message)
        {
            await Clients.All.SendAsync("ReceiveMessage", user, message);
        }

        public async Task HelloFromFlutter(string message)
        {
            await Clients.All.SendAsync("MessageFromFlutter", message);
        }   
    }
}
