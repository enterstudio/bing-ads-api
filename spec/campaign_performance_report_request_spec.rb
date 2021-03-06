require 'spec_helper'

describe BingAdsApi::CampaignPerformanceReportRequest do
  it "should initialize campaign performance report request" do
    expect{
      performance_report_request = BingAdsApi::CampaignPerformanceReportRequest.new(:format => :xml,
        :language => :english, :report_name => "My Report",
        :aggregation => :hourly, :time => :today,
        :columns => [:account_name, :account_number, :time_period],
        :filter => {
          # String as bing expected
          :ad_distribution => "Search",
          :device_os => "Windows",
          # snake case symbol
          :device_type => :computer,
          # nil criteria
          :status => nil
        },
        :scope => {
          :account_ids => 12345,
          :campaigns => [
            {:account_id => 1234, :campaign_id => 1234},
            {:account_id => 1234, :campaign_id => 1234},
            {:account_id => 1234, :campaign_id => 1234}
          ]
        }
      )
    }.not_to raise_error
  end

  it "should raise an exception if the scope is invalid" do
    expect{
      performance_report_request = BingAdsApi::CampaignPerformanceReportRequest.new(:format => :xml,
        :language => :english, :report_name => "My Report",
        :aggregation => :hourly, :time => :today,
        :columns => [:account_name, :account_number, :time_period ],
        :scope => { :campaigns => []})
    }.to raise_error

    expect{
      performance_report_request = BingAdsApi::CampaignPerformanceReportRequest.new(:format => :xml,
        :language => :english, :report_name => "My Report",
        :aggregation => :hourly, :time => :today,
        :columns => [:account_name, :account_number, :time_period ],
        :scope => {:account_ids => 12345 })
    }.to raise_error
  end
end
