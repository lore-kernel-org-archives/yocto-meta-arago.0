Return-Path: <j-sahu@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 52D3BE9D405
	for <webhook@archiver.kernel.org>; Wed,  4 Feb 2026 15:52:58 +0000 (UTC)
Received: from DM1PR04CU001.outbound.protection.outlook.com (DM1PR04CU001.outbound.protection.outlook.com [52.101.61.48])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.23786.1770220374728733348
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 04 Feb 2026 07:52:55 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=D1H/m0vD;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 52.101.61.48, mailfrom: j-sahu@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pPcsRlW0XYXxKd4T9UCFHo8bZ/qMvRAwsSWmoDw+g0MwpMlZl/2jPnzyLT15xSkYSFIZ+MxZf+GNCXI706BccSF7jDAZvA2cMhufgDG3YBz6jq5e1sRzDV3PV0wAhWMVj9XBTpPdbxtil2i3SE2XwzyqbyV/Z7tHeTs06Vj/FI5VxzUSrjgnjyXqQiVz576d/3QdEYzF8D2hLBEt7bRTahE1se9J7s4VXSdPn8bZVT8PGXd7M64ov0f4flLzI1HGuWiScgM1KGzCR/QrcFVKYyWE58/6fx5SFe80ugnhuDwItp2m9Y4552PPUtseKa4bjJdLqUlqSejlzBSlWSafaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=R5BxnJhpZDDy0DpmgDsrOq8/IM8MMEgOV0Hgx5lObR4=;
 b=iB8XlprWd6UODAtX0r3PQ4Od1gd1UeE0cIjvlgF1/o2xtpdkXwWXYaiy9K+33cFTEPAEEeLkiLHzQZtlLbhE8l85wqxdWp+8OmuU/5SyxbKSuLMxFDDvyMwxtI848wclEqrzJTCbTTbiD+cxQmMg2rE9aL00pTn3iomorV+jAawgKTm2AwpwHEt9LkKGKUdXfeMvhfmhk6RLU+gIDszYRBHSfh2vAaVgxYy15FkCVR4ylVv954xSfGU7yOx93INoPrKOgJmLeSpO/XDEgY7PUZhfPpba9peeSkKWx2Jf7f/ooaLN1V3F24ddITVKlWjbxrEmTUY0g0kOBQrVvGumMw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=konsulko.com smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=R5BxnJhpZDDy0DpmgDsrOq8/IM8MMEgOV0Hgx5lObR4=;
 b=D1H/m0vDJ7aoJWP/Tbsl9xL8/B+nmpOvN67PJ7kT0pQJGIlw8+FipfHxjA4qegF2nWiy2Yflzt5L5ElXBSh/WQjY8hO29QPWnOlwVfZw9vEi4gcqDy2iL5MOOvTrasMul3IitzWOer1l5GMuC1AMEUaJbtAqAeiAmm7DFDwan8A=
