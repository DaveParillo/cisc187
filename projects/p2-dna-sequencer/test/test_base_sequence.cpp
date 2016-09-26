#define BOOST_TEST_DYN_LINK
#define BOOST_TEST_MODULE BaseSequenceTests
#include <boost/test/unit_test.hpp>
#include <iostream>
#include <string>

#include "../src/BaseSequence.h"

using namespace mesa;
using namespace mesa::dna;


  /////////////////////////////////////////////////////////////////////////
  //  Constructor tests
  /////////////////////////////////////////////////////////////////////////

BOOST_AUTO_TEST_CASE( base_seq_empty )
{
  BaseSequence b;
  BOOST_CHECK(SequenceType::EMPTY == b.type());
  BOOST_CHECK(b.sequence().empty());
}

BOOST_AUTO_TEST_CASE( base_seq_make_dna )
{
  BaseSequence b = {SequenceType::DNA, "acgt"};
  BOOST_CHECK(SequenceType::DNA == b.type());
  BOOST_CHECK_EQUAL("ACGT", b.sequence());
}

BOOST_AUTO_TEST_CASE( base_seq_make_rna )
{
  BaseSequence b = {SequenceType::RNA, "acgu"};
  BOOST_CHECK(SequenceType::RNA == b.type());
  BOOST_CHECK_EQUAL("ACGU", b.sequence());
}

BOOST_AUTO_TEST_CASE( base_seq_dna_invalid )
{
  BaseSequence b = {SequenceType::DNA, "x"};
  BOOST_CHECK(SequenceType::EMPTY == b.type());
  BOOST_CHECK(b.sequence().empty());
}
BOOST_AUTO_TEST_CASE( base_seq_dna_invalid_num )
{
  BaseSequence b = {SequenceType::DNA, "1"};
  BOOST_CHECK(SequenceType::EMPTY == b.type());
  BOOST_CHECK(b.sequence().empty());
}

BOOST_AUTO_TEST_CASE( base_seq_dna_invalid_rna )
{
  BaseSequence b = {SequenceType::DNA, "acgu"};
  BOOST_CHECK(SequenceType::EMPTY == b.type());
  BOOST_CHECK(b.sequence().empty());
}

BOOST_AUTO_TEST_CASE( base_seq_rna_invalid_dna )
{
  BaseSequence b = {SequenceType::RNA, "acgt"};
  BOOST_CHECK(SequenceType::EMPTY == b.type());
  BOOST_CHECK(b.sequence().empty());
}

BOOST_AUTO_TEST_CASE( base_seq_dna_invalid_space )
{
  BaseSequence b = {SequenceType::DNA, " "};
  BOOST_CHECK(SequenceType::EMPTY == b.type());
  BOOST_CHECK(b.sequence().empty());
  BaseSequence b2 = {SequenceType::DNA, std::to_string('\t')};
  BOOST_CHECK(SequenceType::EMPTY == b2.type());
  BOOST_CHECK(b2.sequence().empty());
}


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

