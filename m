Return-Path: <chase.maupin@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by arago-project.org (Postfix) with ESMTPS id 7D1DF52A59
	for <meta-arago@arago-project.org>;
	Tue, 31 Jan 2012 20:14:16 +0000 (UTC)
Received: from dbdp20.itg.ti.com ([172.24.170.38])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id q0VKEDHr016442
	for <meta-arago@arago-project.org>; Tue, 31 Jan 2012 14:14:14 -0600
Received: from DBDE71.ent.ti.com (localhost [127.0.0.1])
	by dbdp20.itg.ti.com (8.13.8/8.13.8) with ESMTP id q0VKEChr026126
	for <meta-arago@arago-project.org>; Wed, 1 Feb 2012 01:44:12 +0530 (IST)
Received: from dbdp31.itg.ti.com (172.24.170.98) by DBDE71.ent.ti.com
	(172.24.170.149) with Microsoft SMTP Server id 14.1.323.3;
	Wed, 1 Feb 2012 01:44:12 +0530
Received: from localhost.localdomain (dbdp20.itg.ti.com [172.24.170.38])	by
	dbdp31.itg.ti.com (8.13.8/8.13.8) with ESMTP id q0VKEA7F026132;
	Wed, 1 Feb 2012 01:44:11 +0530 (IST)
From: Chase Maupin <Chase.Maupin@ti.com>
To: <meta-arago@arago-project.org>
Date: Tue, 31 Jan 2012 14:14:08 -0600
Message-ID: <1328040848-29090-1-git-send-email-Chase.Maupin@ti.com>
X-Mailer: git-send-email 1.7.0.4
MIME-Version: 1.0
Subject: [PATCH] qt4-embedded: append qt4-embedded LICENSE setting
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
X-List-Received-Date: Tue, 31 Jan 2012 20:14:18 -0000
Content-Type: text/plain

* Append the qt4-embedded LICENSE field to LGPLv2.1 to reflect
  the license we are distributing this under.
* This is similar to the amend used in the old arago overlay

Signed-off-by: Chase Maupin <Chase.Maupin@ti.com>
---
 .../qt4/qt4-embedded_4.8.0.bbappend                |    5 +++++
 1 files changed, 5 insertions(+), 0 deletions(-)
 create mode 100644 meta-arago-distro/recipes-bbappends/qt4/qt4-embedded_4.8.0.bbappend

diff --git a/meta-arago-distro/recipes-bbappends/qt4/qt4-embedded_4.8.0.bbappend b/meta-arago-distro/recipes-bbappends/qt4/qt4-embedded_4.8.0.bbappend
new file mode 100644
index 0000000..462a746
--- /dev/null
+++ b/meta-arago-distro/recipes-bbappends/qt4/qt4-embedded_4.8.0.bbappend
@@ -0,0 +1,5 @@
+# Qt/E from Nokia is dual-licensed (LGPLv2.1 or GPLv3)
+# For our distribution purposes we only use LGPLv2.1
+LICENSE = "LGPLv2.1"
+
+PR_append = "-arago1"
-- 
1.7.0.4


