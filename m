Return-Path: <h-gou@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by arago-project.org (Postfix) with ESMTPS id 41BF05208B
	for <meta-arago@arago-project.org>;
	Wed,  3 Feb 2016 20:42:59 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id u13KgvCc014574
	for <meta-arago@arago-project.org>; Wed, 3 Feb 2016 14:42:57 -0600
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id u13Kgv8U014194
	for <meta-arago@arago-project.org>; Wed, 3 Feb 2016 14:42:57 -0600
Received: from dlep32.itg.ti.com (157.170.170.100) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.3.224.2;
	Wed, 3 Feb 2016 14:42:56 -0600
Received: from uda0271529.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	u13Kgu00005748;	Wed, 3 Feb 2016 14:42:56 -0600
From: Hongmei Gou <h-gou@ti.com>
To: <meta-arago@arago-project.org>
Date: Wed, 3 Feb 2016 15:42:54 -0500
Message-ID: <1454532174-3980-1-git-send-email-h-gou@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH] qtmultimedia: add gstreamer in PACKAGECONFIG to enable video
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
X-List-Received-Date: Wed, 03 Feb 2016 20:43:03 -0000
Content-Type: text/plain

Signed-off-by: Hongmei Gou <h-gou@ti.com>
---
 meta-arago-distro/recipes-qt/qt5/qtmultimedia_%.bbappend | 5 +++++
 1 file changed, 5 insertions(+)
 create mode 100644 meta-arago-distro/recipes-qt/qt5/qtmultimedia_%.bbappend

diff --git a/meta-arago-distro/recipes-qt/qt5/qtmultimedia_%.bbappend b/meta-arago-distro/recipes-qt/qt5/qtmultimedia_%.bbappend
new file mode 100644
index 0000000..f164f6e
--- /dev/null
+++ b/meta-arago-distro/recipes-qt/qt5/qtmultimedia_%.bbappend
@@ -0,0 +1,5 @@
+PR_append = "-arago0"
+
+PACKAGECONFIG ??= "gstreamer \
+                   ${@bb.utils.contains('DISTRO_FEATURES', 'alsa', 'alsa', '', d)} \
+                   ${@bb.utils.contains('DISTRO_FEATURES', 'pulseaudio', 'pulseaudio', '', d)}"
-- 
1.9.1


