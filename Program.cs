var builder = WebApplication.CreateBuilder(args);
var app = builder.Build();

app.MapGet("/", () => "Hello from IsLabApp!");
app.MapGet("/api/notes", () => new[] { "Note 1", "Note 2" });

app.Run();
