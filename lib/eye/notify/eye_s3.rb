require 'eye'
require 'eye/notify/eye_s3/version'
require 'aws-sdk'

module Eye
  class Notify
    class EyeS3 < Eye::Notify::Custom

      # Eye.config do
      #   s3 bucket_name: 'your-bucket-name'
      # end

      param :bucket_name, String, true
      param :region,      String, false, 'us-east-1'
      param :key,         String, false, default_object_key

      def execute
        Aws::S3::Object.new(options).put object
      end

      private

      def options
        {
          bucket_name: bucket_name,
          key:         key,
          client:      client
        }
      end

      def object
        {
          acl:          'authenticated-read',
          content_type: 'application/json',
          body:         body,
        }
      end

      def client
        Aws::S3::Client.new(region: region)
      end

      def body
        JSON.generate event
      end

      def event
        {
          host:      msg_host,
          timestamp: msg_at,
          message:   msg_message,
          name:      msg_name,
          level:     msg_level
        }
      end

      def default_object_key
        now = Time.now
        [now.year, now.month, now.day, "#{now.to_i}_#{msg_host}.json"].join '/'
      end
    end
  end
end