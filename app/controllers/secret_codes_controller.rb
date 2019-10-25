class SecretCodesController < ApplicationController
  before_action :authenticate_user!
  load_and_authorize_resource

  # GET /secret_codes
  # GET /secret_codes.json
  def index
    @secret_codes = SecretCode.order('updated_at desc')
  end

  # GET /secret_codes/new
  def new
    @secret_code = SecretCode.new
  end

  # POST /secret_codes
  # POST /secret_codes.json
  # number
  def create
    code_hash = SecretCode.generate_code(params[:number] || 1)
    @secret_code = SecretCode.create(code_hash)
    redirect_to secret_codes_path
  end
end
