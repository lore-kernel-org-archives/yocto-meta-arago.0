Return-Path: <r-gunasekaran@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 98446EB64DD
	for <webhook@archiver.kernel.org>; Tue, 27 Jun 2023 10:04:06 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web10.9462.1687860243617050050
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 27 Jun 2023 03:04:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=KKjF4N3b;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: r-gunasekaran@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 35RA42N1078696;
	Tue, 27 Jun 2023 05:04:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1687860242;
	bh=vvEyo6VMOTU1sgitkHZxnWozVlYebl0xE29uU9D6jnw=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=KKjF4N3blOKefhUcCuTxVej9kiSWxoJc5P/s7MpBTKwSmxZrAPPy/JH59BZW70fIw
	 NYzpZO5rUvUjBDwtUryUEqr0C4m2YGUbX38M4mtmdr9NLTkFf70jgLTI1eLQzKlIsR
	 +LKvRsjN81HSu84nAu17X3IA3mBYH/i+IKPURbhk=
Received: from DFLE107.ent.ti.com (dfle107.ent.ti.com [10.64.6.28])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 35RA42Lq129365
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 27 Jun 2023 05:04:02 -0500
Received: from DFLE110.ent.ti.com (10.64.6.31) by DFLE107.ent.ti.com
 (10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 27
 Jun 2023 05:04:01 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE110.ent.ti.com
 (10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 27 Jun 2023 05:04:01 -0500
Received: from uda0500640.dal.design.ti.com (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 35RA3kle115122;
	Tue, 27 Jun 2023 05:03:59 -0500
From: Ravi Gunasekaran <r-gunasekaran@ti.com>
To: <meta-arago@lists.yoctoproject.org>
CC: <denis@denix.org>, <reatmon@ti.com>, <g-gupta@ti.com>,
        <r-gunasekaran@ti.com>, <praneeth@ti.com>
Subject: [master/kirkstone][PATCH v3 5/8] meta-arago-extras: sysrepo: Add libredblack needed for sysrepo
Date: Tue, 27 Jun 2023 15:33:42 +0530
Message-ID: <20230627100345.24340-6-r-gunasekaran@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230627100345.24340-1-r-gunasekaran@ti.com>
References: <20230627100345.24340-1-r-gunasekaran@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 27 Jun 2023 10:04:06 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14700

libredblack is needed to build sysrepo. Add recipe for libredblack.

The recipe is taken as-is from the commit 09f73e7 ("update for honister")
from the public repo [1].

[1] - https://github.com/sartura/meta-sysrepo

Signed-off-by: Ravi Gunasekaran <r-gunasekaran@ti.com>
---

Changes since v2:
---------------
Newly introduced in this series

 .../libredblack/libredblack_git.bb            | 21 +++++++++++++++++++
 1 file changed, 21 insertions(+)
 create mode 100644 meta-arago-extras/recipes-sysrepo/libredblack/libredblack_git.bb

diff --git a/meta-arago-extras/recipes-sysrepo/libredblack/libredblack_git.bb b/meta-arago-extras/recipes-sysrepo/libredblack/libredblack_git.bb
new file mode 100644
index 00000000..ea51b618
--- /dev/null
+++ b/meta-arago-extras/recipes-sysrepo/libredblack/libredblack_git.bb
@@ -0,0 +1,21 @@
+SUMMARY = "Library for handling red-black tree searching algorithm"
+DESCRIPTION = "A library to provide the RedBlack balanced tree searching and sorting algorithm."
+LICENSE = "LGPLv2.1"
+LIC_FILES_CHKSUM = "file://COPYING;md5=de174fb5a92cdbe038c88dc4c4316f99"
+
+SRC_URI = "git://github.com/sysrepo/libredblack.git;protocol=https"
+
+PV = "1.0+git${SRCPV}"
+SRCREV = "a399310d99b61eec4d3c0677573ab5dddcf9395d"
+
+S = "${WORKDIR}/git"
+
+# NOTE: if this software is not capable of being built in a separate build directory
+# from the source, you should replace autotools with autotools-brokensep in the
+# inherit line
+inherit python3native autotools
+
+# Specify any options you want to pass to the configure script using EXTRA_OECONF:
+EXTRA_OECONF = " --without-rbgen "
+
+BBCLASSEXTEND = "native nativesdk"
-- 
2.17.1


