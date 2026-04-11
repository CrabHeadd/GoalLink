import QtQuick
import QtQuick.Controls

Page{
    id: root
    required property var sqlModel
    Component.onCompleted: {
        console.log("MODEL:", root.sqlModel)
    }
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
        Repeater {
            anchors.fill: parent
            model: root.sqlModel

            delegate: Rectangle {
                height: 100
                width: 100
                radius: 10
                color: "#0A1A12"
                border.color: "#1A3328"
                Rectangle{
                    id: profilePic
                    radius: 40
                    height: 40
                    width: 40
                    color: Qt.rgba(Math.random(),Math.random(),Math.random(),1);
                    Text {
                        text: model.letter
                        anchors.centerIn: parent
                        color: "white"
                    }
                }
                Text {
                    anchors.left: profilePic.right
                    text: model.accID
                    color: "black"
                }
            }
            Row{
                height: 10
            }
        }
    }
    /*
    TableView {
        anchors.fill: parent
        anchors.horizontalCenter: parent.horizontalCenter
        model: root.sqlModel
        delegate: Rectangle {
            implicitWidth: 50
            color: "#00e5a0"
            implicitHeight: 40
            border.width: 1
            radius: 10
            Component.onCompleted: {
                console.log("row:", row, "col:", column, "data:", modelData)
            }
            Text {
                anchors.centerIn: parent
                text: display
            }
        }
    }*/
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
