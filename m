Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D1D21C77B76
	for <webhook@archiver.kernel.org>; Sat, 22 Apr 2023 16:59:29 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web11.11616.1682182760016340605
 for <meta-arago@lists.yoctoproject.org>;
 Sat, 22 Apr 2023 09:59:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=ZU7LJzeG;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: reatmon@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 33MGxIpU126610;
	Sat, 22 Apr 2023 11:59:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1682182758;
	bh=oXgjVA1p/QRLiCzrtX3ERnqCpJBRSdMbgwHJpg6ieXY=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=ZU7LJzeGx5FOTkmADaUPTnx5e19aWuP99X35UVv5wQQybz+NUxqhw6vB1KmqHIn/g
	 6hOVRneGoLzGPiSD0H8r5WdYmlYJX/UT1td1bW1LzRV6imZiiqr1q0xw5fY2/Im4sL
	 RnccvURXV2YImd4HWXadhbXtIrWvd5h/6W2YH33A=
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 33MGxHYc020623
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Sat, 22 Apr 2023 11:59:17 -0500
Received: from DFLE106.ent.ti.com (10.64.6.27) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16; Sat, 22
 Apr 2023 11:59:17 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE106.ent.ti.com
 (10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16 via
 Frontend Transport; Sat, 22 Apr 2023 11:59:17 -0500
Received: from uda0214219 (ileaxei01-snat.itg.ti.com [10.180.69.5])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 33MGxH4W119200;
	Sat, 22 Apr 2023 11:59:17 -0500
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1pqGZx-0006TX-Hy; Sat, 22 Apr 2023 11:59:17 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-arago@lists.yoctoproject.org>
Subject: [meta-arago][master/kirkstone][PATCH 2/2] ltp-ddt: Add support for version 20230127
Date: Sat, 22 Apr 2023 11:59:17 -0500
Message-ID: <20230422165917.24845-3-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230422165917.24845-1-reatmon@ti.com>
References: <20230422165917.24845-1-reatmon@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Sat, 22 Apr 2023 16:59:29 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14329

The internal testing team would like to move to this version as the
basis for our internal ltp-ddt.

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 .../ltp-ddt/ltp-ddt_20230127.bb               | 47 +++++++++++++++++++
 1 file changed, 47 insertions(+)
 create mode 100644 meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt_20230127.bb

diff --git a/meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt_20230127.bb b/meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt_20230127.bb
new file mode 100644
index 00000000..52e2f611
--- /dev/null
+++ b/meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt_20230127.bb
@@ -0,0 +1,47 @@
+FILESEXTRAPATHS:prepend := "${COREBASE}/meta/recipes-extended/ltp/ltp:"
+FILESEXTRAPATHS:prepend := "${ARAGOBASE}/meta-arago-extras/recipes-extended/ltp/ltp:"
+
+require recipes-extended/ltp/ltp_${PV}.bb
+
+SUMMARY = "Embedded Linux Device Driver Tests based on Linux Test Project"
+HOMEPAGE = "https://git.ti.com/cgit/test-automation/ltp-ddt/"
+
+PROVIDES += "ltp"
+
+DEPENDS += "alsa-lib"
+
+PE = "1"
+PR = "r7"
+PV:append = "+git${SRCPV}"
+
+SRCREV = "7f2fc4b7c972f2f188836c739a7175fad2f2b288"
+BRANCH ?= "master"
+
+SRC_URI:remove = "git://github.com/linux-test-project/ltp.git;branch=master;protocol=https"
+SRC_URI:prepend = "git://git.ti.com/git/test-automation/ltp-ddt.git;protocol=https;branch=${BRANCH} "
+
+SRC_URI:append = "https://git.ti.com/cgit/ti-linux-kernel/ti-linux-kernel/plain/include/uapi/linux/rpmsg_rpc.h?h=ti-linux-5.10.y;name=rpmsg_rpc;subdir=linux;downloadfilename=rpmsg_rpc.h"
+SRC_URI[rpmsg_rpc.sha256sum] = "cd237f40a37520a1f2df19fbfeefd00c0a5ad68efeaba9ba0fba60ca16ea09be"
+
+export prefix = "/opt/ltp"
+export exec_prefix = "/opt/ltp"
+
+EXTRA_OEMAKE:append = " \
+    KERNEL_USR_INC=${WORKDIR} \
+    ALSA_INCPATH=${STAGING_INCDIR} \
+    ALSA_LIBPATH=${STAGING_LIBDIR} \
+"
+
+RDEPENDS:${PN} += "\
+    acl \
+    at \
+    pm-qa \
+    serialcheck \
+    memtester \
+"
+
+do_install:prepend() {
+	# Upstream ltp recipe wants to remove this test case in do_install
+	install -d ${D}${prefix}/runtest/
+	echo "memcg_stress" >> ${D}${prefix}/runtest/controllers
+}
-- 
2.17.1


