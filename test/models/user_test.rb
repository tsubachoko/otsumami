require 'test_helper'

class UserTest < ActiveSupport::TestCase
  
  def setup
    @user = User.new(name: "Example", email: "user@example.com",
                     password: "foobar", password_confirmation: "foobar")
  end
  
  test "should be valid" do
    assert @user.valid?
  end

  test "name should be present" do
    @user.name = " "
    assert_not @user.valid?
  end

  test "name should not be too long" do
    @user.name = 'a' * 51
    assert_not @user.valid?
  end

  test "email should be present" do
    @user.email = " "
    assert_not @user.valid?
  end

  test "email should not be too long" do
    @user.email = 'a' * 244 + "@example.com"
    assert_not @user.valid?
  end

  test "email should be saved as lower-case" do
    email = "FOoBaR@eXaMplE.COM"
    @user.email = email
    @user.save
    assert_equal email.downcase, @user.reload.email
  end

  test "email validation should accept valid addresses" do
    valid_addresses = %w[user@exmaple.com User@foo.COM
                         A_US_ER@foo.bar.org first.last@foo.jp
                         alice+bob@baz.cn]
    valid_addresses.each do |address|
      @user.email = address
      assert @user.valid?, "#{address.inspect} should be valid"
    end
  end

  test "email validation should reject invalid addresses" do
    valid_addresses = %w[user@exmaple,com user_at_foo.org
                         user.name@example. foo@bar_baz.com
                         foo@bar+baz.com foo@bar..com]
    valid_addresses.each do |address|
      @user.email = address
      assert_not @user.valid?, "#{address.inspect} should be invalid"
    end
  end

  test "email should be unique" do
    duplicate_user = @user.dup
    @user.save
    assert_not duplicate_user.valid?
  end

  test "password should be present (no blank)" do
    @user.password = @user.password_confirmation = ' ' * 6
    assert_not @user.valid?
  end

  test "password should have a minimum length" do
    @user.password = @user.password_confirmation = 'a' * 5
    assert_not @user.valid?
  end

  test "favorite and unfavorite" do
    user = users(:tester)
    item = items(:beer)
    assert_not user.favorite?(item)
    user.favorite(item)
    assert user.favorite?(item)
    user.unfavorite(item)
    assert_not user.favorite?(item)
  end

end
