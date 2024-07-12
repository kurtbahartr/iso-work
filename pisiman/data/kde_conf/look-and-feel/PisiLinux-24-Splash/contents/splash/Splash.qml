import QtQuick 2.15

Image {
    id: root
    source: "images/background.png"
    fillMode: Image.PreserveAspectCrop

    property real stage: 0

    onStageChanged: {
        if (stage == 1) {
            introAnimation.running = true;
        }
    }

    RotationAnimator {
        id: gearRotation
        target: gear
        from: 0
        to: 360
        loops: Animation.Infinite
        duration: 5000
        running: true
    }

    Image {
        id: gear
        source: "images/gear2.svg"
        width: 100
        height: 100
        anchors {
            horizontalCenter: parent.horizontalCenter
            bottom: parent.bottom
            bottomMargin: 50
        }

        transformOrigin: Item.Center
        transform: Rotation {
            origin.x: gear.width / 2
            origin.y: gear.height / 2
            angle: -360 * stage / 6 
        }
    }

    SequentialAnimation {
        id: introAnimation
        running: false

        ParallelAnimation {
            PropertyAnimation {
                property: "stage"
                target: root
                to: 6
                duration: 1000
                easing.type: Easing.InOutBack
                easing.overshoot: 1.0
            }
        }
    }
}
