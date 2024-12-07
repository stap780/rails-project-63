# frozen_string_literal: true

require_relative "test_helper"

# TestHexletCode
class TestHexletCode < Minitest::Test

  def setup

    struct = Struct.new(:name, :job, keyword_init: true)
    @user = struct.new name: 'rob', job: 'hexlet'
  end

  def teardown; end

  def test_that_it_has_a_version_number
    refute_nil ::HexletCode::VERSION
  end

  def test_form_without_options
    check_form = HexletCode.form_for(@user)
    # expected = "<form action='#' method='post'></form>"
    expected = load_fixture('form_without_options')
    assert_equal(expected, check_form)
  end

  def test_form_with_options
    check_form = HexletCode.form_for(@user, class: 'hexlet-form')
    # expected = "<form action='#' method='post' class='hexlet-form'></form>"
    expected = load_fixture('form_with_options')
    assert_equal(expected, check_form)
  end

  def test_form_with_url_and_options
    check_form = HexletCode.form_for(@user, url: '/profile', class: 'hexlet-form')
    # expected = "<form action='/profile' method='post' class='hexlet-form'></form>"
    expected = load_fixture('form_with_url_and_options')
    assert_equal(expected, check_form)
  end

  def test_form_with_input_tag
    check_form = HexletCode.form_for @user do |f|
      f.input :name
      f.input :job
    end
    expected = load_fixture('form_with_input_tag')
    assert_equal(expected, check_form)
  end

  def test_form_with_input_tag_and_as
    check_form = HexletCode.form_for @user do |f|
      f.input :name
      f.input :job, as: :text
    end
    expected = load_fixture('form_with_input_tag_and_as')
    assert_equal(expected, check_form)
  end

  def test_form_with_input_tag_and_options
    check_form = HexletCode.form_for @user do |f|
      f.input :name, class: 'user-input'
      f.input :job
    end
    expected = load_fixture('form_with_input_tag_and_options')
    assert_equal(expected, check_form)
  end

  def test_heve_missing_method
    assert_raises NoMethodError do
      HexletCode.form_for @user, url: '/users' do |f|
        f.input :name
        f.input :job, as: :text
        f.input :age # Поля age у пользователя нет
      end
    end
  end

end
