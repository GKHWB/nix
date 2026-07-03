//@ pragma UseQApplication

import Quickshell
import Quickshell.Io
import Quickshell.Services.SystemTray
import QtQuick
import QtQuick.Controls

Scope {
	LazyLoader {
		id: bar

		Bar {}

		loading: true
	}

	IpcHandler {
		target: "bar"

		function showBar(): void { bar.item.visible = !bar.item.visible }
	}
}
