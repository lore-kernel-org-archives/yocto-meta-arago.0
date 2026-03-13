Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 14136107BCD8
	for <webhook@archiver.kernel.org>; Fri, 13 Mar 2026 18:57:41 +0000 (UTC)
Received: from PH8PR06CU001.outbound.protection.outlook.com (PH8PR06CU001.outbound.protection.outlook.com [40.107.209.35])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.23488.1773428251582123213
 for <meta-arago@lists.yoctoproject.org>;
 Fri, 13 Mar 2026 11:57:31 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=L9g6tHGA;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 40.107.209.35, mailfrom: reatmon@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=myw5PYJaFJVHL9FYt8NiTgrvPV+HA7UVLcm7VjeozWCtsqDft0w6AnO9L11mY9mMocyQfJ8J3YdiqLHa2VCZM1W5Vb4dqToCoSvKYPRORkh6GmbSp8lYzryUel3pTD8e8i0ePyjOTl6/mw0Xzlwn+QtMKKPrVHghqV/LOtWXsglrwhy9p249Q0E6KPIxK5kHK/hEI+592H76wZuStkJXpp1lgDQ4V3kXMx/beG0dgKR3AY6MwEGciMZPPaj/qBe8yBQahRwYQMB6gJmxAVOsOiDRBETMNi9QsgOVGqn+P5uJwCgKPKzdA3ejpFTtGsPDShCXi6QeHJ6HLV0M/9en9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yPumfJW7SSlwORGR61cHQefzI2mGUXVJaWnUGkxfEOA=;
 b=hg89db9kDB3M4Wcq0lODwkZq1KJtZ4gejy91zvdvTbcrsRrCbHZ0rh6X1cqbR/iTCGBRRAD9Mwl42D/zyiT7EeGnAL9my9LzIba4yTeKmtfng66reJ6bDMPRyepzk/t5qd7sr/9tQUGuLTMiUvfNN07ADyeXDiLgdGfPWaAfc2KUGlTE3b3D32EAezYREexLTyUYV9GbAHUT06VP/37BaYo/mmZkMaaUqpgYzN5QUn8SkYcGM/vtyIPzqIWhoOUpkRmiqRpzK7B+anNPouLXfOhFEyWrsSkww1zd8OwYV4Nxas0eh5+kdO+kKv0g9t4tLnZNc6AgjDLrU9oS/VzZMg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yPumfJW7SSlwORGR61cHQefzI2mGUXVJaWnUGkxfEOA=;
 b=L9g6tHGAX0g8nv32y+Q7yudSeXmObq4cqNgtC0wUrZ4cCnkjKAmp7x2TMPx++0DxEjnLVSkgZI6y0EzPQdnsB/4EiPpXa2wFI/9niVFL4f1NGjVY2Scm9hxikg4HLmD5O8zMOZiPLv+kdyn52unkLjnb3OtV1+fOFq8yi4zzxqg=
