Return-Path: <j-sahu@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C40F1F46131
	for <webhook@archiver.kernel.org>; Mon, 23 Mar 2026 14:40:36 +0000 (UTC)
Received: from CY3PR05CU001.outbound.protection.outlook.com (CY3PR05CU001.outbound.protection.outlook.com [40.93.201.55])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.19053.1774276831927251935
 for <meta-arago@lists.yoctoproject.org>;
 Mon, 23 Mar 2026 07:40:32 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=Q8eMp4RL;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 40.93.201.55, mailfrom: j-sahu@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QyUtK2vvAZVSdfhZyAWq8wSla57qwAEULX/+x+fc0CMVPMg65gh+rmqmZq+XUh6Q3ND+YCy+V2SpofEnjEhBZpp2YnJMfYEYee3cnO/9JKiE5/3lnK/WY2YL/Wq4FDLiNujhm/bpSBxThfypcf9BMOdk2zwdw2ODjpyQ2FbAEShZ7jLc8Jy2v7mZoWDSXvErIjrsFFXDN0u9SoGfcCCL2KaQyMYGykkqpd8QeMfL/bitar1ImxnKeBzX79QYjBq9PgO5Cf34btF0s+sxRqj4B8z6jHkNl3y91EFYxwGndfqja+Mo1Tt7xB+/9TjRJ4Adm2IZVwxESphElDsNMRM5WA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TMjTZ402Lwdd2AxRqsY9MFdfybt0Ry7cLRF1FuzDqsU=;
 b=wIPatRP+oMGyOVpx0nMzTvYJDD7G+p/epgc9qQKYZyqhjicp2v52pejFmiC8l8mX2X/d7Lv6pm4ZCBjqbFyek7SIBJiOPbVrW7jG0L1BpLc/v5Vu8adTbTF7omk30DXO/LI8tlJ2ptgfKeNJWzHysUELOAchK+pDsMC2lBp7KEx0ps0jXe9Nh++1RzaHA71TCrnm9PZwONtOH2ZToxWvp+a3hs55bNjtrg7ZqtNovN50VqRmAM0EGax+5Ol0WxZJd1n+PlEsDLIlX46r2xke66+rGpOy7FCTMftYXCP1MwwirZFYLnV9IcayEIgMVwJDri8C6tlblO2UWpKhStTFxA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=konsulko.com smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TMjTZ402Lwdd2AxRqsY9MFdfybt0Ry7cLRF1FuzDqsU=;
 b=Q8eMp4RLpJTN3a+FlIxlY/PF3B6c/IqbKfMN6BP1xiAWZ3DSiJlUOTemQNRkJNizblOldmLxHRUOmqsMxeQL2HQfjsFRyFc8GVj2IiyO13uyZyhip3RbCCvqCMSfI5UjFvV0LtEJAtVx4kx53Uq9deiJSwgZZyV1KAxdrzmW+GI=
