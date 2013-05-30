guard :shell do
  watch(/(.+).hs/) do |m|
    title = "Test output"
    msg = "Haskell error"
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
