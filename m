Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8399FC77B75
	for <webhook@archiver.kernel.org>; Tue, 23 May 2023 18:05:02 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web10.787.1684865095244378332
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 23 May 2023 11:04:56 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 1C9E740C30;
	Tue, 23 May 2023 18:04:54 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vcHXDSF3lM6Z; Tue, 23 May 2023 18:04:54 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-88-116.washdc.fios.verizon.net [100.15.88.116])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id E37B8400CF;
	Tue, 23 May 2023 18:04:52 +0000 (UTC)
Received: from thorin.denix (thorin.denix [192.168.30.9])
	by mail.denix.org (Postfix) with ESMTP id 0F3A1163902;
	Tue, 23 May 2023 14:04:08 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@lists.yoctoproject.org
Cc: Denys Dmytriyenko <denys@konsulko.com>
Subject: [kirkstone][PATCH] meta-arago-demos: extract demo applications into own layer
Date: Tue, 23 May 2023 18:04:51 +0000
Message-Id: <20230523180451.3514220-1-denis@denix.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 23 May 2023 18:05:02 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14453

From: Denys Dmytriyenko <denys@konsulko.com>

Over the years, meta-arago-extras has grown quite a bit and gained lots o=
f
dependencies. Besides hosting a set of independent components or modifyin=
g
and customizing upstream components in support of TI platforms and SDKs,
while potentially being useful for end products, many demonstration and
evaluation applications were added to showcase specific features. Such de=
mo
applications are not used for end products, unnecessarily polluting layer
dependencies and making re-use of meta-arago-extras very difficult.

Let's move demos into own sub-layer and clean up dependencies for the ext=
ras
sub-layer.

Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
---
 .../classes/qt5.bbclass                          |  0
 .../conf/layer.conf                              | 15 +++++----------
 .../acontis-atemsys_3.0.1.28.bb                  |  0
 .../recipes-apps/barcode-demo/barcode-roi_git.bb |  0
 .../big-data-ipc-demo/big-data-ipc-demo_git.bb   |  0
 .../dual-camera-demo/desc_dual-camera.html       |  0
 .../dual-camera-demo/dual-camera.desktop         |  0
 .../dual-camera-demo/dual_camera_qt4.sh          |  0
 .../dual-camera-demo/dual_camera_qt5.sh          |  0
 .../dual-camera-demo/dual-camera-demo_1.0.bb     |  0
 .../recipes-apps/evse-hmi/evse-hmi_git.bb        |  0
 .../image-gallery/image-gallery_git.bb           |  0
 .../mmwavegesture-hmi/mmwavegesture-hmi_git.bb   |  0
 .../pdm-anomaly-detection_git.bb                 |  0
 .../point-cloud-viewer/point-cloud-viewer_git.bb |  0
 .../protection-relays-hmi_git.bb                 |  0
 ...-with-QtWidgets-per-Qt5-migration-guide.patch |  0
 ...scii-toAscii-with-fromLatin1-toLatin1-p.patch |  0
 .../recipes-apps/thermostat-demo/qt-tstat_2.0.bb |  0
 .../qt-opencv-opencl-opengl-multithreaded_git.bb |  0
 .../matrix/matrix-gui-3d-demos_2.0.bb            |  0
 .../matrix/matrix-gui-analytics-demos_2.0.bb     |  0
 .../recipes-core/matrix/matrix-gui-apps-git.inc  |  0
 .../matrix/matrix-gui-apps-images_2.0.bb         |  0
 .../recipes-core/matrix/matrix-gui-apps.inc      |  0
 .../matrix/matrix-gui-armbenchmarks-demos_2.0.bb |  0
 .../matrix/matrix-gui-browser-demos_2.0.bb       |  0
 .../matrix/matrix-gui-browser_2.0.bb             |  0
 .../matrix/matrix-gui-camera-loopback_2.0.bb     |  0
 .../recipes-core/matrix/matrix-gui-clocks_2.0.bb |  0
 .../matrix/matrix-gui-crypto-demos_2.0.bb        |  0
 .../matrix/matrix-gui-display-control_2.0.bb     |  0
 .../matrix-gui-ethernet-demos/udhcpd_eth1.conf   |  0
 .../matrix/matrix-gui-ethernet-demos_2.0.bb      |  0
 .../matrix/matrix-gui-generic-pm_2.0.bb          |  0
 .../matrix/matrix-gui-helper-scripts.bb          |  0
 .../matrix/matrix-gui-hmi-demos_2.0.bb           |  0
 .../matrix/matrix-gui-machinevision-demos_2.0.bb |  0
 .../matrix/matrix-gui-mc-demos_2.0.bb            |  0
 .../matrix/matrix-gui-multimedia-demos_2.0.bb    |  0
 .../matrix/matrix-gui-opencl-demos_2.0.bb        |  0
 .../matrix/matrix-gui-oprofile-demos_2.0.bb      |  0
 .../recipes-core/matrix/matrix-gui-paths.inc     |  0
 .../matrix/matrix-gui-pm-demos_2.0.bb            |  0
 .../matrix/matrix-gui-pru-demos_2.0.bb           |  0
 .../matrix/matrix-gui-qt4-demos_2.0.bb           |  0
 .../matrix/matrix-gui-qt5-demos_2.0.bb           |  0
 .../matrix/matrix-gui-settings-demos_2.0.bb      |  0
 .../matrix/matrix-gui-submenus_2.0.bb            |  0
 .../matrix/matrix-gui-tidl-demos_2.0.bb          |  0
 .../matrix/matrix-gui-touch-demos_2.0.bb         |  0
 .../matrix/matrix-gui-usb-demos_2.0.bb           |  0
 .../matrix/matrix-gui-utility-demos_2.0.bb       |  0
 .../matrix/matrix-gui-v4l2-demos_2.0.bb          |  0
 .../matrix-gui-video-analytics-demos_2.0.bb      |  0
 .../matrix/matrix-gui-wifi-demos_2.0.bb          |  0
 ...and-Stop-matrix-when-running-a-GUI-demo.patch |  0
 ...and-workaround-for-GUI-apps-with-weston.patch |  0
 .../recipes-core/matrix/matrix-gui/init          |  0
 .../recipes-core/matrix/matrix-gui/init.eglfs    |  0
 .../matrix/matrix-gui/matrix-gui-2.0.service     |  0
 .../recipes-core/matrix/matrix-gui/php.ini       |  0
 .../recipes-core/matrix/matrix-gui_2.0.bb        |  0
 .../matrix/matrix-lighttpd-config.bb             |  0
 .../matrix/matrix-lighttpd-config/COPYING        |  0
 .../matrix-lighttpd-config/lighttpd.conf.matrix  |  0
 .../recipes-core/matrix/refresh-screen_2.0.bb    |  0
 .../recipes-qt/examples/qtwebbrowser_5.15.1.bb   |  0
 meta-arago-extras/conf/layer.conf                | 16 ----------------
 69 files changed, 5 insertions(+), 26 deletions(-)
 rename {meta-arago-extras =3D> meta-arago-demos}/classes/qt5.bbclass (10=
0%)
 copy {meta-arago-extras =3D> meta-arago-demos}/conf/layer.conf (69%)
 rename {meta-arago-extras =3D> meta-arago-demos}/recipes-apps/acontis-et=
