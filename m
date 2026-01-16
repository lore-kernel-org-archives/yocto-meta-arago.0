Return-Path: <j-sahu@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5A3ABD48998
	for <webhook@archiver.kernel.org>; Fri, 16 Jan 2026 12:11:36 +0000 (UTC)
Received: from CH1PR05CU001.outbound.protection.outlook.com (CH1PR05CU001.outbound.protection.outlook.com [52.101.193.49])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.4716.1768565490758420199
 for <meta-arago@lists.yoctoproject.org>;
 Fri, 16 Jan 2026 04:11:30 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=UXjAHNkZ;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 52.101.193.49, mailfrom: j-sahu@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JixV2GydtuFEjWtuSNjyBbmEBLNOXsUdFkfmZWYkBJsGv0JTYMSHMG05d2t9t+S0W0GL2JpB21Yj6BwYhtLjjeaUdSruLdDDNuV6i4XuclCHCP5AFT2aUyYeLuaUwq+vUPIUNwEmWu7thK+JpMvY6fznyx3hEL4nxc50B1rbIvasVrYjCRCM1iMiLXoa6GqJw+u63d678tBgj4mnPNaiC0NL/b/45GTyRsI620M2+G+nX87mfl/6ozR6xYVF9DBdrOiDtcdCTlm6VTidv05RpuO6GvBxg45DohV6EhRTBXWtpKsSL7sWniEye8ADJo5YQ8+olZbj9DqJ+s1Y5gJEEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=j2wEz7gJ5e2vZRCkaiPK9AYvlhC9RcRKgWtpXCeV6xg=;
 b=b3VsqREzzrpXU5/uM+LGs+nX9fXCL6PIZacGj3PG8bxTFb0BQUdjxZ+NUi1aeXQK28SQNbo8bFCW9qgOjRnzUsgewatCnwgWqnx0EBEoUZfQAdOxWRSu3aQQRGZDasFCEbpEssqMSyL7nuB5jPWMAynNlIFPgkdxVoU5G9Lh0tv833trZ/ItcvW9a6CTS1fib0V3vB/xzTapXfGMVtMVRwaOxEO5UlX/wUqKnVJaS9Cj461Ex41EpD89vg3gANowb9JFtpIsyDs89jGbqijgCuceqb80qHVe+e4T7OF68HLEhVvyp+JhlFVQrY8L6gWg7akfKIFAnQOLzyZ2/u5e5Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=konsulko.com smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=j2wEz7gJ5e2vZRCkaiPK9AYvlhC9RcRKgWtpXCeV6xg=;
 b=UXjAHNkZKgACfI59SDN5FdWfyK30a3uQ+uxyjzR51rXeqQC1GyS1R8k09G0dqiLm571GqNgfXRHblJgDdDzCh5KnVnQxLISvW/VAn0r+NcSqQhUS08HerKMY7j/lO/WdS2kGJvssu9o6AMrvp1pkXZ866HmKjmPkQAf5eKiz0c4=
