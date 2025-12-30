Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 58614EE498F
	for <webhook@archiver.kernel.org>; Tue, 30 Dec 2025 16:51:44 +0000 (UTC)
Received: from BL2PR02CU003.outbound.protection.outlook.com (BL2PR02CU003.outbound.protection.outlook.com [52.101.52.39])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.67888.1767113501530286040
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 30 Dec 2025 08:51:42 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=D8xxnGxo;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 52.101.52.39, mailfrom: reatmon@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gs2GWnueD7RrxVUte2OqnGM5ffSfF4aEsh0JolvIU0+x8RW8spk/eyc8vjjZexvwlWnvpCA2KFuQcxSRfTtbp6dsePCNx6aJQqp1akZ9t1OY45vHULs/fS1V9QMlcpBtYpGxZklvI8lj4KEqaLM0NwjJiAI1XC+oqc4C2SX2hugL4jy6NXkX/PhrFa0ioAGCkDP/KDN6gjuz6yDsX/mkOY8xR1gktYLSpvSA/dc6/L/LMAGO6yUjjAdMWXNVbj+1FYrN47/dy4Rx1zynZm/Y8p4eMwaM1831Xpk36tE1fVBYhqqyLqjzrOx5rldEU/oAe5cFZXG92pQuQooKRdF3aw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hJRm3uyK6VPK43/sWVIixZzg+iasuYonMWdEIAxEZlY=;
 b=EAIKYeHAyf7xsrzS27SFyksQ0oo0n1BLAVBS0HYisBCSrHY3MTUIKlrm10F+RcnJlWf1p4YoxRUrr9ZYJjs8GxbLrTnTasSQe9sD7Jx156hQzpUiJF6g4MEof3M5+JmBDaLRE8wr5tbDpeou5vCv5zDgQfsON4lbQU/JJqqmZ9+oszomsY2ddksE51sVNjUZAHyzNIV0/j6vFsgIQGwOfHW0PXM41MZiSm9GYkpWeYckld/chp3Tq411so6mfQq1bTUPk78srg002HiYo6SNLrHnWbCjOFlZYw8BTtjXkpR00UmzDkdiDM5L9BXvHIsnvPQkUZ/KDn8wsmUYcw1bSQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hJRm3uyK6VPK43/sWVIixZzg+iasuYonMWdEIAxEZlY=;
 b=D8xxnGxoyCZ+Y8Ee6/HrR0J1WjnZlKPN7kx4tzsnLbrye2TIpEJIxsJ4HwwxYgomQzyPeBZ7aMRAjLiGgvEnlDaJkGw02AOYriWnsz3u5yib9X1Y6UOpVZUiK2W/VzDKzh0t7iTvJZJTeKXvUYlOS3xLvgis/3KDserPsqRboQY=
