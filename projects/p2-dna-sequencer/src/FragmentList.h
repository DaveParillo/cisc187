#pragma once

#include <vector>

#include "BaseSequence.h"
#include "Editable.h"
#include "Printable.h"
#include "SequenceType.h"

using std::size_t;

namespace mesa{
  namespace dna {
    /**
     * Manages a collection of BaseSequence(s)
     * 
     */
    class FragmentList : public Printable, Editable {
      public:
        /**
         * Create a new FragmentList with a default size.
         */
        FragmentList();

        /**
         * Create a new FragmentList with a specified size.
         * @param max_size of the new list
         */
        FragmentList(const size_t max_size);
        virtual ~FragmentList() {} 

        /**
         * FragmentList copy assignment operator.
         * @param other FragmentList to copy
         * @return a new FragmentList
         */
        FragmentList& operator=(const FragmentList& other);

        /**
         * Get the capacity of this FragMentList.
         * @return the number of fragments this FragmentList can store.
         */
        size_t capacity () const { return _max; }

        /**
         * Get all the BaseSequence fragments
         * @return the BaseSequence(s)
         */
        const std::vector<BaseSequence>& fragments() const { return _frags; }

        /**
         * Print all fragments in the FragmentList.
         * For each sequence, its position within the fragment list and the SequenceType.  
         * For SequenceType::EMPTY sequences, only a pair of brackets is printed. 
         */
        void print      () const override;
        /**
         * Print the fragment in the FragmentList at the specified position.
         * @param pos the fragment item to print
         */
        void print_at   (const size_t pos) const override;
        /**
         * @copydoc Editable::insert
         */
        void insert     (const size_t pos, SequenceType type, const std::string& sequence) override;
        /**
         * @copydoc Editable::remove
         */
        void remove     (const size_t pos) override;

        /**
         * @copydoc Editable::clip
         */
        BaseSequence clip       (const size_t pos, 
                                 const size_t start, 
                                 const size_t length) override;

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
        BaseSequence clip       (const size_t pos, 
                                 const size_t start) override;

        /**
         * @copydoc Editable::copy
         */
        void copy       (const size_t pos1, const size_t pos2) override;

        /**
         * @copydoc Editable::swap
         */
        void swap       (const size_t pos1, const size_t start1, 
                         const size_t pos2, const size_t start2) override;
        /**
         * @copydoc Editable::transcribe
         */
        void transcribe (const size_t pos) override;

      private:
        /**
         * The maximum number od BaseSequence fragments that can be stored.
         */
        std::size_t               _max;
        /**
         * The list of BaseSequence(s)
         */
        std::vector<BaseSequence> _frags;
        /**
         * A refewrence to the current system logger.
         */
        Logger&       log   = mesa::get_logger();
        /**
         * A reference to a completely empty BaseSequence.
         * @note
         * EMPTY is a Singleton.
         */
        BaseSequence& EMPTY = get_empty();

        /**
         * Determine if a requested position inside a fragment is valid
         * @param pos the fragment index to be evaluated
         * @param command one of the commands available (print, clip, etc)
         *        this would be better implemented as an enum
         * @return \c true if the position is valid
         */
        bool is_position_valid (const size_t pos, const std::string& command) const;

    };


    }
  }
