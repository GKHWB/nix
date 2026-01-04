import Quickshell
import Quickshell.Io
import Quickshell.Wayland
import Quickshell.Widgets
import QtQuick
import QtQuick.Layouts

PanelWindow {
	id: bar

	anchors {
		left: true
		bottom: true
		top: true
	}

	implicitWidth: 40
	color: "#b89b7d"

	ColumnLayout {
		y: 10
		anchors.horizontalCenter: parent.horizontalCenter
		
		WrapperRectangle {
			Layout.alignment: Qt.AlignHCenter
			margin: 10
			leftMargin: 20
			rightMargin: 20
			color: "#35291d"
			ClockWidget {
			}
		}
	}

	ColumnLayout {
		y: parent.height - (height + 10)
		anchors.horizontalCenter: parent.horizontalCenter

		Tray {}
	}
}
