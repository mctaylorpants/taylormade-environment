#!/usr/bin/env ruby

class AwsKeys
  attr_reader :file, :last_modified

  def self.need_rotating?
    self.new.need_rotating?
  end

  def initialize(file = default_keys_file)
    @file = file

    calculate_file_modification_time!
  end

  def need_rotating?
    last_modified < three_months_ago # i.e. it's been modified in the last 3 months
  end

  private
  def default_keys_file
    if home = ENV['HOME']
      "#{home}/.aws/credentials"
    else
      raise "Warning - couldn't detect home directory. Make sure that $HOME is set in your environment."
    end
  end

  def three_months_ago
    Time.now - (60*60*24*90)
  end

  def calculate_file_modification_time!
    File.open(file, 'r') do |f|
      @last_modified = f.mtime
    end
  end
end

if AwsKeys.need_rotating?
  puts "It's that time of year again! Rotating your AWS keys..."
  `aws-rotate-keys`
end
