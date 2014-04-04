$:.unshift File.dirname(__FILE__) + "/lib"
require 'mpb'

sizes = {
  n: '0px',
  px: '1px',
  xs: '2px',
  s: '5px',
  m: '10px',
  l: '20px',
  xl: '40px',
  xxl: '80px'
}

generator = MPB::SassGenerator.new(sizes)
puts generator.generate
