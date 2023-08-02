#if !defined(RNA_TRANSCRIPTION_H)
#define RNA_TRANSCRIPTION_H

#include <map>
#include <string>
#include <algorithm>
#include <numeric>

namespace rna_transcription {
  static const std::map<char, char> complements{
    { 'C', 'G' },
    { 'G', 'C' },
    { 'T', 'A' },
    { 'A', 'U' }};

  char to_rna(const char c);

  std::string to_rna(const std::string seq);
}  // namespace rna_transcription

#endif // RNA_TRANSCRIPTION_H
