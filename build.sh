#!/bin/bash

# Script to build gem 

rm brval2-*.gem
gem build brval2.gemspec
gem install ./brval2-*.gem
irb -r 'brval2'