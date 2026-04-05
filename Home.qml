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
        Rectangle{
            color: "#0A1A12"
            border.color: "#1A3328"
            anchors.horizontalCenter: parent.horizontalCenter
            border.width:2
            width: 200
            height: 500
            radius: 10
            Repeater {
                   model: sqlModel.column

                   delegate: Text {
                       color: "white"
                       text: display
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
