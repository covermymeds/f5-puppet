require 'puppet/parameter'

class Puppet::Parameter::F5Name < Puppet::Parameter
  def self.postinit
    @doc ||= "The name of the object.
    Valid options: <String>"
  end

  validate do |value|
    fail ArgumentError, "#{name} must be a String" unless value.is_a?(String)
    fail ArgumentError, "#{name} must match the pattern /Partition/name" unless value.match(%r{/[\w\.-]+/[\w\.-]+$})
  end
end
