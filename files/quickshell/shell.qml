import Quickshell // for PanelWindow
import Quickshell.Io
import QtQuick // for Text

PanelWindow {
  anchors {
    top: true
    left: true
    right: true
  }

  implicitHeight: 30

  Text {
    id: clock
    // center the bar in its parent component (the window)
    anchors.centerIn: parent

    Process {
        command: ["date"]
        running: true

        stdout: StdioCollector {
            onStreamFinished: clock.text = this.text
        }
    }
  }
}
