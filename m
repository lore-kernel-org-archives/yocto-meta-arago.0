Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 87AF9C25B75
	for <webhook@archiver.kernel.org>; Fri, 31 May 2024 19:46:11 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web10.22653.1717184769109790230
 for <meta-arago@lists.yoctoproject.org>;
 Fri, 31 May 2024 12:46:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=xQGpyoDO;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: reatmon@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 44VJk8Bm074562;
	Fri, 31 May 2024 14:46:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1717184768;
	bh=mZ9fbi2jynTbfZ0jcPIKgwseZ7Plu9FGKuwqp83kd2k=;
	h=From:To:Subject:Date;
	b=xQGpyoDOCmyNBLlqKSn2iCFiW3FIywn6HqtXHu4GBYEo8TJ8Y7KQ/9BeozCYS19Xf
	 HJ7A8ZR6OX3ffpba7EI9DDqxqREIDx1ygEmUcB4aPqslXj47YSqJAzI6i8TMlIqmdY
	 4ugv+48i4lGiaU5hah9G0lLKhfRVXYVvjOinkbqg=
Received: from DLEE114.ent.ti.com (dlee114.ent.ti.com [157.170.170.25])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 44VJk864029364
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 31 May 2024 14:46:08 -0500
Received: from DLEE111.ent.ti.com (157.170.170.22) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 31
 May 2024 14:46:08 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE111.ent.ti.com
 (157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 31 May 2024 14:46:07 -0500
Received: from uda0214219 (uda0214219.dhcp.ti.com [128.247.81.222])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 44VJk7Pi055997;
	Fri, 31 May 2024 14:46:07 -0500
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1sD8CV-0006J1-RZ; Fri, 31 May 2024 14:46:07 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-arago@lists.yoctoproject.org>
Subject: [meta-arago][master][PATCH] recipes: Update for gcc v14 support
Date: Fri, 31 May 2024 14:46:07 -0500
Message-ID: <20240531194607.24199-1-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Fri, 31 May 2024 19:46:11 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15349

One of the changes in gcc v14 is making implicit-function-declaration an
error.  For some older software packages the easiest fix is to add
-fpermissive to the compile line.

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 meta-arago-extras/recipes-support/cclink/ccief-basic_git.bb   | 2 ++
 meta-arago-test/recipes-devtools/cpuloadgen/cpuloadgen_git.bb | 3 ++-
 2 files changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta-arago-extras/recipes-support/cclink/ccief-basic_git.bb b/meta-arago-extras/recipes-support/cclink/ccief-basic_git.bb
index a2ade425..a39f8df8 100644
--- a/meta-arago-extras/recipes-support/cclink/ccief-basic_git.bb
+++ b/meta-arago-extras/recipes-support/cclink/ccief-basic_git.bb
@@ -20,6 +20,8 @@ S = "${WORKDIR}/git"
 
 TARGET_CC_ARCH += "${LDFLAGS}"
 
+EXTRA_OEMAKE = "CC="${CC} -fpermissive""
+
 do_compile() {
 # build Master sample application
     cd ${S}/CCIEF-BASIC_Master/build/linux
diff --git a/meta-arago-test/recipes-devtools/cpuloadgen/cpuloadgen_git.bb b/meta-arago-test/recipes-devtools/cpuloadgen/cpuloadgen_git.bb
index 7f734558..751f91c0 100644
--- a/meta-arago-test/recipes-devtools/cpuloadgen/cpuloadgen_git.bb
+++ b/meta-arago-test/recipes-devtools/cpuloadgen/cpuloadgen_git.bb
@@ -14,7 +14,8 @@ SRC_URI = "git://github.com/ptitiano/cpuloadgen.git;protocol=https;branch=${BRAN
 
 S = "${WORKDIR}/git"
 
-EXTRA_OEMAKE = "DESTDIR=${D}${bindir} CROSS_COMPILE=${TARGET_PREFIX} CC="${CC}""
+EXTRA_OEMAKE = "DESTDIR=${D}${bindir} CROSS_COMPILE=${TARGET_PREFIX} CC="${CC}" CFLAGS="${CFLAGS}""
+CFLAGS += "-fpermissive"
 
 do_install () {
     install -d ${D}${bindir}
-- 
2.17.1


