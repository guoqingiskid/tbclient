import QtQuick 1.1
import "../Component"

AbstractItem {
    id: root;

    implicitHeight: contentCol.height + constant.paddingLarge*2;
    onClicked: {
        var prop = { threadId: id, title: title };
        signalCenter.enterThread(prop);
    }

    Column {
        id: contentCol;
        anchors {
            left: root.paddingItem.left;
            right: root.paddingItem.right;
            top: root.paddingItem.top;
        }
        spacing: constant.paddingSmall;
        Item {
            width: parent.width;
            height: childrenRect.height;
            Text {
                font: constant.subTitleFont;
                color: constant.colorMid;
                text: author;
            }
            Row {
                anchors.right: parent.right;
                spacing: 2;
                Image {
                    source: is_good ? "../../gfx/icon_elite"+constant.invertedString+".png" : "";
                }
                Image {
                    source: is_top ? "../../gfx/icon_top"+constant.invertedString+".png" : "";
                }
            }
        }
        Text {
            width: parent.width;
            text: title;
            color: constant.colorLight;
            font: constant.titleFont;
            wrapMode: Text.WrapAnywhere;
            textFormat: Text.PlainText;
        }
        Row {
            visible: tbsettings.showAbstract;
            anchors.horizontalCenter: parent.horizontalCenter;
            Text {
                width: contentCol.width - thumbnail.width;
                visible: text != "";
                anchors.verticalCenter: parent.verticalCenter;
                text: model.abstract;
                color: constant.colorMid;
                font: constant.subTitleFont;
                wrapMode: Text.WrapAnywhere;
                textFormat: Text.PlainText;
                elide: Text.ElideRight;
                maximumLineCount: thumbnail.source == "" ? 1 : 2;
            }
            Image {
                id: thumbnail;
                visible: source != "";
                width: source == "" ? 0 : constant.thumbnailSize;
                height: width;
                source: picUrl;
                fillMode: Image.PreserveAspectCrop;
                clip: true;
            }
        }
        Text {
            text: num_show;
            font: constant.subTitleFont;
            color: constant.colorMid;
        }
    }
    Text {
        anchors {
            right: root.paddingItem.right;
            bottom: root.paddingItem.bottom;
        }
        text: utility.easyDate(new Date(last_time));
        font: constant.subTitleFont;
        color: constant.colorMid;
    }
}