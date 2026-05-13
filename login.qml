import QtQuick
import QtQuick.Controls
import Button
Page{
    background: Rectangle{
        z: -1
        color: "black"
    }
    id: win
    property int login : 0
    property bool attempt : false
    property string userName: ""
    property string qmlposition: ""
    property bool viz: false
    property bool viz2: false
    property bool rec: false
    property string errNote: ""
    Login{
        id: log
        onResult: (accID, position) => {
                qmlposition = position
                login = accID
                console.log("SIGNAL POSITION:", qmlposition,login)
            }
    }
    onLoginChanged: {
        if (login != 0){
            change.push("Home.qml",{sqlModel:sqlModel,userName:userName,qmlposition:qmlposition,login:login})
        }
    }

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
                        text: "Username"
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
                    id: usernameField
                    anchors.horizontalCenter: parent.horizontalCenter
                    anchors.top: parent.top
                    anchors.topMargin: 65
                    width: 258
                }
                TextField{
                    id: passwordField
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
                        text: qsTr("REGISTER AS PLAYER")
                        anchors.horizontalCenter: parent.horizontalCenter
                        font.family: "silom"
                        anchors.verticalCenter: parent.verticalCenter
                    }
                    MouseArea{
                        anchors.fill: parent
                        onClicked:{
                            attempt=true
                            win.userName = usernameField.text
                            log.checkLogin(usernameField.text,passwordField.text,0)
//                            change.push("Home.qml",{
//                                            sqlModel: sqlModel
//                                        })
                        }
                    }
                }
                Rectangle{
                    id: recSignIn
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
                            attempt=true
                            win.userName = usernameField.text
                            log.checkLogin(usernameField.text,passwordField.text,1)
                        }
                    }
                }
                Text {
                    text: "Sign Up"
                    anchors.horizontalCenter: parent.horizontalCenter
                    anchors.rightMargin: 35
                    anchors.top: recSignIn.bottom
                    anchors.topMargin: 5
                    font.family: "silom"
                    color: "white"
                    MouseArea{
                        anchors.fill: parent
                        onClicked: {
                            viz = true
                        }
                    }
                }
                Text {
                    visible: !login && attempt
                    anchors.right: parent.horizontalCenter
                    anchors.rightMargin: 35
                    anchors.bottom: parent.bottom
                    anchors.bottomMargin: 5

                    Text {
                        text: "invalid login"
                        color: "white"
                    }
                }

        }
            }
    }
    Popup{
        visible: viz
        anchors.centerIn: parent
        closePolicy: Popup.NoAutoClose
        width: 250
        height: 250
        Text {
            text: "Fill out the following fields:"
            id: topTxt
        }
        Text {
            id: txt1
            anchors.left: parent.Left
            anchors.top: topTxt.bottom
            anchors.topMargin: 10
            text: "Username: "
        }
        TextArea{
            id: t1
            anchors.left: txt1.right
            anchors.top: txt1.top
            width: 80
        }
        Text {
            id: txt2
            anchors.left: parent.Left
            anchors.top: txt1.bottom
            anchors.topMargin: 10
            text: "Password: "
        }
        TextArea{
            id: t2
            anchors.left: txt2.right
            anchors.top: txt2.top
            width: 80
        }
        Text {
            id: txt3
            anchors.left: parent.Left
            anchors.top: txt2.bottom
            anchors.topMargin: 10
            text: "SECURITY QUESTION
 Mother's maiden name: "
        }
        TextArea{
            id: t3
            anchors.left: txt3.right
            anchors.top: txt3.top
            anchors.topMargin: 8
            width: 80
        }
        Text {
            id: txt4
            anchors.left: parent.Left
            anchors.top: txt3.bottom
            anchors.topMargin: 10
            text: "Position: "
        }
        TextArea{
            id: t4
            anchors.left: txt4.right
            anchors.top: txt4.top
            width: 80
        }
        Button{
            id: button
            anchors.left: parent.left
            anchors.top: t4.bottom
            text: win.rec ? "Recruiter" : "Not Recruiter"
            onClicked: {
                win.rec = !win.rec
            }
        }

        Button{
            id: submit
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.top:button.bottom
            text: "SUBMIT"

            onClicked: {

                if (t1.text == "" || t2.text == "" || t3.text == "" || t4.text == ""){
                    errNote = "Please fill out all fields"
                    viz2 = true
                }
                else if(log.addAcc(t1.text,t2.text,t3.text,rec,t4.text)){
                    attempt=true
                    win.userName = t1.text
                    log.checkLogin(t1.text,t2.text,rec)
                }
                else{
                    errNote = "Username already registered"
                    viz2 = true
                }
            }
            Text {
                text: errNote
                visible: viz2
                anchors.top: submit.bottom
                anchors.horizontalCenter: parent.horizontalCenter
            }

        }
    }
}
