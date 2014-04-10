class Include
  constructor:(@required,@caller)->


if module? and module.exports?
  module.exports.Include=Include