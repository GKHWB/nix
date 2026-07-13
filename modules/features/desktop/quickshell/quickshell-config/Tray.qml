import Quickshell
import Quickshell.Io
import Quickshell.Widgets
import Quickshell.Services.SystemTray
import QtQuick
import QtQuick.Effects
import QtQuick.Layouts

WrapperRectangle {
	property int size: 20

	Layout.alignment: Qt.AlignHCenter
	margin: 10
	leftMargin: 20
	rightMargin: 20
	color: "#35291d"
	ColumnLayout {
		spacing: 10
		Repeater {
			model: SystemTray.items
			delegate: Item {
				id: systemTrayItem
				required property var modelData

				width: size
				height: size

				IconImage {
					id: icon

					implicitSize: size
					source: (modelData.title == "Input Method") ? "file:/home/alter/nix/home/assets/inputMethodIcon.png" : modelData.icon
					mipmap: true
				}


				MultiEffect {
					source: icon
					anchors.fill: icon

					colorization: 1.0
					colorizationColor: "#b89b7d"
				}


				QsMenuAnchor {
					id: menuAnchor

					anchor {
						window: bar

						rect {
							width: bar.width
							height: bar.height
						}

						edges: Edges.Bottom | Edges.Right

					}
					
					menu: modelData.menu
				}

				MouseArea {
					anchors.fill: parent
					acceptedButtons: Qt.AllButtons
					cursorShape: Qt.PointingHandCursor
					width: parent.width
					height: width
					onClicked: (mouse) => {
						console.log(mouse.button);
						switch (mouse.button) {
							case Qt.LeftButton:
								modelData.activate();
								break;
							case Qt.RightButton:
								menuAnchor.open();
								break;
							case Qt.MiddleButton:
								break;
						}
					}
				}
			}
		}
	}
}
