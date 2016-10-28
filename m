Return-Path: <e-ruei1@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [198.47.19.12])
	by arago-project.org (Postfix) with ESMTPS id 0F9BE5297E
	for <meta-arago@arago-project.org>;
	Fri, 28 Oct 2016 13:03:02 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id u9SD320O001614
	for <meta-arago@arago-project.org>; Fri, 28 Oct 2016 08:03:02 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id u9SD32pY007272
	for <meta-arago@arago-project.org>; Fri, 28 Oct 2016 08:03:02 -0500
Received: from dflp33.itg.ti.com (10.64.6.16) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.3.294.0;
	Fri, 28 Oct 2016 08:03:02 -0500
Received: from uda0850410.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	u9SD32vM000489	for <meta-arago@arago-project.org>;
	Fri, 28 Oct 2016 08:03:02 -0500
From: Eric Ruei <e-ruei1@ti.com>
To: <meta-arago@arago-project.org>
Date: Fri, 28 Oct 2016 09:02:55 -0400
Message-ID: <1477659775-3621-1-git-send-email-e-ruei1@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH] qtdeclarative-examples: Add exit button to touchinteraction example
X-BeenThere: meta-arago@arago-project.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Arago metadata layer for TI SDKs - OE-Core/Yocto compatible
	<meta-arago.arago-project.org>
List-Unsubscribe: <http://arago-project.org/cgi-bin/mailman/options/meta-arago>, 
	<mailto:meta-arago-request@arago-project.org?subject=unsubscribe>
List-Archive: <http://arago-project.org/pipermail/meta-arago>
List-Post: <mailto:meta-arago@arago-project.org>
List-Help: <mailto:meta-arago-request@arago-project.org?subject=help>
List-Subscribe: <http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago>, 
	<mailto:meta-arago-request@arago-project.org?subject=subscribe>
X-List-Received-Date: Fri, 28 Oct 2016 13:03:03 -0000
Content-Type: text/plain

Signed-off-by: Eric Ruei <e-ruei1@ti.com>
---
 ...0001-touchinteraction.qml-Add-exit-button.patch | 60 ++++++++++++++++++++++
 .../recipes-qt/qt5/qtdeclarative_git.bbappend      |  7 +++
 2 files changed, 67 insertions(+)
 create mode 100644 meta-arago-distro/recipes-qt/qt5/qtdeclarative/0001-touchinteraction.qml-Add-exit-button.patch
 create mode 100644 meta-arago-distro/recipes-qt/qt5/qtdeclarative_git.bbappend

diff --git a/meta-arago-distro/recipes-qt/qt5/qtdeclarative/0001-touchinteraction.qml-Add-exit-button.patch b/meta-arago-distro/recipes-qt/qt5/qtdeclarative/0001-touchinteraction.qml-Add-exit-button.patch
new file mode 100644
index 0000000..c7ae8d1
--- /dev/null
+++ b/meta-arago-distro/recipes-qt/qt5/qtdeclarative/0001-touchinteraction.qml-Add-exit-button.patch
@@ -0,0 +1,60 @@
+From 9048b28bde9bf4375f539885eeaa1f92dd2eb258 Mon Sep 17 00:00:00 2001
+From: Eric Ruei <e-ruei1@ti.com>
+Date: Tue, 16 Aug 2016 15:09:04 -0400
+Subject: [PATCH] touchinteraction.qml: Add "exit" button
+
+Signed-off-by: Eric Ruei <e-ruei1@ti.com>
+---
+ .../quick/touchinteraction/touchinteraction.qml    | 38 ++++++++++++++++++++++
+ 1 file changed, 38 insertions(+)
+
+diff --git a/examples/quick/touchinteraction/touchinteraction.qml b/examples/quick/touchinteraction/touchinteraction.qml
+index 2ffb513..2c6934c 100644
+--- a/examples/quick/touchinteraction/touchinteraction.qml
++++ b/examples/quick/touchinteraction/touchinteraction.qml
+@@ -55,4 +55,42 @@ Item {
+             addExample("Corkboards", "Uses touch input on items inside a Flickable", Qt.resolvedUrl("flickable/corkboards.qml"));
+         }
+     }
++
++    Item {
++        id: exit
++
++        width: parent.width / 10
++        height: parent.height /10
++
++        anchors {
++            bottom: parent.bottom
++            left: parent.left
++            bottomMargin: 40
++        }
++
++        Rectangle {
++            id: bgr
++            anchors.fill: parent
++            color: mouseArea.pressed ? "#757575" : "#212121"
++            radius: height / 15
++
++            Text {
++                id: text
++                anchors.centerIn: parent
++                text: "Exit"
++                font.pixelSize: 0.4 * parent.height
++                color: mouseArea.pressed ? "black" : "white"
++                horizontalAlignment: Text.AlignHCenter
++                verticalAlignment: Text.AlignVCenter
++            }
++
++            MouseArea {
++                id: mouseArea
++                anchors.fill: parent
++                onClicked: {
++                    Qt.quit()
++                }
++            }
++        }
++    }
+ }
+-- 
+1.9.1
+
diff --git a/meta-arago-distro/recipes-qt/qt5/qtdeclarative_git.bbappend b/meta-arago-distro/recipes-qt/qt5/qtdeclarative_git.bbappend
new file mode 100644
index 0000000..cc0f9d6
--- /dev/null
+++ b/meta-arago-distro/recipes-qt/qt5/qtdeclarative_git.bbappend
@@ -0,0 +1,7 @@
+FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
+PR_append = ".tisdk0"
+
+SRC_URI += " \
+    file://0001-touchinteraction.qml-Add-exit-button.patch \
+"
+
-- 
1.9.1


