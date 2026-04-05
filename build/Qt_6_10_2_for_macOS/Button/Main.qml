import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

Window {
    id: win
    required property var sqlModel
    Component.onCompleted: {
        console.log("MODEL:", win.sqlModel)
    }
    width: 640
    height: 480
    visible: true
    title: "GoalLink"
    color: "black"
    Column{
        anchors.centerIn: parent
        Row{
            anchors.horizontalCenter: parent.horizontalCenter
            Rectangle{
                id: logo
                height: 50
                width: 120
                color: "#00e5a0"
                radius: 7
                Row{
                    anchors.centerIn: parent
                    Image {
                        id: logoImage
                        source: "logo.png"
                        height: 20
                        width: 20
                    }
                    Item {
                        width: 3
                        height:1
                    }
                    Text {
                        font.family: "silom"
                        font.pixelSize: 18
                        id: logoText
                        text: qsTr("FieldLink")
                    }
                }
            }
        }
        Row{
            anchors.horizontalCenter: parent.horizontalCenter
            Text {
                id: logoSubText
                text: qsTr("The recruiting network for athletes")
                color: "#00e5a0"
                font.family: "silom"
            }
        }
        Row{
            anchors.horizontalCenter: parent.horizontalCenter
            height: 20
            width: 1
        }
        Row{
            anchors.horizontalCenter: parent.horizontalCenter
            Rectangle{
                id: rec
                radius: 7
                color: "#0A1A12"
                width: 300
                height:350
                border.width: 2
                border.color: "#1A3328"
                Column{
                    Text {
                        anchors.left: parent.left
                        anchors.leftMargin: 20
                        anchors.top: parent.top
                        anchors.topMargin: 20
                        id: signIn
                        color: "white"
                        text: qsTr("SIGN IN")
                        font.family: "silom"
                    }
                    Text {
                        anchors.left: parent.left
                        anchors.leftMargin: 20
                        anchors.top: parent.top
                        anchors.topMargin: 50
                        color: "#487A62"
                        font.pixelSize: 12
                        text: qsTr("Email")
                        font.family: "silom"
                    }
                    Text {
                        anchors.left: parent.left
                        anchors.leftMargin: 20
                        anchors.top: parent.top
                        anchors.topMargin: 110
                        color: "#487A62"
                        font.pixelSize: 12
                        text: qsTr("Password")
                        font.family: "silom"
                    }
                }
                TextField{
                    anchors.horizontalCenter: parent.horizontalCenter
                    anchors.top: parent.top
                    anchors.topMargin: 65
                    width: 258
                }
                TextField{
                    anchors.horizontalCenter: parent.horizontalCenter
                    anchors.top: parent.top
                    anchors.topMargin: 125
                    width: 258
                }
                Rectangle{
                    radius: 7
                    color: "#00e5a0"
                    anchors.horizontalCenter: parent.horizontalCenter
                    anchors.top: parent.top
                    anchors.topMargin: 175
                    width: 258
                    height: 50
                    Text{
                        color: "#0A1A12"
                        text: qsTr("REGISTER AS RECRUITER")
                        anchors.horizontalCenter: parent.horizontalCenter
                        font.family: "silom"
                        anchors.verticalCenter: parent.verticalCenter
                    }
                    MouseArea{
                        anchors.fill: parent
                        onClicked:{
                            change.push("Home.qml",{
                                            sqlModel: sqlModel
                                        })
                        }
                    }
                }
                Rectangle{
                    color: parent.color
                    radius: 7
                    border.color: "#00e5a0"
                    border.width: 2
                    anchors.horizontalCenter: parent.horizontalCenter
                    anchors.top: parent.top
                    anchors.topMargin: 235
                    width: 258
                    height: 50

                    Text{
                        color: "#00e5a0"
                        text: qsTr("REGISTER AS RECRUITER")
                        anchors.horizontalCenter: parent.horizontalCenter
                        font.family: "silom"
                        anchors.verticalCenter: parent.verticalCenter
                    }
                    MouseArea{
                        anchors.fill: parent
                        onClicked:{
                            change.push("Home.qml",{
                                            sqlModel: sqlModel
                                        })
                        }
                    }
                }


            }
        }

    }
    StackView{
        id:change
        anchors.fill: parent

    }

    /*
        Image {
            id: post1
            source: "socc1.jpg"
        }




        TextField{
            id: textField
            placeholderText: "Input"
        }
        Button{
            id: button
            text: "Click Me"
            onClicked: {
                popup.open()
            }
        }
    }
    Popup{
        id: popup
        anchors.centerIn: parent
        height: 75
        closePolicy: "CloseOnEscape"
        Column{
            anchors.centerIn: parent
            spacing: 10
            Text {
                text: textField.text
                color: "white"
            }
            Button{
                text:"Close"
                width: 100
                onClicked: {
                    popup.close()
                }
            }
        }
    }
    */
}
