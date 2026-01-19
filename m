Return-Path: <praneeth@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E585AD4694F
	for <webhook@archiver.kernel.org>; Wed, 21 Jan 2026 15:43:02 +0000 (UTC)
Received: from BL2PR02CU003.outbound.protection.outlook.com (BL2PR02CU003.outbound.protection.outlook.com [52.101.52.70])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.33343.1768821566704290320
 for <meta-arago@lists.yoctoproject.org>;
 Mon, 19 Jan 2026 03:19:27 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=ZILc58zb;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 52.101.52.70, mailfrom: v-singh1@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=v9Ddmo8tWITbJ12dLGtkMasQg61Qt83jlknSuxPAb2WogIVsy2+bmsN2NfwcUi+0wTkXGlZEnk4Mr4zejH7ZPXpn4HrQyyD0uKKUBDf7AfJ1qk3TGVgZh/G/JXaucp3GcaCF0is2Q7eD3uymB9vDWe7QN5njiEfL3i2IFu/YeeAuEN/hL4oMBH+stGCoja0hgc/KpC90No92ZQ3mhDnOrLWWlvA87lqFpJLo4V21dJ30wQuVEICLfYIbHpI06UhS3omqTZ06RjwK1BPZoqDv0ao5DTGbqlZ7yGwP650NEcWEYy0lMV5wMIeKldQu7sTBsuS3T/mOnk1hU/9EKoTb6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QsRX2sSzULjSONl0h4hqY7Vgv5rXTV+wtXhXVmkgtd4=;
 b=s3WXoW3zI1IRQFDno2c3UeSMjT4eTlatG+c0CY7uZ6Phlb492O0EFRhDh8hl4syJ8tlw3X2+FU2lpaiwKtXyV1TXE3DKvqJypTMlKspfqOfKDdbTVWX0nDO1BowLqn9cvtm+xcfhEfDMnKs2NKW2P89grmiooni+0eABXpmhNd9D0VvTL2hiOtNiAt7aLCaE3Nz+dSO1AfUb1c5QOM5fn5sGkBWutWpvISxV/QRKkihNHU5LGQoYQwHQ8wFQHdPyzf0Gs7Vrmr2zfh43a6kqGr52OtXN7IcCSoigcTkyYK82wPFzTxkrG7W6iGlSQOf8pYrMwWbI/vxNAO1HaAf/rg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=denix.org smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QsRX2sSzULjSONl0h4hqY7Vgv5rXTV+wtXhXVmkgtd4=;
 b=ZILc58zboJsXI7zI/GnBVUM45WrBNCSjQbrN7pxTSHOtfhRh56ABHbO3VoMhckHwQQnmcKzxJo4pzM4JkMH5CGuI9h7054dJCLnwj+fAV8GayVRAd7utl9BatjWZbYE4S6NPdr368oikeKN4V0KFM+1sT2sVwJDIGDDaAX74efg=
