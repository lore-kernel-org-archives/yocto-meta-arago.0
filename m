Return-Path: <a-garg7@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CD484F3C24A
	for <webhook@archiver.kernel.org>; Mon,  9 Mar 2026 13:01:35 +0000 (UTC)
Received: from SA9PR02CU001.outbound.protection.outlook.com (SA9PR02CU001.outbound.protection.outlook.com [40.93.196.29])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.13590.1773061292929485374
 for <meta-arago@lists.yoctoproject.org>;
 Mon, 09 Mar 2026 06:01:33 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=SLNGiHcm;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 40.93.196.29, mailfrom: a-garg7@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WgqzMHJlkfmNd1mD34R4PZNo+9fduno9opF/gRoKuIOSZFTS9gJDr08/PuHCpa+Dp5nLm/++TQIX77BUbAeof6lr9RjRQCzwxyvZGmQwkkPWlJtZu/M4N6IM1fSA//PJsQDLQXhg0cqx9RooUg4IDaz682qPDzX78fL8NGL1e9ya6Z4Df+nYqDFMcFrXfn2PpLkNuIuf95kO7mTWKtWFsYaBPpT6DTu6lgTz40nNj+hOlOOIpE9PVeuOzRktVAwCZTQkZnZczUhQmal0rbunXqRSXsEos3jcrXG2wXmWwBS55439YnhsCbB7cb6Pg8ZIiR9Cx8tLjKNHKaFVGZ/wnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oN1WEJeXUO3ZTbWUCSmlp3bkf1iNOQF9Y7yn/hpUQdI=;
 b=vvLuPPYKc+QYt7jdNCTbkjgs0RkL0e6yGgt3WcHY2iuGQG6Nq7Rzfx+Wj6pW9dGCavtPKx1E828CFnJWOwiJJskbdjrMNcI98By71I7yBr1Gc9x2XJ0NKa5b8+lQ9ZrT2AhvcFABW+yQI2UfvHKstfqZU9J1wa7+R29us2Q+Al96e2SRtvVZlaymF5uRtj6vZ1P1qeeE5q9RqiveZrRp3sJt81adrJri63Demne9rfFms6lGZv9+ZA2gZYgqJyUJZASvJiZQgUZnVgo63xn9+VtuP4hxwrg12Ph6wbm5oxSMXJzZeu7iKMyC19gmVKpdzvRXR496p0BQhQmJW4NTCg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=konsulko.com smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oN1WEJeXUO3ZTbWUCSmlp3bkf1iNOQF9Y7yn/hpUQdI=;
 b=SLNGiHcmjPSWkacqAcF2aq2lvu7ceyGADLAqV2pIP/ot68sLAM1n/epuUpKjZLgNRyQT7yO8Rys9wyn6pYXqrsiAMffxZO5CeyWfBghftelD4BO5J6i0rgfDUZ0tMPR8QC6PurDmc8jarUw9xw/sCPAopoHXkE9+H7xZ14iK8zA=