Received: from CH2PR04CA0022.namprd04.prod.outlook.com (2603:10b6:610:52::32)
 by LV3PR10MB8201.namprd10.prod.outlook.com (2603:10b6:408:281::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9478.4; Tue, 30 Dec
 2025 16:51:39 +0000
Received: from DS2PEPF00003442.namprd04.prod.outlook.com
 (2603:10b6:610:52:cafe::b9) by CH2PR04CA0022.outlook.office365.com
 (2603:10b6:610:52::32) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9456.14 via Frontend Transport; Tue,
 30 Dec 2025 16:51:39 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 DS2PEPF00003442.mail.protection.outlook.com (10.167.17.69) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9478.4 via Frontend Transport; Tue, 30 Dec 2025 16:51:37 +0000
Received: from DFLE208.ent.ti.com (10.64.6.66) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 30 Dec
 2025 10:51:35 -0600
Received: from DFLE201.ent.ti.com (10.64.6.59) by DFLE208.ent.ti.com
 (10.64.6.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 30 Dec
 2025 10:51:35 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE201.ent.ti.com
 (10.64.6.59) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Tue, 30 Dec 2025 10:51:35 -0600
Received: from grumpy (grumpy.dhcp.ti.com [128.247.81.229])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5BUGpZb31105777;
	Tue, 30 Dec 2025 10:51:35 -0600
Received: from reatmon by grumpy with local (Exim 4.97)
	(envelope-from <reatmon@ti.com>)
	id 1vacwZ-0000000Ei13-2WQE;
	Tue, 30 Dec 2025 10:51:35 -0600
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>, Denys Dmytriyenko
	<denys@konsulko.com>, <meta-arago@lists.yoctoproject.org>
Subject: [meta-arago][master][PATCH 3/4] FIXME: ltp-ddt: Add support for 6.18 kernel headers
Date: Tue, 30 Dec 2025 10:51:31 -0600
Message-ID: <20251230165135.3505628-3-reatmon@ti.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251230165135.3505628-1-reatmon@ti.com>
References: <20251230165135.3505628-1-reatmon@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PEPF00003442:EE_|LV3PR10MB8201:EE_
X-MS-Office365-Filtering-Correlation-Id: 94aea779-3bf5-4feb-46e5-08de47c3b2d6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|82310400026|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?2Pn3kGWoMuHulfFZi+q9Squkwx3sq6+gLaDBPKNHe0aJM3sBOvm1OspkKv0H?=
 =?us-ascii?Q?DiGwKtxFtzkKRQ48z0u+jOKkst67XFhrbinAef+2CW0QytD+0+NxoEj3PFSm?=
 =?us-ascii?Q?qn9GZRPfXWAr77w7PIh5hDHVBS/dAp0iarOhYj8r779UfiEQhmRW7O8INAEe?=
 =?us-ascii?Q?fR0dtSHvwCyFjqjwdFyIru+NITyITWuF4Gi5ooRaR/t03pawuQuE+SoT8T26?=
 =?us-ascii?Q?2WXZOYaXkorhF9W7Kmsax3/XlFLhtZ5Raps+FXZ0WohKdj2ItQC9YRxjNPLr?=
 =?us-ascii?Q?fkkUZwz/HA8UUKxlkUU216LIusx9lZ8ILoewOQ/wopHWBPdg8T/hi2bgJbMI?=
 =?us-ascii?Q?o3+1EQvBzPnxl7p52tfbmShS/k0lkdd2WVg8yFlJBJR3HTuGj08c4aGfFdxs?=
 =?us-ascii?Q?kt5M3QR8tPDIyKbrQw2mXd0t3lNH6Q4JP1xLEsfMeTjs0bGpbXRAMPKZosIA?=
 =?us-ascii?Q?Yg5ROr9snmZTUxHRR/a7edGLN3AUQxUyB5bnq/jfp6DGSo1HYrF56ch1bdN/?=
 =?us-ascii?Q?wIFDxO1eQrB8Tglg9eix10UG2dmljiESoQM3Vf7M1spknqbvdc7urqk9HlGA?=
 =?us-ascii?Q?BLZReykgaW1Z+Qz7pZbyXPUQvFP4CUEVfGzPVEO80Hgi/F4fpgVog9VyDGzV?=
 =?us-ascii?Q?KifkJztWdySM0vd9mi2fltK9eFNjNMEdYD6OUs+0TABIV3gZLFBkqYQW1Yy5?=
 =?us-ascii?Q?vlxgUj+9T8WhAyMCIWOkqNDBP8SeXZhmkmXVb8ezb1l2Yy8zar/Mc7fM5D34?=
 =?us-ascii?Q?VEv4lVajUbJSawaaLzYCbfrobiBMnUD31DHVkdtzXZeKiT4Kokv8a5AWpptj?=
 =?us-ascii?Q?aZmVO+HdT2ffWVonAjT+eDG5cPWCXMeqt+EZpqhCzKo+ANOwpO901+ZfLbYC?=
 =?us-ascii?Q?GHv5B2mKh09yepRbkJAeCG0zCY8ARm4bKyelJX/WrP6DAAISZdLD4KAt8z32?=
 =?us-ascii?Q?L5tikVmTA+NfEgJLLg9LsOkGLhVbdSst/wNP8CbRS7MwUeVTZ/VA/W7NDhZr?=
 =?us-ascii?Q?l+Pv1p6a4KOixMxlfiWbz3l8dQljvJBpzb/7aXtkY4uS2S51h7JmyQtjEd68?=
 =?us-ascii?Q?YSzS89dUcnnRv14U4OGyHPoGUYkjrhnBDZ8pJAS6x8JGnKI2r9TarLrPB82y?=
 =?us-ascii?Q?MUxW+wr3HNYtS7LXSS/lPZH0CeCGAVeZ25ql8z+GQU338bRaysG0iHP+iuHu?=
 =?us-ascii?Q?+XFlAzcS5NfC0eC7vkMW5dbNdZWQKDuz4mP+WmnotGJqCc0CnKUmQvpebeZb?=
 =?us-ascii?Q?2NlixIOdWaFZjRtZ/BFBW/eQSGR+cCBXW4zVNqsPlLTgXPUHrK5d5KH6e8xc?=
 =?us-ascii?Q?AJM9m8APmjJWknfRYQsxzQRhdO28ddKabZ7j7Wrj3j6XqrswHU4UWwSevkZT?=
 =?us-ascii?Q?rD30m8lw3LLAxKK70eaHvYPy3Bwg1ad4Y2rZaEqI5CF8tAnj9J2KyrJRLFEI?=
 =?us-ascii?Q?6kWRP/209cpspiM/mNpbHFbIQAoyE9S/mpUsPOL+ZenQx18Uf7i7f8uz3Mhi?=
 =?us-ascii?Q?+w+CVipVOiesdDf9Ybj4chXN3dvIXG9Lw1N9MexHdawsaWwkCO7wCQBfnNie?=
 =?us-ascii?Q?mSnVzsm9EV/CPeBqsnQ=3D?=
X-Forefront-Antispam-Report: 
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(376014)(82310400026)(36860700013)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Dec 2025 16:51:37.7127
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 94aea779-3bf5-4feb-46e5-08de47c3b2d6
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DS2PEPF00003442.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR10MB8201
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 30 Dec 2025 16:51:44 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16908

A spare struct variable is now being used, but one of the ltp-ddt tests
was referring to the "spare" name.

We need a better long term fix from ltp-ddt, but in the short term this
patch can get us building again.

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 ...unt04-Update-for-6.18-kernel-headers.patch | 54 +++++++++++++++++++
 .../ltp-ddt/ltp-ddt_20250130.bb               |  2 +
 2 files changed, 56 insertions(+)
 create mode 100644 meta-arago-test/recipes-devtools/ltp-ddt/ltp-ddt/0001-l=
istmount04-Update-for-6.18-kernel-headers.patch

diff --git a/meta-arago-test/recipes-devtools/ltp-ddt/ltp-ddt/0001-listmoun=
t04-Update-for-6.18-kernel-headers.patch b/meta-arago-test/recipes-devtools=
/ltp-ddt/ltp-ddt/0001-listmount04-Update-for-6.18-kernel-headers.patch
new file mode 100644
index 00000000..2c002e40
--- /dev/null
+++ b/meta-arago-test/recipes-devtools/ltp-ddt/ltp-ddt/0001-listmount04-Upd=
ate-for-6.18-kernel-headers.patch
@@ -0,0 +1,54 @@
+From 2dab76490d8d9b30119204a6376e00176fad9b07 Mon Sep 17 00:00:00 2001
+From: Ryan Eatmon <reatmon@ti.com>
+Date: Mon, 29 Dec 2025 12:42:29 -0600
+Subject: [PATCH] listmount04: Update for 6.18 kernel headers
+
+The spare slot is now being used as of the 6.18 kernel.
+
+Upstream-Status: Pending
+
+Signed-off-by: Ryan Eatmon <reatmon@ti.com>
+---
+ testcases/kernel/syscalls/listmount/listmount04.c | 8 ++++----
+ 1 file changed, 4 insertions(+), 4 deletions(-)
+
+diff --git a/testcases/kernel/syscalls/listmount/listmount04.c b/testcases=
/kernel/syscalls/listmount/listmount04.c
+index d38408d2c..2053532f6 100644
+--- a/testcases/kernel/syscalls/listmount/listmount04.c
++++ b/testcases/kernel/syscalls/listmount/listmount04.c
+@@ -28,7 +28,7 @@ static uint64_t mnt_ids[MNT_SIZE];
+ static struct tcase {
+ 	int req_usage;
+ 	uint32_t size;
+-	uint32_t spare;
++	uint32_t mnt_ns_fd;
+ 	uint64_t mnt_id;
+ 	uint64_t param;
+ 	uint64_t *mnt_ids;
+@@ -75,12 +75,12 @@ static struct tcase {
+ 	{
+ 		.req_usage =3D 1,
+ 		.size =3D MNT_ID_REQ_SIZE_VER0,
+-		.spare =3D -1,
++		.mnt_ns_fd =3D -1,
+ 		.mnt_id =3D LSMT_ROOT,
+ 		.mnt_ids =3D mnt_ids,
+ 		.nr_mnt_ids =3D MNT_SIZE,
+ 		.exp_errno =3D EINVAL,
+-		.msg =3D "invalid mnt_id_req.spare",
++		.msg =3D "invalid mnt_id_req.mnt_ns_fd",
+ 	},
+ 	{
+ 		.req_usage =3D 1,
+@@ -124,7 +124,7 @@ static void run(unsigned int n)
+ 		req->mnt_id =3D tc->mnt_id;
+ 		req->param =3D tc->param;
+ 		req->size =3D tc->size;
+-		req->spare =3D tc->spare;
++		req->mnt_ns_fd =3D tc->mnt_ns_fd;
+ 	}
+=20
+ 	TST_EXP_FAIL(tst_syscall(__NR_listmount, req, tc->mnt_ids,
+--=20
+2.43.0
+
diff --git a/meta-arago-test/recipes-devtools/ltp-ddt/ltp-ddt_20250130.bb b=
/meta-arago-test/recipes-devtools/ltp-ddt/ltp-ddt_20250130.bb
index d92bfb9b..11bbf13a 100644
--- a/meta-arago-test/recipes-devtools/ltp-ddt/ltp-ddt_20250130.bb
+++ b/meta-arago-test/recipes-devtools/ltp-ddt/ltp-ddt_20250130.bb
@@ -15,6 +15,8 @@ BRANCH ?=3D "master"
 SRC_URI:remove =3D "git://github.com/linux-test-project/ltp.git;branch=3Dm=
aster;protocol=3Dhttps"
 SRC_URI:prepend =3D "git://git.ti.com/git/test-automation/ltp-ddt.git;prot=
ocol=3Dhttps;branch=3D${BRANCH} "
=20
+SRC_URI +=3D "file://0001-listmount04-Update-for-6.18-kernel-headers.patch=
"
+
 export prefix =3D "/opt/ltp"
 export exec_prefix =3D "/opt/ltp"
=20
--=20
2.43.0


