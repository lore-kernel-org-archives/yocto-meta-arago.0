Return-Path: <fcooper@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by arago-project.org (Postfix) with ESMTPS id CE0C752A38
	for <meta-arago@arago-project.org>;
	Thu,  1 Aug 2013 00:07:13 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id r7107Ctu030615
	for <meta-arago@arago-project.org>; Wed, 31 Jul 2013 19:07:12 -0500
Received: from DLEE70.ent.ti.com (dlee70.ent.ti.com [157.170.170.113])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id r7107CAJ010054
	for <meta-arago@arago-project.org>; Wed, 31 Jul 2013 19:07:12 -0500
Received: from dlelxv23.itg.ti.com (172.17.1.198) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.2.342.3;
	Wed, 31 Jul 2013 19:07:12 -0500
Received: from localhost.localdomain (dbdp20.itg.ti.com [172.24.170.38])	by
	dlelxv23.itg.ti.com (8.13.8/8.13.8) with ESMTP id r71079R7032028;
	Wed, 31 Jul 2013 19:07:11 -0500
From: "Franklin S. Cooper Jr" <fcooper@ti.com>
To: <meta-arago@arago-project.org>
Date: Wed, 31 Jul 2013 19:31:46 -0500
Message-ID: <1375317112-1690-1-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.0.4
MIME-Version: 1.0
Cc: "Franklin S. Cooper Jr" <fcooper@ti.com>
Subject: [master & danny][PATCH 1/7] linux-libc-headers: Add linux-libc-headers version 2.6.33
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
X-List-Received-Date: Thu, 01 Aug 2013 00:07:14 -0000
Content-Type: text/plain

* This is the version that was originally being using in arago/oe-classic based
  SDK.

Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
---
 .../linux-libc-headers_2.6.33.bb                   |   10 ++++++++++
 1 files changed, 10 insertions(+), 0 deletions(-)
 create mode 100644 meta-arago-extras/recipes-kernel/linux-libc-headers/linux-libc-headers_2.6.33.bb

diff --git a/meta-arago-extras/recipes-kernel/linux-libc-headers/linux-libc-headers_2.6.33.bb b/meta-arago-extras/recipes-kernel/linux-libc-headers/linux-libc-headers_2.6.33.bb
new file mode 100644
index 0000000..eb8cb19
--- /dev/null
+++ b/meta-arago-extras/recipes-kernel/linux-libc-headers/linux-libc-headers_2.6.33.bb
@@ -0,0 +1,10 @@
+require recipes-kernel/linux-libc-headers/linux-libc-headers.inc
+
+FILESEXTRAPATHS_append := "${THISDIR}/${PN}:${COREBASE}/meta/recipes-kernel/linux-libc-headers/${PN}"
+
+PR = "r0"
+
+SRC_URI += " file://connector-msg-size-fix.patch"
+SRC_URI[md5sum] = "c3883760b18d50e8d78819c54d579b00"
+SRC_URI[sha256sum] = "63e237de3b3c4c46a21833b9ce7e20574548d52dabbd1a8bf376041e4455d5c6"
+
-- 
1.7.0.4


