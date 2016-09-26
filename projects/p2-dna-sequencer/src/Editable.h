#pragma once
#include <cstddef>

#include "BaseSequence.h"
#include "SequenceType.h"

namespace mesa
{
  namespace dna 
  {
  /**
   * Defines actions that can be taken on editable BaseSequences.
   */
    class Editable {
      public:
        /**
         * Base class virtual destructor.
         * @see http://en.cppreference.com/w/cpp/language/destructor
         */
        virtual ~Editable();

        /** 
         * Replace the sequence at fragment position \c pos with 
         * a clipped version of the sequence. 
         * The clipped version is that part of the sequence beginning at character position 
         * \c start and ending with character position \c end. 
         * @note
         * It is an error if \c start has a value less than one, or 
         * if \c start or \c end are beyond the end of the sequence. 
         * A clip command with such an error makes no alteration to the sequence.
         *
         * If there is no sequence at this slot, a suitable message is provided. 
         * 
         * If the value for \c end is less than the value for \c start 
         * then the result is a sequence containing no characters.   
         * 
         * @param pos the target position within the fragment list
         * @param start the start location within the sequence to be clipped
         * @param length the number of postions to clip
         * @return the part of the sequence that was clipped
         */
        virtual BaseSequence clip(const std::size_t pos, 
                                  const std::size_t start, 
                                  const std::size_t length) = 0;

        /** 
         * Replace the sequence at fragment position \c pos with a clipped version of the sequence. 
         * The clipped version is that part of the sequence beginning at character position 
         * \c start and cnotinuing to the end of the sequence.
         * @note
         * It is an error if \c start has a value less than one, or 
         * if \c start is beyond the end of the sequence. 
         * A clip command with such an error makes no alteration to the sequence.
         * 
         * If there is no sequence at this slot, a suitable message is provided. 
         * 
         * @param pos the target position within the fragment list
         * @param start the start location within the sequence to be clipped
         * @return the part of the sequence that was clipped
         */
        virtual BaseSequence clip(const std::size_t pos, const std::size_t start) = 0;

        /**
         * Copy the sequence in position \c pos1 to \c pos2. 
         * If there is no sequence at \c pos1, a suitable message is provided
         * and the sequence at \c pos2 is not changed.
         * @param pos1 the source position within the fragment list
         * @param pos2 the destination position within the fragment list
         */
        virtual void copy (const std::size_t pos1, const std::size_t pos2) = 0;


        /** 
         * Inserts the \c sequence to position \c pos in the fragment list. 
         * The type must be SequenceType::DNA or SequenceType::RNA. 
         * The \c sequence is checked to verify it contains only appropriate letters for its type. 
         * If not, the insert operation is in error and no change is made to the sequence list. 
         * If there is already a sequence at \c pos and if \c sequence is syntactically correct, 
         * then the new sequence replaces the old one at that position. 
         * 
         * It is acceptable that \c sequence be empty (contain no characters) in which case a 
         * null sequence will be stored at \c pos. 
         * 
         * Note that a empty \c sequence in a sequence list slot is different from an empty slot.
         * @param pos the target position within the fragment list
         * @param type the sequence type of DNA sequence being added (DNA, RNA)
         * @param sequence the actual sequence to be added
         */
        virtual void insert (const std::size_t pos, SequenceType type, const std::string& sequence) = 0;

        /**
         * Remove the sequence at position \c pos in the fragment list. 
         * @param pos the target position within the fragment list
         */
        virtual void remove (const std::size_t pos) = 0;


        /**
         * Swap the tails of the sequences at fragment positions \c pos1 and \c pos2. 
         *
         * The tail for \c pos1 begins at character \c start1 and 
         * the tail for \c pos2 begins at character \c start2. 
         * 
         * If the length of a sequence is \c n, the start position may be \c n, 
         * meaning that the tail of the other sequence is added 
         * (i.e., a tail of null length is being swapped). 
         * 
         * @note
         * The swap operation reports an error 
         * if the two sequences are not of the same type, or 
         * if one of the slots does not contain a sequence. 
         * In either case, no changes are made to the sequences.
         * 
         *
         * @param pos1 the source position within the fragment list
         * @param start1 the starting character position within the pos1 fragment
         * @param pos2 the destination position within the fragment list
         * @param start2 the starting character position within the pos2 fragment
         */
        virtual void swap  (const std::size_t pos1, const std::size_t start1, 
                            const std::size_t pos2, const std::size_t start2) = 0;


        /**
         * Transcribe the sequence at position \c pos in the fragment list 
         * from a DNA sequence into an RNA sequence. 
         * @param pos the target position within the fragment list
         *        This is the fragment that will be transcribed.
         * @note If the sequence is not a DNA sequence then nothing is done.
         */
        virtual void transcribe (const std::size_t pos) = 0;

  };

}
}


