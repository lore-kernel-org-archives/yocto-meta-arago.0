Return-Path: <a0866934local@udb0866934>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by arago-project.org (Postfix) with ESMTPS id 60C3652981
	for <meta-arago@arago-project.org>;
	Tue, 12 Aug 2014 13:00:31 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id s7CD0Uqw017994
	for <meta-arago@arago-project.org>; Tue, 12 Aug 2014 08:00:30 -0500
Received: from DLEE70.ent.ti.com (dlemailx.itg.ti.com [157.170.170.113])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id s7CD0U2U009301
	for <meta-arago@arago-project.org>; Tue, 12 Aug 2014 08:00:30 -0500
Received: from dflp33.itg.ti.com (10.64.6.16) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.3.174.1;
	Tue, 12 Aug 2014 08:00:24 -0500
Received: from udb0866934 (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id s7CD0OiH013644;
	Tue, 12 Aug 2014 08:00:24 -0500
Received: from a0866934local by udb0866934 with local (Exim 4.76)
	(envelope-from <a0866934local@udb0866934>)	id 1XHBge-000153-0C;
	Tue, 12 Aug 2014 09:00:24 -0400
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-arago@arago-project.org>
Date: Tue, 12 Aug 2014 09:00:17 -0400
Message-ID: <1407848417-4123-1-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [PATCH] evtest - update checksums
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
X-List-Received-Date: Tue, 12 Aug 2014 13:00:31 -0000
Content-Type: text/plain

* The checksums no longer matched and caused a fetch error.

This patch has been submitted to upstream meta-oe and when accepted the append can be removed.

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
 .../recipes-support/evtest/evtest_1.25.bbappend    |    4 ++++
 1 file changed, 4 insertions(+)
 create mode 100644 meta-arago-extras/recipes-support/evtest/evtest_1.25.bbappend

diff --git a/meta-arago-extras/recipes-support/evtest/evtest_1.25.bbappend b/meta-arago-extras/recipes-support/evtest/evtest_1.25.bbappend
new file mode 100644
index 0000000..1c3b257
--- /dev/null
+++ b/meta-arago-extras/recipes-support/evtest/evtest_1.25.bbappend
@@ -0,0 +1,4 @@
+PR_append = "-arago0"
+
+SRC_URI[archive.md5sum] = "0ef3fe5e20fa2dee8994827d48482902"
+SRC_URI[archive.sha256sum] = "6e93ef54f0aa7d263f5486ce4a14cac53cf50036bfd20cf045fef2b27ee6664b"
-- 
1.7.9.5


