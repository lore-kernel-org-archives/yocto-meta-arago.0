Return-Path: <praneeth@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E3A93D4694E
	for <webhook@archiver.kernel.org>; Wed, 21 Jan 2026 15:43:02 +0000 (UTC)
Received: from SN4PR0501CU005.outbound.protection.outlook.com (SN4PR0501CU005.outbound.protection.outlook.com [40.93.194.69])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.33043.1768821522966737750
 for <meta-arago@lists.yoctoproject.org>;
 Mon, 19 Jan 2026 03:18:43 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=PDWZyhfA;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 40.93.194.69, mailfrom: v-singh1@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZylRjd7b41ZPew7kvChP011RdoRyLz4q3HYJSu1ZXVGXtao53BJQ5UYmBiATdA6hYSMdiRXQhCnT/Yk/2DdiWZtPh96ScyY+6sE0SZKXedeNqc0ASo5bYiBW+gnE7RuXZdUDHLrqr+pychWzPnd/voKMRkOCDeWEz7aIRHG6JSMg+GVnpRZ3Vkhmb+5dzWaelaBatgX2zEwmYcRUhCoDgLnWICFr8UaaV2ZWaTWQf4AYNEBb9sA8/EvuKZh/BGoFeuv7yiEunSoJ9+ehO2tXQzufETWW6VBZtMvaYot6rnIcyXL1SMCB2s5AWnGYnq8VP3CA91gjCNDA2HIBMi9grA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QsRX2sSzULjSONl0h4hqY7Vgv5rXTV+wtXhXVmkgtd4=;
 b=sUKlMAyZp5qigb6W9H1nK8XaVFB/2fZvz7A/c086XiGeUOsaOXdFGI+PjiztM0iJBYZ7EQ3cuUWO74JOvifI6r5CkKvafDWnOnIzucYBHxWmQoFCNl5hBR6SAItvxm0Z4N8xc9knidN7ML5s5PLvOThoQkVBadUxG4qTy4sELMtFr1Npg5ShaIUYsC6T2wGLFAAGRbk+/ZBMhzBIslYgGAerCqt4viOP5i26GFAM6Pp+aEDzaRBbUtFb7oUZD1zGEISEV4a4oItGBsCQWezs770idNPooKIMq11rjLVNd+sOxyP5klyot0xYfiVpztwQZD3CGAkF6LY3VuhLxLJG4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=denix.org smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QsRX2sSzULjSONl0h4hqY7Vgv5rXTV+wtXhXVmkgtd4=;
 b=PDWZyhfAC4v/iRrKg4XZBnI85zzjZ60u441YsUydhrA7RxqxSCsr49YfeYUyIwXQ5dCoVCkF149D/A2iLSEIC+p9C5HqAAqqvKsjBBZc3fLQbdiHtMYwpJNOKlWuOQ1JcG1XsX6fmwLK3cSWxXONwCREKfD0OwmIMPWnKdImK98=
