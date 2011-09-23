# encoding: utf-8
require 'rubygems'
require 'rake'
require 'rake/testtask'
require 'rake/packagetask'
require 'rubygems/package_task'

gemfile = File.expand_path('../spec/test_app/Gemfile', __FILE__)
if File.exists?(gemfile) && (%w(spec cucumber).include?(ARGV.first.to_s) || ARGV.size == 0)
  require 'bundler'
  ENV['BUNDLE_GEMFILE'] = gemfile
  Bundler.setup

  require 'rspec'
  require 'rspec/core/rake_task'
  RSpec::Core::RakeTask.new
end

desc "Default Task"
task :default => [:spec, :cucumber]

spec = eval(File.read('spree_easy_contact.gemspec'))

Gem::PackageTask.new(spec) do |p|
  p.gem_spec = spec
end

desc "Regenerates a rails 3 app for testing"
task :test_app do
  SPREE_PATH = ENV['SPREE_PATH']
  FITSCRUBS_PATH = ENV['FITSCRUBS_PATH']
  
  raise "SPREE_PATH should be specified (where is your source code for spree?)" unless SPREE_PATH
  raise "SPREE_PATH should be specified (where is your source code for spree?)" unless FITSCRUBS_PATH
  
  require File.join(SPREE_PATH, 'lib/generators/spree/test_app_generator')

  class SpreeEasyContactTestAppGenerator < Spree::Generators::TestAppGenerator

    def install_gems
      inside "test_app" do
        run 'bundle exec rake spree:install'
        run 'bundle exec rake spree_fitscrubs:install'
        run 'bundle exec rake spree_easy_contact:install'
      end
    end

    def migrate_db
      run_migrations
    end

    protected
    def full_path_for_local_gems
      <<-gems
gem 'spree', :path => \'#{SPREE_PATH}\'
gem 'spree_fitscrubs', :path => \'#{FITSCRUBS_PATH}\'
gem 'spree_easy_contact', :path => \'#{File.dirname(__FILE__)}\'
      gems
    end

  end
  SpreeEasyContactTestAppGenerator.start
end

namespace :test_app do
  desc 'Rebuild test database'
  task :rebuild_dbs do
    system("cd spec/test_app && bundle exec rake db:drop db:migrate RAILS_ENV=test")
  end
end