CONFIG = HashWithIndifferentAccess.new(
  YAML.load(ERB.new(IO.read("#{Rails.root}/config/graviton.yml")).result)
)