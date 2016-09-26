#define BOOST_TEST_DYN_LINK
#define BOOST_TEST_MODULE FragmentListTests
#include <boost/test/unit_test.hpp>
#include <string>

#include "../src/FragmentList.h"

using namespace mesa::dna;


  /////////////////////////////////////////////////////////////////////////
  //  Constructor tests
  /////////////////////////////////////////////////////////////////////////

BOOST_AUTO_TEST_CASE( frags_make )
{
  FragmentList f;
  BOOST_CHECK(16 == f.capacity());
  BOOST_CHECK(f.fragments().capacity() == 16);
}


/*

  /////////////////////////////////////////////////////////////////////////
  //  copy assignment
  /////////////////////////////////////////////////////////////////////////
BOOST_AUTO_TEST_CASE( base_seq_copy )
{
  BaseSequence b = {SequenceType::DNA, "acgtacg"};
  BaseSequence c = b;
  BOOST_CHECK(SequenceType::DNA == c.type());
  BOOST_CHECK("ACGTACG" == c.sequence());     // data is the same
  BOOST_CHECK(&b != &c);                      // objects are different
}
BOOST_AUTO_TEST_CASE( base_seq_copy_constructor )
{
  BaseSequence b = {SequenceType::DNA, "acgtacg"};
  BaseSequence c = BaseSequence {b};
  BOOST_CHECK(SequenceType::DNA == c.type());
  BOOST_CHECK("ACGTACG" == c.sequence());     // data is the same
  BOOST_CHECK(&b != &c);                      // objects are different
}

  /////////////////////////////////////////////////////////////////////////
  //  API tests: transcribe
  /////////////////////////////////////////////////////////////////////////

BOOST_AUTO_TEST_CASE( base_seq_transcribe )
{
  BaseSequence b = {SequenceType::DNA, "acgtacg"};
  BaseSequence t = b.transcribe();
  BOOST_CHECK(SequenceType::RNA == t.type());
  BOOST_CHECK("CGUACGU" == t.sequence());
}

BOOST_AUTO_TEST_CASE( base_seq_transcribe_empty )
{
  BaseSequence b = {SequenceType::DNA, ""};
  BaseSequence t = b.transcribe();
  BOOST_CHECK(SequenceType::RNA == t.type());
  BOOST_CHECK(t.sequence().empty());
}

BOOST_AUTO_TEST_CASE( base_seq_transcribe_rna )
{
  BaseSequence b = {SequenceType::RNA, "AAAAAAA"};
  BaseSequence t = b.transcribe();
  BOOST_CHECK(SequenceType::EMPTY == t.type());
  BOOST_CHECK(t.sequence().empty());
}


  /////////////////////////////////////////////////////////////////////////
  //  API tests: clip
  /////////////////////////////////////////////////////////////////////////


BOOST_AUTO_TEST_CASE( base_seq_clip4 )
{
  BaseSequence b = {SequenceType::DNA, "aacttga"};
  BaseSequence t = b.clip(2, 4);
  BOOST_CHECK(SequenceType::DNA == t.type());
  BOOST_CHECK("AAA" == b.sequence());          // characters remaining
  BOOST_CHECK("CTTG" == t.sequence());         // characters removed
}


BOOST_AUTO_TEST_CASE( base_seq_clip_all )
{
  BaseSequence b = {SequenceType::DNA, "aacttga"};
  BaseSequence t = b.clip(0, 99);
  BOOST_CHECK(SequenceType::DNA == t.type());
  BOOST_CHECK(b.sequence().empty());           // characters remaining
  BOOST_CHECK("AACTTGA" == t.sequence());      // characters removed
}

BOOST_AUTO_TEST_CASE( base_seq_clip_invalid_start )
{
  BaseSequence b = {SequenceType::DNA, "aacttga"};
  BaseSequence t = b.clip(99, 4);
  BOOST_CHECK(SequenceType::EMPTY == t.type());
  BOOST_CHECK("AACTTGA" == b.sequence());          // characters remaining
  BOOST_CHECK("" == t.sequence());                 // characters removed
}
*/