Received: from CH0PR03CA0300.namprd03.prod.outlook.com (2603:10b6:610:e6::35)
 by DS7PR10MB5136.namprd10.prod.outlook.com (2603:10b6:5:38d::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.25; Mon, 9 Mar
 2026 13:01:29 +0000
Received: from CH2PEPF00000143.namprd02.prod.outlook.com
 (2603:10b6:610:e6:cafe::e2) by CH0PR03CA0300.outlook.office365.com
 (2603:10b6:610:e6::35) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9678.25 via Frontend Transport; Mon,
 9 Mar 2026 13:01:06 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 CH2PEPF00000143.mail.protection.outlook.com (10.167.244.100) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9678.18 via Frontend Transport; Mon, 9 Mar 2026 13:01:29 +0000
Received: from DLEE200.ent.ti.com (157.170.170.75) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 9 Mar
 2026 08:01:27 -0500
Received: from DLEE201.ent.ti.com (157.170.170.76) by DLEE200.ent.ti.com
 (157.170.170.75) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 9 Mar
 2026 08:01:27 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE201.ent.ti.com
 (157.170.170.76) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Mon, 9 Mar 2026 08:01:27 -0500
Received: from a0507033-hp.dhcp.ti.com (a0507033-hp.dhcp.ti.com [10.24.69.112])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 629D1M1v625871;
	Mon, 9 Mar 2026 08:01:25 -0500
From: Aksh Garg <a-garg7@ti.com>
To: <meta-arago@lists.yoctoproject.org>
CC: <reatmon@ti.com>, <denys@konsulko.com>, <c-shilwant@ti.com>,
	<s-vadapalli@ti.com>, <danishanwar@ti.com>, Aksh Garg <a-garg7@ti.com>
Subject: [meta-arago][master][PATCH 1/2] ti-test: Remove the pcitest application
Date: Mon, 9 Mar 2026 18:31:08 +0530
Message-ID: <20260309130109.52886-2-a-garg7@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260309130109.52886-1-a-garg7@ti.com>
References: <20260309130109.52886-1-a-garg7@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PEPF00000143:EE_|DS7PR10MB5136:EE_
X-MS-Office365-Filtering-Correlation-Id: f83b6f53-0cd9-418b-7e0b-08de7ddbfb02
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|376014|82310400026|36860700016;
X-Microsoft-Antispam-Message-Info: 
	740zz4U8cbKpHlb9HWSNdtqm+9sYitEfvXT5IxcecgFj7U++jkXfWbbXKJE74hRFUVhaNePXPjdeVN9aVsypz1Fsss7WwjgINamtqCgNgZYtJ5cr5bq3Q6qFxfBSg6MA1PgM7LNqailf7MhTczR5GDFNG4GkEqOxtbyzZNLumKcvd1UsICt8YbmLIejhC5Dy6qe9uxDKfsdDONGk8AOVcqE9Dn9iF8HN0yDrj4mBnlB88+/OReCvz7sCd4oKjQL7K+5lOfxOaVFVP1rMY5ibghcScbm+Trr9O2lNPhaoEPFV1CGfsGRJTruW1VeZ1n+82f/xMBSYarnvzfV3Fs8ECMe3Chgie4LjP1npKrRbIH8C3FbEl8EA0A9lS5cfsXdWgtBuojPujRwkY4ZcU4eqlm+GieTVXpbS7SrnQKRPo7TFcXKJDVTEt8cgosvsNeYPy9scGlo5tSPdYuTfPvLgjYdKFlEb0i5d+nsyUcE+wKGDrvXdAnaa6In1vgbHk2hnwGEOe4ZcIK4Qn54BkicgMRGNkRBrw1w3lhdGxOn5WIjLCxTomQYKpi/pOqZqGjdphrB+tTQfLnQLbwppB8sFXXfOSF6dvekeqVLlUOJO0O2ug0OyZDXiZpcpqDpeyxWtmAt0iS4SP0OHAUablodlZIIX2pHPyHpgvWj/FCP+bijanzFDQJihRLOL4w8IW+Nm9EeikeqW10djLJEs7GbxJtcuChssxPXRxzQTRt9BhNzsvrdEkadMZPH3Nu3e9LjCPWxPcqglciIKTNn9sOdacw==
X-Forefront-Antispam-Report: 
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(82310400026)(36860700016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	dDRdhmdfjy2FdB+P6T2Upo3t6PaIybEuWidmAEIkBV7gFITV2MTXHALTiXCKGIG64KqNvgCYlQEh/0vPQnHwLMRcZvvRETuvZImiFLyyQZdoX5MJsWlE4kYAAAucTZRkWX+uU4WFF8BGuevaLwnk+ckBe1WZ4fVKhGo4LqD4HvTVwpvtTP9XcSaNktS54khB8X+EJ+uJ0tj8o4Qsuj4QoRTZQ449LclMypXoflG7oLYS8B/sSw1FOPJMiZdCAwO4V6V6kVKSjIMkhyPuNqeySY6r6Tw3pclwMqgyEdJ/9Huk8UFEJEJcxaVcMcb7vtTzMf9xDvW9l65oXgx05xVyz104MPHQft3XZ7nVqXvzmHnH3rMDNtKO9U5Y5wyl53PPbVJgOOCVh6Cjl8BTcUmx4yx4ugEhJ8ay+8h1WKDdYoBsiA6FKohidGlxeoXkjyAH
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Mar 2026 13:01:29.4699
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f83b6f53-0cd9-418b-7e0b-08de7ddbfb02
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CH2PEPF00000143.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR10MB5136
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Mon, 09 Mar 2026 13:01:35 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17290

The 'pcitest' application, used to test the PCIe endpoint functionality,
is obsolete on the 6.18 kernel. Hence, remove the pcitest application
from packagegroups.

Signed-off-by: Aksh Garg <a-garg7@ti.com>
---
 .../packagegroup-arago-bootstrap.bb            |  1 -
 .../recipes-core/packagegroups/ti-test.bb      |  1 -
 .../recipes-kernel/pcitest/pcitest_5.10.bb     | 18 ------------------
 3 files changed, 20 deletions(-)
 delete mode 100644 meta-arago-test/recipes-kernel/pcitest/pcitest_5.10.bb

diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arag=
o-bootstrap.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-=
arago-bootstrap.bb
index e7a28eb80575..35c54ce7b176 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-boots=
trap.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-boots=
trap.bb
@@ -11,7 +11,6 @@ UTILS =3D " \
 	 evtest \
 	 memtester \
 	 nbench-byte \
-	 pcitest \
 	 serialcheck \
 	 yavta \
 	 hdparm \
diff --git a/meta-arago-test/recipes-core/packagegroups/ti-test.bb b/meta-a=
rago-test/recipes-core/packagegroups/ti-test.bb
index 65cf7f1ea614..25d8cce5d615 100644
--- a/meta-arago-test/recipes-core/packagegroups/ti-test.bb
+++ b/meta-arago-test/recipes-core/packagegroups/ti-test.bb
@@ -37,7 +37,6 @@ TI_TEST_BASE =3D "\
     nbench-byte \
     openntpd \
     ${@"optee-test" if d.getVar('OPTEEMACHINE') else ""} \
-    pcitest \
     pciutils \
     perf \
     powertop \
diff --git a/meta-arago-test/recipes-kernel/pcitest/pcitest_5.10.bb b/meta-=
arago-test/recipes-kernel/pcitest/pcitest_5.10.bb
deleted file mode 100644
index 9ab0dbedf4ba..000000000000
--- a/meta-arago-test/recipes-kernel/pcitest/pcitest_5.10.bb
+++ /dev/null
@@ -1,18 +0,0 @@
-SUMMARY =3D "Linux Kernel PCI test"
-LICENSE =3D "GPL-2.0-only"
-LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D6bc538ed5bd9a7fc9398086aedcd7e4=
6"
-
-BRANCH =3D "ti-linux-5.10.y"
-SRCREV =3D "73aa709ca10103b61fba3a07471dbb4dcb56db45"
-SRC_URI =3D "git://git.ti.com/git/ti-linux-kernel/ti-linux-kernel.git;prot=
ocol=3Dhttps;branch=3D${BRANCH}"
-
-do_compile () {
-	cd ${S}/tools/pci
-	${CC} ${CFLAGS} ${LDFLAGS} -o pcitest pcitest.c
-}
-
-do_install () {
-	install -d ${D}${bindir}
-	install -m 0755 ${S}/tools/pci/pcitest ${D}${bindir}
-	install -m 0755 ${S}/tools/pci/pcitest.sh ${D}${bindir}
-}
--=20
2.34.1


