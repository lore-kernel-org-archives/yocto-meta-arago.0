Return-Path: <anshuld@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 71868CFD2F6
	for <webhook@archiver.kernel.org>; Tue,  2 Dec 2025 11:16:30 +0000 (UTC)
Received: from PH8PR06CU001.outbound.protection.outlook.com (PH8PR06CU001.outbound.protection.outlook.com [40.107.209.15])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.5557.1764674184738931973
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 02 Dec 2025 03:16:24 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=mt11VNcC;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 40.107.209.15, mailfrom: anshuld@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dGxSzrOKobl2aGLXL6XSDS855rq7e4/piUKP+omPDpTy5AF4fjIQOCOyf15JlJMJErqvGpUAHaCSlVgs++F+g9w5n3lFfUWJ4ML7G1/MUOL4YFtKKuGinnaoftsvdWxn+pd8bH26axzbh2xKPuVFTDTsV7Iwj/XEsvPpFKOQN8TlUuvO4ZRN0e3j4cD/uoHtE4VqTVkzxT4k6Xa8xOQAL63pcJje/UyFT7TbFakmDRMT5MaK078xvYFmINPgTCaN8RTL7PYGm67tojqJvISCflLnLOlg+MMB8Zt7DdT0Anr9ksucM4ZOLy4NtQ6Fkk5bSw9xpW+sKLIHILU5USptoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Fe+XXqzVMz6s30tIooQrFnG0ojrC6Wkt36kWGi5HvSI=;
 b=YUB933CiqcvOaNpjw0hK4T9gsA5Aqh7oWTuiXK45UuzFObVN3sDoykaiJP7sznMWAIrGde6Lycm4bLQtGS2sEZd6IiNk70WpzJv0tW/N+m/PzW50XLaollnxOPkQxaKktv3/PdCNNqNW2RpsxAZIOJrCLnU8Fz0gNchfBaz352k2PbS3arZeSqqr0SAVWU/KJn40H1L5KEuZurIJRaqv5kxKafXUy9RR+XD33ncM73cuP6BiuMnm36MmIfs/oFWemwNzzfv1aOS0D/hqg+TK4wcRNEc4BSofxcEnH3qlUBbjOQc8qVHkM3F6+HaTFhU5JkZ9MJGb9XxNMfyJl2E5IA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=konsulko.com smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Fe+XXqzVMz6s30tIooQrFnG0ojrC6Wkt36kWGi5HvSI=;
 b=mt11VNcCWTAnvjZDKepbyVGUJDLDw6garC2rkg3p37xHxQpVBsnjzKA2ai7CarMMcCi1NGfTqMnZu9cvH5/B+9M/Tuk00Lrj0akdG9a9AwFoeC889B7QXqAfSAbmjObChmoRiiTj6jYkbuy4QuxHVOWRIW1N8aMC2giGlEU1s7M=
