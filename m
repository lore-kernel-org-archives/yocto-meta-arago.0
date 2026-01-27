Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8E097D340B5
	for <webhook@archiver.kernel.org>; Tue, 27 Jan 2026 16:43:51 +0000 (UTC)
Received: from SJ2PR03CU001.outbound.protection.outlook.com (SJ2PR03CU001.outbound.protection.outlook.com [52.101.43.39])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.16058.1769532227709191868
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 27 Jan 2026 08:43:47 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=CT7SJVYY;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 52.101.43.39, mailfrom: reatmon@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kg+s5LrdRV8fi9DWJ/imxz/vVy7jxB1ANwArj6yzDtPAZkALYyV2EaSzEssKZWymJxXxlB9W96/FbM0k1mV+Q+f4Tt5RvUu+gb9cA2v9nHi6LkoTZxK22CZhCvhsO0gvLq/DBkBuef0vHFNf9if3t7QpdBCqZmVBinbCtCQskwNP9CRX2lf+N2T89RZWR/GA6uNENZKtYTf+FIvoXBl2ut/jPkn83XeE7spTys+3f4XXbFJkmE6KbT+mx5ZxQVx+Q+gf+U32AtjNcxAUDbj019xVTq/OuBzSc6muv/CkAxBJtVurWtDv/MhtWJQNj17+CoNghI8MAMdBPCq2P7PECQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oxkhC9iL65RRCdESaPffNX0vF5VsuZGVyXW/+F1citg=;
 b=EOr4CSezUi0yPnScTL+/3x7gxgZ/gCo57FR4zT9/LbwT2tSeVOZFyzg9U7FOqpPXOsYEGX3VpN3CZENW4fCEWEbpLagtUX9S1qymYZa1c/5PFeJdd3f8pSJQDfXM1uJfl+ZFHebTBDWaJ5gMm3di9STig1INq4ZkHNiW2Kk/HY3zU+TB+TcQ5tO/eC7i+mRrdl30LmwcD1Gnc545fR2qZJkzIffrp0ypDUgWeJhmeu5pEXZVPm5+7UNLqXO2zOhPFGEX8ZVXJxcHCt7GOM4q5mLZ5gmwDMFEkf5N/Ldpp1cSS0LkIzvxzEYsFBfqTxmcaew5vFardZK03ieZJCW4Kg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oxkhC9iL65RRCdESaPffNX0vF5VsuZGVyXW/+F1citg=;
 b=CT7SJVYYLb3UNTuxtxbFlvp9r/SnT2mwQDdjtVWGa6uN1xyMUihlaX44T6erHLPz7Mk3zc2A1roJwTKN38wGnTAAlzNK3smKwoOEkrt6gQpyD1ghGvnXeqV3ulpOyM1PavQCNUI9zBBvRRfF/9kRc7IqX02t0GfqKrgtV8Y5Duc=
