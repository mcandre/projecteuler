guard :shell do
  watch('Gemfile') do |m|
    title = 'Bundler'
    msg = `bundle`
    status = ($?.success? && :success) || :failed

    n msg, title, status
    "-> #{msg}"
  end

  watch(/(.+)\.hs/) do |m|
    title = 'Test'
    msg = `runhaskell #{m[1]}`
    status = ($?.success? && :success) || :failed

    n msg, title, status
    "-> #{msg}"
  end
end
