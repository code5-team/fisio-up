require 'test_helper'

class UsuariosControllerTest < ActionDispatch::IntegrationTest
  test "should get novo" do
    get usuarios_novo_url
    assert_response :success
  end

end
