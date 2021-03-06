import QtQuick 1.1
import com.nokia.meego 1.0

Item {
    property alias headerText: titleLabel.text
    property alias infoTopText: infoTop.text
    property alias infoBottomText: infoBottom.text
    property bool singleLineHeader: true

    property string viewHeader: "image://theme/color"+theme.colorScheme+"-meegotouch-view-header-fixed"
    property int headerTopSpacing : (inPortrait)?appDefaults.cHEADER_DEFAULT_TOP_SPACING_PORTRAIT:
                         appDefaults.cHEADER_DEFAULT_TOP_SPACING_LANDSCAPE
    property int headerBottomSpacing : (inPortrait)?appDefaults.cHEADER_DEFAULT_BOTTOM_SPACING_PORTRAIT:
                         appDefaults.cHEADER_DEFAULT_BOTTOM_SPACING_LANDSCAPE
    property int infoBottomSpacing : (inPortrait)?
                                         0.75*appDefaults.cHEADER_DEFAULT_BOTTOM_SPACING_PORTRAIT:
                                         0.5*appDefaults.cHEADER_DEFAULT_BOTTOM_SPACING_LANDSCAPE
    property string headerFontFamily : appDefaults.cFONT_FAMILY
    property int headerFontSize : appDefaults.cFONT_SIZE_LARGE
    property int infoTopFontSize: appDefaults.cFONT_SIZE_SMALL
    property int infoBottomFontSize: appDefaults.cFONT_SIZE_TINY

    // header dimensions
    height: (inPortrait)?appDefaults.cHEADER_DEFAULT_HEIGHT_PORTRAIT:
                          appDefaults.cHEADER_DEFAULT_HEIGHT_LANDSCAPE
    width: parent.width

    // Header background image
    Image {
        id: titleImage
        height: parent.height
        width: parent.width
        source: viewHeader
    }

    // Define the label styling
    LabelStyle {
        id: labelStyle
        textColor: "white"
        fontFamily: headerFontFamily
        fontPixelSize: headerFontSize
    }
    LabelStyle {
        id: infoTopStyle
        textColor: "white"
        fontFamily: headerFontFamily
        fontPixelSize: infoTopFontSize
    }
    LabelStyle {
        id: infoBottomStyle
        textColor: "black"
        fontFamily: headerFontFamily
        fontPixelSize: infoBottomFontSize
    }

    // Header text
    Label {
        id: titleLabel
        platformStyle: labelStyle
        visible: singleLineHeader
        anchors {
            top:parent.top; topMargin:headerTopSpacing;
            left:parent.left; leftMargin:defaultMargin
        }
    }
    Label {
        id: infoTop
        platformStyle: infoTopStyle
        visible: !singleLineHeader
        anchors {
            bottom: infoBottom.top
            left:parent.left; leftMargin:defaultMargin
        }
    }
    Label {
        id: infoBottom
        platformStyle: infoBottomStyle
        visible: !singleLineHeader
        anchors {
            bottom:parent.bottom; bottomMargin:infoBottomSpacing;
            left:parent.left; leftMargin:defaultMargin
        }
    }
}
