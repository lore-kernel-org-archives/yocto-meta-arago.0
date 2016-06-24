Return-Path: <denis@denix.org>
Received: from vms173019pub.verizon.net (vms173019pub.verizon.net
	[206.46.173.19])
	by arago-project.org (Postfix) with ESMTPS id 4D6BB52A63
	for <meta-arago@arago-project.org>;
	Fri, 24 Jun 2016 20:21:51 +0000 (UTC)
Received: from vz-proxy-m002.mx.aol.com ([64.236.83.3])
	by vms173019.mailsrvcs.net
	(Oracle Communications Messaging Server 7.0.5.32.0 64bit (built Jul 16
	2014)) with ESMTPA id <0O9A008LBLVZHWA0@vms173019.mailsrvcs.net> for
	meta-arago@arago-project.org; Fri, 24 Jun 2016 15:21:36 -0500 (CDT)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.1 cv=WcjxEBVX c=1 sm=1 tr=0	a=yQ9kT6OsLgv7WE5tBE7I5g==:117
	a=pD_ry4oyNxEA:10 a=sozttTNsAAAA:8	a=Xq3lYmhOQ7c8x-E2JVsA:9
Received: by 100.15.86.14 with SMTP id 5e31c704; Fri, 24 Jun 2016 20:21:35 GMT
Received: from elrond.denix (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id 37049162078;	Fri,
	24 Jun 2016 16:21:35 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Fri, 24 Jun 2016 16:21:32 -0400
Message-id: <20160624202133.19795-1-denis@denix.org>
X-Mailer: git-send-email 2.9.0
Subject: [PATCH 1/2] glsdk-example-apps: now depends on libdce
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
X-List-Received-Date: Fri, 24 Jun 2016 20:21:51 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 .../recipes-graphics/glsdk-example-apps/glsdk-example-apps.bb         | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-arago-extras/recipes-graphics/glsdk-example-apps/glsdk-example-apps.bb b/meta-arago-extras/recipes-graphics/glsdk-example-apps/glsdk-example-apps.bb
index 349c1ec..ab12589 100644
--- a/meta-arago-extras/recipes-graphics/glsdk-example-apps/glsdk-example-apps.bb
+++ b/meta-arago-extras/recipes-graphics/glsdk-example-apps/glsdk-example-apps.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "http://git.ti.com/glsdk"
 LICENSE = "BSD"
 LIC_FILES_CHKSUM = "file://COPYING;md5=10a9abb9c5bb19edd83a8cf66eef7148"
 
-DEPENDS = "gstreamer1.0 libdrm ti-ipc wayland weston"
+DEPENDS = "gstreamer1.0 libdrm libdce ti-ipc wayland weston"
 
 COMPATIBLE_MACHINE = "dra7xx"
 
@@ -16,7 +16,7 @@ SRC_URI = "git://git.ti.com/glsdk/example-applications.git;protocol=git \
 
 SRCREV = "bdc4887134325fc6c83815005d5f36edbc577255"
 
-PR = "r42"
+PR = "r43"
 
 do_install_append () {
     install -d ${D}${sysconfdir}/glsdkstatcoll
-- 
2.9.0


