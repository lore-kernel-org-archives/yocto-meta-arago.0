Return-Path: <d-senicic1@ti.com>
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	by arago-project.org (Postfix) with ESMTPS id 67878529AE
	for <meta-arago@arago-project.org>;
	Tue, 10 Jul 2018 01:14:14 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id w6A1E748013858
	for <meta-arago@arago-project.org>; Mon, 9 Jul 2018 20:14:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1531185247;
	bh=egejrdQLu8VYRo2oybWffQlzxidFOKozKTD+EGhy2Fs=;
	h=From:To:CC:Subject:Date;
	b=tpPQWSpKnB3+z1yAT8QWYBbzPb7ZRG4+1esfpq0zlvtUwIl1T9xlI+QZ8DXXpHiP1
	gz/Il2sPtGzGoXwwGbLGKAf4SN3HCvn82upHFONiSM3aow00XKGEp+e2N6+khVABdp
	EPvRn3GbCnZtYK4X3rB8xCQ5xaoVFSoywx2YbR5E=
Received: from DLEE102.ent.ti.com (dlee102.ent.ti.com [157.170.170.32])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id w6A1E7nt000372
	for <meta-arago@arago-project.org>; Mon, 9 Jul 2018 20:14:07 -0500
Received: from DLEE106.ent.ti.com (157.170.170.36) by DLEE102.ent.ti.com
	(157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1466.3;
	Mon, 9 Jul 2018 20:14:07 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DLEE106.ent.ti.com
	(157.170.170.36) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1466.3 via Frontend
	Transport; Mon, 9 Jul 2018 20:14:07 -0500
Received: from UDA0271529.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id w6A1E7g3006651;
	Mon, 9 Jul 2018 20:14:07 -0500
From: Djordje Senicic <x0157990@ti.com>
To: <meta-arago@arago-project.org>
Date: Mon, 9 Jul 2018 21:14:04 -0400
Message-ID: <1531185244-24045-1-git-send-email-x0157990@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: d-senicic1@ti.com, Djordje Senicic <x0157990@ti.com>
Subject: [[rocko/ti2018.01]] matrix-gui: Add tidl submenu and demos
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
X-List-Received-Date: Tue, 10 Jul 2018 01:14:14 -0000
Content-Type: text/plain

* Add Deep Learning submenu
* Add three buttons for demos with prerecorded clips and live camera input
* This patch is for review only (new submenu content should be checked into http://git.ti.com/matrix-gui-v2/)

Signed-off-by: Djordje Senicic <x0157990@ti.com>
---
 .../matrix/files/0001-Add-tidl-submenu.patch       |  27 ++++++++++
 .../recipes-core/matrix/files/tidl-i.png           | Bin 0 -> 6727 bytes
 .../files/tidl_apps/demo_clip1/app_desc.html       |   4 ++
 .../tidl_apps/demo_clip1/tidl_demo_clip.desktop    |  10 ++++
 .../files/tidl_apps/demo_clip2/app_desc.html       |   4 ++
 .../tidl_apps/demo_clip2/tidl_demo_clip.desktop    |  10 ++++
 .../files/tidl_apps/demo_livecam/app_desc.html     |   4 ++
 .../demo_livecam/tidl_demo_livecam.desktop         |  10 ++++
 .../matrix/files/tidl_bins/runTidlClip1.sh         |   2 +
 .../matrix/files/tidl_bins/runTidlClip2.sh         |   3 ++
 .../matrix/files/tidl_bins/runTidlLiveCam.sh       |   3 ++
 .../recipes-core/matrix/matrix-gui-apps-git.inc    |   7 +--
 .../recipes-core/matrix/matrix-gui-submenus_2.0.bb |   6 +++
 .../matrix/matrix-gui-tidl-demos_2.0.bb            |  57 +++++++++++++++++++++
 14 files changed, 144 insertions(+), 3 deletions(-)
 create mode 100644 meta-arago-extras/recipes-core/matrix/files/0001-Add-tidl-submenu.patch
 create mode 100644 meta-arago-extras/recipes-core/matrix/files/tidl-i.png
 create mode 100644 meta-arago-extras/recipes-core/matrix/files/tidl_apps/demo_clip1/app_desc.html
 create mode 100644 meta-arago-extras/recipes-core/matrix/files/tidl_apps/demo_clip1/tidl_demo_clip.desktop
 create mode 100644 meta-arago-extras/recipes-core/matrix/files/tidl_apps/demo_clip2/app_desc.html
 create mode 100644 meta-arago-extras/recipes-core/matrix/files/tidl_apps/demo_clip2/tidl_demo_clip.desktop
 create mode 100644 meta-arago-extras/recipes-core/matrix/files/tidl_apps/demo_livecam/app_desc.html
 create mode 100644 meta-arago-extras/recipes-core/matrix/files/tidl_apps/demo_livecam/tidl_demo_livecam.desktop
 create mode 100755 meta-arago-extras/recipes-core/matrix/files/tidl_bins/runTidlClip1.sh
 create mode 100755 meta-arago-extras/recipes-core/matrix/files/tidl_bins/runTidlClip2.sh
 create mode 100755 meta-arago-extras/recipes-core/matrix/files/tidl_bins/runTidlLiveCam.sh
 create mode 100644 meta-arago-extras/recipes-core/matrix/matrix-gui-tidl-demos_2.0.bb

diff --git a/meta-arago-extras/recipes-core/matrix/files/0001-Add-tidl-submenu.patch b/meta-arago-extras/recipes-core/matrix/files/0001-Add-tidl-submenu.patch
new file mode 100644
index 0000000..b9fdcd6
--- /dev/null
+++ b/meta-arago-extras/recipes-core/matrix/files/0001-Add-tidl-submenu.patch
@@ -0,0 +1,27 @@
+From 87c8c26dd173b19dd09588db9d8a22298531c78b Mon Sep 17 00:00:00 2001
+From: Djordje Senicic <x0157990@ti.com>
+Date: Mon, 9 Jul 2018 20:16:28 -0400
+Subject: [PATCH] Add tidl submenu
+
+Signed-off-by: Djordje Senicic <x0157990@ti.com>
+---
+ tidl_submenu/tidl.desktop | 7 +++++++
+ 1 file changed, 7 insertions(+)
+ create mode 100644 tidl_submenu/tidl.desktop
+
+diff --git a/tidl_submenu/tidl.desktop b/tidl_submenu/tidl.desktop
+new file mode 100644
+index 0000000..615494d
+--- /dev/null
++++ b/tidl_submenu/tidl.desktop
+@@ -0,0 +1,7 @@
++#!/usr/bin/env xdg-open
++[Desktop Entry]
++Name=TI Deep Learning
++GenericName=Deep Learning Examples
++Icon=/usr/share/matrix-gui-2.0/apps/images/multimedia-icon.png
++Type=Directory
++X-MATRIX-CategoryTarget=tidl_dir
+-- 
+1.9.1
+
diff --git a/meta-arago-extras/recipes-core/matrix/files/tidl-i.png b/meta-arago-extras/recipes-core/matrix/files/tidl-i.png
new file mode 100644
index 0000000000000000000000000000000000000000..543a3a151ff6f0feb5707956f4b8c2ec99fa300c
GIT binary patch
literal 6727
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
S=y}Wy0idd)sa&jR7W6-^Fm*iu