Received: from PH5P222CA0006.NAMP222.PROD.OUTLOOK.COM (2603:10b6:510:34b::6)
 by CH0PR10MB4956.namprd10.prod.outlook.com (2603:10b6:610:c9::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.14; Wed, 4 Feb
 2026 15:52:51 +0000
Received: from SA2PEPF000015C7.namprd03.prod.outlook.com
 (2603:10b6:510:34b:cafe::99) by PH5P222CA0006.outlook.office365.com
 (2603:10b6:510:34b::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9587.14 via Frontend Transport; Wed,
 4 Feb 2026 15:52:56 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 SA2PEPF000015C7.mail.protection.outlook.com (10.167.241.197) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9587.10 via Frontend Transport; Wed, 4 Feb 2026 15:52:49 +0000
Received: from DFLE210.ent.ti.com (10.64.6.68) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 4 Feb
 2026 09:52:26 -0600
Received: from DFLE206.ent.ti.com (10.64.6.64) by DFLE210.ent.ti.com
 (10.64.6.68) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 4 Feb
 2026 09:52:26 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE206.ent.ti.com
 (10.64.6.64) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Wed, 4 Feb 2026 09:52:26 -0600
Received: from jeevan-HP-Z2-Tower-G9-Workstation-Desktop-PC.dhcp.ti.com (jeevan-hp-z2-tower-g9-workstation-desktop-pc.dhcp.ti.com [172.24.233.81])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 614FqOE21371504;
	Wed, 4 Feb 2026 09:52:25 -0600
From: Telukula Jeevan Kumar Sahu <j-sahu@ti.com>
To: <meta-arago@lists.yoctoproject.org>
CC: Ryan Eatmon <reatmon@ti.com>, Denys Dmytriyenko <denys@konsulko.com>
Subject: [meta-arago][master][PATCH] pulseaudio-service: Add systemd service for system-wide audio daemon
Date: Wed, 4 Feb 2026 21:22:19 +0530
Message-ID: <20260204155219.2386647-1-j-sahu@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF000015C7:EE_|CH0PR10MB4956:EE_
X-MS-Office365-Filtering-Correlation-Id: 2291cb16-3870-4998-9288-08de6405728e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700013|82310400026|376014|1800799024|18082099003;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?kJ0Iwyq4PI3C3HHcLTJVwpt9cEtTaq5XYArGlt9pnPLu/lmnN1P947mOvVV+?=
 =?us-ascii?Q?hOLobLv/UjbnbDnlU7I970U8+0o5OQXVK4+5u8/3fF0GCou1hB0z2SSQUB1W?=
 =?us-ascii?Q?rdhUh5qQXCU6iLVpiHDeGItfrLMBQCyX6toD9brUHLU8HcC6A5ufdPtQrsAv?=
 =?us-ascii?Q?Vd951pGDG1aFsSf7qfgUzTtTaKsgQn32gxIGJFXBiL9Um7qIKE09yMrmnjR3?=
 =?us-ascii?Q?lZ7HNMgDm+aTNNm47r8U1gtAhdaqfH9u0GqEB30yTn1fMPIAMVj9YtLuPQ7s?=
 =?us-ascii?Q?6DZRt/CJdGWoCr5+rdAS+VTiXxhqRBsuHSoXooJh86x0w4Zz9eomVY876Qoc?=
 =?us-ascii?Q?x32ycAbXISLP8ONKKho2oN4CkfreE+foTAtz6rdqz44/7XAXjtBvMZXST5PB?=
 =?us-ascii?Q?Jtaxkm5RdwCN5TuGGj0xvA1n2YUxSapw0G5sUmkobCYZxhRIVIjJpNZeehWY?=
 =?us-ascii?Q?4D/21NrjospHqBO1aByp4yE1oYTbpziNe3StLzDGKN6VH6TKRRDlb/OLNlKM?=
 =?us-ascii?Q?9eRQ86hkBCHvKlzYCw2oapY3kt+F0ZuSt5LwC24IW2YimfuspNgnC4rEv4CH?=
 =?us-ascii?Q?0sbvxgoVHYFLzbrEJ9U2B29j/+JMPEMH95Mgj+n6ZgpiTaTa480nxAF0Fzp9?=
 =?us-ascii?Q?5hu7IcZ8mAaQiUp9UClSy2UT+hzeU3pW4PYtxJ8BoZ0nhXlMs+PGvnyesf6i?=
 =?us-ascii?Q?MMvHbguZpLZCR6+ofYZ5NkNocVqAOPqosHgDnjIbSfAL0EpPP9+Wi8WyeAyh?=
 =?us-ascii?Q?nj/J2H13VCcK8fBvNO4I5CmtjPMOlNw15TSMVUY3XcATwyULtGXDYUUg9xWM?=
 =?us-ascii?Q?r9qIZU64UnMpZBNwO9P2dPrJ5uTXIIquu1LjtyrReE77V0Q5i/+6t0bct+YQ?=
 =?us-ascii?Q?JxItb2QJp5tGdI9dz8q2t1ofUthadUmguo/ffEQgZ77kmNM7AJlza+rx0bAh?=
 =?us-ascii?Q?hRmNmiSkXspVZ5l5XlPR2JuCSlMgFVMGSgEYkdpzNd1CMXR16ufgx8MCTwbu?=
 =?us-ascii?Q?hXFaPP1DrUIumeNVOb40RjuVvJPTCZvFWceLw4eRZPBBekAL25xBY9uGP6+a?=
 =?us-ascii?Q?vAynHdDS05/Dcw+F/ZcsdyJfrgD0ujRPLpvtY6M0NisRyfzGxZLLOJWgR55N?=
 =?us-ascii?Q?oA+uD9iMuckjytnvxPrre0hj47gILREdE2l9HevThy79bDEas6Jsdl/+HFWv?=
 =?us-ascii?Q?zdtgW5gSiQbf12GJCZU3iZPUo3sbKx2YXXzLEWMEvYomzlqaPAyntkSBdWIu?=
 =?us-ascii?Q?TceBZs+ypd1r6g+aR1mBMDM3KqHdAm66gpGXd+HtXNBUyzn6ty96sxz1+uR8?=
 =?us-ascii?Q?1caU7Q784g6/e4w/eCLFezsPsVrW2x+cDkb7LaR5BJdQFxD8CLw5HRovHyu+?=
 =?us-ascii?Q?sDoIc/LqczUlp+b/EZFiQAXFRpEQRpJB9IcZmEzCMQRWbm8NggS7atqOgeN0?=
 =?us-ascii?Q?TrUfEfGWnUlUwBTMkvo8xtRTqCK0LPROtAybbtTgsNwpbb3ROl8uIYGKBY/Y?=
 =?us-ascii?Q?P2kwdfmmASFFBVBn63EzG+GJfuqOGEPQN5e9Y1o20G7Q+alj5txJCNwxAVwl?=
 =?us-ascii?Q?RrFvODq84nDyHBIArC1wAbUG0vbmkNBHMebBrY9eY6PYBPCWZA4Mh1nIQQNQ?=
 =?us-ascii?Q?kKE5yh1mKQTCi5Mck1/+GGcIDblV9YSO1efW8TnYBBCcj7rI++AWcUduM1MF?=
 =?us-ascii?Q?jJ5dvQ=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(376014)(1800799024)(18082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	k8N+s3nP6mdd/jVPIrU6h1mg5LcKDMHfhP0ABKDTha4rnqb5fiRrISi9SXE3PA7y4737NQW1n4wR4L9mubLVBynwVxXqpFBePSlqsVFCUVgzvrM3wuv3868T/EcP/jDo9ODH+5ECl5fveUydmzHDsTS7gYBlsF77ddbvrn75i/QPYX2UysY6J8qUbq6OrkE+kQzqsZ3YbGtm5ILAw4n0p1T8SiMz4RkGCI0Rvii4a8JhinTfOF2xfu91aHR9aKcI1dHyNl0xOWg9bawZm4zqiDh95+/bDuEFbh9qafhYP83YWfbPNCDhtd5spDWgO/UBoQzi80QJIHMwAiUasnNhufmzNBG66sQtC/PLHt+ywbGllpq2B7L2RyYG+cNkXmxhrR53cmG9eheBLHyEwE4kvDvVWHsU2bxL2d5mz/hwh11stg+jwyvJfcia+y/O2UYn
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Feb 2026 15:52:49.1970
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2291cb16-3870-4998-9288-08de6405728e
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SA2PEPF000015C7.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR10MB4956
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Wed, 04 Feb 2026 15:52:58 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17077

Add a systemd service to run PulseAudio in system mode where multiple
applications need audio access without user sessions. Depends on
pulseaudio-server to ensure audio/pulse groups exist.

Enable this service by default to provide system-wide audio for all
applications.

Signed-off-by: Telukula Jeevan Kumar Sahu <j-sahu@ti.com>
---
 .../pulseaudio/files/pulseaudio.service       | 11 ++++++
 .../pulseaudio/pulseaudio-service.bb          | 35 +++++++++++++++++++
 2 files changed, 46 insertions(+)
 create mode 100644 meta-arago-extras/recipes-multimedia/pulseaudio/files/p=
ulseaudio.service
 create mode 100644 meta-arago-extras/recipes-multimedia/pulseaudio/pulseau=
dio-service.bb

diff --git a/meta-arago-extras/recipes-multimedia/pulseaudio/files/pulseaud=
io.service b/meta-arago-extras/recipes-multimedia/pulseaudio/files/pulseaud=
io.service
new file mode 100644
index 00000000..1d3ac435
--- /dev/null
+++ b/meta-arago-extras/recipes-multimedia/pulseaudio/files/pulseaudio.serv=
ice
@@ -0,0 +1,11 @@
+[Unit]
+Description=3DPulseAudio Sound System
+After=3Dalsa-restore.service
+
+[Service]
+BusName=3Dorg.pulseaudio.Server
+ExecStart=3D/usr/bin/pulseaudio --system
+Restart=3Dalways
+
+[Install]
+WantedBy=3Dmulti-user.target
diff --git a/meta-arago-extras/recipes-multimedia/pulseaudio/pulseaudio-ser=
vice.bb b/meta-arago-extras/recipes-multimedia/pulseaudio/pulseaudio-servic=
e.bb
new file mode 100644
index 00000000..432b2679
--- /dev/null
+++ b/meta-arago-extras/recipes-multimedia/pulseaudio/pulseaudio-service.bb
@@ -0,0 +1,35 @@
+DESCRIPTION =3D "Pulseaudio systemd service for system-wide audio"
+LICENSE =3D "MIT"
+LIC_FILES_CHKSUM =3D "file://${COMMON_LICENSE_DIR}/MIT;md5=3D0835ade698e0b=
cf8506ecda2f7b4f302"
+
+inherit ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'systemd', '', =
d)}
+inherit useradd
+
+DEPENDS =3D "pulseaudio"
+
+# Ensure pulseaudio-server is installed to create audio group
+RDEPENDS:${PN} =3D "pulseaudio-server"
+
+SRC_URI =3D "\
+    file://pulseaudio.service \
+"
+
+S =3D "${UNPACKDIR}"
+
+SYSTEMD_PACKAGES =3D "${PN}"
+SYSTEMD_SERVICE:${PN} =3D "pulseaudio.service"
+SYSTEMD_AUTO_ENABLE:${PN} =3D "disable"
+
+FILES:${PN} =3D " \
+    ${systemd_system_unitdir}/pulseaudio.service \
+"
+
+USERADD_PACKAGES =3D "${PN}"
+GROUPMEMS_PARAM:${PN} =3D "--add root --group audio"
+
+do_install() {
+    if ${@bb.utils.contains('DISTRO_FEATURES','systemd','true','false',d)}=
; then
+        install -d ${D}${systemd_system_unitdir}
+        install -m 0644 ${S}/pulseaudio.service ${D}${systemd_system_unitd=
ir}/
+    fi
+}
--=20
2.34.1


