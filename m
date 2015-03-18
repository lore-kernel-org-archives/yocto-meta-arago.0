Return-Path: <karthik.ramanan@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by arago-project.org (Postfix) with ESMTPS id 784DE52A77
	for <meta-arago@arago-project.org>;
	Wed, 18 Mar 2015 12:38:33 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id t2ICcWrH003963
	for <meta-arago@arago-project.org>; Wed, 18 Mar 2015 07:38:32 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id t2ICcVFF002857
	for <meta-arago@arago-project.org>; Wed, 18 Mar 2015 07:38:31 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.3.224.2;
	Wed, 18 Mar 2015 07:38:31 -0500
Received: from swubn01.india.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
	by dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id t2ICcTIk026374;
	Wed, 18 Mar 2015 07:38:30 -0500
From: Karthik Ramanan <a0393906@ti.com>
To: <meta-arago@arago-project.org>
Date: Wed, 18 Mar 2015 18:08:28 +0530
Message-ID: <1426682308-13821-1-git-send-email-a0393906@ti.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: glsdk-example-apps: Update SRCREV for GLSDK 7.00 EA
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
X-List-Received-Date: Wed, 18 Mar 2015 12:38:33 -0000
Content-Type: text/plain

This contains updates to several test applications.
Some of the important changes are:

 * gsttestplayer: Adaptation to GST 1.x
 * vip: Fixed configure and Makefile
 * configure: Provide option to disable gst tests
 * sensor-cfg: Application to configure sensors from user space
 * testvpe: Add RGB565 support
 * testvpe: Add support for SEQ_TB buffers

Signed-off-by: Karthik Ramanan <a0393906@ti.com>
---
 .../glsdk-example-apps/glsdk-example-apps.bb       |    6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta-arago-extras/recipes-graphics/glsdk-example-apps/glsdk-example-apps.bb b/meta-arago-extras/recipes-graphics/glsdk-example-apps/glsdk-example-apps.bb
index a6b45b8..deb5ccd 100644
--- a/meta-arago-extras/recipes-graphics/glsdk-example-apps/glsdk-example-apps.bb
+++ b/meta-arago-extras/recipes-graphics/glsdk-example-apps/glsdk-example-apps.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "http://git.ti.com/glsdk"
 LICENSE = "BSD"
 LIC_FILES_CHKSUM = "file://COPYING;md5=10a9abb9c5bb19edd83a8cf66eef7148"
 
-DEPENDS = "gstreamer libdrm ti-ipc"
+DEPENDS = "gstreamer1.0 libdrm ti-ipc"
 
 COMPATIBLE_MACHINE = "dra7xx-evm"
 
@@ -12,6 +12,6 @@ S = "${WORKDIR}/git"
 inherit autotools pkgconfig
 
 SRC_URI = "git://git.ti.com/glsdk/example-applications.git;protocol=git"
-SRCREV = "a21dd98d5686a6c4563f89966cb459158085dd1b"
+SRCREV = "ac71e62ec2bd4c94cd73f24fcf0fc8f4f2876dc8"
 
-PR = "r1"
+PR = "r2"
-- 
1.7.9.5