hercat-demo/acontis-atemsys_3.0.1.28.bb (100%)
 rename {meta-arago-extras =3D> meta-arago-demos}/recipes-apps/barcode-de=
mo/barcode-roi_git.bb (100%)
 rename {meta-arago-extras =3D> meta-arago-demos}/recipes-apps/big-data-i=
pc-demo/big-data-ipc-demo_git.bb (100%)
 rename {meta-arago-extras/recipes-multimedia =3D> meta-arago-demos/recip=
es-apps}/dual-camera-demo/dual-camera-demo/desc_dual-camera.html (100%)
 rename {meta-arago-extras/recipes-multimedia =3D> meta-arago-demos/recip=
es-apps}/dual-camera-demo/dual-camera-demo/dual-camera.desktop (100%)
 rename {meta-arago-extras/recipes-multimedia =3D> meta-arago-demos/recip=
es-apps}/dual-camera-demo/dual-camera-demo/dual_camera_qt4.sh (100%)
 rename {meta-arago-extras/recipes-multimedia =3D> meta-arago-demos/recip=
es-apps}/dual-camera-demo/dual-camera-demo/dual_camera_qt5.sh (100%)
 rename {meta-arago-extras/recipes-multimedia =3D> meta-arago-demos/recip=
es-apps}/dual-camera-demo/dual-camera-demo_1.0.bb (100%)
 rename {meta-arago-extras =3D> meta-arago-demos}/recipes-apps/evse-hmi/e=
vse-hmi_git.bb (100%)
 rename {meta-arago-extras =3D> meta-arago-demos}/recipes-apps/image-gall=
ery/image-gallery_git.bb (100%)
 rename {meta-arago-extras =3D> meta-arago-demos}/recipes-apps/mmwavegest=
ure-hmi/mmwavegesture-hmi_git.bb (100%)
 rename {meta-arago-extras =3D> meta-arago-demos}/recipes-apps/pdm-anomal=
y-detection/pdm-anomaly-detection_git.bb (100%)
 rename {meta-arago-extras =3D> meta-arago-demos}/recipes-apps/point-clou=
d-viewer/point-cloud-viewer_git.bb (100%)
 rename {meta-arago-extras =3D> meta-arago-demos}/recipes-apps/protection=
-relays-hmi/protection-relays-hmi_git.bb (100%)
 rename {meta-arago-extras =3D> meta-arago-demos}/recipes-apps/thermostat=
-demo/qt-tstat/0002-Replace-QtGui-with-QtWidgets-per-Qt5-migration-guide.=
patch (100%)
 rename {meta-arago-extras =3D> meta-arago-demos}/recipes-apps/thermostat=
-demo/qt-tstat/0003-Replace-fromAscii-toAscii-with-fromLatin1-toLatin1-p.=
patch (100%)
 rename {meta-arago-extras =3D> meta-arago-demos}/recipes-apps/thermostat=
-demo/qt-tstat_2.0.bb (100%)
 rename {meta-arago-extras =3D> meta-arago-demos}/recipes-apps/video-anal=
ytics-demo/qt-opencv-opencl-opengl-multithreaded_git.bb (100%)
 rename {meta-arago-extras =3D> meta-arago-demos}/recipes-core/matrix/mat=
rix-gui-3d-demos_2.0.bb (100%)
 rename {meta-arago-extras =3D> meta-arago-demos}/recipes-core/matrix/mat=
rix-gui-analytics-demos_2.0.bb (100%)
 rename {meta-arago-extras =3D> meta-arago-demos}/recipes-core/matrix/mat=
rix-gui-apps-git.inc (100%)
 rename {meta-arago-extras =3D> meta-arago-demos}/recipes-core/matrix/mat=
rix-gui-apps-images_2.0.bb (100%)
 rename {meta-arago-extras =3D> meta-arago-demos}/recipes-core/matrix/mat=
rix-gui-apps.inc (100%)
 rename {meta-arago-extras =3D> meta-arago-demos}/recipes-core/matrix/mat=
rix-gui-armbenchmarks-demos_2.0.bb (100%)
 rename {meta-arago-extras =3D> meta-arago-demos}/recipes-core/matrix/mat=
rix-gui-browser-demos_2.0.bb (100%)
 rename {meta-arago-extras =3D> meta-arago-demos}/recipes-core/matrix/mat=
rix-gui-browser_2.0.bb (100%)
 rename {meta-arago-extras =3D> meta-arago-demos}/recipes-core/matrix/mat=
rix-gui-camera-loopback_2.0.bb (100%)
 rename {meta-arago-extras =3D> meta-arago-demos}/recipes-core/matrix/mat=
rix-gui-clocks_2.0.bb (100%)
 rename {meta-arago-extras =3D> meta-arago-demos}/recipes-core/matrix/mat=
rix-gui-crypto-demos_2.0.bb (100%)
 rename {meta-arago-extras =3D> meta-arago-demos}/recipes-core/matrix/mat=
rix-gui-display-control_2.0.bb (100%)
 rename {meta-arago-extras =3D> meta-arago-demos}/recipes-core/matrix/mat=
rix-gui-ethernet-demos/udhcpd_eth1.conf (100%)
 rename {meta-arago-extras =3D> meta-arago-demos}/recipes-core/matrix/mat=
rix-gui-ethernet-demos_2.0.bb (100%)
 rename {meta-arago-extras =3D> meta-arago-demos}/recipes-core/matrix/mat=
rix-gui-generic-pm_2.0.bb (100%)
 rename {meta-arago-extras =3D> meta-arago-demos}/recipes-core/matrix/mat=
rix-gui-helper-scripts.bb (100%)
 rename {meta-arago-extras =3D> meta-arago-demos}/recipes-core/matrix/mat=
rix-gui-hmi-demos_2.0.bb (100%)
 rename {meta-arago-extras =3D> meta-arago-demos}/recipes-core/matrix/mat=
rix-gui-machinevision-demos_2.0.bb (100%)
 rename {meta-arago-extras =3D> meta-arago-demos}/recipes-core/matrix/mat=