Received: from BN0PR03CA0048.namprd03.prod.outlook.com (2603:10b6:408:e7::23)
 by SJ0PR10MB5694.namprd10.prod.outlook.com (2603:10b6:a03:3ed::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.15; Tue, 27 Jan
 2026 16:43:45 +0000
Received: from BN3PEPF0000B073.namprd04.prod.outlook.com
 (2603:10b6:408:e7:cafe::1a) by BN0PR03CA0048.outlook.office365.com
 (2603:10b6:408:e7::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9542.16 via Frontend Transport; Tue,
 27 Jan 2026 16:43:44 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 BN3PEPF0000B073.mail.protection.outlook.com (10.167.243.118) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9564.3 via Frontend Transport; Tue, 27 Jan 2026 16:43:43 +0000
Received: from DFLE210.ent.ti.com (10.64.6.68) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 27 Jan
 2026 10:43:27 -0600
Received: from DFLE211.ent.ti.com (10.64.6.69) by DFLE210.ent.ti.com
 (10.64.6.68) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 27 Jan
 2026 10:43:27 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE211.ent.ti.com
 (10.64.6.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Tue, 27 Jan 2026 10:43:27 -0600
Received: from grumpy (grumpy.dhcp.ti.com [128.247.81.229])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 60RGhR56819458;
	Tue, 27 Jan 2026 10:43:27 -0600
Received: from reatmon by grumpy with local (Exim 4.97)
	(envelope-from <reatmon@ti.com>)
	id 1vkmA3-00000001dl9-0uZb;
	Tue, 27 Jan 2026 10:43:27 -0600
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>, Denys Dmytriyenko
	<denys@konsulko.com>, <meta-arago@lists.yoctoproject.org>
Subject: [meta-arago][master][PATCH] *-telnetd: Remove telnetd services
Date: Tue, 27 Jan 2026 10:43:27 -0600
Message-ID: <20260127164327.391138-1-reatmon@ti.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B073:EE_|SJ0PR10MB5694:EE_
X-MS-Office365-Filtering-Correlation-Id: 32604b23-4252-4419-d1da-08de5dc33b9f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700013|1800799024|82310400026|376014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?hfEvdre3ecspH3ImpQbHOuzOMTyALo2xUMACgs1FTUTI0t8Xn9bgkWLYyAvJ?=
 =?us-ascii?Q?/I/+ymTSGIS/DT/oksfr/VERkJnVvdDDTctS+JaE4tj9l4YaS2pqLPwFQbjj?=
 =?us-ascii?Q?XiruIHYMyhEdlE9t6RAneVj0FqRTUAdavWQdGPmw6nh32T2kgDdM8tejxhUV?=
 =?us-ascii?Q?cMHRX9ieip1bZDVu/ClbCxvWoU6Sc7aKxAVT8fqBKLN85yscv+l2Hwe/kYCU?=
 =?us-ascii?Q?OCc0eXyeI4YW2KsyO07PVOp4H7YYtCjY97lBk1XPjtFnYquYuLShmKbJ6CgO?=
 =?us-ascii?Q?9jD4v9aK84/k9eAKeKIlKWgx+lMKBcKvHK5HwzXx+xaV65Cf4i9C5RGhp6rK?=
 =?us-ascii?Q?DkiOfpOjAjQjfBu+gNv+76Od5tBADbY0pxvbWKqlZqEJ85gdeyN7MbBW136T?=
 =?us-ascii?Q?cyhbS4/0wXmngzNxNOaEggJ5jEUdfDvIII38oyoDul4W0X40u/zGb5XGEqPi?=
 =?us-ascii?Q?iaAnoPZxIFkT7e3Lkdo+n860JrkOyGafJgvp4bogp6Vti0pBP/93VDcKtwyN?=
 =?us-ascii?Q?1gF1Ql59n4HMOxTqI8rEhQYpSE7a68WMgM9it5z1sd3dKDMYN32XD67rZc//?=
 =?us-ascii?Q?brUjy0dF9D7N2MSlpirKh42sgWWbmXJ6rvCsJVONEwzOPIOjCWN/YDLJE6d1?=
 =?us-ascii?Q?nUHYz2jh+OiJsgtS0NT4Q+vuLY7toWLlvwNq5zfgSLi8eEYLjsYgujrl9/kf?=
 =?us-ascii?Q?BxRwDwDvKTntljkteS38RVJM29I/KY2OWkJoNRXEPWJ7IfTn1fldjf2NjZ1p?=
 =?us-ascii?Q?d4CSacgS+JiVw7fLqu1TJEEIjeLIkuVbws4N0N/1M5cTu8QDjELdrNCJXW9z?=
 =?us-ascii?Q?+QUDO5XaI65F9q/uSOR2wsG+M6gvaA9xmIIKwQC7MmxPLiRCBQ2FPG5/fqVE?=
 =?us-ascii?Q?S5DwmJXPLZcKB56wyEMzt86h1gZkWdl7HgiNSvF7+8Rb0Kjk1sPk6JNE0W53?=
 =?us-ascii?Q?Rz71brBALT73UE+StQMwvTNmbjcxXX/z7Ngk9jlCVTLSKU5EBoNTAOZn/Sx4?=
 =?us-ascii?Q?a3cSvCDUwtIU2/JUtIT1TzXFPRYDuXXMKP9w5D/k/P8G/JKUsKWfGN80njWg?=
 =?us-ascii?Q?lc+wy/Y31x+S6A+4qUi1PkR4kpBzbx0QfZyVcHllzPd2XhFGRlCWmgpeqjsN?=
 =?us-ascii?Q?BqFZYqYbIEf29EXUDapif/vFV6+38XQarhip/LuxC+82Oq/sOYFVpM/ninlJ?=
 =?us-ascii?Q?ZZ6i5XpUwdgelmBSgH2atjRIrv8dycvlkfDMq9INnf2UI8H3QJ+A2M8TPjcN?=
 =?us-ascii?Q?hgzNN9a5mWiruPZLXyFKOsoBMIArsGD5g2XwGy546WJU2PmyWEdXEeUZF2LE?=
 =?us-ascii?Q?Czw5ggWYzl41YdF1Z1ILkgjei9JNrkzWWPHsj90cb1J6PC1C54VwULUA+Yv7?=
 =?us-ascii?Q?pHZO6898/qabCSU1MhMT4Jl38vcKwZSjiadhJ5r3uVauNtlv5+cA/rro/YRE?=
 =?us-ascii?Q?iaZq0PbhZs75HTiAU2Cuf3wzpp20Gl7fVnEs9SOIYoM34tRHBKty/vqndQhS?=
 =?us-ascii?Q?4eF2etlIDe6/zO8fh+3pjVbbrA2QFB9z7YMqcql+lTj2ssI4Wq6xAwTTma92?=
 =?us-ascii?Q?+pMKavuOYwBMvwzS/vUuEF/xLI3y7h1FzQ4+w2lpZVrOqX1JWT2m9r9wbFep?=
 =?us-ascii?Q?Qm3iWOXUsFSkC8ognTo5gagjg9se0bA9Sem6SDBs568443twNH0eM4BKOC8v?=
 =?us-ascii?Q?mi1fbA=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(82310400026)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jan 2026 16:43:43.2384
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 32604b23-4252-4419-d1da-08de5dc33b9f
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BN3PEPF0000B073.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR10MB5694
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 27 Jan 2026 16:43:51 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17041

Remove all of the services that start telnetd.  It is time to retire
this service in favor of ssh for connecting to the boards.

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 .../initscript-telnetd/initscript-telnetd.bb  | 18 ---------
 .../initscript-telnetd/telnetd                | 40 -------------------
 .../systemd-telnetd/systemd-telnetd.bb        | 20 ----------
 .../systemd-telnetd/telnetd.service           | 29 --------------
 .../packagegroups/packagegroup-arago-base.bb  |  2 -
 5 files changed, 109 deletions(-)
 delete mode 100644 meta-arago-distro/recipes-connectivity/initscript-telne=
td/initscript-telnetd.bb
 delete mode 100644 meta-arago-distro/recipes-connectivity/initscript-telne=
td/initscript-telnetd/telnetd
 delete mode 100644 meta-arago-distro/recipes-connectivity/systemd-telnetd/=
systemd-telnetd.bb
 delete mode 100644 meta-arago-distro/recipes-connectivity/systemd-telnetd/=
systemd-telnetd/telnetd.service

diff --git a/meta-arago-distro/recipes-connectivity/initscript-telnetd/init=
script-telnetd.bb b/meta-arago-distro/recipes-connectivity/initscript-telne=
td/initscript-telnetd.bb
deleted file mode 100644
index 8398e7f3..00000000
--- a/meta-arago-distro/recipes-connectivity/initscript-telnetd/initscript-=
telnetd.bb
+++ /dev/null
@@ -1,18 +0,0 @@
-SUMMARY =3D "Initscripts for telnetd"
-LICENSE =3D "MIT"
-LIC_FILES_CHKSUM =3D "file://telnetd;beginline=3D2;endline=3D18;md5=3Dd134=
d0d385c53f9201a270fef8448f29"
-PR  =3D "r1"
-
-SRC_URI =3D "file://telnetd"
-
-S =3D "${UNPACKDIR}"
-
-INITSCRIPT_NAME =3D "telnetd"
-INITSCRIPT_PARAMS =3D "defaults 10"
-
-inherit update-rc.d
-
-do_install () {
-	install -d ${D}${sysconfdir}/init.d/
-	install -c -m 755 ${S}/telnetd ${D}${sysconfdir}/init.d/telnetd
-}
diff --git a/meta-arago-distro/recipes-connectivity/initscript-telnetd/init=
script-telnetd/telnetd b/meta-arago-distro/recipes-connectivity/initscript-=
telnetd/initscript-telnetd/telnetd
deleted file mode 100644
index a99f23ef..00000000
--- a/meta-arago-distro/recipes-connectivity/initscript-telnetd/initscript-=
telnetd/telnetd
+++ /dev/null
@@ -1,40 +0,0 @@
-#! /bin/sh
-#Permission is hereby granted, free of charge, to any person obtaining a c=
opy
-#of this software and associated documentation files (the "Software"), to =
deal
-#in the Software without restriction, including without limitation the rig=
hts
-#to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
-#copies of the Software, and to permit persons to whom the Software is
-#furnished to do so, subject to the following conditions:
-#
-#The above copyright notice and this permission notice shall be included i=
n
-#all copies or substantial portions of the Software.
-#
-#THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS O=
R
-#IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
-#FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL T=
HE
-#AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
-#LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING F=
ROM,
-#OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
-#THE SOFTWARE.
-
-telnetd=3D/usr/sbin/telnetd
-
-test -x "$telnetd" || exit 0
-
-case "$1" in
-  start)
-    echo -n "Starting telnet daemon"
-    start-stop-daemon --start --quiet --exec $telnetd
-    echo "."
-    ;;
-  stop)
-    echo -n "Stopping telnet daemon"
-    start-stop-daemon --stop --quiet --exec $telnetd
-    echo "."
-    ;;
-  *)
-    echo "Usage: /etc/init.d/telnetd {start|stop}"
-    exit 1
-esac
-
-exit 0
diff --git a/meta-arago-distro/recipes-connectivity/systemd-telnetd/systemd=
-telnetd.bb b/meta-arago-distro/recipes-connectivity/systemd-telnetd/system=
d-telnetd.bb
deleted file mode 100644
index ff52213e..00000000
--- a/meta-arago-distro/recipes-connectivity/systemd-telnetd/systemd-telnet=
d.bb
+++ /dev/null
@@ -1,20 +0,0 @@
-SUMMARY =3D "telnetd"
-DESCRIPTION =3D "systemd config for starting telnetd."
-LICENSE =3D "MIT"
-LIC_FILES_CHKSUM =3D "file://telnetd.service;beginline=3D1;endline=3D17;md=
5=3Dd134d0d385c53f9201a270fef8448f29"
-
-SRC_URI =3D "file://telnetd.service"
-
-S =3D "${UNPACKDIR}"
-
-inherit systemd
-
-SYSTEMD_PACKAGES =3D "${PN}"
-SYSTEMD_SERVICE:${PN} =3D "telnetd.service"
-SYSTEMD_AUTO_ENABLE:${PN} =3D "enable"
-
-do_install:append () {
-    # install systemd unit files
-    install -d ${D}${systemd_system_unitdir}
-    install -m 0644 ${S}/telnetd.service ${D}${systemd_system_unitdir}
-}
diff --git a/meta-arago-distro/recipes-connectivity/systemd-telnetd/systemd=
-telnetd/telnetd.service b/meta-arago-distro/recipes-connectivity/systemd-t=
elnetd/systemd-telnetd/telnetd.service
deleted file mode 100644
index d8b34373..00000000
--- a/meta-arago-distro/recipes-connectivity/systemd-telnetd/systemd-telnet=
d/telnetd.service
+++ /dev/null
@@ -1,29 +0,0 @@
-#Permission is hereby granted, free of charge, to any person obtaining a c=
opy
-#of this software and associated documentation files (the "Software"), to =
deal
-#in the Software without restriction, including without limitation the rig=
hts
-#to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
-#copies of the Software, and to permit persons to whom the Software is
-#furnished to do so, subject to the following conditions:
-#
-#The above copyright notice and this permission notice shall be included i=
n
-#all copies or substantial portions of the Software.
-#
-#THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS O=
R
-#IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
-#FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL T=
HE
-#AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
-#LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING F=
ROM,
-#OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
-#THE SOFTWARE.
-
-[Unit]
-Description=3DTelnet Server
-After=3Dlocal-fs.target
-
-[Service]
-RemainAfterExit=3Dtrue
-Type=3Doneshot
-ExecStart=3D/usr/sbin/telnetd
-
-[Install]
-WantedBy=3Dmulti-user.target
diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arag=
o-base.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago=
-base.bb
index b80697e5..d36b4397 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-base.=
bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-base.=
bb
@@ -16,8 +16,6 @@ ARAGO_BASE =3D "\
     mtd-utils \
     mtd-utils-ubifs \
     curl \
-    initscript-telnetd \
-    systemd-telnetd \
     ethtool \
     bash \
     opkg-bash-completion \
--=20
2.43.0


