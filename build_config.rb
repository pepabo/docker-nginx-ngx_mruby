MRuby::Build.new('host') do |conf|

  toolchain :gcc

  conf.gembox 'full-core'

  conf.cc do |cc|
    cc.flags << ENV['NGX_MRUBY_CFLAGS'] if ENV['NGX_MRUBY_CFLAGS']
  end

  conf.linker do |linker|
    linker.flags << ENV['NGX_MRUBY_LDFLAGS'] if ENV['NGX_MRUBY_LDFLAGS']
  end

  # recommended mrbgems
  conf.gem :github => 'iij/mruby-env'
  conf.gem :github => 'iij/mruby-dir'
  conf.gem :github => 'iij/mruby-digest'
  conf.gem :github => 'iij/mruby-process'
  conf.gem :github => 'mattn/mruby-json'
  conf.gem :github => 'mattn/mruby-onig-regexp'
  conf.gem :github => 'matsumotory/mruby-redis'
  conf.gem :github => 'matsumotory/mruby-vedis'
  conf.gem :github => 'matsumotory/mruby-userdata'
  conf.gem :github => 'matsumotory/mruby-uname'
  conf.gem :github => 'matsumotory/mruby-mutex'
  # FIXME: Can be removed "checksum_hash" upgraded to mruby 3.2
  # https://github.com/matsumotory/mruby-localmemcache/issues/8
  conf.gem :github => 'matsumotory/mruby-localmemcache', :checksum_hash => 'ae9e0f0816a7610a1237e86ad18db01d1459498b'
  conf.gem :mgem => 'mruby-secure-random'

  # ngx_mruby extended class
  conf.gem './mrbgems/ngx_mruby_mrblib'
  conf.gem './mrbgems/rack-based-api'
  conf.gem './mrbgems/auto-ssl'
end
