# frozen_string_literal: true

require_relative 'word_frequency'
require 'minitest/autorun'

# Testing class
class TestWordFrequency < Minitest::Test
  def test_empty_string
    assert_equal([], words_from_string(''))
    assert_equal([], words_from_string('   '))
  end

  def test_single_word
    assert_equal(['cat'], words_from_string('cat'))
    assert_equal(['cat'], words_from_string('  cat  '))
  end

  def test_many_words
    assert_equal(%w[cat and dog], words_from_string('cat and dog'))
  end

  def ignores_punctuation
    assert_equal(%w[the cat's mat], words_from_string("<the!> cat's, -mat-"))
  end

  def test_empty_list
    assert_equal({}, count_frequency([]))
  end

  def test_single_word_count
    assert_equal({ 'cat' => 1 }, count_frequency(['cat']))
  end

  def test_two_different_words_count
    assert_equal({ 'cat' => 1, 'sat' => 1 }, count_frequency(%w[cat sat]))
  end

  def test_two_words_with_adjacent_repeat_count
    assert_equal({ 'cat' => 2, 'sat' => 1 }, count_frequency(%w[cat cat sat]))
  end

  def test_two_words_with_non_adjacent_repeat_count
    assert_equal({ 'cat' => 2, 'sat' => 1 }, count_frequency(%w[cat sat cat]))
  end
end
