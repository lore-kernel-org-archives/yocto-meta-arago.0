Return-Path: <sam.nelson@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by arago-project.org (Postfix) with ESMTPS id 010C652A43
	for <meta-arago@arago-project.org>;
	Thu, 12 Mar 2015 02:23:42 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id t2C2Ngii021882
	for <meta-arago@arago-project.org>; Wed, 11 Mar 2015 21:23:42 -0500
Received: from DLEE70.ent.ti.com (dlemailx.itg.ti.com [157.170.170.113])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id t2C2Nf96030048
	for <meta-arago@arago-project.org>; Wed, 11 Mar 2015 21:23:41 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.3.224.2;
	Wed, 11 Mar 2015 21:23:41 -0500
Received: from udb0862859.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	t2C2NcZm013371;	Wed, 11 Mar 2015 21:23:41 -0500
From: Sam Nelson <sam.nelson@ti.com>
To: <meta-arago@arago-project.org>
Date: Wed, 11 Mar 2015 22:23:33 -0400
Message-ID: <1426127016-21527-2-git-send-email-sam.nelson@ti.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1426127016-21527-1-git-send-email-sam.nelson@ti.com>
References: <1426127016-21527-1-git-send-email-sam.nelson@ti.com>
MIME-Version: 1.0
Subject: [PATCH 2/5] makedumpfile: Add makedumpfile tool
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
X-List-Received-Date: Thu, 12 Mar 2015 02:23:43 -0000
Content-Type: text/plain

From: Hao Zhang <hzhang@ti.com>

- Add makedumpfile tool to shorten the dumpfile of kdump.

Signed-off-by: Hao Zhang <hzhang@ti.com>
Signed-off-by: Sam Nelson <sam.nelson@ti.com>
---
 .../makedumpfile/makedumpfile_1.5.0.bb             |   18 ++++++++++++++++++
 1 file changed, 18 insertions(+)
 create mode 100644 meta-arago-extras/recipes-support/makedumpfile/makedumpfile_1.5.0.bb

diff --git a/meta-arago-extras/recipes-support/makedumpfile/makedumpfile_1.5.0.bb b/meta-arago-extras/recipes-support/makedumpfile/makedumpfile_1.5.0.bb
new file mode 100644
index 0000000..59dbaba
--- /dev/null
+++ b/meta-arago-extras/recipes-support/makedumpfile/makedumpfile_1.5.0.bb
@@ -0,0 +1,18 @@
+DESCRIPTION = "Make dump file utility"
+LICENSE = "GPLv2"
+
+LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
+
+SRC_URI = "http://sourceforge.net/projects/makedumpfile/files/makedumpfile/1.5.0/makedumpfile-${PV}.tar.gz;name=makedumpfile"
+
+SRC_URI[makedumpfile.md5sum] = "e22277d77752c71525a79eab148abf55"
+SRC_URI[makedumpfile.sha256sum] = "8a771a22c6ba79dc505e55727f0cfd357ccb3c97defe21cefd5a67b64452fca7"
+
+DEPENDS = "zlib elfutils bzip2"
+
+EXTRA_OEMAKE = "TARGET=${TARGET_ARCH}"
+
+do_install() {
+	install -d ${D}${bindir}/
+	install -c -m 755 ${S}/makedumpfile ${D}${bindir}/
+}
-- 
1.7.9.5


