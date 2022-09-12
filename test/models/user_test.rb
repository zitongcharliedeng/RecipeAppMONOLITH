require "test_helper"

class UserTest < ActiveSupport::TestCase
  def setup
    @user = User.new(name: "Example User", email: "user@example.com", 
      password: "foobar", password_confirmation: "foobar")
  end

  test "email validation should accept valid addresses" do
    valid_addresses = ["user@example.com", "USER@foo.COM", "A_US-ER@foo.bar.org",
    "first.last@foo.jp", "alice+bob@baz.cn"]
    valid_addresses.each do |valid_address|
      @user.email = valid_address
      assert @user.valid?, "#{valid_address.inspect} should be valid"
    end
  end

  test "email validation should reject invalid addresses" do
    invalid_addresses = %w[user@example,com user_at_foo.org user.name@example.
    foo@bar_baz.com foo@bar+baz.com]
    invalid_addresses.each do |invalid_address|
      @user.email = invalid_address
      assert_not @user.valid?, "#{invalid_address.inspect} should be invalid"
    end
  end

    test "password has at least 1 number (should succeed)" do
    valid_passwords = ["1234556", "3g12316", "sfdsdfes23",
    "dghfgfbhd5", "fgfhh2"]
    valid_passwords.each do |valid_password|
      @user.password = valid_password
      @user.password_confirmation = valid_password
      assert @user.valid?, "#{valid_password.inspect} should be valid"
    end
  end

  test "password has at least 1 number (should fail)" do
    invalid_passwords = ["12356", "jggggygh", "2",
    "dghfg", "fg"]
    invalid_passwords.each do |invalid_password|
      @user.password = invalid_password
      @user.password_confirmation = invalid_password
      assert_not @user.valid?, "#{invalid_password.inspect} should be invalid"
    end
  end


end
