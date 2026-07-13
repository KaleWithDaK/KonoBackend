var builder = WebApplication.CreateBuilder(args);

// Learn more about configuring OpenAPI at https://aka.ms/aspnet/openapi
builder.Services.AddEndpointsApiExplorer();
builder.Services.AddSwaggerGen();


var app = builder.Build();


app.UseSwagger();
app.UseSwaggerUI();

app.MapGet("/", () => Results.Ok("Yurr"));

app.Run();