Received: from BYAPR03CA0026.namprd03.prod.outlook.com (2603:10b6:a02:a8::39)
 by BLAPR10MB5108.namprd10.prod.outlook.com (2603:10b6:208:330::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.31; Mon, 23 Mar
 2026 14:40:28 +0000
Received: from SJ1PEPF00001CE6.namprd03.prod.outlook.com
 (2603:10b6:a02:a8:cafe::5a) by BYAPR03CA0026.outlook.office365.com
 (2603:10b6:a02:a8::39) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9723.31 via Frontend Transport; Mon,
 23 Mar 2026 14:40:28 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 SJ1PEPF00001CE6.mail.protection.outlook.com (10.167.242.22) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9723.19 via Frontend Transport; Mon, 23 Mar 2026 14:40:27 +0000
Received: from DLEE209.ent.ti.com (157.170.170.98) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 23 Mar
 2026 09:40:27 -0500
Received: from DLEE210.ent.ti.com (157.170.170.112) by DLEE209.ent.ti.com
 (157.170.170.98) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 23 Mar
 2026 09:40:27 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE210.ent.ti.com
 (157.170.170.112) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Mon, 23 Mar 2026 09:40:27 -0500
Received: from jeevan-HP-Z2-Tower-G9-Workstation-Desktop-PC.dhcp.ti.com (jeevan-hp-z2-tower-g9-workstation-desktop-pc.dhcp.ti.com [172.24.233.81])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 62NEePWF439150;
	Mon, 23 Mar 2026 09:40:26 -0500
From: Telukula Jeevan Kumar Sahu <j-sahu@ti.com>
To: <meta-arago@lists.yoctoproject.org>
CC: Ryan Eatmon <reatmon@ti.com>, Denys Dmytriyenko <denys@konsulko.com>
Subject: [meta-arago][master][PATCH] systemd: Add systemd-networkd-wait-online service
Date: Mon, 23 Mar 2026 20:10:22 +0530
Message-ID: <20260323144022.2278502-1-j-sahu@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00001CE6:EE_|BLAPR10MB5108:EE_
X-MS-Office365-Filtering-Correlation-Id: 73f5de42-12b2-4bda-be3d-08de88ea206e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|1800799024|36860700016|376014|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info: 
	GkbBZyyyYXBD89VrREuBD01ZkImXC9K2VL6pwcVAGVFYHMK2s/QgvvJ/r+FRt4YwzRjdC5KkcbZWlSSBXbekE/tPICn9OaLueGa0V4lCE+2dUB/BCVSwWqB5rJb0T5iL3tFOPdpyy3bj+SrIWNU5ijT7k/ZoD7vnJr640VH+Lr2u1E0lXc/zjGTd/+yNA+UCpegT9WgTD2r5RL0xGGZ/xagBVXUQqywHKNE9ZAjUn09sAj8M781EobgmNixhrMKWpV4EnfIRkA5LBhXRqT/qISKY1Rgvj0dhMa4kBFQ3XzJowpxaMSTzW5MktMCKv9mtt3n5xLqRYDbrWCqx4nW0d+cj6aYkbaw5YdlFH7iQVXzZAjvKfT0aGOJK2UWWo1H6Fw/Qe/j+6g9yXG0xFkltzANDWZoK9f8sieVjGu7tnMVZqz8Eg9P2bj79WiodOZsHMdDy0YgIBW9BGUoBoVxCGPZAuw3G8WS2cS1SuHnAlxHfpmOsmIQQrG9YaPyjbO7tFEEDovObKQvhbcphCrFqANEjiNXpyv+SkAPiuIcUwdpUoARs3QrIX9C6NELrwPpAnkL48gVq8PhGBuZdU7gEfplKEV2L4sHz0qdKCwgAxgNMajgbxkAtu8nUcCtJ258c/qDOlY2v8D4Z8urG27zERagk/ZzWe8mOJg151ydO7jRdHOfzTqOmnpW9pqApOc1YS82WI4H5iyAk/qT5dl3EfuvSCWoxkz8q3TdgxsLU1i8=
X-Forefront-Antispam-Report: 
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(36860700016)(376014)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	QSYgWU8x734iLOjdbGTgytomfJirshpixjuMvWOYe+wrLth0g+NJTyJ9exw3DdnUSdqvbO8M0WsYnl3TFNv26Bj4QJT1R35nyNkoGSphvGaTCVGLcSVObXb+nMtkkPfMEL0yG6HOVFWag2iUrAWYndODAV/Bl1nBuIkmJ2UYW2FWCbKC6+CDD+IxBR+6tkntQ7WmBuMj72kn/3X8AtbdBx4rBcW1Kqg0KsSOtYbuLGm+h5cbmzGDB5gxzdKAUb2MU/BG8xadebirqRyzKzvTWhsERyljt6NSCzS1k61O3wlbodw+P2o3GIFA4R4NSswpxioKlmrF7JIL0C6eeOs9wAvz8AqSqVCrv9UwouJHEzM/mJT21Z6vum8eZxZtevQpGwq2KQCmB3qRSWpRe+ZdMED0rL60D3o1SKXfM+TVudJQ4FQgxFK8MdBz4mLjZofS
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Mar 2026 14:40:27.9811
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 73f5de42-12b2-4bda-be3d-08de88ea206e
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SJ1PEPF00001CE6.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLAPR10MB5108
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Mon, 23 Mar 2026 14:40:36 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17420

Install custom systemd-networkd-wait-online.service[0] with --any flag to
allow boot to proceed when ANY network interface is online instead of waiti=
ng
for ALL interfaces to be online. This enables faster boot and allows
docker/services[1] to start immediately when any of the network interface i=
s up.

[0]: https://www.freedesktop.org/software/systemd/man/latest/systemd-networ=
kd-wait-online.service.html#--any
[1]: https://git.ti.com/cgit/ti-sdk-linux/meta-tisdk/commit/?&id=3D386464bb=
dd2e857d08daf4c44c4e2e24c62e3be8

Signed-off-by: Telukula Jeevan Kumar Sahu <j-sahu@ti.com>
Signed-off-by: Chirag Shilwant <c-shilwant@ti.com>
---
 .../recipes-core/systemd/systemd-arago.inc    |  4 +++
 .../systemd-networkd-wait-online.service      | 25 +++++++++++++++++++
 2 files changed, 29 insertions(+)
 create mode 100644 meta-arago-distro/recipes-core/systemd/systemd/systemd-=
networkd-wait-online.service

diff --git a/meta-arago-distro/recipes-core/systemd/systemd-arago.inc b/met=
a-arago-distro/recipes-core/systemd/systemd-arago.inc
index 3c31b92d..3ca38edc 100644
--- a/meta-arago-distro/recipes-core/systemd/systemd-arago.inc
+++ b/meta-arago-distro/recipes-core/systemd/systemd-arago.inc
@@ -8,6 +8,7 @@ SRC_URI:append =3D " \
     file://30-wlan.network \
     file://60-usb.network \
     file://timesyncd.conf \
+    file://systemd-networkd-wait-online.service \
 "
=20
 do_install:append() {
@@ -28,6 +29,9 @@ do_install:append() {
     install -d ${D}${sysconfdir}/systemd/
     install -m 0644 ${UNPACKDIR}/timesyncd.conf ${D}${sysconfdir}/systemd/
=20
+    # Install systemd-networkd-wait-online with --any flag for faster boot
+    install -m 0644 ${UNPACKDIR}/systemd-networkd-wait-online.service ${D}=
${systemd_system_unitdir}/
+
     # Remove new prompt code that is polluting the testing output
     rm ${D}/${nonarch_libdir}/tmpfiles.d/20-systemd-osc-context.conf
     rm ${D}/${nonarch_libdir}/systemd/profile.d/80-systemd-osc-context.sh
diff --git a/meta-arago-distro/recipes-core/systemd/systemd/systemd-network=
d-wait-online.service b/meta-arago-distro/recipes-core/systemd/systemd/syst=
emd-networkd-wait-online.service
new file mode 100644
index 00000000..bb349527
--- /dev/null
+++ b/meta-arago-distro/recipes-core/systemd/systemd/systemd-networkd-wait-=
online.service
@@ -0,0 +1,25 @@
+#  SPDX-License-Identifier: LGPL-2.1-or-later
+#
+#  This file is part of systemd.
+#
+#  systemd is free software; you can redistribute it and/or modify it
+#  under the terms of the GNU Lesser General Public License as published b=
y
+#  the Free Software Foundation; either version 2.1 of the License, or
+#  (at your option) any later version.
+
+[Unit]
+Description=3DWait for Network to be Configured
+Documentation=3Dman:systemd-networkd-wait-online.service(8)
+DefaultDependencies=3Dno
+Conflicts=3Dshutdown.target
+Requires=3Dsystemd-networkd.service
+After=3Dsystemd-networkd.service
+Before=3Dnetwork-online.target shutdown.target
+
+[Service]
+Type=3Doneshot
+ExecStart=3D/lib/systemd/systemd-networkd-wait-online --any
+RemainAfterExit=3Dyes
+
+[Install]
+WantedBy=3Dnetwork-online.target
--=20
2.34.1


