import SwiftUI
import SwiftData

struct ContentView: View {
    @Environment(\.modelContext) private var context
    @Query(sort: \Note.updatedAt, order: .reverse) private var notes: [Note]

    var body: some View {
        NavigationStack {
            List {
                if notes.isEmpty {
                    ContentUnavailableView(
                        "No Notes",
                        systemImage: "note.text",
                        description: Text("Tap + to create your first note")
                    )
                }

                ForEach(notes) { note in
                    NavigationLink {
                        NoteEditorView(note: note)
                    } label: {
                        VStack(alignment: .leading) {
                            Text(note.content.isEmpty ? "New Note" : note.content)
                                .lineLimit(1)
                                .font(.headline)

                            Text(note.updatedAt, style: .relative)
                                .font(.caption)
                                .foregroundStyle(.secondary)
                        }
                    }
                }
                .onDelete(perform: deleteNotes)
            }
            .navigationTitle("Notes")
            .toolbar {
                Button {
                    addNote()
                } label: {
                    Image(systemName: "plus")
                }
            }
        }
    }

    private func addNote() {
        context.insert(Note())
    }

    private func deleteNotes(at offsets: IndexSet) {
        for index in offsets {
            context.delete(notes[index])
        }
    }
}

