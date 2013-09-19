function(doc, meta) {
  if (doc.type == "vine" && doc.title) {
    emit(doc.score, doc.title);
  }
}