Received: from CH0PR03CA0415.namprd03.prod.outlook.com (2603:10b6:610:11b::26)
 by DM4PR10MB6837.namprd10.prod.outlook.com (2603:10b6:8:107::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.17; Fri, 13 Mar
 2026 18:57:29 +0000
Received: from CH1PEPF0000AD82.namprd04.prod.outlook.com
 (2603:10b6:610:11b:cafe::e) by CH0PR03CA0415.outlook.office365.com
 (2603:10b6:610:11b::26) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9678.31 via Frontend Transport; Fri,
 13 Mar 2026 18:57:23 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 CH1PEPF0000AD82.mail.protection.outlook.com (10.167.244.91) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9700.17 via Frontend Transport; Fri, 13 Mar 2026 18:57:28 +0000
Received: from DLEE209.ent.ti.com (157.170.170.98) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 13 Mar
 2026 13:57:28 -0500
Received: from DLEE210.ent.ti.com (157.170.170.112) by DLEE209.ent.ti.com
 (157.170.170.98) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 13 Mar
 2026 13:57:28 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE210.ent.ti.com
 (157.170.170.112) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Fri, 13 Mar 2026 13:57:28 -0500
Received: from grumpy (grumpy.dhcp.ti.com [128.247.81.229])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 62DIvS4t1045101;
	Fri, 13 Mar 2026 13:57:28 -0500
Received: from reatmon by grumpy with local (Exim 4.97)
	(envelope-from <reatmon@ti.com>)
	id 1w17hQ-000000015XU-12hB;
	Fri, 13 Mar 2026 13:57:28 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>, Denys Dmytriyenko
	<denys@konsulko.com>, <meta-arago@lists.yoctoproject.org>
Subject: [meta-arago][master][PATCH] ltp-ddt: Sideport glibc 2.43 patch from oe-core
Date: Fri, 13 Mar 2026 13:57:28 -0500
Message-ID: <20260313185728.259606-1-reatmon@ti.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000AD82:EE_|DM4PR10MB6837:EE_
X-MS-Office365-Filtering-Correlation-Id: 24a97a62-4af3-4adb-2f17-08de81325fea
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|1800799024|36860700016|376014|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info: 
	XK+tdJNNIxa37jdhWBMs0ZkQpN08uGJQ9dQvSGdf418fmhuGOA77koKhVdvenrlOGbn1OdPVShb/Nu5maFv+FZOH16VcvzvoVIzKoQT8Y9mD3C5xl1bGnX0hLW5aQdaqE+lu2oJ7pvokMxxjeD2QshjVY9wlYgTpaDXSF00h5V3VL0vcU02MLFffhx/tRRcdc1GcPGmPngtS2FL4hoZtHEbSxigNAS0U1zUfRmqADQcwMMoVc71LmLvP6XDknwTKUCAgZAA5MzmrVEh0DikTcJIFKQKAm3Xmj7mYCMmR7ZmUVHir/qXEurulPqb++oZDVV8yCB/ckEvfsdqdpuNX2CxqPD36Q5iE68+BE/vPV2lejjzthT446NBeMp1MAHAk1nn5OJdSTExu0pw67dyiW/femN7HmaIipka/zObvq17/t291nZTclwz9jriFaE/b7DuqqH8OQafYGJy2m2cxeyKvWyfnWeQ9iyHuysPA+Wx0fMLZ3X64ltyT7QEsz9yw8paOV3nP6+5Duk6Rbk2SzYBrZGGwWrz9uMIejnN3HeZHf6YEv2PQaVRTrMq8ssOTkNqXy+FGeKbHlUfsXeNmCPRG/ZWql3m6geOfV1lmj1eOxgEV2NJH83LLtdG+QIDV0ifiO6lHL7r3xCFUcjVL6OEw29xllEk08bseSe+TMoqJ6Sy/9FTZLk/fNiWU2nE8ALnS/l50gvEqOvYaXtiPHmg+WPnlYwKY9FPZD8HB+dp1GuDIBRD/3OzB5AlyMw9/7ODDAPhiTt5FhzGzJ3MKLw==
X-Forefront-Antispam-Report: 
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(36860700016)(376014)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	FYR3/rZaSnGpq8JCLRfkQk6Zs0oAMo3M/FbujF2BKCASFeRc43A0jqVGMKwYsUDgUDGXs8jKwy35h5K5PHzDGOxJUActSsqIVi1tFRfa84AmppNLn5gWc0BPvzFrIImh2j7M9IST7CVYxffSc/s5rCUcjUNJV5Ol3mdeensasK4295FVqoEaEginUpVhznm4t3PFnrj8B5M0DmKJbpmWwZ02ggYz9WciV/sF+b4Bk5SD/tfNq4Y1neak+JHWiyMTM4epoohq+DVjmL6S2cqr9zrylEAYumy6v03Fy1vhJS/p7RPK4wHHdv88FesdaJrupArTStNC8GwntN0fQryoFyL65axYZ5ebLoUxiGuuFJuUvkg96C8Yzu23BwhXgXgMrVuWPKDoRE7BR1bp2iVdGjAUXMDhx5GEvPyubuHDx8KCrS+HLR43JVuDGuF1Zqyg
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Mar 2026 18:57:28.9687
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 24a97a62-4af3-4adb-2f17-08de81325fea
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CH1PEPF0000AD82.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR10MB6837
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Fri, 13 Mar 2026 18:57:41 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17338

A recent change to glibc 2.43 has caused a build failure.  oe-core has
updated the ltp recipe [1] so we need to copy the same fix over here.

[1] https://git.openembedded.org/openembedded-core/commit/?id=3Df78863f89da=
5d11b52c477741bf65790f2ce0186

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 ...tp-fix-build-failure-with-glibc-2.43.patch | 33 +++++++++++++++++++
 .../recipes-devtools/ltp-ddt/ltp_20260130.inc |  1 +
 2 files changed, 34 insertions(+)
 create mode 100644 meta-arago-test/recipes-devtools/ltp-ddt/ltp-ddt/0001-l=
tp-fix-build-failure-with-glibc-2.43.patch

diff --git a/meta-arago-test/recipes-devtools/ltp-ddt/ltp-ddt/0001-ltp-fix-=
build-failure-with-glibc-2.43.patch b/meta-arago-test/recipes-devtools/ltp-=
ddt/ltp-ddt/0001-ltp-fix-build-failure-with-glibc-2.43.patch
new file mode 100644
index 00000000..7c78660e
--- /dev/null
+++ b/meta-arago-test/recipes-devtools/ltp-ddt/ltp-ddt/0001-ltp-fix-build-f=
ailure-with-glibc-2.43.patch
@@ -0,0 +1,33 @@
+ltp: fix build failure with glibc 2.43
+
+glibc 2.43 added native openat2() support for the first time. This
+caused compatibility issues with LTP's internal openat2 definitions
+in lapi/openat2.h. LTP's configure detects glibc's openat2() and
+sets HAVE_OPENAT2=3D1, causing lapi/openat2.h to skip its own
+definitions of struct open_how, RESOLVE_* constants and the openat2()
+wrapper, resulting in a build failure.
+
+Undef HAVE_OPENAT2 in lapi/openat2.h to force LTP to always use its
+own internal definitions.this is a workaround until the fix is found.
+
+Upstream-Status: Pending
+
+Signed-off-by: Hemanth Kumar M D <Hemanth.KumarMD@windriver.com>
+
+diff --git a/include/lapi/openat2.h b/include/lapi/openat2.h
+index 03327bdb7..bd44573c9 100644
+--- a/include/lapi/openat2.h
++++ b/include/lapi/openat2.h
+@@ -14,6 +14,11 @@
+
+ #include "config.h"
+
++/* glibc 2.43 provides openat2 but LTP uses its own syscall wrapper */
++#ifdef HAVE_OPENAT2
++#undef HAVE_OPENAT2
++#endif
++
+ #ifndef HAVE_OPENAT2
+ /*
+  * Arguments for how openat2(2) should open the target path. If only @fla=
gs and
+
diff --git a/meta-arago-test/recipes-devtools/ltp-ddt/ltp_20260130.inc b/me=
ta-arago-test/recipes-devtools/ltp-ddt/ltp_20260130.inc
index 602f75ca..8786bb6d 100644
--- a/meta-arago-test/recipes-devtools/ltp-ddt/ltp_20260130.inc
+++ b/meta-arago-test/recipes-devtools/ltp-ddt/ltp_20260130.inc
@@ -30,6 +30,7 @@ SRC_URI =3D "git://github.com/linux-test-project/ltp.git;=
branch=3Dmaster;protocol=3Dht
            file://0001-Remove-OOM-tests-from-runtest-mm.patch \
            file://0001-Add-__clear_cache-declaration-for-clang.patch \
            file://0001-syscalls-semctl08-Skip-semctl08-when-__USE_TIME64_R=
E.patch \
+           file://0001-ltp-fix-build-failure-with-glibc-2.43.patch \
           "
=20
 inherit autotools-brokensep pkgconfig
--=20
2.43.0