Received: from DS7PR06CA0048.namprd06.prod.outlook.com (2603:10b6:8:54::24) by
 CH3PR10MB6810.namprd10.prod.outlook.com (2603:10b6:610:140::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.12; Mon, 19 Jan
 2026 11:04:06 +0000
Received: from DS1PEPF00017095.namprd03.prod.outlook.com
 (2603:10b6:8:54:cafe::a6) by DS7PR06CA0048.outlook.office365.com
 (2603:10b6:8:54::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9520.12 via Frontend Transport; Mon,
 19 Jan 2026 11:04:05 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 DS1PEPF00017095.mail.protection.outlook.com (10.167.17.138) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9542.4 via Frontend Transport; Mon, 19 Jan 2026 11:04:04 +0000
Received: from DLEE212.ent.ti.com (157.170.170.114) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 19 Jan
 2026 05:04:03 -0600
Received: from DLEE200.ent.ti.com (157.170.170.75) by DLEE212.ent.ti.com
 (157.170.170.114) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 19 Jan
 2026 05:04:03 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE200.ent.ti.com
 (157.170.170.75) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Mon, 19 Jan 2026 05:04:03 -0600
Received: from uda0513920.dhcp.ti.com (uda0513920.dhcp.ti.com [10.24.73.26] (may be forged))
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 60JB41Dg3580808;
	Mon, 19 Jan 2026 05:04:02 -0600
From: vishnu singh <v-singh1@ti.com>
To: <meta-arago@lists.yoctoproject.org>, <reatmon@ti.com>, <denis@denix.org>
Subject: [scarthgap][RFC PATCH] packagegroup-arago-tisdk-connectivity: Enable zeroconf ip support
Date: Mon, 19 Jan 2026 16:34:01 +0530
Message-ID: <20260119110401.3585256-1-v-singh1@ti.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS1PEPF00017095:EE_|CH3PR10MB6810:EE_
X-MS-Office365-Filtering-Correlation-Id: bf129bba-3fb6-470e-49d0-08de574a7577
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|1800799024|36860700013|82310400026;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?Qlcie05DoL0Cwr0rqMpE0bRhPcH7cLoXxlcYZDvKKWoeEJJlKX/Y8uFf8b6g?=
 =?us-ascii?Q?FcMlIv41EB0idB8b1RNEDjQl/gIBu5hJO7ZuNRcM+ma2zc6e8oXQdcQHglOW?=
 =?us-ascii?Q?EHUq7u8Iux9CB3da9T+Lwuqu9E2PS8w/V0XGvPJdmg4gUH5M7VCItJvKQ/j1?=
 =?us-ascii?Q?/rwlYEbRvVjBLu6Jf7nGMDDX8KjXnm514gqBVWaz3Z0AwzkzMS4uY2aYp2iX?=
 =?us-ascii?Q?AdelkznGhIo49BhZJPZR7rz1i6xhnO02N7kgOg/C5Hd+kEyoauPSRtYnBmBA?=
 =?us-ascii?Q?Pu+9+ysDGI5dLMrsbWOLBjsftzl4SZiF8x/KQi2FDZzIspVnbCAtLCR71OmI?=
 =?us-ascii?Q?++4WCw20AtJR8UwhqN/amtFINmPo5UuYHXdTj8T/xb5IawwnzUOjLEC5Vd32?=
 =?us-ascii?Q?I75OxcM0TDqHRvz7c9ZH4v9n0YH12nXAhxu5T9EzVIzPzCklae/UFikMv0e8?=
 =?us-ascii?Q?fbnHmhfkTmY33gQZ3lyB7RM9ZDZZqlByyqFsIWzmGhnMghKNZDJwygF3DICU?=
 =?us-ascii?Q?/auDVCZ8alIvO6J0z1edwZwREV9iEH7UnwxU67zFwx03rx6Od+WnkmQ6DCZH?=
 =?us-ascii?Q?oqnC9gkkXJc00HIS6E4eny/LK5IR1LGkAsllLGyYZyk+ruyXHkjOvYcdH2B8?=
 =?us-ascii?Q?XXqY/NKHIok9q2fok7St3/mGHLzVQEuMOZZJAnTUZxc3mBvG7ganRPi60mYf?=
 =?us-ascii?Q?wKGoOzboyAoMgH+cvdgxxUsDDr7kcceX6iuemd75FwtVTXPPcE3ozq5QMno+?=
 =?us-ascii?Q?QqmmiKF60imurohaMUP8SheAUiOwD1AgUokqUNZYkbZKhIy8rj6K5qj1hDG1?=
 =?us-ascii?Q?uZ9l1v8uvqZAtJLavtz3skuYmbL+oXRI229o5omYBvpXt8GWMB6zH1Kp6ob+?=
 =?us-ascii?Q?qVO4nfsWS1W5q+X8IjoXeVE2HSkLPDvmEBmpERe1joTAOA9HYqg8niFSsxxi?=
 =?us-ascii?Q?78/eGBnKXm36vJ9B9S4VhURk0cL94o28FyDjpJkFofqU4zt/k/0eTQUboYWB?=
 =?us-ascii?Q?VHYyWVIUQ7+8UQk+tLjM2zL1GE9sv5w6zapN6yZe1P2e9qV8ikwG2//yuhK+?=
 =?us-ascii?Q?+WvLP+KFInWPrt1jBFeoiwhc/dB1hP3QKrE92nRD8fX+vL2HaqOl717go36w?=
 =?us-ascii?Q?x68ErWpJ+B+VmCMQ7RmXv+aBdW2U2qXMBynpJnz8F1pEyHfolxtWwUxPL/se?=
 =?us-ascii?Q?zgXozxXe9YA7wgxYgFZqWA88iyBIlwkHBQg4Ctzfu+ep3C5kcVsIexmMAIle?=
 =?us-ascii?Q?gHwhdOCpW5FAT3YV0K+aexgAYPTc9tUIjQyMCvitCGGMVbQcynVcDPVaxRO+?=
 =?us-ascii?Q?UiuBklQOX2Nwjl2hDu/+/NEtfGqzXt8QAQWKYfpMCpjyDLootgNd3EKcmy/S?=
 =?us-ascii?Q?opgQQBLVBheWmXcHRkQXo5mhFGVQ0aHswi3h7M2i2JvRvC8pl/VNu4Anw0Vd?=
 =?us-ascii?Q?RMzvcFe2UWJKUjbgHJItEAGOw08UsUQiBqCGsL7OxFyCuJ/JHnhLADV9hP+e?=
 =?us-ascii?Q?kNHMYPOMr6+5pUHIs/xTB8parbK4qGYGjuNL55d5I6K/+HjPlrMOoL8Zx/rX?=
 =?us-ascii?Q?Da+toWAdvUo6fzTdpYGp0NA309h46qkA7lEQBdVaqpnB9xxHKPLgJVOtc1uI?=
 =?us-ascii?Q?1c7FaXmRx1GUFKY2PxodgdWmtLi7VVadSoytLo5nGFkc?=
X-Forefront-Antispam-Report: 
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(36860700013)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jan 2026 11:04:04.2132
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bf129bba-3fb6-470e-49d0-08de574a7577
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DS1PEPF00017095.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR10MB6810
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Wed, 21 Jan 2026 15:43:02 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16996

From: Vishnu Singh <v-singh1@ti.com>

Dante DEP useage zeroconf for Dante network IP addresses.
Zeroconf provide the IP network without manual configuation,
and avahi-autoipd is for auto ip assignment.
To get the zeroconf ip at bootup, zeroconf-autoip service is used.

Signed-off-by: Vishnu Singh <v-singh1@ti.com>
---
 .../zeroconf-autoip/zeroconf-autoip.bb        | 30 +++++++++++++++++++
 .../zeroconf-autoip/zeroconf-autoip/README    |  1 +
 .../zeroconf-autoip/zeroconf-autoip@.service  | 12 ++++++++
 .../packagegroup-arago-tisdk-connectivity.bb  |  7 +++++
 4 files changed, 50 insertions(+)
 create mode 100644 meta-arago-distro/recipes-connectivity/zeroconf-autoip/=
zeroconf-autoip.bb
 create mode 100644 meta-arago-distro/recipes-connectivity/zeroconf-autoip/=
zeroconf-autoip/README
 create mode 100644 meta-arago-distro/recipes-connectivity/zeroconf-autoip/=
zeroconf-autoip/zeroconf-autoip@.service

diff --git a/meta-arago-distro/recipes-connectivity/zeroconf-autoip/zerocon=
f-autoip.bb b/meta-arago-distro/recipes-connectivity/zeroconf-autoip/zeroco=
nf-autoip.bb
new file mode 100644
index 00000000..4b59a7e6
--- /dev/null
+++ b/meta-arago-distro/recipes-connectivity/zeroconf-autoip/zeroconf-autoi=
p.bb
@@ -0,0 +1,30 @@
+SUMMARY =3D "Zerconf autoip"
+DESCRIPTION =3D "Zeroconf IP assignment using avahi autoipd"
+LICENSE =3D "MIT"
+LIC_FILES_CHKSUM =3D "file://README;md5=3D102e8ceedf1b96837ba2eefc0d47f4e6=
"
+
+FILESEXTRAPATHS:prepend :=3D "${THISDIR}/${PN}:"
+
+COMPATIBLE_MACHINE =3D "am62dxx"
+
+SRC_URI =3D "file://zeroconf-autoip@.service \
+	file://README \
+"
+
+S =3D "${UNPACKDIR}"
+
+inherit systemd
+
+SYSTEMD_SERVICE:${PN} =3D "zeroconf-autoip@eth0.service zeroconf-autoip@et=
h1.service"
+SYSTEMD_AUTO_ENABLE =3D "enable"
+
+do_install() {
+	install -d ${D}${systemd_system_unitdir}
+	install -m 0644 ${WORKDIR}/zeroconf-autoip@.service ${D}${systemd_system_=
unitdir}/
+}
+
+FILES:${PN}=3D " \
+	${systemd_system_unitdir} \
+	${systemd_system_unitdir}/zeroconf-autoip@.service \
+"
+PR =3D "r0"
diff --git a/meta-arago-distro/recipes-connectivity/zeroconf-autoip/zerocon=
f-autoip/README b/meta-arago-distro/recipes-connectivity/zeroconf-autoip/ze=
roconf-autoip/README
new file mode 100644
index 00000000..1ad1d419
--- /dev/null
+++ b/meta-arago-distro/recipes-connectivity/zeroconf-autoip/zeroconf-autoi=
p/README
@@ -0,0 +1 @@
+TI-TFL
diff --git a/meta-arago-distro/recipes-connectivity/zeroconf-autoip/zerocon=
f-autoip/zeroconf-autoip@.service b/meta-arago-distro/recipes-connectivity/=
zeroconf-autoip/zeroconf-autoip/zeroconf-autoip@.service
new file mode 100644
index 00000000..952a8c60
--- /dev/null
+++ b/meta-arago-distro/recipes-connectivity/zeroconf-autoip/zeroconf-autoi=
p/zeroconf-autoip@.service
@@ -0,0 +1,12 @@
+[Unit]
+Description=3Dzerocnf-autoipd for %i interface
+After=3Dnetwork.target
+
+[Service]
+ExecStart=3D/usr/sbin/avahi-autoipd --force-bind %i
+ExecStop=3D/usr/sbin/avahi-autoipd -k %i
+Restart=3Don-failure
+RestartSec=3D30
+
+[Install]
+WantedBy=3Dmulti-user.target
diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arag=
o-tisdk-connectivity.bb b/meta-arago-distro/recipes-core/packagegroups/pack=
agegroup-arago-tisdk-connectivity.bb
index 0a8d4493..66aa4872 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk=
-connectivity.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk=
-connectivity.bb
@@ -53,6 +53,11 @@ BT_TI =3D "\
     bt-enable \
     bt-fw \
 "
+ZEROCONF_TI =3D "\
+	zeroconf \
+	avahi-autoipd \
+	zeroconf-autoip \
+"
=20
 CONNECTIVITY_RDEPENDS =3D " \
     htop \
@@ -68,6 +73,8 @@ CONNECTIVITY_RDEPENDS =3D " \
 CONNECTIVITY_RDEPENDS:append:ti33x =3D " ${BT_TI}"
 CONNECTIVITY_RDEPENDS:append:ti43x =3D " ${BT_TI}"
 CONNECTIVITY_RDEPENDS:append:am57xx =3D " ${BT_TI}"
+CONNECTIVITY_RDEPENDS:append:am62dxx =3D " ${ZEROCONF_TI}"
+
=20
 RDEPENDS:${PN} =3D "\
     ${CONNECTIVITY_RDEPENDS} \
--=20
2.50.1


