using IsLabApp.Models;
using IsLabApp.Services;

Console.WriteLine("Welcome to IsLabApp!");

var noteService = new NoteService();
var note = noteService.Create("Test", "Hello World");
Console.WriteLine($"Created note with ID: {note.Id}");
