import QtQuick
import QtQuick.Controls

Page{
    background: Rectangle{
        color: "black"
        Column{
            Rectangle{
                color: "blue"
                anchors.fill: parent
                radius: 7
            }
        }
        Column{
            Rectangle{
                color: "blue"
                anchors.fill: parent
                width: 5
                height: 5
                radius: 7
            }
        }
        Column{
            Rectangle{
                color: "blue"
                anchors.fill: parent
                radius: 7
            }
        }
    }
}
