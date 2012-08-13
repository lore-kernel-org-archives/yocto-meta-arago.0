Return-Path: <a0273011@sdit-build02.dal.design.ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by arago-project.org (Postfix) with ESMTPS id 8C502529EF
	for <meta-arago@arago-project.org>;
	Mon, 13 Aug 2012 18:17:41 +0000 (UTC)
Received: from dlelxv30.itg.ti.com ([172.17.2.17])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id q7DIHeFG011124
	for <meta-arago@arago-project.org>; Mon, 13 Aug 2012 13:17:40 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dlelxv30.itg.ti.com (8.13.8/8.13.8) with ESMTP id q7DIHeWG002667
	for <meta-arago@arago-project.org>; Mon, 13 Aug 2012 13:17:40 -0500
Received: from dlelxv22.itg.ti.com (172.17.1.197) by dfle72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.1.323.3;
	Mon, 13 Aug 2012 13:17:40 -0500
Received: from sdit-build02.dal.design.ti.com (sdit-build02.dal.design.ti.com
	[10.247.66.5])	by dlelxv22.itg.ti.com (8.13.8/8.13.8) with ESMTP id
	q7DIHeKl012271;	Mon, 13 Aug 2012 13:17:40 -0500
Received: from a0273011 by sdit-build02.dal.design.ti.com with local (Exim
	4.71)	(envelope-from <a0273011@sdit-build02.dal.design.ti.com>)	id
	1T0zLS-0006DI-Ex; Mon, 13 Aug 2012 13:26:30 -0500
From: Franklin S Cooper Jr <fcooper@ti.com>
To: <meta-arago@arago-project.org>
Date: Mon, 13 Aug 2012 13:26:29 -0500
Message-ID: <1344882389-23852-1-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.0.4
MIME-Version: 1.0
Cc: Franklin S Cooper Jr <fcooper@ti.com>
Subject: [PATCH] dbus: Set License to GPLv2+ Signed-off-by: Franklin S Cooper Jr <fcooper@ti.com>
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
X-List-Received-Date: Mon, 13 Aug 2012 18:17:41 -0000
Content-Type: text/plain

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
1.7.0.4