Received: from PH8PR15CA0010.namprd15.prod.outlook.com (2603:10b6:510:2d2::6)
 by CH2PR10MB4311.namprd10.prod.outlook.com (2603:10b6:610:79::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.9; Tue, 2 Dec
 2025 11:16:21 +0000
Received: from CY4PEPF0000E9D1.namprd03.prod.outlook.com
 (2603:10b6:510:2d2:cafe::70) by PH8PR15CA0010.outlook.office365.com
 (2603:10b6:510:2d2::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9388.9 via Frontend Transport; Tue, 2
 Dec 2025 11:16:20 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 CY4PEPF0000E9D1.mail.protection.outlook.com (10.167.241.136) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9388.8 via Frontend Transport; Tue, 2 Dec 2025 11:16:18 +0000
Received: from DFLE202.ent.ti.com (10.64.6.60) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 2 Dec
 2025 05:16:14 -0600
Received: from DFLE210.ent.ti.com (10.64.6.68) by DFLE202.ent.ti.com
 (10.64.6.60) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 2 Dec
 2025 05:16:14 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE210.ent.ti.com
 (10.64.6.68) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Tue, 2 Dec 2025 05:16:14 -0600
Received: from localhost (dhcp-172-24-233-105.dhcp.ti.com [172.24.233.105])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5B2BGDkC2143174;
	Tue, 2 Dec 2025 05:16:14 -0600
From: Anshul Dalal <anshuld@ti.com>
To: <meta-arago@lists.yoctoproject.org>
CC: Anshul Dalal <anshuld@ti.com>, <vigneshr@ti.com>, <denys@konsulko.com>,
	<reatmon@ti.com>
Subject: [meta-arago][scarthgap][PATCH RFC 3/4] swupdate: add bootloader support
Date: Tue, 2 Dec 2025 16:46:00 +0530
Message-ID: <20251202111603.1616989-4-anshuld@ti.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251202111603.1616989-1-anshuld@ti.com>
References: <20251202111603.1616989-1-anshuld@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000E9D1:EE_|CH2PR10MB4311:EE_
X-MS-Office365-Filtering-Correlation-Id: db541d6f-97fc-4c0c-791e-08de31943731
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700013|376014|1800799024|82310400026;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?ida3BK7nrOSSgnvflVMy6Y1m3ivPpzC2cHgcyuj6KleD5poqT13hpC3wotbo?=
 =?us-ascii?Q?S1nTb4s+8DqvPI69cM16WbRgqP8ZrfouKY9KgYv4r4Iids4hECwzf8A2gdYb?=
 =?us-ascii?Q?EJ1CTS5pYTOhzTPq86dZivUA2mrOo0JuJnh5V4/wlwIQdHfti33lleaReeLd?=
 =?us-ascii?Q?7lNO7eRFUtu77rsPjbPfg1YJ35zBxPmf4GN+BCkx7UH4fNj0Rj5EO5ixpjRu?=
 =?us-ascii?Q?2qycPk3duDwmo8hCVZM4QLqd3qhZljmeMDy9WZXln0B3PrwZQu0ZEmlB5msU?=
 =?us-ascii?Q?ZXnffmcRALcRKfMVqCoeXZrMaSVydhwCV4UNTPkcoAF4QsNh3jGjzkAr8UhZ?=
 =?us-ascii?Q?ahn2oEYMMSHW6wJkTJk/CEw9R0GL7wo1QtaeFOtlXFnyDluwxbah7NRqe39I?=
 =?us-ascii?Q?eCVTNK+56Q7g6NTx7furl6SUvlkuqdjzJ7s0V3/ovpsmiyMekieb0Z7ILKIl?=
 =?us-ascii?Q?PdTYOih3VYcmvF0w7uIX0SxBWsWi+J/Gz1AU70shp9F0c3iArpeGRstvfz87?=
 =?us-ascii?Q?rUVZT8rhDdOSNAkvzC68JRHo0ALxSH8Mk4gvKWAiilL8J3XN2wCkpRONzse3?=
 =?us-ascii?Q?q7wUG6CFN5rVhs4cvIbGB5+kPXWrkDvyGF5BccyPuTj6Zkgx6iCZFg2CpbbL?=
 =?us-ascii?Q?gRq+DU8eGahD3a1IIy2EFYpzvzvBNs66aYMyUyFH3VEwWXmZG4KaN0SL6HBn?=
 =?us-ascii?Q?TrxlqR4at1pLW5KfSXwAcN3uYs5iAFdGxgYjvA3jEiUm+bgWvxE0On9Iz6iQ?=
 =?us-ascii?Q?CcqaonSRtZgq6cVeSI9ZYkqFTwSZGRQ2Qr4VC+s6ekrqgMAxTi3whG7F9cZq?=
 =?us-ascii?Q?eV0KBlq0CUndZJgRa3B3tP3F36G2t03Jj1Ju7UfaaTajetIN4BUsJN5k2U34?=
 =?us-ascii?Q?ogd7IgfQF8yTbg89Qw9/dDAhNByPzE8RADF41YoUANVn0WQEYWvvyJ3f1vMS?=
 =?us-ascii?Q?n5Xl1eRz0f7E0v5ss+3XgRSLl4h8T1mbWPb7PPjLBe8ujlfRUnb1aigJtGAI?=
 =?us-ascii?Q?LnuZaClL1ipd8j7HufG0Psdyhaq/vxA/MpurgLv+wXnyH+zDeRqLEOdBrFLN?=
 =?us-ascii?Q?JUu40bK9P1NN/6Dr5WSazw8QbCpy8xkcEFr6+te7KhoEDqc0xjtWsACZxj5S?=
 =?us-ascii?Q?e5sKmdSsSqPdKZYpK81x9XJITFxxt6l0hwzFqWC47vEFVQHcfgYSOAIywvX9?=
 =?us-ascii?Q?yJP3QwejdT4kM/wOtKV//GT1L9RAdS0y52Jd8+jHf2vlWqKtHX55KZBZvmTM?=
 =?us-ascii?Q?caRgjOyGyfn2qEEZS/u8UiI5/4MP0kOL714cqnboU8h7qKnsZD2t/IWhaEcJ?=
 =?us-ascii?Q?aM2lHH2XcpNfzoZl/cs9+x9hF9DTJvqxqW0RrG8M0fBnsqlAxh0Z1qCSk5Kn?=
 =?us-ascii?Q?m95fTnzK25XWUtk8NYt8hEKr7+FkVtHdPp1ZIf0DEPmlfAjXl7N8xH4N7X1p?=
 =?us-ascii?Q?0rYpFCi2bhaiN+tEO8zJjT5ZdSFWkuMTyyiK2ACm1MD4lPEGccKU8OVrZCcr?=
 =?us-ascii?Q?2VWRGGcZs3sjFWg=3D?=
X-Forefront-Antispam-Report: 
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(36860700013)(376014)(1800799024)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Dec 2025 11:16:18.3669
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: db541d6f-97fc-4c0c-791e-08de31943731
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CY4PEPF0000E9D1.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR10MB4311
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 02 Dec 2025 11:16:30 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16850

U-Boot uses the 'bootpart' env variable to configure the rootfs for the
kernel at boot. The BACKUP_REG0 MMR is also used to store bootcount as
per U-Boot requirements[1].

After each reset, U-Boot increments the bootcount and it's reset to 0 by
the swupdate service indicating a successful boot. If the kernel panics
however (eg. if the update failed), the bootcount is never reset and
keeps on getting incremented by U-Boot until it reaches certain
threshold after which U-Boot switches to the other non-updated partition
to ensure a successful boot.

This patch adds support for the same to the final .swu image generated
by the update-image recipe.

[1]: https://docs.u-boot.org/en/latest/api/bootcount.html

Signed-off-by: Anshul Dalal <anshuld@ti.com>
---
 .../recipes-swupdate/images/files/sw-description     | 12 ++++++++++++
 .../recipes-swupdate/libubootenv/files/fw_env.config |  5 +++++
 .../libubootenv/libubootenv_%.bbappend               | 10 ++++++++++
 .../recipes-swupdate/swupdate/files/defconfig        |  2 ++
 .../recipes-swupdate/swupdate/files/swupdate.sh      |  4 ++++
 .../recipes-swupdate/swupdate/swupdate_%.bbappend    |  2 ++
 6 files changed, 35 insertions(+)
 create mode 100644 meta-arago-distro/recipes-swupdate/libubootenv/files/fw=
_env.config
 create mode 100644 meta-arago-distro/recipes-swupdate/libubootenv/libuboot=
env_%.bbappend

diff --git a/meta-arago-distro/recipes-swupdate/images/files/sw-description=
 b/meta-arago-distro/recipes-swupdate/images/files/sw-description
index 8dc4e2b2..241bc95c 100644
--- a/meta-arago-distro/recipes-swupdate/images/files/sw-description
+++ b/meta-arago-distro/recipes-swupdate/images/files/sw-description
@@ -15,6 +15,12 @@ software =3D
 						compressed =3D "zlib";
 					},
 				);
