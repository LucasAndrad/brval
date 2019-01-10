#!/bin/bash

# Script to build gem 

rm brval-*.gem
gem build brval.gemspec
gem install ./brval-*.gem
irb -r 'brval'