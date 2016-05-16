Return-Path: <denis@denix.org>
Received: from vms173007pub.verizon.net (vms173007pub.verizon.net
	[206.46.173.7])
	by arago-project.org (Postfix) with ESMTPS id 5442852960
	for <meta-arago@arago-project.org>;
	Mon, 16 May 2016 14:54:41 +0000 (UTC)
Received: from vz-proxy-l007.mx.aol.com ([64.236.82.157])
	by vms173007.mailsrvcs.net
	(Oracle Communications Messaging Server 7.0.5.32.0 64bit (built Jul 16
	2014)) with ESMTPA id <0O7900EU9YQ4Z350@vms173007.mailsrvcs.net> for
	meta-arago@arago-project.org; Mon, 16 May 2016 09:54:15 -0500 (CDT)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.1 cv=WcjxEBVX c=1 sm=1 tr=0	a=EDyElNE8DnJcdewKkuvZJw==:117
	a=yrkiwgmsf1kA:10 a=sozttTNsAAAA:8	a=lkVzk8pQizLTPdLuMyIA:9
Received: by 100.15.86.14 with SMTP id 0861f527; Mon, 16 May 2016 14:54:15 GMT
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id 46C1B162005;	Mon,
	16 May 2016 10:54:04 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Mon, 16 May 2016 10:54:03 -0400
Message-id: <1463410443-29957-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.2.0
Subject: [PATCH] opencv: temporary fix for locale pkg dependency until fixed upstream
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
X-List-Received-Date: Mon, 16 May 2016 14:54:41 -0000

From: Denys Dmytriyenko <denys@ti.com>

The backported fix has been submitted to krogoth, but not yet pulled.

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 meta-arago-distro/recipes-support/opencv/opencv_%.bbappend | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta-arago-distro/recipes-support/opencv/opencv_%.bbappend b/meta-arago-distro/recipes-support/opencv/opencv_%.bbappend
index 6d60a2f..7298a01 100644
--- a/meta-arago-distro/recipes-support/opencv/opencv_%.bbappend
+++ b/meta-arago-distro/recipes-support/opencv/opencv_%.bbappend
@@ -1,7 +1,8 @@
-PACKAGECONFIG_append= " ${@bb.utils.contains("DISTRO_FEATURES", "wayland", "qtwayland", "", d)}"
+PACKAGECONFIG_append = "${@bb.utils.contains("DISTRO_FEATURES", "wayland", " qtwayland", "", d)}"
 
 PACKAGECONFIG[qtwayland] = "-DWITH_QT=ON,-DWITH_QT=OFF,qtwayland,"
 
 inherit cmake_qt5
 
 ALLOW_EMPTY_${PN}-java = "1"
+ALLOW_EMPTY_${PN}-locale = "1"
-- 
2.2.0


