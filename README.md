# RemoteControl

```
var count: Int = 0

RemoteControlManager.sharedManager.debug = false

RemoteControlManager.sharedManager.masterButton.click = {
  print("hoho! click!!!")
}

RemoteControlManager.sharedManager.remoteControlReveivedWithEventHandler = {
  print("I am handler")
}

RemoteControlManager.sharedManager.masterButton.click = {
  ++self.count
}

RemoteControlManager.sharedManager.masterButton.doubleClick = {
  --self.count
}

RemoteControlManager.sharedManager.masterButton.tripleClick = {
  self.count = 0
}
```