rix-gui-mc-demos_2.0.bb (100%)
 rename {meta-arago-extras =3D> meta-arago-demos}/recipes-core/matrix/mat=
rix-gui-multimedia-demos_2.0.bb (100%)
 rename {meta-arago-extras =3D> meta-arago-demos}/recipes-core/matrix/mat=
rix-gui-opencl-demos_2.0.bb (100%)
 rename {meta-arago-extras =3D> meta-arago-demos}/recipes-core/matrix/mat=
rix-gui-oprofile-demos_2.0.bb (100%)
 rename {meta-arago-extras =3D> meta-arago-demos}/recipes-core/matrix/mat=
rix-gui-paths.inc (100%)
 rename {meta-arago-extras =3D> meta-arago-demos}/recipes-core/matrix/mat=
rix-gui-pm-demos_2.0.bb (100%)
 rename {meta-arago-extras =3D> meta-arago-demos}/recipes-core/matrix/mat=
rix-gui-pru-demos_2.0.bb (100%)
 rename {meta-arago-extras =3D> meta-arago-demos}/recipes-core/matrix/mat=
rix-gui-qt4-demos_2.0.bb (100%)
 rename {meta-arago-extras =3D> meta-arago-demos}/recipes-core/matrix/mat=
rix-gui-qt5-demos_2.0.bb (100%)
 rename {meta-arago-extras =3D> meta-arago-demos}/recipes-core/matrix/mat=
rix-gui-settings-demos_2.0.bb (100%)
 rename {meta-arago-extras =3D> meta-arago-demos}/recipes-core/matrix/mat=
rix-gui-submenus_2.0.bb (100%)
 rename {meta-arago-extras =3D> meta-arago-demos}/recipes-core/matrix/mat=
rix-gui-tidl-demos_2.0.bb (100%)
 rename {meta-arago-extras =3D> meta-arago-demos}/recipes-core/matrix/mat=
rix-gui-touch-demos_2.0.bb (100%)
 rename {meta-arago-extras =3D> meta-arago-demos}/recipes-core/matrix/mat=
rix-gui-usb-demos_2.0.bb (100%)
 rename {meta-arago-extras =3D> meta-arago-demos}/recipes-core/matrix/mat=
rix-gui-utility-demos_2.0.bb (100%)
 rename {meta-arago-extras =3D> meta-arago-demos}/recipes-core/matrix/mat=
rix-gui-v4l2-demos_2.0.bb (100%)
 rename {meta-arago-extras =3D> meta-arago-demos}/recipes-core/matrix/mat=
rix-gui-video-analytics-demos_2.0.bb (100%)
 rename {meta-arago-extras =3D> meta-arago-demos}/recipes-core/matrix/mat=
rix-gui-wifi-demos_2.0.bb (100%)
 rename {meta-arago-extras =3D> meta-arago-demos}/recipes-core/matrix/mat=
rix-gui/0001-execute_command-Stop-matrix-when-running-a-GUI-demo.patch (1=
00%)
 rename {meta-arago-extras =3D> meta-arago-demos}/recipes-core/matrix/mat=
rix-gui/0001-execute_command-workaround-for-GUI-apps-with-weston.patch (1=
00%)
 rename {meta-arago-extras =3D> meta-arago-demos}/recipes-core/matrix/mat=
rix-gui/init (100%)
 rename {meta-arago-extras =3D> meta-arago-demos}/recipes-core/matrix/mat=
rix-gui/init.eglfs (100%)
 rename {meta-arago-extras =3D> meta-arago-demos}/recipes-core/matrix/mat=
rix-gui/matrix-gui-2.0.service (100%)
 rename {meta-arago-extras =3D> meta-arago-demos}/recipes-core/matrix/mat=
rix-gui/php.ini (100%)
 rename {meta-arago-extras =3D> meta-arago-demos}/recipes-core/matrix/mat=
rix-gui_2.0.bb (100%)
 rename {meta-arago-extras =3D> meta-arago-demos}/recipes-core/matrix/mat=
rix-lighttpd-config.bb (100%)
 rename {meta-arago-extras =3D> meta-arago-demos}/recipes-core/matrix/mat=
rix-lighttpd-config/COPYING (100%)
 rename {meta-arago-extras =3D> meta-arago-demos}/recipes-core/matrix/mat=
rix-lighttpd-config/lighttpd.conf.matrix (100%)
 rename {meta-arago-extras =3D> meta-arago-demos}/recipes-core/matrix/ref=
resh-screen_2.0.bb (100%)
 rename {meta-arago-extras =3D> meta-arago-demos}/recipes-qt/examples/qtw=
ebbrowser_5.15.1.bb (100%)

diff --git a/meta-arago-extras/classes/qt5.bbclass b/meta-arago-demos/cla=
sses/qt5.bbclass
similarity index 100%
rename from meta-arago-extras/classes/qt5.bbclass
rename to meta-arago-demos/classes/qt5.bbclass
diff --git a/meta-arago-extras/conf/layer.conf b/meta-arago-demos/conf/la=
yer.conf
similarity index 69%
copy from meta-arago-extras/conf/layer.conf
copy to meta-arago-demos/conf/layer.conf
index 6df62162..0ffd3849 100644
--- a/meta-arago-extras/conf/layer.conf
+++ b/meta-arago-demos/conf/layer.conf
@@ -4,18 +4,13 @@ BBPATH .=3D ":${LAYERDIR}"
 # We have a recipes directory, add to BBFILES
 BBFILES +=3D "${LAYERDIR}/recipes*/*/*.bb ${LAYERDIR}/recipes*/*/*.bbapp=
end"
=20
-BBFILE_COLLECTIONS +=3D "meta-arago-extras"
-BBFILE_PATTERN_meta-arago-extras :=3D "^${LAYERDIR}/"
-BBFILE_PRIORITY_meta-arago-extras =3D "10"
+BBFILE_COLLECTIONS +=3D "meta-arago-demos"
+BBFILE_PATTERN_meta-arago-demos :=3D "^${LAYERDIR}/"
+BBFILE_PRIORITY_meta-arago-demos =3D "10"
=20
-LAYERSERIES_COMPAT_meta-arago-extras =3D "kirkstone langdale"
+LAYERSERIES_COMPAT_meta-arago-demos =3D "kirkstone langdale"
=20
-# Set a variable to get to the top of the metadata location
-ARAGOBASE :=3D '${@os.path.normpath("${LAYERDIR}/../")}'
-
-LICENSE_PATH +=3D "${LAYERDIR}/licenses"
-
-LAYERDEPENDS_meta-arago-extras =3D " \
+LAYERDEPENDS_meta-arago-demos =3D " \
     core \
     meta-ti-bsp \
     meta-ti-extras \
