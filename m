Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5079AC28D13
	for <webhook@archiver.kernel.org>; Mon, 22 Aug 2022 17:33:06 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web09.21105.1661189579574557048
 for <meta-arago@lists.yoctoproject.org>;
 Mon, 22 Aug 2022 10:32:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=lTTpwp9A;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: reatmon@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 27MHWuqR002538;
	Mon, 22 Aug 2022 12:32:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1661189576;
	bh=/Fk8l8tDI2GqW+AcddPBPlvTMMoCdLSpN13dNHjjE2U=;
	h=From:To:Subject:Date;
	b=lTTpwp9AMfPoooWhv2uowEAzLpZa4Egj4bn2bcxIMrkFpxeYIer6TCql0TbRWPvOc
	 698iH3x3QpO9vV6ecie5m6pLEWDd7S0jXIOjoRE8OvGztEy4n25afAKMgb9SbpGWCs
	 H8sgBWwW4YCNxczGpZx5fe+y0d5NSaYmKCOvhFr4=
Received: from DLEE112.ent.ti.com (dlee112.ent.ti.com [157.170.170.23])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 27MHWuhB104375
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 22 Aug 2022 12:32:56 -0500
Received: from DLEE104.ent.ti.com (157.170.170.34) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.6; Mon, 22
 Aug 2022 12:32:56 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.6 via
 Frontend Transport; Mon, 22 Aug 2022 12:32:56 -0500
Received: from uda0214219 (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 27MHWuoo026113;
	Mon, 22 Aug 2022 12:32:56 -0500
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1oQBIG-0008Bb-5B; Mon, 22 Aug 2022 12:32:56 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-arago@lists.yoctoproject.org>
Subject: [meta-arago][dunfell][RFC] oe-core: Fix rm_work issue with some
 packages from oe-core.
Date: Mon, 22 Aug 2022 12:32:56 -0500
Message-ID: <20220822173256.31426-1-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Mon, 22 Aug 2022 17:33:06 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/13979

There appears to be an issue with a few packages from oe-core
and the rm_work feature when combined with the srcipk feature
of arago.  These recipes patch files and after the rm_work the
bitbake flow does not re-fetch the source again, so the patch
fails the second time around.  Easy fix is to just exclude
rm_worke on these packages.

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 .../recipes-devtools/opkg-utils/opkg-utils_%.bbappend          | 3 +++
 meta-arago-distro/recipes-devtools/swig/swig_%.bbappend        | 3 +++
 meta-arago-distro/recipes-extended/bc/bc_%.bbappend            | 3 +++
 3 files changed, 9 insertions(+)
 create mode 100644 meta-arago-distro/recipes-devtools/opkg-utils/opkg-utils_%.bbappend
 create mode 100644 meta-arago-distro/recipes-devtools/swig/swig_%.bbappend
 create mode 100644 meta-arago-distro/recipes-extended/bc/bc_%.bbappend

diff --git a/meta-arago-distro/recipes-devtools/opkg-utils/opkg-utils_%.bbappend b/meta-arago-distro/recipes-devtools/opkg-utils/opkg-utils_%.bbappend
new file mode 100644
index 00000000..29d90a9d
--- /dev/null
+++ b/meta-arago-distro/recipes-devtools/opkg-utils/opkg-utils_%.bbappend
@@ -0,0 +1,3 @@
+
+RM_WORK_EXCLUDE += "${PN}"
+
diff --git a/meta-arago-distro/recipes-devtools/swig/swig_%.bbappend b/meta-arago-distro/recipes-devtools/swig/swig_%.bbappend
new file mode 100644
index 00000000..29d90a9d
--- /dev/null
+++ b/meta-arago-distro/recipes-devtools/swig/swig_%.bbappend
@@ -0,0 +1,3 @@
+
+RM_WORK_EXCLUDE += "${PN}"
+
diff --git a/meta-arago-distro/recipes-extended/bc/bc_%.bbappend b/meta-arago-distro/recipes-extended/bc/bc_%.bbappend
new file mode 100644
index 00000000..29d90a9d
--- /dev/null
+++ b/meta-arago-distro/recipes-extended/bc/bc_%.bbappend
@@ -0,0 +1,3 @@
+
+RM_WORK_EXCLUDE += "${PN}"
+
-- 
2.17.1


