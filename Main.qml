

/*
This is a UI file (.ui.qml) that is intended to be edited in Qt Design Studio only.
It is supposed to be strictly declarative and only uses a subset of QML. If you edit
this file manually, you might introduce QML code that is not supported by Qt Design Studio.
Check out https://doc.qt.io/qtcreator/creator-quick-ui-forms.html for details on .ui.qml files.
*/
import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
Window
{
    width: 450
    height: 800
    visible: true
    color: "#00000000"
    title: "To Do"
    id:root
    Component.onCompleted:
    {
        showFullScreen()
    }

    Rectangle {
        id: rectangle
        width: parent.width
        height:parent.height
        color: "#000000"
        property bool is_dialog_open: false

        Text {
            id: _dummy_text
            color: "#ffffff"
            text: qsTr("To Do")
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.top: parent.top
            anchors.leftMargin: 0
            anchors.rightMargin: 0
            anchors.topMargin: 10
            font.pixelSize: 24
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
        }

        Button {
            id: add_todo_button
            y: 1856
            height: 45
            text: qsTr("Add New Todo")
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.bottom: parent.bottom
            anchors.leftMargin: 19
            anchors.rightMargin: 20
            anchors.bottomMargin: 19

            background: Rectangle {
                width: parent.width
                height: parent.height
                radius: 14
                color: "white"
            }

            Connections {
                target: add_todo_button
                onClicked: rectangle.is_dialog_open = !rectangle.is_dialog_open
            }
        }

        Column {
            id: column
            x: 21
            y: 122
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.top: parent.top
            anchors.bottom: parent.bottom
            anchors.leftMargin: 21
            anchors.rightMargin: 22
            anchors.topMargin: 66
            anchors.bottomMargin: 88
            spacing: 25

            ListView
            {

                anchors.fill: parent
                spacing:25
                delegate:
                    Rectangle {
                    id: todo_item
                    x: 0
                    y: 17
                    width: parent.width
                    height: 64
                    color: "#ffffff"
                    radius: 14

                    CheckBox {
                        id: checkBox
                        text:name
                        anchors.left: parent.left
                        anchors.top: parent.top
                        anchors.leftMargin: 8
                        anchors.topMargin: 12
                        font.bold: false
                        font.pointSize: 14
                    }
                    Button
                    {
                        text: "X"
                        anchors.right: parent.right
                        anchors.top: parent.top
                        anchors.topMargin: 12
                        anchors.rightMargin: 8
                        width: parent.width/4
                        height: parent.height/1.5

                        background: Rectangle {
                            width: parent.width
                            height: parent.height
                            radius: 14
                            color: "red"
                        }
                        onClicked:
                        {
                            my_list_model.remove(index)
                        }
                    }
                }
                model:                 ListModel
                {
                    id:my_list_model
                    ListElement
                    {
                        name:"TODO"
                    }
                    function createListElement()
                    {
                        return {"name":todo_text_input.text}
                    }
                }
            }


        }

        Rectangle {
            id: add_todo_dialog

            height: parent.height*0.25
            width:parent.width*0.8
            visible: rectangle.is_dialog_open
            color: "#222222"
            radius: 14
            anchors.centerIn:parent

            ColumnLayout {
                height: parent.height*1.5
                anchors.verticalCenter: parent.verticalCenter
                anchors.left: parent.left
                anchors.right: parent.right
                anchors.top: parent.top
                anchors.leftMargin: 31
                anchors.rightMargin: 31
                anchors.topMargin: 16
                spacing: 25
                uniformCellSizes: false
                TextField {
                    id: todo_text_input
                    font.pointSize: 14
                    Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
                    Layout.fillHeight: true
                    Layout.fillWidth: true
                    // placeholderText: qsTr("Enter Your new Todo here")
                    background: Rectangle
                    {
                        width: parent.width+8
                        height: parent.height
                        radius: 14
                        color: "white"
                    }
                }

                RowLayout {
                    Layout.fillWidth: true
                    Layout.fillHeight: true
                    Button {
                        id: btn_close
                        text: qsTr("Close")
                        Layout.fillHeight: true
                        Layout.fillWidth: true

                        background: Rectangle {
                            width: parent.width
                            height: parent.height
                            radius: 14
                            color: "white"
                        }
                        onClicked:
                        {
                            todo_text_input.text=""
                            rectangle.is_dialog_open = false
                        }
                    }
                    Button {
                        id: btn_clear
                        text: qsTr("Clear")
                        Layout.fillHeight: true
                        Layout.fillWidth: true

                        background: Rectangle {
                            width: parent.width
                            height: parent.height
                            radius: 14
                            color: "white"
                        }
                    onClicked:
                    {
                        todo_text_input.text=""

                    }
                }
            }
                Button {
                    id: btn_add_todo
                    text: qsTr("Add Todo")
                    Layout.fillHeight: true
                    Layout.fillWidth: true

                    background: Rectangle {
                        width: parent.width
                        height: parent.height
                        radius: 14
                        color: "white"
                    }

                        onClicked:
                        {
                            my_list_model.append(my_list_model.createListElement())
                            rectangle.is_dialog_open = false
                        }
                    }


        }

    }
}


}