literal 0
HcmV?d00001

diff --git a/meta-arago-extras/recipes-core/matrix/files/tidl_apps/demo_clip1/app_desc.html b/meta-arago-extras/recipes-core/matrix/files/tidl_apps/demo_clip1/app_desc.html
new file mode 100644
index 0000000..f64afd8
--- /dev/null
+++ b/meta-arago-extras/recipes-core/matrix/files/tidl_apps/demo_clip1/app_desc.html
@@ -0,0 +1,4 @@
+<h1>TIDL Application Overview</h1>
+<h2>Purpose:</h2>
+<p>This application demonstrates Deep Learning Imagenet classification (1000 classes) based on J11 network topology.</p>
+<p>Both DSP cores are used for processing (frame-based pipeline), of live camera input.</p>
diff --git a/meta-arago-extras/recipes-core/matrix/files/tidl_apps/demo_clip1/tidl_demo_clip.desktop b/meta-arago-extras/recipes-core/matrix/files/tidl_apps/demo_clip1/tidl_demo_clip.desktop
new file mode 100644
index 0000000..415a4a0
--- /dev/null
+++ b/meta-arago-extras/recipes-core/matrix/files/tidl_apps/demo_clip1/tidl_demo_clip.desktop
@@ -0,0 +1,10 @@
+#!/usr/bin/env xdg-open
+[Desktop Entry]
+Name=J11v2 Clip1
+Icon=/usr/share/matrix-gui-2.0/apps/images/tidl-i.png
+Exec=runTidlClip1.sh
+Type=Application
+ProgramType=gui
+Categories=tidl_dir
+X-Matrix-Description=/usr/share/matrix-gui-2.0/apps/tidl_apps/demo_clip1/app_desc.html
+X-Matrix-Lock=test_demo_lock
diff --git a/meta-arago-extras/recipes-core/matrix/files/tidl_apps/demo_clip2/app_desc.html b/meta-arago-extras/recipes-core/matrix/files/tidl_apps/demo_clip2/app_desc.html
new file mode 100644
index 0000000..f64afd8
--- /dev/null
+++ b/meta-arago-extras/recipes-core/matrix/files/tidl_apps/demo_clip2/app_desc.html
@@ -0,0 +1,4 @@
+<h1>TIDL Application Overview</h1>
+<h2>Purpose:</h2>
+<p>This application demonstrates Deep Learning Imagenet classification (1000 classes) based on J11 network topology.</p>
+<p>Both DSP cores are used for processing (frame-based pipeline), of live camera input.</p>
diff --git a/meta-arago-extras/recipes-core/matrix/files/tidl_apps/demo_clip2/tidl_demo_clip.desktop b/meta-arago-extras/recipes-core/matrix/files/tidl_apps/demo_clip2/tidl_demo_clip.desktop
new file mode 100644
index 0000000..b54b53d
--- /dev/null
+++ b/meta-arago-extras/recipes-core/matrix/files/tidl_apps/demo_clip2/tidl_demo_clip.desktop
@@ -0,0 +1,10 @@
+#!/usr/bin/env xdg-open
+[Desktop Entry]
+Name=J11v2 Clip2
+Icon=/usr/share/matrix-gui-2.0/apps/images/tidl-i.png
+Exec=runTidlClip2.sh 
+Type=Application
+ProgramType=gui
+Categories=tidl_dir
+X-Matrix-Description=/usr/share/matrix-gui-2.0/apps/tidl_apps/demo_clip2/app_desc.html
+X-Matrix-Lock=test_demo_lock
diff --git a/meta-arago-extras/recipes-core/matrix/files/tidl_apps/demo_livecam/app_desc.html b/meta-arago-extras/recipes-core/matrix/files/tidl_apps/demo_livecam/app_desc.html
new file mode 100644
index 0000000..56cb181
--- /dev/null
+++ b/meta-arago-extras/recipes-core/matrix/files/tidl_apps/demo_livecam/app_desc.html
@@ -0,0 +1,4 @@
+<h1>TIDL Application Overview</h1>
+<h2>Purpose:</h2>
+<p>This application demonstrates Deep Learning Imagenet classification (1000 classes) based on J11 network topology.</p>
+<p>Both DSP cores are used for processing (frame-based pipeline), of decoded video clip.</p>
diff --git a/meta-arago-extras/recipes-core/matrix/files/tidl_apps/demo_livecam/tidl_demo_livecam.desktop b/meta-arago-extras/recipes-core/matrix/files/tidl_apps/demo_livecam/tidl_demo_livecam.desktop
new file mode 100644
index 0000000..853374a
--- /dev/null
+++ b/meta-arago-extras/recipes-core/matrix/files/tidl_apps/demo_livecam/tidl_demo_livecam.desktop
@@ -0,0 +1,10 @@
+#!/usr/bin/env xdg-open
+[Desktop Entry]
+Name=J11v2 Camera
+Icon=/usr/share/matrix-gui-2.0/apps/images/tidl-i.png
+Exec=runTidlLiveCam.sh
+Type=Application
+ProgramType=gui
+Categories=tidl_dir
+X-Matrix-Description=/usr/share/matrix-gui-2.0/apps/tidl_apps/demo_livecam/app_desc.html
+X-Matrix-Lock=tidl_demo_lock
diff --git a/meta-arago-extras/recipes-core/matrix/files/tidl_bins/runTidlClip1.sh b/meta-arago-extras/recipes-core/matrix/files/tidl_bins/runTidlClip1.sh
new file mode 100755
index 0000000..b7e551d
--- /dev/null
+++ b/meta-arago-extras/recipes-core/matrix/files/tidl_bins/runTidlClip1.sh
@@ -0,0 +1,2 @@
+cd /usr/share/ti/tidl/examples/classification
+./tidl_classification -n 2 -t d -l ./imagenet.txt -s ./classlist.txt -i ./clips/test1.mp4 -c ./stream_config_j11_v2.txt
diff --git a/meta-arago-extras/recipes-core/matrix/files/tidl_bins/runTidlClip2.sh b/meta-arago-extras/recipes-core/matrix/files/tidl_bins/runTidlClip2.sh
new file mode 100755
index 0000000..a6f9516
--- /dev/null
+++ b/meta-arago-extras/recipes-core/matrix/files/tidl_bins/runTidlClip2.sh
@@ -0,0 +1,3 @@
+cd /usr/share/ti/tidl/examples/classification
+./tidl_classification -n 2 -t d -l ./imagenet.txt -s ./classlist.txt -i ./clips/test2.mp4 -c ./stream_config_j11_v2.txt
+
diff --git a/meta-arago-extras/recipes-core/matrix/files/tidl_bins/runTidlLiveCam.sh b/meta-arago-extras/recipes-core/matrix/files/tidl_bins/runTidlLiveCam.sh
new file mode 100755
index 0000000..33fb2fb
--- /dev/null
+++ b/meta-arago-extras/recipes-core/matrix/files/tidl_bins/runTidlLiveCam.sh
@@ -0,0 +1,3 @@
+cd /usr/share/ti/tidl/examples/classification
+./tidl_classification -n 2 -t d -l ./imagenet.txt -s ./classlist.txt -i 1 -c ./stream_config_j11_v2.txt
+
diff --git a/meta-arago-extras/recipes-core/matrix/matrix-gui-apps-git.inc b/meta-arago-extras/recipes-core/matrix/matrix-gui-apps-git.inc
index ff90a66..555e6db 100644
--- a/meta-arago-extras/recipes-core/matrix/matrix-gui-apps-git.inc
+++ b/meta-arago-extras/recipes-core/matrix/matrix-gui-apps-git.inc
@@ -3,10 +3,11 @@ LICENSE = "CC-BY-SA-3.0"
 LICENSE_CHECKSUM = "LICENSE;md5=6e0ae7214f6c74c149cb25f373057fa9"
 LIC_FILES_CHKSUM := "file://../${LICENSE_CHECKSUM}"
 
