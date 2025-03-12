Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 750EFC35FF7
	for <webhook@archiver.kernel.org>; Wed, 12 Mar 2025 14:45:50 +0000 (UTC)
Received: from fllvem-ot03.ext.ti.com (fllvem-ot03.ext.ti.com [198.47.19.245])
 by mx.groups.io with SMTP id smtpd.web11.39072.1741790742346347627
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 12 Mar 2025 07:45:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=GGJ+wLZG;
 spf=pass (domain: ti.com, ip: 198.47.19.245, mailfrom: reatmon@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 52CEjeox1057607
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 12 Mar 2025 09:45:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1741790741;
	bh=Sl0tOc0GfnsrKhomK/xIoYQBTWLzTHQW/DFIj59crT0=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=GGJ+wLZGviZvrXtdJoOLSqQGU/xUoDnzJ93F/I713ueIkXaWo7Czkk/bfUzOPvBcE
	 cvhXGpCljTnNS7iThDNHfxq6UR2TJcolpPgpIZVWRdLoITkki/HlIIZWBqtsJM1mi1
	 9pykcU4NCqGnmSovmJ6pqRit6D49U0y0AJ4F20SE=
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 52CEjevO005781
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 12 Mar 2025 09:45:40 -0500
Received: from DFLE112.ent.ti.com (10.64.6.33) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 12
 Mar 2025 09:45:40 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 12 Mar 2025 09:45:40 -0500
Received: from uda0214219 (uda0214219.dhcp.ti.com [128.247.81.222])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 52CEjeuO074628;
	Wed, 12 Mar 2025 09:45:40 -0500
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1tsNL2-0003ow-Fk; Wed, 12 Mar 2025 09:45:40 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-arago@lists.yoctoproject.org>
Subject: [meta-arago][master/scarthgap][PATCH 04/10] mtd-utils: Wrap the bbappend in a compliant manner
Date: Wed, 12 Mar 2025 09:45:34 -0500
Message-ID: <20250312144540.14210-5-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20250312144540.14210-1-reatmon@ti.com>
References: <20250312144540.14210-1-reatmon@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Wed, 12 Mar 2025 14:45:50 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15996

Wrap the bbappend in a yocto-check-layer compliant manner so that only
if you are building this recipe under meta-ti-bsp with ti-soc in the
MACHINE_OVERRIDES would the bbappend apply.

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 .../recipes-core/packagegroups/ti-test.bb     |  5 +-
 ...{mtd-utils_%.bbappend => mtd-utils-ti.inc} |  0
 .../recipes-devtools/mtd/mtd-utils_%.bbappend | 47 ++-----------------
 3 files changed, 7 insertions(+), 45 deletions(-)
 copy meta-arago-test/recipes-devtools/mtd/{mtd-utils_%.bbappend => mtd-utils-ti.inc} (100%)

diff --git a/meta-arago-test/recipes-core/packagegroups/ti-test.bb b/meta-arago-test/recipes-core/packagegroups/ti-test.bb
index 934a2c47..a5a8838f 100644
--- a/meta-arago-test/recipes-core/packagegroups/ti-test.bb
+++ b/meta-arago-test/recipes-core/packagegroups/ti-test.bb
@@ -38,7 +38,6 @@ TI_TEST_BASE = "\
     mstpd \
     mtd-utils \
     mtd-utils-ubifs \
-    mtd-utils-ubifs-tests \
     nbench-byte \
     netperf \
     openntpd \
@@ -59,6 +58,10 @@ TI_TEST_BASE = "\
     yavta \
 "
 
+TI_TEST_BASE:ti-soc:append = " \
+    mtd-utils-ubifs-tests \
+"
+
 TI_TEST_EXTRAS = " \
     python3-pillow \
     pytesseract \
diff --git a/meta-arago-test/recipes-devtools/mtd/mtd-utils_%.bbappend b/meta-arago-test/recipes-devtools/mtd/mtd-utils-ti.inc
similarity index 100%
copy from meta-arago-test/recipes-devtools/mtd/mtd-utils_%.bbappend
copy to meta-arago-test/recipes-devtools/mtd/mtd-utils-ti.inc
diff --git a/meta-arago-test/recipes-devtools/mtd/mtd-utils_%.bbappend b/meta-arago-test/recipes-devtools/mtd/mtd-utils_%.bbappend
index 1120e87a..bdf28247 100644
--- a/meta-arago-test/recipes-devtools/mtd/mtd-utils_%.bbappend
+++ b/meta-arago-test/recipes-devtools/mtd/mtd-utils_%.bbappend
@@ -1,45 +1,4 @@
-PR:append = ".arago2"
+MTD_UTILS_TI = ""
+MTD_UTILS_TI:ti-soc = "mtd-utils-ti.inc"
 
-SRC_URI:remove = "git://git.infradead.org/mtd-utils.git;branch=master \
-"
-
-SRC_URI:prepend = "git://git.infraroot.at/mtd-utils.git;branch=master;protocol=https \
-"
-
-EXTRA_OEMAKE = "'CC=${CC} ${CFLAGS} ${@bb.utils.contains('PACKAGECONFIG', 'xattr', '', '-DWITHOUT_XATTR', d)} -I${S}/include' 'RANLIB=${RANLIB}' 'AR=${AR}' 'BUILDDIR=${S}'"
-
-do_compile:append() {
-	oe_runmake tests
-}
-
-do_install:append() {
-	install -m 0755 io_update ${D}${sbindir}/
-	install -m 0755 volrefcnt ${D}${sbindir}/
-	install -m 0755 integ ${D}${sbindir}/
-	install -m 0755 io_paral ${D}${sbindir}/
-	install -m 0755 io_read ${D}${sbindir}/
-	install -m 0755 io_basic ${D}${sbindir}/
-	install -m 0755 mkvol_basic ${D}${sbindir}/
-	install -m 0755 mkvol_bad ${D}${sbindir}/
-	install -m 0755 mkvol_paral ${D}${sbindir}/
-	install -m 0755 rsvol ${D}${sbindir}/
-	install -m 0755 tests/ubi-tests/runubitests.sh ${D}${sbindir}/
-	install -m 0755 tests/ubi-tests/ubi-stress-test.sh ${D}${sbindir}/
-}
-
-PACKAGES =+ "mtd-utils-ubifs-tests"
-
-FILES:mtd-utils-ubifs-tests = " \
-${sbindir}/io_update \
-${sbindir}/volrefcnt \
-${sbindir}/integ \
-${sbindir}/io_paral \
-${sbindir}/io_read \
-${sbindir}/io_basic \
-${sbindir}/mkvol_basic \
-${sbindir}/mkvol_bad \
-${sbindir}/mkvol_paral \
-${sbindir}/rsvol \
-${sbindir}/runubitests.sh \
-${sbindir}/ubi-stress-test.sh \
-"
+require ${MTD_UTILS_TI}
-- 
2.17.1