diff --git a/meta-arago-extras/recipes-apps/acontis-ethercat-demo/acontis=
-atemsys_3.0.1.28.bb b/meta-arago-demos/recipes-apps/acontis-ethercat-dem=
o/acontis-atemsys_3.0.1.28.bb
similarity index 100%
rename from meta-arago-extras/recipes-apps/acontis-ethercat-demo/acontis-=
atemsys_3.0.1.28.bb
rename to meta-arago-demos/recipes-apps/acontis-ethercat-demo/acontis-ate=
msys_3.0.1.28.bb
diff --git a/meta-arago-extras/recipes-apps/barcode-demo/barcode-roi_git.=
bb b/meta-arago-demos/recipes-apps/barcode-demo/barcode-roi_git.bb
similarity index 100%
rename from meta-arago-extras/recipes-apps/barcode-demo/barcode-roi_git.b=
b
rename to meta-arago-demos/recipes-apps/barcode-demo/barcode-roi_git.bb
diff --git a/meta-arago-extras/recipes-apps/big-data-ipc-demo/big-data-ip=
c-demo_git.bb b/meta-arago-demos/recipes-apps/big-data-ipc-demo/big-data-=
ipc-demo_git.bb
similarity index 100%
rename from meta-arago-extras/recipes-apps/big-data-ipc-demo/big-data-ipc=
-demo_git.bb
rename to meta-arago-demos/recipes-apps/big-data-ipc-demo/big-data-ipc-de=
mo_git.bb
diff --git a/meta-arago-extras/recipes-multimedia/dual-camera-demo/dual-c=
amera-demo/desc_dual-camera.html b/meta-arago-demos/recipes-apps/dual-cam=
era-demo/dual-camera-demo/desc_dual-camera.html
similarity index 100%
rename from meta-arago-extras/recipes-multimedia/dual-camera-demo/dual-ca=
mera-demo/desc_dual-camera.html
rename to meta-arago-demos/recipes-apps/dual-camera-demo/dual-camera-demo=
/desc_dual-camera.html
diff --git a/meta-arago-extras/recipes-multimedia/dual-camera-demo/dual-c=
amera-demo/dual-camera.desktop b/meta-arago-demos/recipes-apps/dual-camer=
a-demo/dual-camera-demo/dual-camera.desktop
similarity index 100%
rename from meta-arago-extras/recipes-multimedia/dual-camera-demo/dual-ca=
mera-demo/dual-camera.desktop
rename to meta-arago-demos/recipes-apps/dual-camera-demo/dual-camera-demo=
/dual-camera.desktop
diff --git a/meta-arago-extras/recipes-multimedia/dual-camera-demo/dual-c=
amera-demo/dual_camera_qt4.sh b/meta-arago-demos/recipes-apps/dual-camera=
-demo/dual-camera-demo/dual_camera_qt4.sh
similarity index 100%
rename from meta-arago-extras/recipes-multimedia/dual-camera-demo/dual-ca=
mera-demo/dual_camera_qt4.sh
rename to meta-arago-demos/recipes-apps/dual-camera-demo/dual-camera-demo=
/dual_camera_qt4.sh
diff --git a/meta-arago-extras/recipes-multimedia/dual-camera-demo/dual-c=
amera-demo/dual_camera_qt5.sh b/meta-arago-demos/recipes-apps/dual-camera=
-demo/dual-camera-demo/dual_camera_qt5.sh
similarity index 100%
rename from meta-arago-extras/recipes-multimedia/dual-camera-demo/dual-ca=
mera-demo/dual_camera_qt5.sh
rename to meta-arago-demos/recipes-apps/dual-camera-demo/dual-camera-demo=
/dual_camera_qt5.sh
diff --git a/meta-arago-extras/recipes-multimedia/dual-camera-demo/dual-c=
amera-demo_1.0.bb b/meta-arago-demos/recipes-apps/dual-camera-demo/dual-c=
amera-demo_1.0.bb
similarity index 100%
rename from meta-arago-extras/recipes-multimedia/dual-camera-demo/dual-ca=
mera-demo_1.0.bb
rename to meta-arago-demos/recipes-apps/dual-camera-demo/dual-camera-demo=
_1.0.bb
diff --git a/meta-arago-extras/recipes-apps/evse-hmi/evse-hmi_git.bb b/me=
ta-arago-demos/recipes-apps/evse-hmi/evse-hmi_git.bb
similarity index 100%
rename from meta-arago-extras/recipes-apps/evse-hmi/evse-hmi_git.bb
rename to meta-arago-demos/recipes-apps/evse-hmi/evse-hmi_git.bb
diff --git a/meta-arago-extras/recipes-apps/image-gallery/image-gallery_g=
it.bb b/meta-arago-demos/recipes-apps/image-gallery/image-gallery_git.bb
similarity index 100%
rename from meta-arago-extras/recipes-apps/image-gallery/image-gallery_gi=
t.bb
rename to meta-arago-demos/recipes-apps/image-gallery/image-gallery_git.b=
b
diff --git a/meta-arago-extras/recipes-apps/mmwavegesture-hmi/mmwavegestu=
re-hmi_git.bb b/meta-arago-demos/recipes-apps/mmwavegesture-hmi/mmwaveges=
ture-hmi_git.bb
similarity index 100%
rename from meta-arago-extras/recipes-apps/mmwavegesture-hmi/mmwavegestur=
e-hmi_git.bb
rename to meta-arago-demos/recipes-apps/mmwavegesture-hmi/mmwavegesture-h=
mi_git.bb
diff --git a/meta-arago-extras/recipes-apps/pdm-anomaly-detection/pdm-ano=
maly-detection_git.bb b/meta-arago-demos/recipes-apps/pdm-anomaly-detecti=
on/pdm-anomaly-detection_git.bb
similarity index 100%
rename from meta-arago-extras/recipes-apps/pdm-anomaly-detection/pdm-anom=
aly-detection_git.bb
rename to meta-arago-demos/recipes-apps/pdm-anomaly-detection/pdm-anomaly=
-detection_git.bb
diff --git a/meta-arago-extras/recipes-apps/point-cloud-viewer/point-clou=
d-viewer_git.bb b/meta-arago-demos/recipes-apps/point-cloud-viewer/point-=
cloud-viewer_git.bb
similarity index 100%
rename from meta-arago-extras/recipes-apps/point-cloud-viewer/point-cloud=
-viewer_git.bb
rename to meta-arago-demos/recipes-apps/point-cloud-viewer/point-cloud-vi=
ewer_git.bb
diff --git a/meta-arago-extras/recipes-apps/protection-relays-hmi/protect=
ion-relays-hmi_git.bb b/meta-arago-demos/recipes-apps/protection-relays-h=
mi/protection-relays-hmi_git.bb
similarity index 100%
rename from meta-arago-extras/recipes-apps/protection-relays-hmi/protecti=
on-relays-hmi_git.bb
rename to meta-arago-demos/recipes-apps/protection-relays-hmi/protection-=
relays-hmi_git.bb
diff --git a/meta-arago-extras/recipes-apps/thermostat-demo/qt-tstat/0002=
-Replace-QtGui-with-QtWidgets-per-Qt5-migration-guide.patch b/meta-arago-=
demos/recipes-apps/thermostat-demo/qt-tstat/0002-Replace-QtGui-with-QtWid=
gets-per-Qt5-migration-guide.patch
similarity index 100%
rename from meta-arago-extras/recipes-apps/thermostat-demo/qt-tstat/0002-=
Replace-QtGui-with-QtWidgets-per-Qt5-migration-guide.patch
rename to meta-arago-demos/recipes-apps/thermostat-demo/qt-tstat/0002-Rep=
lace-QtGui-with-QtWidgets-per-Qt5-migration-guide.patch
diff --git a/meta-arago-extras/recipes-apps/thermostat-demo/qt-tstat/0003=
-Replace-fromAscii-toAscii-with-fromLatin1-toLatin1-p.patch b/meta-arago-=
demos/recipes-apps/thermostat-demo/qt-tstat/0003-Replace-fromAscii-toAsci=
i-with-fromLatin1-toLatin1-p.patch
similarity index 100%
rename from meta-arago-extras/recipes-apps/thermostat-demo/qt-tstat/0003-=
Replace-fromAscii-toAscii-with-fromLatin1-toLatin1-p.patch
rename to meta-arago-demos/recipes-apps/thermostat-demo/qt-tstat/0003-Rep=
lace-fromAscii-toAscii-with-fromLatin1-toLatin1-p.patch
diff --git a/meta-arago-extras/recipes-apps/thermostat-demo/qt-tstat_2.0.=
bb b/meta-arago-demos/recipes-apps/thermostat-demo/qt-tstat_2.0.bb
similarity index 100%
rename from meta-arago-extras/recipes-apps/thermostat-demo/qt-tstat_2.0.b=
b
rename to meta-arago-demos/recipes-apps/thermostat-demo/qt-tstat_2.0.bb
diff --git a/meta-arago-extras/recipes-apps/video-analytics-demo/qt-openc=
v-opencl-opengl-multithreaded_git.bb b/meta-arago-demos/recipes-apps/vide=
o-analytics-demo/qt-opencv-opencl-opengl-multithreaded_git.bb
similarity index 100%
rename from meta-arago-extras/recipes-apps/video-analytics-demo/qt-opencv=
-opencl-opengl-multithreaded_git.bb
rename to meta-arago-demos/recipes-apps/video-analytics-demo/qt-opencv-op=
encl-opengl-multithreaded_git.bb
diff --git a/meta-arago-extras/recipes-core/matrix/matrix-gui-3d-demos_2.=
0.bb b/meta-arago-demos/recipes-core/matrix/matrix-gui-3d-demos_2.0.bb
similarity index 100%
rename from meta-arago-extras/recipes-core/matrix/matrix-gui-3d-demos_2.0=
.bb
rename to meta-arago-demos/recipes-core/matrix/matrix-gui-3d-demos_2.0.bb
diff --git a/meta-arago-extras/recipes-core/matrix/matrix-gui-analytics-d=
emos_2.0.bb b/meta-arago-demos/recipes-core/matrix/matrix-gui-analytics-d=
emos_2.0.bb
similarity index 100%
rename from meta-arago-extras/recipes-core/matrix/matrix-gui-analytics-de=
mos_2.0.bb
rename to meta-arago-demos/recipes-core/matrix/matrix-gui-analytics-demos=
_2.0.bb
diff --git a/meta-arago-extras/recipes-core/matrix/matrix-gui-apps-git.in=
c b/meta-arago-demos/recipes-core/matrix/matrix-gui-apps-git.inc
similarity index 100%
rename from meta-arago-extras/recipes-core/matrix/matrix-gui-apps-git.inc
rename to meta-arago-demos/recipes-core/matrix/matrix-gui-apps-git.inc
diff --git a/meta-arago-extras/recipes-core/matrix/matrix-gui-apps-images=
_2.0.bb b/meta-arago-demos/recipes-core/matrix/matrix-gui-apps-images_2.0=
.bb
similarity index 100%
rename from meta-arago-extras/recipes-core/matrix/matrix-gui-apps-images_=
2.0.bb
rename to meta-arago-demos/recipes-core/matrix/matrix-gui-apps-images_2.0=
.bb
diff --git a/meta-arago-extras/recipes-core/matrix/matrix-gui-apps.inc b/=
meta-arago-demos/recipes-core/matrix/matrix-gui-apps.inc
similarity index 100%
rename from meta-arago-extras/recipes-core/matrix/matrix-gui-apps.inc
rename to meta-arago-demos/recipes-core/matrix/matrix-gui-apps.inc
diff --git a/meta-arago-extras/recipes-core/matrix/matrix-gui-armbenchmar=
ks-demos_2.0.bb b/meta-arago-demos/recipes-core/matrix/matrix-gui-armbenc=
hmarks-demos_2.0.bb
similarity index 100%
rename from meta-arago-extras/recipes-core/matrix/matrix-gui-armbenchmark=
s-demos_2.0.bb
rename to meta-arago-demos/recipes-core/matrix/matrix-gui-armbenchmarks-d=
emos_2.0.bb
diff --git a/meta-arago-extras/recipes-core/matrix/matrix-gui-browser-dem=
os_2.0.bb b/meta-arago-demos/recipes-core/matrix/matrix-gui-browser-demos=
_2.0.bb
similarity index 100%
rename from meta-arago-extras/recipes-core/matrix/matrix-gui-browser-demo=
s_2.0.bb
rename to meta-arago-demos/recipes-core/matrix/matrix-gui-browser-demos_2=
.0.bb
diff --git a/meta-arago-extras/recipes-core/matrix/matrix-gui-browser_2.0=
.bb b/meta-arago-demos/recipes-core/matrix/matrix-gui-browser_2.0.bb
similarity index 100%
rename from meta-arago-extras/recipes-core/matrix/matrix-gui-browser_2.0.=
bb
rename to meta-arago-demos/recipes-core/matrix/matrix-gui-browser_2.0.bb
diff --git a/meta-arago-extras/recipes-core/matrix/matrix-gui-camera-loop=
back_2.0.bb b/meta-arago-demos/recipes-core/matrix/matrix-gui-camera-loop=
back_2.0.bb
similarity index 100%
rename from meta-arago-extras/recipes-core/matrix/matrix-gui-camera-loopb=
ack_2.0.bb
rename to meta-arago-demos/recipes-core/matrix/matrix-gui-camera-loopback=
_2.0.bb
diff --git a/meta-arago-extras/recipes-core/matrix/matrix-gui-clocks_2.0.=
bb b/meta-arago-demos/recipes-core/matrix/matrix-gui-clocks_2.0.bb
similarity index 100%
rename from meta-arago-extras/recipes-core/matrix/matrix-gui-clocks_2.0.b=
b
rename to meta-arago-demos/recipes-core/matrix/matrix-gui-clocks_2.0.bb
diff --git a/meta-arago-extras/recipes-core/matrix/matrix-gui-crypto-demo=
s_2.0.bb b/meta-arago-demos/recipes-core/matrix/matrix-gui-crypto-demos_2=
.0.bb
similarity index 100%
rename from meta-arago-extras/recipes-core/matrix/matrix-gui-crypto-demos=
_2.0.bb
rename to meta-arago-demos/recipes-core/matrix/matrix-gui-crypto-demos_2.=
0.bb
diff --git a/meta-arago-extras/recipes-core/matrix/matrix-gui-display-con=
trol_2.0.bb b/meta-arago-demos/recipes-core/matrix/matrix-gui-display-con=
trol_2.0.bb
similarity index 100%
rename from meta-arago-extras/recipes-core/matrix/matrix-gui-display-cont=
rol_2.0.bb
rename to meta-arago-demos/recipes-core/matrix/matrix-gui-display-control=
_2.0.bb
diff --git a/meta-arago-extras/recipes-core/matrix/matrix-gui-ethernet-de=
mos/udhcpd_eth1.conf b/meta-arago-demos/recipes-core/matrix/matrix-gui-et=
hernet-demos/udhcpd_eth1.conf
similarity index 100%
rename from meta-arago-extras/recipes-core/matrix/matrix-gui-ethernet-dem=
os/udhcpd_eth1.conf
rename to meta-arago-demos/recipes-core/matrix/matrix-gui-ethernet-demos/=
udhcpd_eth1.conf
diff --git a/meta-arago-extras/recipes-core/matrix/matrix-gui-ethernet-de=
mos_2.0.bb b/meta-arago-demos/recipes-core/matrix/matrix-gui-ethernet-dem=
os_2.0.bb
similarity index 100%
rename from meta-arago-extras/recipes-core/matrix/matrix-gui-ethernet-dem=
os_2.0.bb
rename to meta-arago-demos/recipes-core/matrix/matrix-gui-ethernet-demos_=
2.0.bb
diff --git a/meta-arago-extras/recipes-core/matrix/matrix-gui-generic-pm_=
2.0.bb b/meta-arago-demos/recipes-core/matrix/matrix-gui-generic-pm_2.0.b=
b
similarity index 100%
rename from meta-arago-extras/recipes-core/matrix/matrix-gui-generic-pm_2=
.0.bb
rename to meta-arago-demos/recipes-core/matrix/matrix-gui-generic-pm_2.0.=
bb
diff --git a/meta-arago-extras/recipes-core/matrix/matrix-gui-helper-scri=
pts.bb b/meta-arago-demos/recipes-core/matrix/matrix-gui-helper-scripts.b=
b
similarity index 100%
rename from meta-arago-extras/recipes-core/matrix/matrix-gui-helper-scrip=
ts.bb
rename to meta-arago-demos/recipes-core/matrix/matrix-gui-helper-scripts.=
bb
diff --git a/meta-arago-extras/recipes-core/matrix/matrix-gui-hmi-demos_2=
.0.bb b/meta-arago-demos/recipes-core/matrix/matrix-gui-hmi-demos_2.0.bb
similarity index 100%
rename from meta-arago-extras/recipes-core/matrix/matrix-gui-hmi-demos_2.=
0.bb
rename to meta-arago-demos/recipes-core/matrix/matrix-gui-hmi-demos_2.0.b=
b
diff --git a/meta-arago-extras/recipes-core/matrix/matrix-gui-machinevisi=
on-demos_2.0.bb b/meta-arago-demos/recipes-core/matrix/matrix-gui-machine=
vision-demos_2.0.bb
similarity index 100%
rename from meta-arago-extras/recipes-core/matrix/matrix-gui-machinevisio=
n-demos_2.0.bb
rename to meta-arago-demos/recipes-core/matrix/matrix-gui-machinevision-d=
emos_2.0.bb
diff --git a/meta-arago-extras/recipes-core/matrix/matrix-gui-mc-demos_2.=
0.bb b/meta-arago-demos/recipes-core/matrix/matrix-gui-mc-demos_2.0.bb
similarity index 100%
rename from meta-arago-extras/recipes-core/matrix/matrix-gui-mc-demos_2.0=
.bb
rename to meta-arago-demos/recipes-core/matrix/matrix-gui-mc-demos_2.0.bb
diff --git a/meta-arago-extras/recipes-core/matrix/matrix-gui-multimedia-=
demos_2.0.bb b/meta-arago-demos/recipes-core/matrix/matrix-gui-multimedia=
-demos_2.0.bb
similarity index 100%
rename from meta-arago-extras/recipes-core/matrix/matrix-gui-multimedia-d=
emos_2.0.bb
rename to meta-arago-demos/recipes-core/matrix/matrix-gui-multimedia-demo=
s_2.0.bb
diff --git a/meta-arago-extras/recipes-core/matrix/matrix-gui-opencl-demo=
s_2.0.bb b/meta-arago-demos/recipes-core/matrix/matrix-gui-opencl-demos_2=
.0.bb
similarity index 100%
rename from meta-arago-extras/recipes-core/matrix/matrix-gui-opencl-demos=
_2.0.bb
rename to meta-arago-demos/recipes-core/matrix/matrix-gui-opencl-demos_2.=
0.bb
diff --git a/meta-arago-extras/recipes-core/matrix/matrix-gui-oprofile-de=
mos_2.0.bb b/meta-arago-demos/recipes-core/matrix/matrix-gui-oprofile-dem=
os_2.0.bb
similarity index 100%
rename from meta-arago-extras/recipes-core/matrix/matrix-gui-oprofile-dem=
os_2.0.bb
rename to meta-arago-demos/recipes-core/matrix/matrix-gui-oprofile-demos_=
2.0.bb
diff --git a/meta-arago-extras/recipes-core/matrix/matrix-gui-paths.inc b=
/meta-arago-demos/recipes-core/matrix/matrix-gui-paths.inc
similarity index 100%
rename from meta-arago-extras/recipes-core/matrix/matrix-gui-paths.inc
rename to meta-arago-demos/recipes-core/matrix/matrix-gui-paths.inc
diff --git a/meta-arago-extras/recipes-core/matrix/matrix-gui-pm-demos_2.=
0.bb b/meta-arago-demos/recipes-core/matrix/matrix-gui-pm-demos_2.0.bb
similarity index 100%
rename from meta-arago-extras/recipes-core/matrix/matrix-gui-pm-demos_2.0=
.bb
rename to meta-arago-demos/recipes-core/matrix/matrix-gui-pm-demos_2.0.bb
diff --git a/meta-arago-extras/recipes-core/matrix/matrix-gui-pru-demos_2=
.0.bb b/meta-arago-demos/recipes-core/matrix/matrix-gui-pru-demos_2.0.bb
similarity index 100%
rename from meta-arago-extras/recipes-core/matrix/matrix-gui-pru-demos_2.=
0.bb
rename to meta-arago-demos/recipes-core/matrix/matrix-gui-pru-demos_2.0.b=
b
diff --git a/meta-arago-extras/recipes-core/matrix/matrix-gui-qt4-demos_2=
.0.bb b/meta-arago-demos/recipes-core/matrix/matrix-gui-qt4-demos_2.0.bb
similarity index 100%
rename from meta-arago-extras/recipes-core/matrix/matrix-gui-qt4-demos_2.=
0.bb
rename to meta-arago-demos/recipes-core/matrix/matrix-gui-qt4-demos_2.0.b=
b
diff --git a/meta-arago-extras/recipes-core/matrix/matrix-gui-qt5-demos_2=
.0.bb b/meta-arago-demos/recipes-core/matrix/matrix-gui-qt5-demos_2.0.bb
similarity index 100%
rename from meta-arago-extras/recipes-core/matrix/matrix-gui-qt5-demos_2.=
0.bb
rename to meta-arago-demos/recipes-core/matrix/matrix-gui-qt5-demos_2.0.b=
b
diff --git a/meta-arago-extras/recipes-core/matrix/matrix-gui-settings-de=
mos_2.0.bb b/meta-arago-demos/recipes-core/matrix/matrix-gui-settings-dem=
os_2.0.bb
similarity index 100%
rename from meta-arago-extras/recipes-core/matrix/matrix-gui-settings-dem=
os_2.0.bb
rename to meta-arago-demos/recipes-core/matrix/matrix-gui-settings-demos_=
2.0.bb
diff --git a/meta-arago-extras/recipes-core/matrix/matrix-gui-submenus_2.=
0.bb b/meta-arago-demos/recipes-core/matrix/matrix-gui-submenus_2.0.bb
similarity index 100%
rename from meta-arago-extras/recipes-core/matrix/matrix-gui-submenus_2.0=
.bb
rename to meta-arago-demos/recipes-core/matrix/matrix-gui-submenus_2.0.bb
diff --git a/meta-arago-extras/recipes-core/matrix/matrix-gui-tidl-demos_=
2.0.bb b/meta-arago-demos/recipes-core/matrix/matrix-gui-tidl-demos_2.0.b=
b
similarity index 100%
rename from meta-arago-extras/recipes-core/matrix/matrix-gui-tidl-demos_2=
.0.bb
rename to meta-arago-demos/recipes-core/matrix/matrix-gui-tidl-demos_2.0.=
bb
diff --git a/meta-arago-extras/recipes-core/matrix/matrix-gui-touch-demos=
_2.0.bb b/meta-arago-demos/recipes-core/matrix/matrix-gui-touch-demos_2.0=
.bb
similarity index 100%
rename from meta-arago-extras/recipes-core/matrix/matrix-gui-touch-demos_=
2.0.bb
rename to meta-arago-demos/recipes-core/matrix/matrix-gui-touch-demos_2.0=
.bb
diff --git a/meta-arago-extras/recipes-core/matrix/matrix-gui-usb-demos_2=
.0.bb b/meta-arago-demos/recipes-core/matrix/matrix-gui-usb-demos_2.0.bb
similarity index 100%
rename from meta-arago-extras/recipes-core/matrix/matrix-gui-usb-demos_2.=
0.bb
rename to meta-arago-demos/recipes-core/matrix/matrix-gui-usb-demos_2.0.b=
b
diff --git a/meta-arago-extras/recipes-core/matrix/matrix-gui-utility-dem=
os_2.0.bb b/meta-arago-demos/recipes-core/matrix/matrix-gui-utility-demos=
_2.0.bb
similarity index 100%
rename from meta-arago-extras/recipes-core/matrix/matrix-gui-utility-demo=
s_2.0.bb
rename to meta-arago-demos/recipes-core/matrix/matrix-gui-utility-demos_2=
.0.bb
diff --git a/meta-arago-extras/recipes-core/matrix/matrix-gui-v4l2-demos_=
2.0.bb b/meta-arago-demos/recipes-core/matrix/matrix-gui-v4l2-demos_2.0.b=
b
similarity index 100%
rename from meta-arago-extras/recipes-core/matrix/matrix-gui-v4l2-demos_2=
.0.bb
rename to meta-arago-demos/recipes-core/matrix/matrix-gui-v4l2-demos_2.0.=
bb
diff --git a/meta-arago-extras/recipes-core/matrix/matrix-gui-video-analy=
tics-demos_2.0.bb b/meta-arago-demos/recipes-core/matrix/matrix-gui-video=
-analytics-demos_2.0.bb
similarity index 100%
rename from meta-arago-extras/recipes-core/matrix/matrix-gui-video-analyt=
ics-demos_2.0.bb
rename to meta-arago-demos/recipes-core/matrix/matrix-gui-video-analytics=
-demos_2.0.bb
diff --git a/meta-arago-extras/recipes-core/matrix/matrix-gui-wifi-demos_=
2.0.bb b/meta-arago-demos/recipes-core/matrix/matrix-gui-wifi-demos_2.0.b=
b
similarity index 100%
rename from meta-arago-extras/recipes-core/matrix/matrix-gui-wifi-demos_2=
.0.bb
rename to meta-arago-demos/recipes-core/matrix/matrix-gui-wifi-demos_2.0.=
bb
diff --git a/meta-arago-extras/recipes-core/matrix/matrix-gui/0001-execut=
e_command-Stop-matrix-when-running-a-GUI-demo.patch b/meta-arago-demos/re=
cipes-core/matrix/matrix-gui/0001-execute_command-Stop-matrix-when-runnin=
g-a-GUI-demo.patch
similarity index 100%
rename from meta-arago-extras/recipes-core/matrix/matrix-gui/0001-execute=
_command-Stop-matrix-when-running-a-GUI-demo.patch
rename to meta-arago-demos/recipes-core/matrix/matrix-gui/0001-execute_co=
mmand-Stop-matrix-when-running-a-GUI-demo.patch
diff --git a/meta-arago-extras/recipes-core/matrix/matrix-gui/0001-execut=
e_command-workaround-for-GUI-apps-with-weston.patch b/meta-arago-demos/re=
cipes-core/matrix/matrix-gui/0001-execute_command-workaround-for-GUI-apps=
-with-weston.patch
similarity index 100%
rename from meta-arago-extras/recipes-core/matrix/matrix-gui/0001-execute=
_command-workaround-for-GUI-apps-with-weston.patch
rename to meta-arago-demos/recipes-core/matrix/matrix-gui/0001-execute_co=
mmand-workaround-for-GUI-apps-with-weston.patch
diff --git a/meta-arago-extras/recipes-core/matrix/matrix-gui/init b/meta=
-arago-demos/recipes-core/matrix/matrix-gui/init
similarity index 100%
rename from meta-arago-extras/recipes-core/matrix/matrix-gui/init
rename to meta-arago-demos/recipes-core/matrix/matrix-gui/init
diff --git a/meta-arago-extras/recipes-core/matrix/matrix-gui/init.eglfs =
b/meta-arago-demos/recipes-core/matrix/matrix-gui/init.eglfs
similarity index 100%
rename from meta-arago-extras/recipes-core/matrix/matrix-gui/init.eglfs
rename to meta-arago-demos/recipes-core/matrix/matrix-gui/init.eglfs
diff --git a/meta-arago-extras/recipes-core/matrix/matrix-gui/matrix-gui-=
2.0.service b/meta-arago-demos/recipes-core/matrix/matrix-gui/matrix-gui-=
2.0.service
similarity index 100%
rename from meta-arago-extras/recipes-core/matrix/matrix-gui/matrix-gui-2=
.0.service
rename to meta-arago-demos/recipes-core/matrix/matrix-gui/matrix-gui-2.0.=
service
diff --git a/meta-arago-extras/recipes-core/matrix/matrix-gui/php.ini b/m=
eta-arago-demos/recipes-core/matrix/matrix-gui/php.ini
similarity index 100%
rename from meta-arago-extras/recipes-core/matrix/matrix-gui/php.ini
rename to meta-arago-demos/recipes-core/matrix/matrix-gui/php.ini
diff --git a/meta-arago-extras/recipes-core/matrix/matrix-gui_2.0.bb b/me=
ta-arago-demos/recipes-core/matrix/matrix-gui_2.0.bb
similarity index 100%
rename from meta-arago-extras/recipes-core/matrix/matrix-gui_2.0.bb
rename to meta-arago-demos/recipes-core/matrix/matrix-gui_2.0.bb
diff --git a/meta-arago-extras/recipes-core/matrix/matrix-lighttpd-config=
.bb b/meta-arago-demos/recipes-core/matrix/matrix-lighttpd-config.bb
similarity index 100%
rename from meta-arago-extras/recipes-core/matrix/matrix-lighttpd-config.=
bb
rename to meta-arago-demos/recipes-core/matrix/matrix-lighttpd-config.bb
diff --git a/meta-arago-extras/recipes-core/matrix/matrix-lighttpd-config=
/COPYING b/meta-arago-demos/recipes-core/matrix/matrix-lighttpd-config/CO=
PYING
similarity index 100%
rename from meta-arago-extras/recipes-core/matrix/matrix-lighttpd-config/=
COPYING
rename to meta-arago-demos/recipes-core/matrix/matrix-lighttpd-config/COP=
YING
diff --git a/meta-arago-extras/recipes-core/matrix/matrix-lighttpd-config=
/lighttpd.conf.matrix b/meta-arago-demos/recipes-core/matrix/matrix-light=
tpd-config/lighttpd.conf.matrix
similarity index 100%
rename from meta-arago-extras/recipes-core/matrix/matrix-lighttpd-config/=
lighttpd.conf.matrix
rename to meta-arago-demos/recipes-core/matrix/matrix-lighttpd-config/lig=
httpd.conf.matrix
diff --git a/meta-arago-extras/recipes-core/matrix/refresh-screen_2.0.bb =
b/meta-arago-demos/recipes-core/matrix/refresh-screen_2.0.bb
similarity index 100%
rename from meta-arago-extras/recipes-core/matrix/refresh-screen_2.0.bb
rename to meta-arago-demos/recipes-core/matrix/refresh-screen_2.0.bb
diff --git a/meta-arago-extras/recipes-qt/examples/qtwebbrowser_5.15.1.bb=
 b/meta-arago-demos/recipes-qt/examples/qtwebbrowser_5.15.1.bb
