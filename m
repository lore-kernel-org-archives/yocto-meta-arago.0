Return-Path: <denis@denix.org>
Received: from vms173023pub.verizon.net (vms173023pub.verizon.net
	[206.46.173.23])
	by arago-project.org (Postfix) with ESMTPS id 60E5F529EF
	for <meta-arago@arago-project.org>;
	Tue, 21 Jun 2016 04:47:56 +0000 (UTC)
Received: from vz-proxy-m001.mx.aol.com ([64.236.83.14])
	by vms173023.mailsrvcs.net
	(Oracle Communications Messaging Server 7.0.5.32.0 64bit (built Jul 16
	2014)) with ESMTPA id <0O9300MQ7UNJMV40@vms173023.mailsrvcs.net> for
	meta-arago@arago-project.org; Mon, 20 Jun 2016 23:47:44 -0500 (CDT)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.1 cv=J+9Xl1TS c=1 sm=1 tr=0	a=MJxOpqxZADbEbEImuSX/mw==:117
	a=pD_ry4oyNxEA:10 a=sozttTNsAAAA:8	a=nXq6KTlrk6CEIr2grw8A:9
Received: by 100.15.86.14 with SMTP id 044da22a; Tue, 21 Jun 2016 04:47:44 GMT
Received: from elrond.denix (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id 488F1162044;	Tue,
	21 Jun 2016 00:47:43 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Tue, 21 Jun 2016 00:47:42 -0400
Message-id: <20160621044742.26307-1-denis@denix.org>
X-Mailer: git-send-email 2.9.0
Subject: [PATCH] glsdk-example-apps: add dependency for wayland and weston
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
X-List-Received-Date: Tue, 21 Jun 2016 04:47:56 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 .../glsdk-example-apps/glsdk-example-apps.bb       |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-arago-extras/recipes-graphics/glsdk-example-apps/glsdk-example-apps.bb b/meta-arago-extras/recipes-graphics/glsdk-example-apps/glsdk-example-apps.bb
index 07d702b..fe44f1d 100644
--- a/meta-arago-extras/recipes-graphics/glsdk-example-apps/glsdk-example-apps.bb
+++ b/meta-arago-extras/recipes-graphics/glsdk-example-apps/glsdk-example-apps.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "http://git.ti.com/glsdk"
 LICENSE = "BSD"
 LIC_FILES_CHKSUM = "file://COPYING;md5=10a9abb9c5bb19edd83a8cf66eef7148"
 
-DEPENDS = "gstreamer1.0 libdrm ti-ipc"
+DEPENDS = "gstreamer1.0 libdrm ti-ipc wayland weston"
 
 COMPATIBLE_MACHINE = "dra7xx"
 
@@ -16,7 +16,7 @@ SRC_URI = "git://git.ti.com/glsdk/example-applications.git;protocol=git \
 
 SRCREV = "4dcbca6bf486b0331781014c463225e927e1f464"
 
-PR = "r40"
+PR = "r41"
 
 do_install_append () {
     install -d ${D}${sysconfdir}/glsdkstatcoll
-- 
1.7.9.5