Received: from BYAPR05CA0020.namprd05.prod.outlook.com (2603:10b6:a03:c0::33)
 by SA2PR10MB4634.namprd10.prod.outlook.com (2603:10b6:806:114::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.10; Mon, 19 Jan
 2026 11:03:48 +0000
Received: from SJ5PEPF000001F6.namprd05.prod.outlook.com
 (2603:10b6:a03:c0:cafe::11) by BYAPR05CA0020.outlook.office365.com
 (2603:10b6:a03:c0::33) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9542.7 via Frontend Transport; Mon,
 19 Jan 2026 11:03:47 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 SJ5PEPF000001F6.mail.protection.outlook.com (10.167.242.74) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9542.4 via Frontend Transport; Mon, 19 Jan 2026 11:03:45 +0000
Received: from DFLE215.ent.ti.com (10.64.6.73) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 19 Jan
 2026 05:03:43 -0600
Received: from DFLE208.ent.ti.com (10.64.6.66) by DFLE215.ent.ti.com
 (10.64.6.73) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 19 Jan
 2026 05:03:42 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE208.ent.ti.com
 (10.64.6.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Mon, 19 Jan 2026 05:03:42 -0600
Received: from uda0513920.dhcp.ti.com (uda0513920.dhcp.ti.com [10.24.73.26] (may be forged))
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 60JB3d1C3434384;
	Mon, 19 Jan 2026 05:03:40 -0600
From: vishnu singh <v-singh1@ti.com>
To: <meta-arago@lists.yoctoproject.org>, <reatmon@ti.com>, <denis@denix.org>
Subject: [master][RFC PATCH] packagegroup-arago-tisdk-connectivity: Enable zeroconf ip support
Date: Mon, 19 Jan 2026 16:33:39 +0530
Message-ID: <20260119110339.3585220-1-v-singh1@ti.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001F6:EE_|SA2PR10MB4634:EE_
X-MS-Office365-Filtering-Correlation-Id: 03eaddd2-a8ce-4368-7890-08de574a6a86
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|376014|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?P2FNskeiocLgA4sFilHqwz3CKCrir48lgO+vDyreg+bcuiD7J/8MOQi0+i1u?=
 =?us-ascii?Q?CGmMxkv+XtgPlqX55zxrw96LHItpQDFARsY3yX/f76joZ2a5p0abZIzG/PIe?=
 =?us-ascii?Q?+2J0DDdCK7oMpTweGPFhsMOywkqJo5ub6TuiiSkVZ0B2xFhD0oPK/RKd5WXW?=
 =?us-ascii?Q?VdvS6v39lqXVgBJdO+s5JN4SzpVfaYPgw+3qBLS1TvsiMyO9IvHVCjLWehKO?=
 =?us-ascii?Q?y7eKYTTLPA6IwgN20e1Y9oJXxYFMdf3hBtqBOmpU0Q06w6rB9kL/lnp9hGPs?=
 =?us-ascii?Q?rrEcqMXVg1eRHP9/tPtq2e3tN1AivGlDfJkT4ZNwJz9GSTC8ZCLp1bMrl41Z?=
 =?us-ascii?Q?lNLNZFa+PFD0DVEagQZIIt+5zk+gt9fE8J1HrIjYx7nm40eu9EuzF7U2rybB?=
 =?us-ascii?Q?5VCQMvT0Uq0USdPkn3qPLj5b/cLGNaCybdxXGOjTktvhiJOxPMYfPrA/pDBc?=
 =?us-ascii?Q?qL+qvqu/VKCiVzMJDT8xrj+waw8PohBYWYWrCwFDfoiVbXlySxG83zwTW7bC?=
 =?us-ascii?Q?X64DqCuApNRQfxF5CyERQvS+wxh71UtEa90Xy8RTNsLHzuTcXUmUqW9S6Yqu?=
 =?us-ascii?Q?lJb20BMgTGQX4UrNIX6NfpKEMS12V3/AJ3baUB9dY9neYr3mmyOdR9qdEm9N?=
 =?us-ascii?Q?DxKa55tFI7k/VG1KXyFZpgRUwb9h1HCegb4pNSd5CLWhta5Xax7iK0vKNvGK?=
 =?us-ascii?Q?ndQFYGaoByO/HERU2gxlaRA9dA/r7qsFrX9koyZRqA9l6cWD70WWhaRGpjrQ?=
 =?us-ascii?Q?irQCj6ulCGxnMypFvLwgjnEl2kE+59bT8tw/Jpo8SAGOejtFcyRTus/egpkk?=
 =?us-ascii?Q?7N8xQlrM3DMDNdlz7URXgRdrwoXmt1Qgw+A2W2wUlYmA35Cn2AyCrIecDufK?=
 =?us-ascii?Q?lM2C8FlxhAZEIIFZx9xrtV8tThS/L9ZE4azyN82DNPGKPplIMptbEAxxobTK?=
 =?us-ascii?Q?sXv1iZgI/zzycxdCm4ooNWYT3D9OAJ5x13mmMzJYe8xmbADIbaDATZjrVmQI?=
 =?us-ascii?Q?Mv1aMmJaT+u/j3BLhrKC+aAnhScpe6KFQmohAanpe7QFL3fvxEyXPnuDuS5F?=
 =?us-ascii?Q?Dbms+YrfSyG/QNJzE/jSL3Po8B7PGpTVTlhJsFcOcZ5WrcxauqmfFBlKgBkh?=
 =?us-ascii?Q?DiIMJwsswdbl2l7VjM2ddNWz8FHweXeK4gJBgPbTTLXGLvirW2GJoKldjIuf?=
 =?us-ascii?Q?thC5lNi4z2DzeahE15tNIaOxDzGH+y5IJ9GYmpmZUEJlquuAbDgy9g1jp9ry?=
 =?us-ascii?Q?H+zNclEQ9ra+fUAU689KpEhU4f4vZHZ+FaZKT2aS0QhxHdV6ed2IvnIiFCGQ?=
 =?us-ascii?Q?Hb3zvTYjrZtlHocJAwAHa39TiHRdtFp2CV0gfQ9qgbjFB+hI7K96U4Z4vKyQ?=
 =?us-ascii?Q?e+0p7pXTC+gi9PQ4EzOxp9qrak6lnBZIBJIMS6rTTiHF51GCzm2R3q50SAKc?=
 =?us-ascii?Q?Nm9j3jjo2ivE9dctVLSpopX+J4ReHxcA4S9ij3z/PikB7jyQlswpafBmJHbe?=
 =?us-ascii?Q?d/BukOlPbHB9J1uVd/Mj7w0mNMAagXcEG1MZ1oy53BG1WJyWYEB258oNpX6P?=
 =?us-ascii?Q?ix+AoCMWCGGtmKCMFlXuYk8E86jnc0pLdDAehgtuzSdNmcUCx7ydOaH4cM+d?=
 =?us-ascii?Q?Vs6g7hqacDp+89K4kDx0jqqByDrcRLt5jvMD/WedIpIw?=
X-Forefront-Antispam-Report: 
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(82310400026)(376014)(36860700013)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jan 2026 11:03:45.8303
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 03eaddd2-a8ce-4368-7890-08de574a6a86
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SJ5PEPF000001F6.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR10MB4634
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Wed, 21 Jan 2026 15:43:02 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16997

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


