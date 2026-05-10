import QtQuick
import QtQuick 2.0
import QtQuick.Controls
import QtQuick.Layouts
import Button


Window {
    required property var sqlModel
    width: 640
    height: 480
    visible: true
    title: "GoalLink"
    color: "black"
    Component.onCompleted: {
        change.push("login.qml")
    }

    StackView{
        id:change
        anchors.fill: parent

    }
}
