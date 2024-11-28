# frozen_string_literal: true

require_relative "test_helper"
# require_relative '../lib/modules/tag'

class TestHexletCode < Minitest::Test

  def setup
    # Создаем класс User с полями name и job
    struct = Struct.new(:name, :job, keyword_init: true)
    # Создаем конкретно пользователя и заполняем имя
    @user = struct.new name: 'rob'
  end

  def teardown; end

  def test_that_it_has_a_version_number
    refute_nil ::HexletCode::VERSION
  end

  # def test_it_does_something_useful
  #   assert false
  # end

  def test_form_without_options
    check_form = HexletCode.form_for(@user)
    expected = "<form action='#' method='post'></form>"
    assert_equal(expected, check_form)
  end

  def test_form_with_options
    check_form = HexletCode.form_for(@user, class: 'hexlet-form')
    expected = "<form action='#' method='post' class='hexlet-form'></form>"
    assert_equal(expected, check_form)
  end

  def test_form_with_url_and_options
    check_form = HexletCode.form_for(@user, url: '/profile', class: 'hexlet-form')
    expected = "<form action='/profile' method='post' class='hexlet-form'></form>"
    assert_equal(expected, check_form)
  end

end