Received: from BN9PR03CA0679.namprd03.prod.outlook.com (2603:10b6:408:10e::24)
 by BLAPR10MB5186.namprd10.prod.outlook.com (2603:10b6:208:321::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.7; Fri, 16 Jan
 2026 12:11:26 +0000
Received: from BN2PEPF00004FBE.namprd04.prod.outlook.com
 (2603:10b6:408:10e:cafe::1) by BN9PR03CA0679.outlook.office365.com
 (2603:10b6:408:10e::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9520.6 via Frontend Transport; Fri,
 16 Jan 2026 12:11:10 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 BN2PEPF00004FBE.mail.protection.outlook.com (10.167.243.184) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9542.4 via Frontend Transport; Fri, 16 Jan 2026 12:11:26 +0000
Received: from DLEE213.ent.ti.com (157.170.170.116) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 16 Jan
 2026 06:11:25 -0600
Received: from DLEE202.ent.ti.com (157.170.170.77) by DLEE213.ent.ti.com
 (157.170.170.116) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 16 Jan
 2026 06:11:25 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE202.ent.ti.com
 (157.170.170.77) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Fri, 16 Jan 2026 06:11:25 -0600
Received: from jeevan-HP-Z2-Tower-G9-Workstation-Desktop-PC.dhcp.ti.com (jeevan-hp-z2-tower-g9-workstation-desktop-pc.dhcp.ti.com [172.24.233.81])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 60GCBHIT3115968;
	Fri, 16 Jan 2026 06:11:24 -0600
From: Telukula Jeevan Kumar Sahu <j-sahu@ti.com>
To: <meta-arago@lists.yoctoproject.org>
CC: Ryan Eatmon <reatmon@ti.com>, Denys Dmytriyenko <denys@konsulko.com>
Subject: [meta-arago][master][PATCH 2/2] meson: Add patch to fix Qt6 private header detection for cross-compilation
Date: Fri, 16 Jan 2026 17:40:44 +0530
Message-ID: <20260116121044.2028660-2-j-sahu@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260116121044.2028660-1-j-sahu@ti.com>
References: <20260116121044.2028660-1-j-sahu@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF00004FBE:EE_|BLAPR10MB5186:EE_
X-MS-Office365-Filtering-Correlation-Id: 9a6aa183-4438-4c7b-bcb3-08de54f85f77
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|34020700016|36860700013|1800799024|376014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?TBgMJcapoMbkSINj/QUTq7mPeGITeWPErjgAJhEGcsMc6lKb3wocYHidYmvv?=
 =?us-ascii?Q?mBplhAvVjNdebsja2fubIhEf+Yz0VgKBz/PI8GcFafZu44GceOKu+lNNQTTC?=
 =?us-ascii?Q?fDCm4ek0serAccJcw1kaUMEponugplM8YqO6qyw66Q+Ts4rfCrSMbW4xRU9H?=
 =?us-ascii?Q?1bu7PVFhGtSBAXALpEPo/Nmn+1rxHtEjm/tnpaPJ6E8hZFTc97hsW4lih6qM?=
 =?us-ascii?Q?KHQCmeXS3Eif9t/y4uPJivUxlcxS7SBoBj8UsFwXZpm5o1JDQy2Aby3CO/qG?=
 =?us-ascii?Q?6BNOJFGvp8ako9Q1EipTfnddSeuNYzM7sWpEsFBaTe1fdiPUPpQY3ThSbDCd?=
 =?us-ascii?Q?+SgTv9ZEgRkdk75zDMxIFmmOkLL7ycVxnazD/BzKRl5r3EOc+Vk36et1RiAF?=
 =?us-ascii?Q?pROgA+vd5vMmvX/pPmXNHeYijnuQL2wImeH0mgt6uGbYf05lbziVPZ9YF/n3?=
 =?us-ascii?Q?FgOqZAzHnT890lZUnJIZtxReqyowfhSPqT/wYTm331jahPxiYtEoNv/et8GV?=
 =?us-ascii?Q?L2PtAWgFV6NbaisZWhkvI98Y208Rl3GddWQS1KoVRNBK5aDvx4BEJbOK6FvU?=
 =?us-ascii?Q?7blpT9w/eAu//SrdYvgnnIVIn1mterbPGW7NcXLZE378xVzy+0OTAQ5TtSxW?=
 =?us-ascii?Q?UKFyLed2qtLvHoVArlvlgDPFE52YeNioUI7XCCIcxV0Xdwe8xhqGQa1Pfz+3?=
 =?us-ascii?Q?XOOORqeJwKno8athpw7R2SErNQAK5DzELavW39qPEHecRjV4yYN/uqFkLqNS?=
 =?us-ascii?Q?xC4oySzl8uRxoSN4pNQtJPkjiArpqAYj1yqwfJDUBLtqp/XdkxzC5ucJuv3T?=
 =?us-ascii?Q?gbCvDL4C0KSTSiv2NdqRN2HXhC+dEeqfFGa3AwPQlnwZsvKTPVPO9rEm0gSt?=
 =?us-ascii?Q?sQAa08m0KOR5/ghTrB7uAhlkSbAsG6P4YPhCBRnpPbsaL80QRnNKANIVnCcl?=
 =?us-ascii?Q?NWL7EJTAezeRP6K7H5z+ktoIwZ8aSLlRxCGxX+WAL7dD/8nCeWgHCzjUGE1u?=
 =?us-ascii?Q?p4AIWeWi1QTgh5eFyfv32uHDjRqHNNC4yYdF78977STSnl/HpqKm7mpakfkH?=
 =?us-ascii?Q?1vPqC/LVTEFplBeAZUJRoKmdYGUCGfh0XFn4ufsUbQqwzYuwJzwafAOsd82e?=
 =?us-ascii?Q?xe5vwDvwoe2Eaw37o9Rd7f8D5+3YWqOa8IQpY9OQP4W9gCHuDDf2riQRQnNA?=
 =?us-ascii?Q?7unyyec9NGoUeyZrU6G2U9GVfR3qnmSkCYjADUf8Ygvy7v43P2l6N778A7SU?=
 =?us-ascii?Q?Im4+Yd7FlZ4rij1DcMY/6d09hpAwyfrnnQc/jwYRDm7OASeX4bsMxdK1vUdz?=
 =?us-ascii?Q?Ys+DfFPk1CDPOjeEg2adDW/vO+z6G8thf7nB/mZRerpJY7VzZf7ZAL2Bn1fc?=
 =?us-ascii?Q?YWw9ziqgq22wntwSpIfF8URMCLuGJz8FnPsx+zN+dRCC7PLax/+h/kV5lEuq?=
 =?us-ascii?Q?Fsh/60ZAxGRp+tAiYy7GwO1N8iOU+knHmwsoiSOMBHUQ+TzuVwKzRC5o5rXJ?=
 =?us-ascii?Q?vZ9UQGlctX5HlEFYucmIgMfVkP/KmQrVUfFJfVdykGbnRV/g7/KezcTdKPk9?=
 =?us-ascii?Q?onw3BF7OCdXw3Q/BZYkBceWO/Mt+M0y1wMxbr0/mzvmmtK8rNW/w8E8iOuui?=
 =?us-ascii?Q?9u3ytK7C8jXLjqJO85EdnSAqAEaycfbC4m0GQgfrFMEq1VgGdfW7sjiV5H/e?=
 =?us-ascii?Q?pIOFAQ=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(34020700016)(36860700013)(1800799024)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jan 2026 12:11:26.2251
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9a6aa183-4438-4c7b-bcb3-08de54f85f77
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BN2PEPF00004FBE.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLAPR10MB5186
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Fri, 16 Jan 2026 12:11:36 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16964

GStreamer commit 6efccf0ee18a[0] introduced dependency on Qt private header=
s
for building Qt6 qmlgl plugins. This exposed a bug in meson's Qt dependency
detection where it checks the build host filesystem instead of the sysroot
for private header paths.

Add patch to fix meson's inability to check Qt private header paths in the
sysroot during cross-compilation that sets PKG_CONFIG_SYSROOT_DIR and prepe=
nds
sysroot to Qt private header paths.

[0]: https://gitlab.freedesktop.org/gstreamer/gstreamer/-/commit/6efccf0ee1=
8a3cf7f426a5acceaa716e7c41f5dd

Signed-off-by: Telukula Jeevan Kumar Sahu <j-sahu@ti.com>
---
 ...respect-PKG_CONFIG_SYSROOT_DIR-for-c.patch | 72 +++++++++++++++++++
 .../recipes-devtools/meson/meson_%.bbappend   |  5 ++
 2 files changed, 77 insertions(+)
 create mode 100644 meta-arago-extras/dynamic-layers/qt6-layer/recipes-devt=
ools/meson/meson/0001-qt-dependencies-respect-PKG_CONFIG_SYSROOT_DIR-for-c.=
patch
 create mode 100644 meta-arago-extras/dynamic-layers/qt6-layer/recipes-devt=
ools/meson/meson_%.bbappend

diff --git a/meta-arago-extras/dynamic-layers/qt6-layer/recipes-devtools/me=
son/meson/0001-qt-dependencies-respect-PKG_CONFIG_SYSROOT_DIR-for-c.patch b=
/meta-arago-extras/dynamic-layers/qt6-layer/recipes-devtools/meson/meson/00=
01-qt-dependencies-respect-PKG_CONFIG_SYSROOT_DIR-for-c.patch
new file mode 100644
index 00000000..ff14dc1c
--- /dev/null
+++ b/meta-arago-extras/dynamic-layers/qt6-layer/recipes-devtools/meson/mes=
on/0001-qt-dependencies-respect-PKG_CONFIG_SYSROOT_DIR-for-c.patch
@@ -0,0 +1,72 @@
+From 39f0e9c9b620b4289da61422022e507144a681b0 Mon Sep 17 00:00:00 2001
+From: Telukula Jeevan Kumar Sahu <j-sahu@ti.com>
+Date: Fri, 9 Jan 2026 17:44:57 +0530
+Subject: [PATCH] qt: respect PKG_CONFIG_SYSROOT_DIR for cross-compilation
+
+When cross-compiling with Yocto/OpenEmbedded, pkg-config returns paths
+without the sysroot prefix (e.g., /usr/include/QtCore), but the actual
+files are in the recipe-sysroot. The _qt_get_private_includes() function
+checks the host filesystem instead of the sysroot for Qt private headers.
+
+This patch adds PKG_CONFIG_SYSROOT_DIR support to prepend sysroot when
+checking directory existence and when returning paths. Changes only
+activate when PKG_CONFIG_SYSROOT_DIR is set, preserving native builds.
+
+Also fixes dirname assignment to use full path instead of basename.
+
+Related issue: https://github.com/mesonbuild/meson/issues/15456
+
+Upstream-Status: Inappropriate [Yocto-specific sysroot handling]
+
+Signed-off-by: Telukula Jeevan Kumar Sahu <j-sahu@ti.com>
+---
+ mesonbuild/dependencies/qt.py | 21 ++++++++++++++++-----
+ 1 file changed, 16 insertions(+), 5 deletions(-)
+
+diff --git a/mesonbuild/dependencies/qt.py b/mesonbuild/dependencies/qt.py
+index c245e5c..a3846ec 100644
+--- a/mesonbuild/dependencies/qt.py
++++ b/mesonbuild/dependencies/qt.py
+@@ -42,16 +42,24 @@ def _qt_get_private_includes(mod_inc_dir: str, module:=
 str, mod_version: str) ->
+     if int(mod_version.split('.')[0]) < 5:
+         return []
+
++    # Respect PKG_CONFIG_SYSROOT_DIR for cross-compilation
++    sysroot =3D os.environ.get('PKG_CONFIG_SYSROOT_DIR', '')
+     private_dir =3D os.path.join(mod_inc_dir, mod_version)
+     # fallback, let's try to find a directory with the latest version
+-    if os.path.isdir(mod_inc_dir) and not os.path.exists(private_dir):
+-        dirs =3D [filename for filename in os.listdir(mod_inc_dir)
+-                if os.path.isdir(os.path.join(mod_inc_dir, filename))]
++    # Check in sysroot for cross-compilation
++    check_mod_inc =3D os.path.join(sysroot, mod_inc_dir.lstrip('/')) if s=
ysroot else mod_inc_dir
++    check_private =3D os.path.join(sysroot, private_dir.lstrip('/')) if s=
ysroot else private_dir
++    if os.path.isdir(check_mod_inc) and not os.path.exists(check_private)=
:
++        dirs =3D [filename for filename in os.listdir(check_mod_inc)
++                if os.path.isdir(os.path.join(check_mod_inc, filename))]
+
+         for dirname in sorted(dirs, reverse=3DTrue):
+             if len(dirname.split('.')) =3D=3D 3:
+-                private_dir =3D dirname
++                private_dir =3D os.path.join(mod_inc_dir, dirname)
+                 break
++    # Prepend sysroot to returned paths for cross-compilation
++    if sysroot and not private_dir.startswith(sysroot):
++        private_dir =3D os.path.join(sysroot, private_dir.lstrip('/'))
+     return [private_dir, Path(private_dir, f'Qt{module}').as_posix()]
+
+
+@@ -192,7 +200,10 @@ class QtPkgConfigDependency(_QtBase, PkgConfigDepende=
ncy, metaclass=3Dabc.ABCMeta)
+             if self.private_headers:
+                 qt_inc_dir =3D mod.get_variable(pkgconfig=3D'includedir')
+                 mod_private_dir =3D os.path.join(qt_inc_dir, 'Qt' + m)
+-                if not os.path.isdir(mod_private_dir):
++                # Check in sysroot for cross-compilation
++                sysroot =3D os.environ.get('PKG_CONFIG_SYSROOT_DIR', '')
++                check_dir =3D os.path.join(sysroot, mod_private_dir.lstri=
p('/')) if sysroot else mod_private_dir
++                if not os.path.isdir(check_dir):
+                     # At least some versions of homebrew don't seem to se=
t this
+                     # up correctly. /usr/local/opt/qt/include/Qt + m_name=
 is a
+                     # symlink to /usr/local/opt/qt/include, but the pkg-c=
onfig
+--
+2.34.1
diff --git a/meta-arago-extras/dynamic-layers/qt6-layer/recipes-devtools/me=
son/meson_%.bbappend b/meta-arago-extras/dynamic-layers/qt6-layer/recipes-d=
evtools/meson/meson_%.bbappend
new file mode 100644
index 00000000..883a862b
--- /dev/null
+++ b/meta-arago-extras/dynamic-layers/qt6-layer/recipes-devtools/meson/mes=
on_%.bbappend
@@ -0,0 +1,5 @@
+FILESEXTRAPATHS:prepend :=3D "${THISDIR}/meson:"
+
+SRC_URI:append:class-native =3D " \
+    file://0001-qt-dependencies-respect-PKG_CONFIG_SYSROOT_DIR-for-c.patch=
 \
+"
--=20
2.34.1


