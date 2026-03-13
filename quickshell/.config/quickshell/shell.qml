//Mandatory imports for hyprland
import Quickshell  // ---
import QtQuick // --- 
import Quickshell.Wayland
import Quickshell.Hyprland
import QtQuick.Layouts
import Quickshell.Io 


PanelWindow {
	id: root

	//Variables
	property color colBg: "#0B1818"
	property color colGold : "#FFC282"
	property color  colGreen : "#A5A465"
	property string fontFamily : "JetBrainsMono Nerd Font"

	property int cpuUsage: 0
	property var lastCpuIdle: 0
	property var lastCpuTotal : 0 


	Process {
		id: cpuProc 

		command: ["sh", "-c", "head -1 /proc/stat"]

		stdout: SplitParser {
			onRead: data => {
				var p = data.trim().split(/\s+/)
				var idle = parseInt(p[4]) + parseInt(p[5])
				var total = p.slice(1).reduce((a, b) => a + (parseInt(b)), 0)
				
				if (lastCpuTotal > 0) {
					cpuUsage = Math.round(100 * (1.0 - (idle - lastCpuIdle) / (total - lastCpuTotal)))
				}

				lastCpuTotal= total
				lastCpuIdle = idle
			}
		}
		Component.onCompleted: running = true
	}

	Timer {
		interval : 2000
		running: true
		repeat : true
		onTriggered: cpuProc.running = true
	}

	//bar config
	anchors.top: true
	anchors.left : true 
	anchors.right: true 
	implicitHeight: 30
	color : "#0B1818"

	Text {
		anchors.centerIn: parent
		text: "My first Bar"
		color: "#a9b1d6"
		font.pixelSize: 14

	}

	RowLayout {
		anchors.fill : parent
		anchors.margins: 8

		Repeater {
			model : 9

			Text {
				property var ws: Hyprland.workspaces.values.find(w => w.id === index + 1)
				property bool isActive: Hyprland.focusedWorkspace?.id === (index + 1)
				text: index + 1

				color: isActive ? "#FFC282" :(ws ? "#A5A465" : "#444b6a")
				font {pixelSize : 14; bold : true}

				MouseArea {
					anchors.fill: parent
					onClicked: Hyprland.dispatch("workspace " + (index + 1))
				}

			}
		}

		Item {Layout.fillWidth: true }

		Text {
			text: "CPU: " + cpuUsage + "%"
			color: root.colGold
			font{family: root.fontFamily; pixelSize: 14; bold: true}
		}
	}

}
