Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D7C48C7EE45
	for <webhook@archiver.kernel.org>; Fri,  9 Jun 2023 18:54:34 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web10.2705.1686336866373926517
 for <meta-arago@lists.yoctoproject.org>;
 Fri, 09 Jun 2023 11:54:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=FbkTjEwF;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: afd@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 359IsPtr075177;
	Fri, 9 Jun 2023 13:54:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1686336865;
	bh=feiJs3Jrqpmbc8byWzuudzPgOPPb89L2SCBNpUisRM8=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=FbkTjEwF2HsyBGEvrMx2XdVzcNZ1AIfbfdpJ+O6FzJ1skFzthdAH/9nAbRazTfyzW
	 bcTKXVACf5AR8VYVvZihSLmlkBo+EW0h0slJ0KDWZb/LUulPNQoYtVX81M6vgSnRQw
	 1ZOjQVj1cZ8sE2ClxOBGcgoTRxHtRB0qXwxKX3YM=
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 359IsP84042422
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 9 Jun 2023 13:54:25 -0500
Received: from DFLE112.ent.ti.com (10.64.6.33) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 9
 Jun 2023 13:54:25 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 9 Jun 2023 13:54:25 -0500
Received: from lelv0327.itg.ti.com (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 359IsNMb035371;
	Fri, 9 Jun 2023 13:54:24 -0500
From: Andrew Davis <afd@ti.com>
To: Denys Dmytriyenko <denys@konsulko.com>, Ryan Eatmon <reatmon@ti.com>,
        <meta-arago@lists.yoctoproject.org>
CC: Andrew Davis <afd@ti.com>
Subject: [meta-arago][master/kirkstone][PATCH 4/4] dt: Remove this broken and unused recipe
Date: Fri, 9 Jun 2023 13:54:22 -0500
Message-ID: <20230609185422.132654-4-afd@ti.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230609185422.132654-1-afd@ti.com>
References: <20230609185422.132654-1-afd@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Fri, 09 Jun 2023 18:54:34 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14582

The source for this is not longer available and it hasn't been
built for years. Remove it.

Signed-off-by: Andrew Davis <afd@ti.com>
---
 .../packagegroup-arago-tisdk-addons.bb        |  2 --
 .../recipes-devtools/dt/dt/no_aio.patch       | 17 -----------
 .../recipes-devtools/dt/dt_17.07.bb           | 30 -------------------
 3 files changed, 49 deletions(-)
 delete mode 100644 meta-arago-extras/recipes-devtools/dt/dt/no_aio.patch
 delete mode 100644 meta-arago-extras/recipes-devtools/dt/dt_17.07.bb

diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb
index af701d85..297d8d4d 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb
@@ -8,8 +8,6 @@ inherit packagegroup
 
 PACKAGES =+ "${PN}-extra"
 
-#    dt
-
 UTILS = " \
     gdbserver \
     oprofile \
diff --git a/meta-arago-extras/recipes-devtools/dt/dt/no_aio.patch b/meta-arago-extras/recipes-devtools/dt/dt/no_aio.patch
deleted file mode 100644
index 8253e863..00000000
--- a/meta-arago-extras/recipes-devtools/dt/dt/no_aio.patch
+++ /dev/null
@@ -1,17 +0,0 @@
----
- Makefile.linux |    2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-Index: dt.d-WIP/Makefile.linux
-===================================================================
---- dt.d-WIP/Makefile.linux
-+++ dt.d-WIP/Makefile.linux
-@@ -68,7 +68,7 @@ LINTLIBS=
-
- PORG      = -O3
-
--CFLAGS= $(PORG) -DAIO -DFIFO -DMMAP -DTTY -D__linux__ -D_GNU_SOURCE -D_FILE_OFFSET_BITS=64
-+CFLAGS= $(PORG) -DFIFO -DMMAP -DTTY -D__linux__ -D_GNU_SOURCE -D_FILE_OFFSET_BITS=64
- CPP=	/lib/cpp
- CPPOPTS= -D__GNUC__ -DFIFO -DMMAP -D__linux__ -D_GNU_SOURCE
- LDFLAGS=
diff --git a/meta-arago-extras/recipes-devtools/dt/dt_17.07.bb b/meta-arago-extras/recipes-devtools/dt/dt_17.07.bb
deleted file mode 100644
index 4ef15f60..00000000
--- a/meta-arago-extras/recipes-devtools/dt/dt_17.07.bb
+++ /dev/null
@@ -1,30 +0,0 @@
-HOMEPAGE = "http://home.comcast.net/~SCSIguy/SCSI_FAQ/RMiller_Tools/dt.html"
-DESCRIPTION = "The Data Test Program (dt) is a generic data test program used to verify proper \
-operation of peripherals, file systems, device drivers, or any data stream supported by the \
-operating system."
-
-SECTION = "console/tests"
-
-LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=fb073c94d1f584010fc75867b686d6d3"
-
-INC_PR = "r0"
-
-SRC_URI = "http://home.comcast.net/~SCSIguy/SCSI_FAQ/RMiller_Tools/ftp/dt/dt-source.tar.gz"
-S = "${WORKDIR}/dt.d"
-
-TARGET_CC_ARCH += "${LDFLAGS}"
-
-do_compile() {
-	${MAKE} -f Makefile.linux
-}
-
-SRC_URI:append:libc-uclibc = " file://no_aio.patch "
-
-do_install() {
-	install -d ${D}${bindir}
-	install -m 0755 dt ${D}${bindir}
-}
-
-SRC_URI[md5sum] = "fc3373e30868698b90f02cc5fab9aabd"
-SRC_URI[sha256sum] = "6a213b8da2b8907c4f1633c3b90229085ac239e4d43aa5879b0123c21f951cab"
-- 
2.39.2


