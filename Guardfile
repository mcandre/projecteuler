guard :shell do
  watch('Gemfile') do |m|
    title = 'Bundler output'
    msg = 'Bundler Failure'
    status = :failed

    if `bundle`
      msg = 'Bundled'
      status = :status
    end

    n msg, title, status

    "-> #{msg}"
  end

  watch(/(.+)\.hs/) do |m|
    title = 'Test output'
    msg = 'Haskell error'
    status = :failed

    output = `runhaskell #{m[1]}`

    if $?.success?
      msg = output
      status = :success
    end

    n msg, title, status

    "-> #{msg}"
  end
end
