Return-Path: <fcooper@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by arago-project.org (Postfix) with ESMTPS id 3115852099
	for <meta-arago@arago-project.org>;
	Wed, 21 Jan 2015 16:29:48 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id t0LGTlG2023191
	for <meta-arago@arago-project.org>; Wed, 21 Jan 2015 10:29:47 -0600
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id t0LGTlnm031318
	for <meta-arago@arago-project.org>; Wed, 21 Jan 2015 10:29:47 -0600
Received: from dlep32.itg.ti.com (157.170.170.100) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.3.174.1;
	Wed, 21 Jan 2015 10:29:46 -0600
Received: from dbdmail01.india.ti.com (dbdmail01.india.ti.com
	[172.24.162.206])	by dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	t0LGTjFU012142;	Wed, 21 Jan 2015 10:29:46 -0600
Received: from sdit-build02.dal.design.ti.com (sdit-build02.dal.design.ti.com
	[10.247.66.5])	by dbdmail01.india.ti.com (8.14.3/8.14.3/SuSE Linux
	0.8) with ESMTP id t0LGThuF003199;	Wed, 21 Jan 2015 21:59:44 +0530
From: "Franklin S. Cooper Jr" <fcooper@ti.com>
To: <meta-arago@arago-project.org>
Date: Wed, 21 Jan 2015 10:29:41 -0600
Message-ID: <1421857781-32763-1-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Cc: "Franklin S. Cooper Jr" <fcooper@ti.com>
Subject: [PATCH] nativesdk-qt4-tools: Add -no-pch to configure to fix build errors
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
X-List-Received-Date: Wed, 21 Jan 2015 16:29:48 -0000
Content-Type: text/plain

From: "Franklin S. Cooper Jr" <fcooper@ti.com>

* Nativesdk-qt4-tools has been failing with many errors similar to the ones
  below :

  <long path>/stdc-predef.h:59:1: error: use -Winvalid-pch for more information
  <long path>/stdc-predef.h:59:1: fatal error:
                .pch/release-static-emb-auto/QtCore: No such file or directory

* Based on http://qt-project.org/forums/viewthread/26781 and looking at the
  main Qt 4 recipe this error can be fixed by disabling pch by passing -no-pch
  to configure.

Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
---
 .../qt4/nativesdk-qt4-tools_4.8.5.bbappend         |    4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta-arago-distro/recipes-qt/qt4/nativesdk-qt4-tools_4.8.5.bbappend b/meta-arago-distro/recipes-qt/qt4/nativesdk-qt4-tools_4.8.5.bbappend
index 6296fbe..8391cdd 100644
--- a/meta-arago-distro/recipes-qt/qt4/nativesdk-qt4-tools_4.8.5.bbappend
+++ b/meta-arago-distro/recipes-qt/qt4/nativesdk-qt4-tools_4.8.5.bbappend
@@ -1,7 +1,9 @@
-PR_append = "-arago2"
+PR_append = "-arago3"
 
 # Qt/E from Nokia is dual-licensed (LGPLv2.1 or GPLv3)
 # For our distribution purposes we only use LGPLv2.1
 LICENSE = "LGPLv2.1"
 
 DEPENDS := "${@oe_filter_out('nativesdk-libx11', '${DEPENDS}', d)}"
+
+EXTRA_OECONF += " -no-pch"
-- 
1.7.9.5