+				uboot: (
+					{
+						name =3D "bootpart";
+						value =3D "0:1";
+					},
+				);
 			};
=20
 			copy2 : {
@@ -26,6 +32,12 @@ software =3D
 						compressed =3D "zlib";
 					},
 				);
+				uboot: (
+					{
+						name =3D "bootpart";
+						value =3D "0:2";
+					},
+				);
 			};
 		};
 	}
diff --git a/meta-arago-distro/recipes-swupdate/libubootenv/files/fw_env.co=
nfig b/meta-arago-distro/recipes-swupdate/libubootenv/files/fw_env.config
new file mode 100644
index 00000000..57eec5fc
--- /dev/null
+++ b/meta-arago-distro/recipes-swupdate/libubootenv/files/fw_env.config
@@ -0,0 +1,5 @@
+# Describes the env location for U-Boot in the hw partition
+# Second entry indicates redundant env
+# Boot dev			Offset		Size
+/dev/mmcblk0boot0	0x680000	0x20000
+/dev/mmcblk0boot0	0x6a0000	0x20000
diff --git a/meta-arago-distro/recipes-swupdate/libubootenv/libubootenv_%.b=
bappend b/meta-arago-distro/recipes-swupdate/libubootenv/libubootenv_%.bbap=
pend
new file mode 100644
index 00000000..e3d142f2
--- /dev/null
+++ b/meta-arago-distro/recipes-swupdate/libubootenv/libubootenv_%.bbappend
@@ -0,0 +1,10 @@
+FILESEXTRAPATHS:prepend :=3D "${THISDIR}/files:"
+
+SRC_URI:append =3D " file://fw_env.config"
+
+do_install:append() {
+	install -d ${D}${sysconfdir}
+	install -m 644 ${WORKDIR}/fw_env.config ${D}${sysconfdir}
+}
+
+FILES:${PN}:append =3D " ${sysconfdir}"
diff --git a/meta-arago-distro/recipes-swupdate/swupdate/files/defconfig b/=
meta-arago-distro/recipes-swupdate/swupdate/files/defconfig
index b1362eaa..4a2d78c0 100644
--- a/meta-arago-distro/recipes-swupdate/swupdate/files/defconfig
+++ b/meta-arago-distro/recipes-swupdate/swupdate/files/defconfig
@@ -1,8 +1,10 @@
 CONFIG_HW_COMPATIBILITY=3Dy
 # CONFIG_LUA is not set
 # CONFIG_BOOTLOADER_NONE is not set
