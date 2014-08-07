import QtQuick 1.0
import com.nokia.symbian 1.0

Menu {
    id: root;
    MenuLayout {
        MenuItem {
            text: qsTr("Back");
            enabled: webView.back.enabled;
            onClicked: webView.back.trigger();
        }
        MenuItem {
            text: qsTr("Forward");
            enabled: webView.forward.enabled;
            onClicked: webView.forward.trigger();
        }
        MenuItem {
            text: qsTr("Open browser");
            onClicked: utility.openURLDefault(webView.url);
        }
    }
}
