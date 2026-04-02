import QtQuick
import QtQuick.Controls

Page{
    background: Rectangle{
        z: -1
        color: "black"
    }
    header: ToolBar{

    }

    Column{
        anchors.rightMargin: 50
        anchors.right: cM.left
        id: cL
        Rectangle{
            color: "#0A1A12"
            border.width: 2
            width: 80
            border.color: "#1A3328"
            height: 500
            radius: 10
        }
    }
    Column{
        anchors.centerIn: parent
        id: cM
        Rectangle{
            color: "#0A1A12"
            border.color: "#1A3328"
            anchors.horizontalCenter: parent.horizontalCenter
            border.width:2
            width: 80
            height: 500
            radius: 10
            ListView {
                model: sqlModel

                delegate: Column {
                    Text { text: title }     // must match DB column name
                    Text { text: content }
                }
            }
        }
    }
    Column{
        id: cR
        anchors.leftMargin: 50
        anchors.left: cM.right
        Rectangle{
            border.color: "#1A3328"
            width: 80
            border.width: 2
            height: 500
            color: "#0A1A12"
            radius: 10
        }
    }
}
