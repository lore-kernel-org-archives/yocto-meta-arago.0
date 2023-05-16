Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9D0F6C77B75
	for <webhook@archiver.kernel.org>; Tue, 16 May 2023 16:41:03 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web11.26907.1684255256172851381
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 16 May 2023 09:40:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=VXHiim0d;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: reatmon@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 34GGetxs052709;
	Tue, 16 May 2023 11:40:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1684255255;
	bh=XiQRZWr9F0sMYQhWQ0Fdh00hKpPmi8/Ex9e0uYEbhS4=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=VXHiim0dGaiSad/KrAoIBVxAblfJ7aUx6WTMzw/oJhkmBU74vudLQRgonIrnufOgX
	 LoyVOXxDhH9EGIxXVRlFfK5FxEAapQkuwYXUxALR5vl9gcT4c7Bp7ZwbdSRsjey4tp
	 M6b/2Bv7WUnEH44vUcWWnBIMqPbKoCVeQermukMU=
Received: from DFLE111.ent.ti.com (dfle111.ent.ti.com [10.64.6.32])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 34GGetnI004960
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 16 May 2023 11:40:55 -0500
Received: from DFLE102.ent.ti.com (10.64.6.23) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 16
 May 2023 11:40:54 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 16 May 2023 11:40:54 -0500
Received: from uda0214219 (ileaxei01-snat.itg.ti.com [10.180.69.5])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 34GGesKo002910;
	Tue, 16 May 2023 11:40:54 -0500
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1pyxjK-00038R-R0; Tue, 16 May 2023 11:40:54 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-arago@lists.yoctoproject.org>
Subject: [meta-arago][master/kirkstone][PATCH 5/6] ltp-ddt: Remove older version.
Date: Tue, 16 May 2023 11:40:53 -0500
Message-ID: <20230516164054.11978-6-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230516164054.11978-1-reatmon@ti.com>
References: <20230516164054.11978-1-reatmon@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 16 May 2023 16:41:03 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14408

Now that we have 20230127 in place, we can remove this older recipe.

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 .../ltp-ddt/ltp-ddt_20210524.bb               | 47 -------------------
 1 file changed, 47 deletions(-)
 delete mode 100644 meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt_20210524.bb

diff --git a/meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt_20210524.bb b/meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt_20210524.bb
deleted file mode 100644
index 03f6d4f3..00000000
--- a/meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt_20210524.bb
+++ /dev/null
@@ -1,47 +0,0 @@
-FILESEXTRAPATHS:prepend := "${COREBASE}/meta/recipes-extended/ltp/ltp:"
-FILESEXTRAPATHS:prepend := "${ARAGOBASE}/meta-arago-extras/recipes-extended/ltp/ltp:"
-
-require recipes-extended/ltp/ltp_${PV}.bb
-
-SUMMARY = "Embedded Linux Device Driver Tests based on Linux Test Project"
-HOMEPAGE = "https://git.ti.com/cgit/test-automation/ltp-ddt/"
-
-PROVIDES += "ltp"
-
-DEPENDS += "alsa-lib"
-
-PE = "1"
-PR = "r7"
-PV:append = "+git${SRCPV}"
-
-SRCREV = "0b51638be46d1e00e2e7e6c4c65dcff738ff2e60"
-BRANCH ?= "master"
-
-SRC_URI:remove = "git://github.com/linux-test-project/ltp.git;protocol=https;branch=master"
-SRC_URI:prepend = "git://git.ti.com/git/test-automation/ltp-ddt.git;protocol=https;branch=${BRANCH} "
-
-SRC_URI:append = "https://git.ti.com/cgit/ti-linux-kernel/ti-linux-kernel/plain/include/uapi/linux/rpmsg_rpc.h?h=ti-linux-5.10.y;name=rpmsg_rpc;subdir=linux;downloadfilename=rpmsg_rpc.h"
-SRC_URI[rpmsg_rpc.sha256sum] = "cd237f40a37520a1f2df19fbfeefd00c0a5ad68efeaba9ba0fba60ca16ea09be"
-
-export prefix = "/opt/ltp"
-export exec_prefix = "/opt/ltp"
-
-EXTRA_OEMAKE:append = " \
-    KERNEL_USR_INC=${WORKDIR} \
-    ALSA_INCPATH=${STAGING_INCDIR} \
-    ALSA_LIBPATH=${STAGING_LIBDIR} \
-"
-
-RDEPENDS:${PN} += "\
-    acl \
-    at \
-    pm-qa \
-    serialcheck \
-    memtester \
-"
-
-do_install:prepend() {
-	# Upstream ltp recipe wants to remove this test case in do_install
-	install -d ${D}${prefix}/runtest/
-	echo "memcg_stress" >> ${D}${prefix}/runtest/controllers
-}
-- 
2.17.1