+CONFIG_UBOOT=3Dy
 CONFIG_SYSTEMD=3Dy
 CONFIG_WEBSERVER=3Dy
+CONFIG_BOOTLOADERHANDLER=3Dy
 CONFIG_CFI=3Dy
 CONFIG_EMMC_HANDLER=3Dy
 CONFIG_RAW=3Dy
diff --git a/meta-arago-distro/recipes-swupdate/swupdate/files/swupdate.sh =
b/meta-arago-distro/recipes-swupdate/swupdate/files/swupdate.sh
index bb3a3593..2083062e 100644
--- a/meta-arago-distro/recipes-swupdate/swupdate/files/swupdate.sh
+++ b/meta-arago-distro/recipes-swupdate/swupdate/files/swupdate.sh
@@ -8,4 +8,8 @@ else
 	SELECTION=3D"-e stable,copy2"
 fi
=20
+# BACKUP_REG0 MMR on AM62x
+UBOOT_BOOTCOUNT_ADDR=3D0x4301c100
+
+devmem2 $UBOOT_BOOTCOUNT_ADDR w 0
 swupdate -H @MACHINE@:1.0 ${SELECTION} -p 'reboot' -f /etc/swupdate.cfg -w=
 "-r /www -p 8080"
diff --git a/meta-arago-distro/recipes-swupdate/swupdate/swupdate_%.bbappen=
d b/meta-arago-distro/recipes-swupdate/swupdate/swupdate_%.bbappend
index 0ce763f9..20f87435 100644
--- a/meta-arago-distro/recipes-swupdate/swupdate/swupdate_%.bbappend
+++ b/meta-arago-distro/recipes-swupdate/swupdate/swupdate_%.bbappend
@@ -2,6 +2,8 @@ inherit swupdate-lib
=20
 FILESEXTRAPATHS:append :=3D "${THISDIR}/files:"
=20
+RDEPENDS:${PN} +=3D "devmem2"
+
 FILES:${PN} +=3D " \
   ${SWUPDATE_HW_COMPATIBILITY_FILE} \
 "
--=20
2.52.0


