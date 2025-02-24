Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A4886C021A4
	for <webhook@archiver.kernel.org>; Mon, 24 Feb 2025 19:24:58 +0000 (UTC)
Received: from lelvem-ot01.ext.ti.com (lelvem-ot01.ext.ti.com [198.47.23.234])
 by mx.groups.io with SMTP id smtpd.web11.99174.1740425091454387891
 for <meta-arago@lists.yoctoproject.org>;
 Mon, 24 Feb 2025 11:24:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=fqG+ML94;
 spf=pass (domain: ti.com, ip: 198.47.23.234, mailfrom: reatmon@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 51OJOoVZ1007306
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 24 Feb 2025 13:24:50 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1740425090;
	bh=vgw40fQ+39zs3g5kv75i+59gVdClKMzmUFjACcB8IYY=;
	h=From:To:Subject:Date;
	b=fqG+ML94bBP8KAe3PJWpMgXF+Em55y/TtZ2CcfC23Lqv9yBZqwGhWAJ1o+XOODGOM
	 xcC6SzulqTsk2jW8zfi+leQYpAY9Hf0ci4x4IsswO7/Gevap8WwK73UbtIbv4aUHs/
	 PTxz3gcV+0/sndxbbIqkuqWj6+lFlgsEi7uJt5e8=
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 51OJOopN072987
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 24 Feb 2025 13:24:50 -0600
Received: from DFLE102.ent.ti.com (10.64.6.23) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 24
 Feb 2025 13:24:50 -0600
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 24 Feb 2025 13:24:49 -0600
Received: from uda0214219 (uda0214219.dhcp.ti.com [128.247.81.222])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 51OJOnnP121270;
	Mon, 24 Feb 2025 13:24:49 -0600
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1tme4P-00077U-Qu; Mon, 24 Feb 2025 13:24:49 -0600
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-arago@lists.yoctoproject.org>
Subject: [meta-arago][scarthgap][PATCH] ltp-ddt: Remove version 20240129
Date: Mon, 24 Feb 2025 13:24:49 -0600
Message-ID: <20250224192449.27328-1-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Mon, 24 Feb 2025 19:24:58 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15906

Now that we have moved to the 20250130 version we no longer need to
carry the previous version.

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 .../ltp-ddt/ltp-ddt_20240129.bb               | 44 -------------------
 1 file changed, 44 deletions(-)
 delete mode 100644 meta-arago-test/recipes-devtools/ltp-ddt/ltp-ddt_20240129.bb

diff --git a/meta-arago-test/recipes-devtools/ltp-ddt/ltp-ddt_20240129.bb b/meta-arago-test/recipes-devtools/ltp-ddt/ltp-ddt_20240129.bb
deleted file mode 100644
index 528db999..00000000
--- a/meta-arago-test/recipes-devtools/ltp-ddt/ltp-ddt_20240129.bb
+++ /dev/null
@@ -1,44 +0,0 @@
-FILESEXTRAPATHS:prepend := "${COREBASE}/meta/recipes-extended/ltp/ltp:"
-FILESEXTRAPATHS:prepend := "${TITESTBASE}/recipes-extended/ltp/ltp:"
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
-PR = "r1"
-PV:append = "+git"
-
-SRCREV = "551467bce4c38af24c9c98843770fdfe45e1e253"
-BRANCH ?= "master"
-
-SRC_URI:remove = "git://github.com/linux-test-project/ltp.git;branch=master;protocol=https"
-SRC_URI:prepend = "git://git.ti.com/git/test-automation/ltp-ddt.git;protocol=https;branch=${BRANCH} "
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


