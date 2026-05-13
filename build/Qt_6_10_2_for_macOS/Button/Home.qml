import QtQuick
import QtQuick.Controls
import Button

Page{
    id: root
    required property var sqlModel
    required property string userName
    required property var qmlposition
    required property var login

    property var profColor: log2.getColor(login)
    property string letCol: "black"
    onProfColorChanged:{
        if (profColor == "#ffffff") {
            letCol = "#000000"
        }
        else{
            letCol = "#ffffff"
        }
    }

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


            Image {
                anchors.verticalCenter: parent.verticalCenter
                id: logoImage
                source: "logo.png"
                height: 20
                width: 20
                anchors.left: parent.left
            }
            Text {
                anchors.verticalCenter: parent.verticalCenter
                font.family: "silom"
                font.pixelSize: 18
                anchors.left: logoImage.right
                anchors.leftMargin: 3
                text: qsTr("FieldLink")
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
    }
    Login{
        id: log2
    }
    TextArea{
        id: newPost
        width: 100
        height: 20
        anchors.bottom: cM.top
        anchors.bottomMargin: 10
        anchors.horizontalCenter: parent.horizontalCenter
    }
    Button{
        text: "submit"
        onClicked: {
            log2.addPost(login,newPost.text)
            root.sqlModel.updateMod()
        }
        width: 50
        height: 10
        anchors.bottom: newPost.top
        anchors.bottomMargin: -5
        anchors.right: newPost.left
    }

    Column{
        anchors.top: parent.top
        anchors.topMargin: 60
        anchors.rightMargin: 50
        anchors.right: cM.left
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
            Rectangle{
                id:curProf
                anchors.top: top.top
                anchors.topMargin: top.height - 20
                anchors.left: parent.left
                anchors.leftMargin: 10
                radius: 40
                height: 40
                width: 40
                color: profColor
                Text {
                    text: userName[0]
                    anchors.centerIn: parent
                    color: letCol
                }
            }
            color: "#0A1A12"
            border.width: 2
            width: 150
            border.color: "#1A3328"
            height: 300
            radius: 10
            Text {
                id:userDisplay
                text: userName
                anchors.top: curProf.bottom
                anchors.topMargin: 10
                color: "white"
                font.family: "silom"
                anchors.left: parent.left
                anchors.leftMargin: 10
            }
            Text {
                text: qmlposition
                anchors.top: userDisplay.bottom
                color: "gray"
                font.family: "silom"
                font.pixelSize: 10
                anchors.left: parent.left
                anchors.leftMargin: 10
            }
        }
    }
    Column{
        anchors.top: parent.top
        anchors.topMargin: 100
        anchors.horizontalCenter: parent.horizontalCenter
        id: cM
        ListView {
            width: 200
            height: 5000
            model: root.sqlModel

            delegate: Rectangle {
                property string col: "#000000"
                property var modCol: model.color
                Component.onCompleted: {
                    if (model.color == "#ffffff"){
                        col = "#000000"
                    }
                    else{
                        col = "#ffffff"
                    }
                }

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
                    color: model.color
                    Text {
                        text: model.letter
                        anchors.centerIn: parent
                        color: col
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
                    width: 80
                    height: 1
                    anchors.top: description.bottom
                    anchors.topMargin: 5
                    anchors.horizontalCenter: parent.horizontalCenter
                    color: "#1A3328"
                }
                Image {
                    source: (log2.getlikes(login,model.postID)) ? "qrc:/qt/qml/Button/redheart.png" : "qrc:/qt/qml/Button/heart.png"
                    anchors.right: likes.left
                    anchors.rightMargin: 5
                    anchors.top: likes.top
                    anchors.topMargin: 3
                    height: 10
                    width: 10

                    MouseArea{
                        anchors.fill: parent
                        onClicked: {log2.likeToggle(login,model.postID)
                                    root.sqlModel.updateMod()
                        }
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
        anchors.top: parent.top
        anchors.topMargin: 60
        anchors.leftMargin: 50
        anchors.left: cM.right
        Rectangle{
            border.color: "#1A3328"
            width: 120
            border.width: 2
            height: 250
            color: "#0A1A12"
            radius: 10
            Rectangle{
                id: black
                radius: 40
                height: 40
                width: 40
                color: "black"
                anchors.left: parent.left
                anchors.leftMargin:  10
                anchors.top: parent.top
                anchors.topMargin: 10
                MouseArea{
                    anchors.fill: parent
                    onClicked: {
                        log2.setColor(login,parent.color)
                        profColor = log2.getColor(login)
                        root.sqlModel.updateMod()
                    }
                }
            }
            Rectangle{
                id: white
                radius: 40
                height: 40
                width: 40
                color: "white"
                anchors.right: parent.right
                anchors.rightMargin: 10
                anchors.top: parent.top
                anchors.topMargin: 10
                MouseArea{
                    anchors.fill: parent
                    onClicked: {
                        log2.setColor(login,parent.color)
                        profColor = log2.getColor(login)
                        root.sqlModel.updateMod()
                    }
                }
            }
            Rectangle{
                id: blue
                radius: 40
                height: 40
                width: 40
                color: "blue"
                anchors.right: white.right
                anchors.top: white.bottom
                anchors.topMargin: 10
                MouseArea{
                    anchors.fill: parent
                    onClicked: {
                        log2.setColor(login,parent.color)
                        profColor = log2.getColor(login)
                        root.sqlModel.updateMod()
                    }
                }
            }
            Rectangle{
                id: red
                radius: 40
                height: 40
                width: 40
                color: "red"
                anchors.left: black.left
                anchors.top: black.bottom
                anchors.topMargin: 10
                MouseArea{
                    anchors.fill: parent
                    onClicked: {
                        log2.setColor(login,parent.color)
                        profColor = log2.getColor(login)
                        root.sqlModel.updateMod()
                    }
                }
            }
        }
    }
}