similarity index 100%
rename from meta-arago-extras/recipes-qt/examples/qtwebbrowser_5.15.1.bb
rename to meta-arago-demos/recipes-qt/examples/qtwebbrowser_5.15.1.bb
diff --git a/meta-arago-extras/conf/layer.conf b/meta-arago-extras/conf/l=
ayer.conf
index 6df62162..8c4b474e 100644
--- a/meta-arago-extras/conf/layer.conf
+++ b/meta-arago-extras/conf/layer.conf
@@ -20,22 +20,6 @@ LAYERDEPENDS_meta-arago-extras =3D " \
     meta-ti-bsp \
     meta-ti-extras \
     openembedded-layer \
-    networking-layer \
-    meta-python \
-    arm-toolchain \
-    qt5-layer \
-"
-
-SIGGEN_EXCLUDE_SAFE_RECIPE_DEPS +=3D " \
-    matrix-gui-multimedia-demos->amsdk-av-files \
-    matrix-gui-oprofile-demos->oprofile \
-    matrix-gui-oprofile-demos->oprofile-example \
-    matrix-gui-usb-demos->bonnie++ \
-    matrix-gui-armbenchmarks-demos->arm-benchmarks \
-    matrix-gui-armbenchmarks-demos->lmbench \
-    matrix-gui-armbenchmarks-demos->nbench-byte \
-    matrix-gui-machinevision-demos->point-cloud-viewer \
-    matrix-lighttpd-config->lighttpd \
 "
=20
 SIGGEN_EXCLUDERECIPES_ABISAFE +=3D " \
--=20
2.25.1


