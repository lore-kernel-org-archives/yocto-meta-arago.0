Return-Path: <a0273011@sdit-build02.dal.design.ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by arago-project.org (Postfix) with ESMTPS id 11C64529A1
	for <meta-arago@arago-project.org>;
	Mon, 13 Aug 2012 19:53:52 +0000 (UTC)
Received: from dlelxv30.itg.ti.com ([172.17.2.17])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id q7DJrobl005660
	for <meta-arago@arago-project.org>; Mon, 13 Aug 2012 14:53:50 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dlelxv30.itg.ti.com (8.13.8/8.13.8) with ESMTP id q7DJrowl029151
	for <meta-arago@arago-project.org>; Mon, 13 Aug 2012 14:53:50 -0500
Received: from dlelxv22.itg.ti.com (172.17.1.197) by dfle72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.1.323.3;
	Mon, 13 Aug 2012 14:53:50 -0500
Received: from sdit-build02.dal.design.ti.com (sdit-build02.dal.design.ti.com
	[10.247.66.5])	by dlelxv22.itg.ti.com (8.13.8/8.13.8) with ESMTP id
	q7DJroPD000924;	Mon, 13 Aug 2012 14:53:50 -0500
Received: from a0273011 by sdit-build02.dal.design.ti.com with local (Exim
	4.71)	(envelope-from <a0273011@sdit-build02.dal.design.ti.com>)	id
	1T10qX-00081u-UE; Mon, 13 Aug 2012 15:02:41 -0500
From: Franklin S Cooper Jr <fcooper@ti.com>
To: <meta-arago@arago-project.org>
Date: Mon, 13 Aug 2012 15:02:38 -0500
Message-ID: <1344888158-30832-1-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.0.4
MIME-Version: 1.0
Cc: Franklin S Cooper Jr <fcooper@ti.com>
Subject: [PATCH v2] dbus: Set License to GPLv2+
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
X-List-Received-Date: Mon, 13 Aug 2012 19:53:52 -0000
Content-Type: text/plain

* GPLv2+ is the preferred license to distribute under in the Arago
  distribution if a choice of which license to use is given.

Signed-off-by: Franklin S Cooper Jr <fcooper@ti.com>
---
 .../recipes-core/dbus/dbus_1.4.16.bbappend         |    3 +++
 1 files changed, 3 insertions(+), 0 deletions(-)
 create mode 100644 meta-arago-distro/recipes-core/dbus/dbus_1.4.16.bbappend

diff --git a/meta-arago-distro/recipes-core/dbus/dbus_1.4.16.bbappend b/meta-arago-distro/recipes-core/dbus/dbus_1.4.16.bbappend
new file mode 100644
index 0000000..6641cb5
--- /dev/null
+++ b/meta-arago-distro/recipes-core/dbus/dbus_1.4.16.bbappend
@@ -0,0 +1,3 @@
+PR_append = "-arago0"
+
+LICENSE = "GPLv2+"
-- 
1.7.7


