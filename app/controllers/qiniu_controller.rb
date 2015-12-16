class QiniuController < ApplicationController

  def token
    uptoken = Qiniu.generate_upload_token(scope:ENV['QINIU_BUCKET'])
    render json: { uptoken: uptoken }
  end
end
