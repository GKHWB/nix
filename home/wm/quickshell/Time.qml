pragma Singleton

import Quickshell
import QtQuick

Singleton {
	id: root
	property string format: "hh\nmm"
	property string time: Qt.formatDateTime(new Date(), format)

	Timer {
		interval: 1000
		running: true
		repeat: true
		onTriggered: root.time = Qt.formatDateTime(new Date(), format)
	}
}
