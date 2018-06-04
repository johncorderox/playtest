class Amazon < ApplicationRecord

  after_create :save_amazon_details

  private
  def save_amazon_details
    require 'aws-sdk'

    @amazon = Amazon.first
    Aws.config.update({credentials: Aws::Credentials.new(
      @amazon.access_key_id, @amazon.secret_access_key)})

    s3 = Aws::S3::Resource.new(region: 'us-west-2')

    my_bucket = s3.bucket(@amazon.bucket)
    my_bucket.create

    Log.create(description: "Bucket has been created.", error_code: 200, status: "PASS")

  end

end
