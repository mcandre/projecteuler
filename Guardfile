guard :shell do
  watch(/(.+)\.hs/) do |m|
    title = 'Test'
    msg = `runhaskell #{m[0]}`
    status = ($?.success? && :success) || :failed

    n msg, title, status
    "-> #{msg}"
  end
end
