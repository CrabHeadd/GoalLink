import QtQuick
import QtQuick.Controls

Page{
    id: root
    required property var sqlModel
    required property var userName
    required property var qmlposition
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
            Rectangle{
                anchors.top: parent.top
                anchors.horizontalCenter: parent.horizontalCenter
                radius: 10
                color: "#00e5a0"
                width: 76
                height: 50
                Rectangle{
                    id: flat
                    anchors.bottom: parent.bottom
                    height:10
                    width: 76
                    color: "#00e5a0"
                }
            }

            color: "#0A1A12"
            border.width: 2
            width: 80
            border.color: "#1A3328"
            height: 500
            radius: 10
            Text {
                text: userName
                anchors.top: flat.bottom
                anchors.topMargin: 5
                color: "white"
            }
            Text {
                text: "piss"
            }
        }
    }
    Column{
        anchors.centerIn: parent
        id: cM
        Repeater {
            anchors.fill: parent
            model: root.sqlModel

            delegate: Rectangle {
                id: rec
                height: 150
                width: 200
                radius: 10
                color: "#0A1A12"
                border.color: "#1A3328"
                Rectangle{
                    id: profilePic
                    anchors.left: rec.left
                    anchors.leftMargin: 10
                    anchors.top: rec.top
                    anchors.topMargin: 10
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
                    id: username
                    anchors.left: profilePic.right
                    anchors.leftMargin: 10
                    anchors.top: profilePic.top
                    anchors.topMargin: 10
                    text: model.username
                    color: "white"
                }
                Rectangle{
                    visible: model.isRecruiter==1
                    width: 100
                    height: 20
                    anchors.left: username.right
                    anchors.leftMargin: 10
                    anchors.top:username.top
                    color: "#015b74"
                    border.color: "#3b9dff"
                    border.width: 1
                    radius: 10
                    Text {
                        text: "Recruiter"
                        color: "white"
                        anchors.centerIn: parent
                    }
                }
                Text {
                    id: description
                    anchors.top: profilePic.bottom
                    anchors.topMargin: 15
                    anchors.left: parent.left
                    anchors.leftMargin: 10
                    color: "white"
                    text: model.description
                }
                Rectangle{
                    id: divider
                    width: 70
                    height: 1
                    anchors.top: description.bottom
                    anchors.topMargin: 5
                    anchors.horizontalCenter: parent.horizontalCenter
                    color: "#1A3328"
                }
                Image {
                    source: "heart.png"
                    anchors.right: likes.left
                    anchors.rightMargin: 5
                    anchors.top: likes.top
                    anchors.topMargin: 3
                    height: 10
                    width: 10
                    MouseArea{
                        onClicked: {}
                    }
                }
                Text {
                    id: likes
                    color: "white"
                    text: model.likes
                    anchors.top: divider.bottom
                    anchors.topMargin: 5
                    anchors.left: parent.left
                    anchors.leftMargin: 20
                }
            }
            Row{
                height: 100
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
