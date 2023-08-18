Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C474BEE499E
	for <webhook@archiver.kernel.org>; Fri, 18 Aug 2023 21:23:54 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web10.1823.1692393831256014557
 for <meta-arago@lists.yoctoproject.org>;
 Fri, 18 Aug 2023 14:23:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=VWI/EIQL;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: reatmon@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 37ILNomL083628;
	Fri, 18 Aug 2023 16:23:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1692393830;
	bh=77iJHF5PS1ITuJshBEwucGNz36si9Q74X7Y4IDPP6Eg=;
	h=From:To:Subject:Date;
	b=VWI/EIQL7VuM0zPahsYXWmMMb8rjH54PKWo0M/dnBcWIEtavFtPm1wetR6a7U0aFb
	 LpP8pq+hw4P1xEqgkV5viymbmC82cJbMRRKDfsgjAMBR53qNrdyBZhqKplyRB3Ib4y
	 0R6A6CTMfDfdlTs2nEJuSk7zuz6APpIMYb0fCeNU=
Received: from DLEE112.ent.ti.com (dlee112.ent.ti.com [157.170.170.23])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 37ILNo8A019903
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 18 Aug 2023 16:23:50 -0500
Received: from DLEE101.ent.ti.com (157.170.170.31) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 18
 Aug 2023 16:23:49 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE101.ent.ti.com
 (157.170.170.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 18 Aug 2023 16:23:50 -0500
Received: from uda0214219 (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 37ILNnNN003589;
	Fri, 18 Aug 2023 16:23:49 -0500
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1qX6wf-0000Hp-Jx; Fri, 18 Aug 2023 16:23:49 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-arago@lists.yoctoproject.org>
Subject: [meta-arago][master/kirkstone][PATCH] openntpd: Update to version 6.8p1
Date: Fri, 18 Aug 2023 16:23:47 -0500
Message-ID: <20230818212349.1060-1-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Fri, 18 Aug 2023 21:23:54 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14857

The 3.9p1 version is really old, and we ran into compile issues with the
latest upstream testing.  Take this opportunity to upgrade to the latest
version.

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 .../openntpd/openntpd_3.9p1.bb                | 21 ---------------
 .../openntpd/openntpd_6.8p1.bb                | 26 +++++++++++++++++++
 2 files changed, 26 insertions(+), 21 deletions(-)
 delete mode 100644 meta-arago-extras/recipes-connectivity/openntpd/openntpd_3.9p1.bb
 create mode 100644 meta-arago-extras/recipes-connectivity/openntpd/openntpd_6.8p1.bb

diff --git a/meta-arago-extras/recipes-connectivity/openntpd/openntpd_3.9p1.bb b/meta-arago-extras/recipes-connectivity/openntpd/openntpd_3.9p1.bb
deleted file mode 100644
index 008d4d33..00000000
--- a/meta-arago-extras/recipes-connectivity/openntpd/openntpd_3.9p1.bb
+++ /dev/null
@@ -1,21 +0,0 @@
-DESCRIPTION = "OpenNTPD is a FREE, easy to use implementation of the \
-Network Time Protocol."
-HOMEPAGE = "http://www.openntpd.org/"
-SECTION = "console/network"
-LICENSE = "BSD-3-Clause & ISC"
-LIC_FILES_CHKSUM = "file://LICENCE;md5=4b4f5158007cc97e6b0e2325bb99854a"
-
-PR = "r0"
-
-SRC_URI = "http://mirror.ece.vt.edu/pub/OpenBSD/OpenNTPD/${P}.tar.gz"
-
-S = "${WORKDIR}/openntpd-${PV}"
-EXTRA_OECONF = "--disable-strip"
-inherit autotools
-
-LDFLAGS += "-lrt"
-EXTRA_OECONF += "LDFLAGS="${LDFLAGS}" CFLAGS="${CFLAGS}"\
-                 --with-privsep-user=root --with-privsep-path=/${prefix}"
-
-SRC_URI[md5sum] = "afc34175f38d08867c1403d9008600b3"
-SRC_URI[sha256sum] = "83dd7c1e8ec8b4567afe49af539271b5a73562fb7a3ca51df73eccba89ec8c49"
diff --git a/meta-arago-extras/recipes-connectivity/openntpd/openntpd_6.8p1.bb b/meta-arago-extras/recipes-connectivity/openntpd/openntpd_6.8p1.bb
new file mode 100644
index 00000000..e4aa27fc
--- /dev/null
+++ b/meta-arago-extras/recipes-connectivity/openntpd/openntpd_6.8p1.bb
@@ -0,0 +1,26 @@
+DESCRIPTION = "OpenNTPD is a FREE, easy to use implementation of the \
+Network Time Protocol."
+HOMEPAGE = "http://www.openntpd.org/"
+SECTION = "console/network"
+LICENSE = "BSD-3-Clause & ISC"
+LIC_FILES_CHKSUM = "file://COPYING;md5=fe922aad2b6ad1c359cf2adfdaaab1b6"
+
+PR = "r0"
+
+SRC_URI = "https://cdn.openbsd.org/pub/OpenBSD/OpenNTPD/${P}.tar.gz"
+SRC_URI[md5sum] = "7c68ce2627b2ea13f2b95db1ef4fcfc5"
+SRC_URI[sha256sum] = "8582db838a399153d4a17f2a76518b638cc3020f58028575bf54127518f55a46"
+
+S = "${WORKDIR}/openntpd-${PV}"
+inherit autotools
+
+LDFLAGS += "-lrt"
+EXTRA_OECONF += "LDFLAGS="${LDFLAGS}" CFLAGS="${CFLAGS}"\
+                 --with-privsep-user=root"
+
+do_install:append() {
+    # don't install empty /var/run and /run to avoid conflict with base-files
+    rm -rf ${D}${localstatedir}/run
+    rm -rf ${D}/run
+}
+
-- 
2.17.1


