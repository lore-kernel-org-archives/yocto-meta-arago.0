Return-Path: <denis@denix.org>
Received: from vms173013pub.verizon.net (vms173013pub.verizon.net
	[206.46.173.13])
	by arago-project.org (Postfix) with ESMTPS id 08EF0529BF
	for <meta-arago@arago-project.org>;
	Tue,  7 Jun 2016 23:19:22 +0000 (UTC)
Received: from vz-proxy-m005.mx.aol.com ([64.236.83.15])
	by vms173013.mailsrvcs.net
	(Oracle Communications Messaging Server 7.0.5.32.0 64bit (built Jul 16
	2014)) with ESMTPA id <0O8F00BMTCRU7J70@vms173013.mailsrvcs.net> for
	meta-arago@arago-project.org; Tue, 07 Jun 2016 18:19:06 -0500 (CDT)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.1 cv=MtGvkDue c=1 sm=1 tr=0	a=NimJJ1rWho3RDXpqkQh0Zg==:117
	a=pD_ry4oyNxEA:10 a=sozttTNsAAAA:8	a=x5BwiFZGAAAA:8
	a=qnY5220AgA0-XhASMcAA:9
Received: by 100.15.86.14 with SMTP id 75d3c3cd; Tue, 07 Jun 2016 23:19:06 GMT
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id 26CFE162042;	Tue,
	7 Jun 2016 19:19:06 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Tue, 07 Jun 2016 19:19:05 -0400
Message-id: <1465341545-20646-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.2.0
Subject: [PATCH] libdce: moved to meta-ti
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
X-List-Received-Date: Tue, 07 Jun 2016 23:19:22 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 .../recipes-multimedia/libdce/libdce_3.00.10.01.bb          | 13 -------------
 1 file changed, 13 deletions(-)
 delete mode 100644 meta-arago-extras/recipes-multimedia/libdce/libdce_3.00.10.01.bb

diff --git a/meta-arago-extras/recipes-multimedia/libdce/libdce_3.00.10.01.bb b/meta-arago-extras/recipes-multimedia/libdce/libdce_3.00.10.01.bb
deleted file mode 100644
index aa61cb6..0000000
--- a/meta-arago-extras/recipes-multimedia/libdce/libdce_3.00.10.01.bb
+++ /dev/null
@@ -1,13 +0,0 @@
-DESCRIPTION = "Library used for remotely invoking the hw accelerated codec on IVA-HD"
-LICENSE = "BSD"
-LIC_FILES_CHKSUM = "file://libdce.h;beginline=1;endline=31;md5=0a398cf815b8b5f31f552266cd453dae"
-
-inherit autotools pkgconfig
-
-DEPENDS = "libdrm ti-ipc"
-
-SRC_URI = "git://git.omapzoom.org/repo/libdce.git;protocol=git"
-SRCREV = "4e9b02508ac3847df0af5c496a1be7b4ae082ad5"
-
-S = "${WORKDIR}/git"
-EXTRA_OECONF += "IPC_HEADERS=${STAGING_INCDIR}/ti/ipc/mm"
-- 
2.2.0


