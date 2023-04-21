Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3D84CC77B78
	for <webhook@archiver.kernel.org>; Fri, 21 Apr 2023 19:38:14 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web11.21944.1682105888762824115
 for <meta-arago@lists.yoctoproject.org>;
 Fri, 21 Apr 2023 12:38:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=O4NDoBd+;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: reatmon@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 33LJc7Ex034496;
	Fri, 21 Apr 2023 14:38:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1682105887;
	bh=FDHcj4YtO2a+XdasjGuEmDYoO9zreCkpTAmPVGfFKZc=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=O4NDoBd+HsLnu2vC5O5vtAguOjbd9b1ySvCvWwpHuNhio52Q7rjSpaGtmydQA4DfO
	 ipthiYzqyi9NMEfdRmSE0nr/CncP8dh/rHpzFB4MgOSmklzHSYSlIhHxjyR0oB6IsD
	 HWTy8S3OQaimetKgR18DuKQEWBlmdm40qM1qhpOA=
Received: from DFLE110.ent.ti.com (dfle110.ent.ti.com [10.64.6.31])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 33LJc78R021224
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 21 Apr 2023 14:38:07 -0500
Received: from DFLE108.ent.ti.com (10.64.6.29) by DFLE110.ent.ti.com
 (10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16; Fri, 21
 Apr 2023 14:38:07 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16 via
 Frontend Transport; Fri, 21 Apr 2023 14:38:07 -0500
Received: from uda0214219 (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 33LJc7CK081070;
	Fri, 21 Apr 2023 14:38:07 -0500
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1ppwa7-0000FN-5L; Fri, 21 Apr 2023 14:38:07 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-arago@lists.yoctoproject.org>
Subject: [meta-arago][master/kirkstone][PATCH] ltp-ddt_20230127: Add rpmsg_rpc.h to SRC_URI
Date: Fri, 21 Apr 2023 14:38:06 -0500
Message-ID: <20230421193806.903-2-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230421193806.903-1-reatmon@ti.com>
References: <20230421193806.903-1-reatmon@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Fri, 21 Apr 2023 19:38:14 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14324

Rather than rely on the TI kernel custom headers that are needed for
compilation, directly pull in the needed header from the ti-linux-kernel
repo on git.ti.com.

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 .../recipes-devtools/ltp-ddt/ltp-ddt_20230127.bb             | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt_20230127.bb b/meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt_20230127.bb
index b7c695f3..52e2f611 100644
--- a/meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt_20230127.bb
+++ b/meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt_20230127.bb
@@ -20,11 +20,14 @@ BRANCH ?= "master"
 SRC_URI:remove = "git://github.com/linux-test-project/ltp.git;branch=master;protocol=https"
 SRC_URI:prepend = "git://git.ti.com/git/test-automation/ltp-ddt.git;protocol=https;branch=${BRANCH} "
 
+SRC_URI:append = "https://git.ti.com/cgit/ti-linux-kernel/ti-linux-kernel/plain/include/uapi/linux/rpmsg_rpc.h?h=ti-linux-5.10.y;name=rpmsg_rpc;subdir=linux;downloadfilename=rpmsg_rpc.h"
+SRC_URI[rpmsg_rpc.sha256sum] = "cd237f40a37520a1f2df19fbfeefd00c0a5ad68efeaba9ba0fba60ca16ea09be"
+
 export prefix = "/opt/ltp"
 export exec_prefix = "/opt/ltp"
 
 EXTRA_OEMAKE:append = " \
-    KERNEL_USR_INC=${STAGING_INCDIR} \
+    KERNEL_USR_INC=${WORKDIR} \
     ALSA_INCPATH=${STAGING_INCDIR} \
     ALSA_LIBPATH=${STAGING_LIBDIR} \
 "
-- 
2.17.1


