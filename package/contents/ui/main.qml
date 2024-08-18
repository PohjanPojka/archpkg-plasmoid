import QtQuick 2.15
import QtQml.XmlListModel

import org.kde.plasma.core as PlasmaCore
import org.kde.kirigami as Kirigami
import org.kde.plasma.components as PlasmaComponents
import org.kde.plasma.plasmoid

PlasmoidItem {
	id: root
	width: 600; height: 260
	property var locale: Qt.locale()

	fullRepresentation: Item {
		width: 600; height: 260

		XmlListModel {
			id: xmlModel
			source: "https://archlinux.org/feeds/packages"
			query: "/rss/channel/item"

			XmlListModelRole { name: "title"; elementName: "title" }
			XmlListModelRole { name: "pubDate"; elementName: "pubDate" }
			XmlListModelRole { name: "link"; elementName: "link" }
		}

		Column {
			width: parent.width
			height: parent.height - 30
			spacing: 5
			id: column

			PlasmaComponents.Label {
				id: topLabel

				font.pixelSize: 22
				text: "Recently updated"
			}

			ListView {
				height: parent.height
				width: parent.width
				clip: true
				model: xmlModel
				spacing: 2

				delegate: Rectangle {
					height: 30
					width: column.width
					radius: 5
					border.color: mouse.hovered ? Kirigami.Theme.highlightColor : Kirigami.Theme.backgroundColor
					border.width: 2


					color: mouse.hovered ? Qt.darker(Kirigami.Theme.highlightColor, 1.5) : Kirigami.Theme.backgroundColor

					HoverHandler {
						id: mouse
						acceptedDevices: PointerDevice.Mouse | PointerDevice.TouchPad
					}

					TapHandler {
						id: tapHandler
						onTapped: Qt.openUrlExternally(link)
					}


					PlasmaComponents.Label {
						text: title
						anchors.left: parent.left
						anchors.leftMargin: 5
					}
					PlasmaComponents.Label {
						text: tString(pubDate)
						anchors.right: parent.right
						anchors.rightMargin: 5
					}
				}
			}
		}
	}

	function tString(input) {
    	const dateUTC = new Date(input);

    	const out = dateUTC.toLocaleString();

   		return out;
	}
}
