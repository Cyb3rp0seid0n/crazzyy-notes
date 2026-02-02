import SwiftUI
import SwiftData

struct NoteEditorView: View {
    @Bindable var note: Note

    var body: some View {
        TextEditor(text: $note.content)
            .padding()
            .navigationTitle("Edit Note")
            .onChange(of: note.content) {
                note.updatedAt = Date()
            }
    }
}

