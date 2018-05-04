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
    last_modified < two_months_ago # i.e. it's been modified in the last 2 months
  end

  private
  def default_keys_file
    if home = ENV['HOME']
      "#{home}/.aws/credentials"
    else
      raise "Warning - couldn't detect home directory. Make sure that $HOME is set in your environment."
    end
  end

  def two_months_ago
    Time.now - (60*60*24*2)
  end

  def calculate_file_modification_time!
    File.open(file, 'r') do |f|
      @last_modified = f.mtime
    end
  end
end

begin
  date = Time.now

  if AwsKeys.need_rotating?
    logfile = File.open("#{ENV['HOME']}/.aws/key_rotater.log", 'w') # start a new log file
    logfile.puts "#{date} - Rotating keys\n"
    logfile.puts `aws-rotate-keys`
  else
    logfile = File.open("#{ENV['HOME']}/.aws/key_rotater.log", 'a') # append to old log file
    logfile.puts "#{date} - Keys do not need to be rotated\n"
  end
ensure
  logfile.close
end