-SRC_URI = "git://git.ti.com/matrix-gui-v2/matrix-gui-v2-apps.git;protocol=git;branch=${BRANCH}"
-SRCREV = "2ef38ec90f2523f138fb54f11f9a895145d88522"
+SRC_URI = "git://git.ti.com/matrix-gui-v2/matrix-gui-v2-apps.git;protocol=git;branch=${BRANCH} "
+SRCREV = "65fee8957447ae4e403ad324acf735d811b2c412"
 BRANCH = "master"
-INC_PR = "r51"
+INC_PR = "r52"
+
 
 # Pull in the base package for installing matrix applications
 require matrix-gui-apps.inc
diff --git a/meta-arago-extras/recipes-core/matrix/matrix-gui-submenus_2.0.bb b/meta-arago-extras/recipes-core/matrix/matrix-gui-submenus_2.0.bb
index 34bd759..2220632 100644
--- a/meta-arago-extras/recipes-core/matrix/matrix-gui-submenus_2.0.bb
+++ b/meta-arago-extras/recipes-core/matrix/matrix-gui-submenus_2.0.bb
@@ -7,6 +7,9 @@ require matrix-gui-apps-git.inc
 # reset the LIC_FILES_CHKSUM setting from the matrix-gui-apps-git.inc file
 LIC_FILES_CHKSUM = "file://LICENSE;md5=6e0ae7214f6c74c149cb25f373057fa9"
 
