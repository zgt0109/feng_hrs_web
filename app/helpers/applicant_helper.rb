module ApplicantHelper
  # 累计发布岗位显示
  def render_common_job_count
    Job.all.size + 500
  end

  # 已入驻企业显示
  def render_common_company
    Enterprise.all.size + 100
  end

  # 已入驻中介显示
  def render_common_zhongjie
    Enterprise.all.size + 128
  end

  # 首页招聘信息中性别显示
  def render_common_gender(params)
    gender = params.job_quantity
    gender.wish_male_count? ? '男' : gender.wish_female_count? ? '女' : '男女不限'
  end

  # 首页招聘信息中男女招聘人数显示
  def render_common_gender_count(params)
    gender = params.job_quantity
    if gender.wish_male_count?
       params.job_quantity.wish_male_count
    elsif gender.wish_female_count?
       params.job_quantity.wish_female_count
    else
       params.job_quantity.wish_unkown_count
    end
  end

end
