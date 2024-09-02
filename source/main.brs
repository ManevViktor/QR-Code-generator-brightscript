'********** Copyright 2016 Roku Corp.  All Rights Reserved. **********

sub Main()
    showChannelSGScreen()
end sub

sub showChannelSGScreen()
    screen = CreateObject("roSGScreen")
    m.port = CreateObject("roMessagePort")
    screen.setMessagePort(m.port)
   scene = screen.CreateScene("SampleScene")
    screen.show()

    node = CreateObject("roSGNode", "QRCode")
    scene.appendChild(node)

    node.text = "https:/www.google.com"

    while(true)
        msg = wait(0, m.port)
        msgType = type(msg)

        if msgType = "roSGScreenEvent"
            if msg.isScreenClosed() then return
        end if
    end while

end sub
