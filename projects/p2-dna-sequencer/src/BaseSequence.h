#pragma once

#include <iostream>
#include <string>

#include "Logger.h"
#include "SequenceType.h"


namespace mesa{
  namespace dna {
    /**
     * Value class to store a sequence of DNA or RNA bases.
     * 
     * A BaseSequence is a sequence of letters representing the 4 
     * amino acids found in DNA and RNA.
     * The class also stores the sequence type.
     * Two sequence types exist because the valid letters that can be stored
     * in a sequence of a particular type are not the same.
     * 
     * - A DNA sequence can only hold the letters: ACGT
     * - An RNA sequence can only hold the letters: ACGU
     *
     * It is valid for a BaseSequence to have no characters, in which case
     * the SequenceType is EMPTY.
     *
     */
    class BaseSequence {
      public:
        /**
         * Create an SequenceType::EMPTY sequence.
         */
        BaseSequence() {} 
        /**
         * Creates a BaseSequence from a SequenceType and string of characters.
         *
         * The string must be a valid sequence of characters for the supplied type, or
         * an EMPTY BaseSequence is created.
         * @see get_empty()
         * @param type new type
         * @param sequence new sequence
         */
        BaseSequence(const SequenceType type, const std::string& sequence);
        /**
         * BaseSequence copy constructor.
         */
        BaseSequence(const BaseSequence& other);

        /**
         * Get the BaseSequence type.
         * @return the current SequenceType
         */
        const SequenceType&   type()     const {return _type;}
        /**
         * Get the BaseSequence characters.
         * @return the current sequence
         * @note
         * The sequence stored in the BaseSequence could perhaps have been
         * a Base class or enum, but ultimately I went with a simple string.
         * No one needs to know the underlying storage is a string and
         * it could be easily refactored into something else later if needed.
         * For now, operating on the YAGNI principle: Ya Ain't Gonna Need It
         */
        const std::string&    sequence() const {return _seq;}
        /**
         * Transform a DNA sequence into an RNA sequence.
         *
         * If the sequence is already of SequenceType::RNA, then
         * this function does nothing and returns an empty sequence.
         * @see get_empty()
         * @return a new BaseSequence of type RNA.
         */
        BaseSequence  transcribe();
        /** 
         * Removed characters from the sequence.
         * 
         * The clipped version is that part of the sequence beginning at character position 
         * \c start and continuing for \c length characters or until the end is reached,
         * whicherver comes first. 
         * @note
         * It is an error if \c start is beyond the end of the sequence. 
         * A clip command with such an error makes no alteration to the sequence.
         *
         * @param start the start location within the sequence
         * @param length the number of postions to clip
         * @return the part of the sequence that was clipped
         */
        BaseSequence clip       (const std::size_t start, 
                                 const std::size_t length);

        /**
         * BaseSequence copy assignment operator.
         * @param other BaseSequence to copy
         * @return a new BaseSequence
         */
        BaseSequence& operator=(const BaseSequence& other);

        
      private:
        /**
         * The current SequenceType 
         */
        SequenceType _type = SequenceType::EMPTY;
        /**
         * The current sequence characters
         */
        std::string _seq;
        /**
         * Reference to the system logger.
         */
        Logger& log = mesa::get_logger();


    };

    /**
     * Output stream operator overload.
     */
    std::ostream& operator<<(std::ostream& os, const BaseSequence& rhs);

    /**
     * Get a definition of a BaseSequence with type == EMPTY and no sequence.
     * @return an empty BaseSequence
     */
    BaseSequence& get_empty();

    /**
     * Confirm that a SequenceType / string combination is valid.
     * @param type the SequenceType to evaluate
     * @param sequence the characters to evaluate
     * @return true if every character in the sequence is valid for its SequenceType
     * @return false otherwise
     */
    bool sequence_is_valid(const SequenceType type, const std::string& sequence);
  }
}
