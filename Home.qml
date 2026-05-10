import QtQuick
import QtQuick.Controls
import Button

Page{
    id: root
    required property var sqlModel
    required property var userName
    required property var qmlposition
    required property var login
    background: Rectangle{
        z: -1
        color: "black"
    }
    header:
        ToolBar{

        background: Rectangle{
            id: rectan
            color: "#0A1A12"
            border.width: 2
            border.color: "#1A3328"
            width: root.width
            height: 50

        }

        Rectangle{
            anchors.top: parent.top
            anchors.topMargin: 2
            anchors.right: parent.right
            border.width: 2
            border.color: "#1A3328"
            color: "#0A1A12"
            radius: 10
            height: 40
            width: 100
            Text {
                id: name
                text: qsTr("Sign Out")
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.verticalCenter: parent.verticalCenter
                color: "white"
            }
            MouseArea{
                anchors.fill: parent
                onClicked: {
                    change.push("login.qml")
                }
            }
        }
    }
    Login{
        id: log2
    }
    TextArea{
        id: newPost
        width: 50
        height: 10
        z: 10
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 20
    }
    Button{
        onClicked: {
            log2.addPost(login,newPost.text)
            root.sqlModel.select()

        }
        z: 10
        width: 50
        height: 10
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 10
    }

    Column{
        anchors.rightMargin: 50
        anchors.right: cM.left
        anchors.top: bar.bottom
        id: cL
        Rectangle{
            Rectangle{
                id: top
                anchors.top: parent.top
                anchors.horizontalCenter: parent.horizontalCenter
                radius: 10
                color: "#00e5a0"
                width: parent.width - 4
                height: 50
                Rectangle{
                    anchors.bottom: parent.bottom
                    height:10
                    width: parent.width
                    color: "#00e5a0"
                }
            }

            color: "#0A1A12"
            border.width: 2
            width: 100
            border.color: "#1A3328"
            height: 500
            radius: 10
            Text {
                id:userDisplay
                text: userName
                anchors.top: top.bottom
                anchors.topMargin: 5
                color: "white"
            }
            Text {
                text: qmlposition
                anchors.top: userDisplay.bottom
                color: "white"
            }
        }
    }
    Column{
        anchors.centerIn: parent
        id: cM
        anchors.top: bar
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
                    visible: log2.getlikes(login,model.postID)
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
        anchors.top: bar
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
