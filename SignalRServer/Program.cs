using Microsoft.AspNetCore.Hosting;
using SignalRServer.Data;
using SignalRServer.Hubs;
using System.Diagnostics;

var builder = WebApplication.CreateBuilder(args);

// Add services to the container.
builder.Services.AddRazorPages();
builder.Services.AddServerSideBlazor();
builder.Services.AddSingleton<WeatherForecastService>();
builder.Services.AddSignalR();

// TODO: Get the IP directly, allow setting PORT only.
var URL = Environment.GetEnvironmentVariable("PC_STATS_IP");
var PORT = Environment.GetEnvironmentVariable("PC_STATS_PORT");
Debug.WriteLine($"Using Environment Variables URL={URL} and PORT={PORT}");
builder.WebHost.UseUrls();
builder.WebHost.UseUrls(new string[2] { $"https://{URL}:{PORT}", $"https://localhost:{PORT}"});

var app = builder.Build();

// Configure the HTTP request pipeline.
if (!app.Environment.IsDevelopment())
{
    app.UseExceptionHandler("/Error");
    // The default HSTS value is 30 days. You may want to change this for production scenarios, see https://aka.ms/aspnetcore-hsts.
    app.UseHsts();
    app.UseHttpsRedirection();
}

app.UseStaticFiles();

app.UseRouting();

app.MapBlazorHub();
app.MapFallbackToPage("/_Host");
app.MapHub<PCStatsHub>("/pcstats");

app.Run();
