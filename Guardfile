guard :shell do
  watch(/^.*\.hs$/) do |m|
    title = 'Test'
    eager "runhaskell #{m[0]}"
    status = ($?.success? && :success) || :failed
    n '', title, status
    ''
  end
end