+SRC_URI += " file://0001-Add-tidl-submenu.patch \ 
+           "
+
 PR = "${INC_PR}.18"
 
 # These packages make submenus in matrix and are not architecture specific
@@ -36,6 +39,7 @@ SUBMENUS = " arm_submenu \
              touch_submenu \
              browser_submenu \
 	     hmi_submenu \
+             tidl_submenu \
 "
 
 do_install(){
@@ -70,6 +74,7 @@ PACKAGES += " ${PN}-arm \
               ${PN}-touch \
               ${PN}-browser \
               ${PN}-hmi \
+              ${PN}-tidl \
 "
 
 # Make sure app images has been installed
@@ -99,3 +104,4 @@ FILES_${PN}-machinevision = "${MATRIX_APP_DIR}/machinevision_submenu/*"
 FILES_${PN}-touch = "${MATRIX_APP_DIR}/touch_submenu/*"
 FILES_${PN}-browser = "${MATRIX_APP_DIR}/browser_submenu/*"
 FILES_${PN}-hmi = "${MATRIX_APP_DIR}/hmi_submenu/*"
+FILES_${PN}-tidl = "${MATRIX_APP_DIR}/tidl_submenu/*"
diff --git a/meta-arago-extras/recipes-core/matrix/matrix-gui-tidl-demos_2.0.bb b/meta-arago-extras/recipes-core/matrix/matrix-gui-tidl-demos_2.0.bb
new file mode 100644
index 0000000..e0a49d1
--- /dev/null
+++ b/meta-arago-extras/recipes-core/matrix/matrix-gui-tidl-demos_2.0.bb
@@ -0,0 +1,57 @@
+DESCRIPTION = "Deep learning vision demo descriptions for Matrix v2"
+HOMEPAGE = "https://gitorious.org/matrix-gui-v2/matrix-gui-v2-apps"
+
+require recipes-core/matrix/matrix-gui-apps-git.inc
+PR = "${INC_PR}.3"
+
+PACKAGE_ARCH = "${MACHINE_ARCH}"
+
+LIC_FILES_CHKSUM := "file://${LICENSE_CHECKSUM}"
+
+SRC_URI  = " file://tidl_apps \
+             file://tidl_bins \
+             file://tidl-i.png \
+           "
+S = "${WORKDIR}/git"
+
+# Make sure tidl submenu and app images has been installed
+TIDLDEMO_RDEPENDS += "matrix-gui-apps-images matrix-gui-submenus-tidl"
+
+FILES_${PN} += "${MATRIX_BASE_DIR}/apps/tidl_apps/*"
+
+PACKAGES = "matrix-tidl-demo-clip1 \
+            matrix-tidl-demo-clip2 \
+            matrix-tidl-demo-livecam \
+"
+
+RDEPENDS_matrix-tidl-demo-clip1 = " \
+    ${TIDLDEMO_RDEPENDS} \
+"
+
+RDEPENDS_matrix-tidl-demo-clip2 = " \
+    ${TIDLDEMO_RDEPENDS} \
+"
+
+RDEPENDS_matrix-tidl-demo-livecam = " \
+    ${TIDLDEMO_RDEPENDS} \
+"
+
+do_install() {
+    CP_ARGS="-Prf --preserve=mode,timestamps --no-preserve=ownership"
+    install -d ${D}/usr/share/matrix-gui-2.0/apps/images
+    install -d ${D}/usr/share/matrix-gui-2.0/apps/
+    install -d ${D}/${bindir}
+    cp ${CP_ARGS} ${WORKDIR}/tidl-i.png ${D}/usr/share/matrix-gui-2.0/apps/images/
+    cp ${CP_ARGS} ${WORKDIR}/tidl_apps ${D}/usr/share/matrix-gui-2.0/apps/
+    install -m 0755 ${WORKDIR}/tidl_bins/* ${D}/${bindir}
+}
+
+FILES_matrix-tidl-demo-clip1 = "${MATRIX_APP_DIR}/tidl_apps/demo_clip1/*"
+FILES_matrix-tidl-demo-clip1 += "${bindir}/runTidlClip1.sh"
+
+FILES_matrix-tidl-demo-clip2 = "${MATRIX_APP_DIR}/tidl_apps/demo_clip2/*"
+FILES_matrix-tidl-demo-clip2 += "${bindir}/runTidlClip2.sh"
+
+FILES_matrix-tidl-demo-livecam   = "${MATRIX_APP_DIR}/tidl_apps/demo_livecam/*"
+FILES_matrix-tidl-demo-livecam   += "${bindir}/runTidlLiveCam.sh"
+
-- 
1.9.1


