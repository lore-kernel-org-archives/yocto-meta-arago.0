Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A505BD26D87
	for <webhook@archiver.kernel.org>; Fri,  9 Jan 2026 18:19:51 +0000 (UTC)
Received: from DM1PR04CU001.outbound.protection.outlook.com (DM1PR04CU001.outbound.protection.outlook.com [52.101.61.5])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.16644.1767982781939896813
 for <meta-arago@lists.yoctoproject.org>;
 Fri, 09 Jan 2026 10:19:42 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=DXkocA+k;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 52.101.61.5, mailfrom: reatmon@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=e9utpVDPEbvpEVy1iYt/RnBjHFHhlOKylX/70XLxLMA1zUF/v1Y4PoJhjsJqzx1rp+L8JNFDTtoCEldADzBW8KboUnIFxawsFKVZvseIIqwdvD4rrKWvNwsgzPZYDROEqumQNC5RUWaRsxuZNeTZtHEVj1ikD86xVABJzAIosKQCxYbxUbsIM+SLbgdEBOlSO9eo1Zpbe8n59cEC+GQx2Pt5ToqB/521EcYnPO9ZnmRodrHQalgWYNmnALjLpevLnG75s4FGKH39/Ely/Y6Lo+USxL0mPhm+lNbhdwQyFAM8VitJpKaTH3tYg2Glw95FlEKHpju9Su0I1Qarwdg8rQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bktLmQ5ozAogbsS0wbcC1rEVN6Lq8eSF7uooCBJ1/S8=;
 b=kYQ4Eo/EKlSTmS9pxrFfv0g4hW+vnYLc49M8nvMOgYJ0ImJosdGsAAZhLeD1iCMDTpKbYa41BNR09xe/3BMZvnUDf9fCmQ46FCs7O460Il/HFYDUrqt5mlSrh0KIVA4fp7YWX+tLAEOXi/ZsFGYNJM8ID+ygNovLSj5xnR4NHQjxY6psvKgt2a0vOFarXqxtp1nSF5fCymJt4YCsI6i4KoixTosMjx6OTF49F09coMQ3Yz7wbnO6KtgM+6Hrm5G02dPGuxUWu5PtwRK/BSNVRC9knwkp7049YYTCx++5sFD8Hf3UaFE/mx9H4eeowNdypvdasWewiKMyicCMiCzDZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bktLmQ5ozAogbsS0wbcC1rEVN6Lq8eSF7uooCBJ1/S8=;
 b=DXkocA+kJtZz5xEL89CHdh64k2HUubHmm0p0T3QK2KP7qySn+ZFfVos5XCafmHCKGatB582IjG9j+4hoP9cD7UNtA8MWy18bxwI/c6QTa8yF3noLjW7m0SxclOCY+/B/+RJ7/cU0mPcshrRUFZEoZoVEPpCEU5E5YvtSg5OBnWY=
Received: from SJ2PR07CA0020.namprd07.prod.outlook.com (2603:10b6:a03:505::19)
 by CH2PR10MB4231.namprd10.prod.outlook.com (2603:10b6:610:ac::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.4; Fri, 9 Jan
 2026 18:19:39 +0000
Received: from SJ1PEPF00001CEA.namprd03.prod.outlook.com
 (2603:10b6:a03:505:cafe::36) by SJ2PR07CA0020.outlook.office365.com
 (2603:10b6:a03:505::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9499.5 via Frontend Transport; Fri, 9
 Jan 2026 18:19:34 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 SJ1PEPF00001CEA.mail.protection.outlook.com (10.167.242.26) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9520.1 via Frontend Transport; Fri, 9 Jan 2026 18:19:37 +0000
Received: from DFLE214.ent.ti.com (10.64.6.72) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 9 Jan
 2026 12:19:35 -0600
Received: from DFLE209.ent.ti.com (10.64.6.67) by DFLE214.ent.ti.com
 (10.64.6.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 9 Jan
 2026 12:19:34 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE209.ent.ti.com
 (10.64.6.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Fri, 9 Jan 2026 12:19:34 -0600
Received: from grumpy (grumpy.dhcp.ti.com [128.247.81.229])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 609IJYD7361737;
	Fri, 9 Jan 2026 12:19:34 -0600
Received: from reatmon by grumpy with local (Exim 4.97)
	(envelope-from <reatmon@ti.com>)
	id 1veH5C-0000000Bw1z-3BpA;
	Fri, 09 Jan 2026 12:19:34 -0600
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>, Denys Dmytriyenko
	<denys@konsulko.com>, <meta-arago@lists.yoctoproject.org>
Subject: [meta-arago][master][PATCH v2] conf: Add support for bsp-ti-6_18 to ti-core-initramfs
Date: Fri, 9 Jan 2026 12:19:34 -0600
Message-ID: <20260109181934.2844640-1-reatmon@ti.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00001CEA:EE_|CH2PR10MB4231:EE_
X-MS-Office365-Filtering-Correlation-Id: 40b648e6-e7f9-4bb6-de54-08de4faba5ba
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|1800799024|36860700013|376014|34020700016;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?/8qWiZJtiC7fvYVar0KSs0lObBMyFV0dfczYPLfpIC8nhyq1ccjiMbqf9WRs?=
 =?us-ascii?Q?d/dla3MpDfEkv0bu7I5gAWduIf8pc7RjOW9ePQJdljomKLYHQDWqF+ASPokM?=
 =?us-ascii?Q?kJVp5PbyVSzT+DKb7al+xPO1/TzOAvvOZHO7L3TOT2dZ/P8BM9fSle8rsxSe?=
 =?us-ascii?Q?GmWaVXf5go1Tn7hmdESuI3h3078r1zNLA8xLLtxjiE0rHN50xQdyZn//Jqji?=
 =?us-ascii?Q?jBnR/i8nOQHoD0Bsxk0aHuM503wMsvnhThqusuvSHV/WsMcvTqE4qOXTFvCq?=
 =?us-ascii?Q?j6v4B/GYGqAREYurfUI09hYZhgOShjYgK+8zBVtt/Ib9Ic5kX7G8xOQWsYUu?=
 =?us-ascii?Q?aNfPtP4QovgxLqmqiZX2CI/mOhpWGn9E8FxVOjb+TGVNr1NAgADmJl61Mhnf?=
 =?us-ascii?Q?PaqsVwUOoHwIcr0YqKEYXM5qU8szt3cUcKv80isp9cCJTSMKt7c9Kv07ZRQp?=
 =?us-ascii?Q?QgP3yiWPK8C0m7/fAGQNRaeV/44vK0SIQ+/6iFCcqWrqCSEKddS6wSCrj9kT?=
 =?us-ascii?Q?+G7V+blejXICrleUDiKsFfW0pVq6Mv/KoeNk/9EDppKK328Hx59vh9HEi14y?=
 =?us-ascii?Q?M7i+LjceKHK3Rf9pO7DH0vnFa+uESp+3USRrLxguw6Sy68F6a+S0ewIo45vW?=
 =?us-ascii?Q?e7cBKH34aCmRUwG/MUzTfNk8lurr2RiAnZfDJLeh5DyothhY3RL2mIehkhYl?=
 =?us-ascii?Q?XgrAGy7BgA8i0T9KYmHYeG6a+7SR6xYfg8v8Eh/ki/wo6a38jV995vqaP95w?=
 =?us-ascii?Q?ypoLdDQR8kOOfgE7vGUOw6WEdtzHrIAn1U/AbdXOs88S5O8RdfTjmQWZ9MX3?=
 =?us-ascii?Q?nTOIi6Kzy6BXHJg0/xJ/2gGvKqNMyuExXFd/gFMM9pihOE/mfH3BegoG04M/?=
 =?us-ascii?Q?4XZM+ST1vVYzR/gUrTnFbjo+hnftW/qfH918UxjH6na9x+8OmPWEWo5Dx/5T?=
 =?us-ascii?Q?q9lGMASrWfkcxO7WiQ/1vv4lvwzfAqGolk0ddQ6Q7HlXiqb4KAfeNizI66Og?=
 =?us-ascii?Q?O1C3KOfeLdw7LF//xyZ8PllnLWLI4Rib6ks+6Apd11lerVXlfPU2IYRYtVuD?=
 =?us-ascii?Q?9NfOOiCNsOu+O26CSS1y/ankTBUYBB0Utk3fanfrx6kGtF2l260nL3sEajuq?=
 =?us-ascii?Q?CVf1z4YblJJm0SZtC1Tq84xH/vAqAuKsxS3WM2K6A6cd4Fff5axpN/BlxiOq?=
 =?us-ascii?Q?KrOLuhDnFKoYCzBCofFs8/Qq4HTR/BfJIF0DqOqoma5kj8tYeMp31xs2RNwO?=
 =?us-ascii?Q?R+n+z006Fz1CY+ePeukDivOCE1Zl4Y8hsYzGOH3YKSLubVkbfEIKUwtpe3tx?=
 =?us-ascii?Q?+LPAqH26WMXlpgW1ui5LmXKFTDmeCWaEoZOVmHTmn8/CM9DwyIMK3kzCf+Ed?=
 =?us-ascii?Q?7zN+qQjUb67mvmjE55QuGFDcYuk140Ldi1v7n66pfKw14ykonFfA+atMLbIz?=
 =?us-ascii?Q?U0LkU0E5TLlmB/W+uwg4IycHSQg6UOfCmgYJru2PgCtQPxq9oNpABN0IPN+2?=
 =?us-ascii?Q?BQX/DzIk4PxjiHC+CiNwRQLSNSiNYW4VBClUgGrNixGMsGrGCn1oG30AZOvI?=
 =?us-ascii?Q?mFnqXyeAn1ib6SQNGls=3D?=
X-Forefront-Antispam-Report: 
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(36860700013)(376014)(34020700016);DIR:OUT;SFP:1101;
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jan 2026 18:19:37.0355
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 40b648e6-e7f9-4bb6-de54-08de4faba5ba
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SJ1PEPF00001CEA.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR10MB4231
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Fri, 09 Jan 2026 18:19:51 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16941

With the 6.18 we are moving to using an initramfs to provide non-default
modules for booting.  So add that override to the machines that need it.

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
v2: Forgot to add ti-soc.inc to the commit.

 meta-ti-bsp/conf/machine/include/am62axx.inc | 5 +++--
 meta-ti-bsp/conf/machine/include/j721e.inc   | 1 +
 meta-ti-bsp/conf/machine/include/j784s4.inc  | 1 +
 meta-ti-bsp/conf/machine/include/ti-soc.inc  | 3 +++
 4 files changed, 8 insertions(+), 2 deletions(-)

diff --git a/meta-ti-bsp/conf/machine/include/am62axx.inc b/meta-ti-bsp/con=
f/machine/include/am62axx.inc
index 08111f82..1fd4a1ac 100644
--- a/meta-ti-bsp/conf/machine/include/am62axx.inc
+++ b/meta-ti-bsp/conf/machine/include/am62axx.inc
@@ -12,5 +12,6 @@ OPTEEMACHINE =3D "k3-am62x"
=20
 MACHINE_ESSENTIAL_EXTRA_RRECOMMENDS +=3D "cnm-wave-fw"
=20
-TI_INITRAMFS_KERNEL_MODULES:append:bsp-mainline  =3D " kernel-module-tps65=
94-i2c kernel-module-tps6594-regulator kernel-module-tps6594-core"
-TI_INITRAMFS_KERNEL_MODULES:append:bsp-next  =3D " kernel-module-tps6594-i=
2c kernel-module-tps6594-regulator kernel-module-tps6594-core"
+TI_INITRAMFS_KERNEL_MODULES:append:bsp-ti-6_18 =3D " kernel-module-tps6594=
-i2c kernel-module-tps6594-regulator kernel-module-tps6594-core"
+TI_INITRAMFS_KERNEL_MODULES:append:bsp-mainline =3D " kernel-module-tps659=
4-i2c kernel-module-tps6594-regulator kernel-module-tps6594-core"
+TI_INITRAMFS_KERNEL_MODULES:append:bsp-next =3D " kernel-module-tps6594-i2=
c kernel-module-tps6594-regulator kernel-module-tps6594-core"
diff --git a/meta-ti-bsp/conf/machine/include/j721e.inc b/meta-ti-bsp/conf/=
machine/include/j721e.inc
index 5ec43049..29566dac 100644
--- a/meta-ti-bsp/conf/machine/include/j721e.inc
+++ b/meta-ti-bsp/conf/machine/include/j721e.inc
@@ -20,5 +20,6 @@ TI_VXE_VXD_DRIVER:bsp-ti-6_6 =3D ""
=20
 MACHINE_ESSENTIAL_EXTRA_RRECOMMENDS +=3D "cadence-mhdp-fw vxd-dec-fw ti-et=
h-fw-j721e ${TI_VXE_VXD_DRIVER}"
=20
+TI_INITRAMFS_KERNEL_MODULES:append:bsp-ti-6_18 =3D " kernel-module-cdns-pl=
tfrm kernel-module-ti-j721e-ufs"
 TI_INITRAMFS_KERNEL_MODULES:append:bsp-mainline =3D " kernel-module-cdns-p=
ltfrm kernel-module-ti-j721e-ufs"
 TI_INITRAMFS_KERNEL_MODULES:append:bsp-next =3D " kernel-module-cdns-pltfr=
m kernel-module-ti-j721e-ufs"
diff --git a/meta-ti-bsp/conf/machine/include/j784s4.inc b/meta-ti-bsp/conf=
/machine/include/j784s4.inc
index 6ba427cb..42c95b11 100644
--- a/meta-ti-bsp/conf/machine/include/j784s4.inc
+++ b/meta-ti-bsp/conf/machine/include/j784s4.inc
@@ -14,5 +14,6 @@ OPTEEMACHINE =3D "k3-j784s4"
=20
 MACHINE_ESSENTIAL_EXTRA_RRECOMMENDS +=3D "cadence-mhdp-fw cnm-wave-fw ti-e=
th-fw-j784s4"
=20
+TI_INITRAMFS_KERNEL_MODULES:append:bsp-ti-6_18 =3D " kernel-module-cdns-pl=
tfrm kernel-module-ti-j721e-ufs"
 TI_INITRAMFS_KERNEL_MODULES:append:bsp-mainline =3D " kernel-module-cdns-p=
ltfrm kernel-module-ti-j721e-ufs"
 TI_INITRAMFS_KERNEL_MODULES:append:bsp-next =3D " kernel-module-cdns-pltfr=
m kernel-module-ti-j721e-ufs"
diff --git a/meta-ti-bsp/conf/machine/include/ti-soc.inc b/meta-ti-bsp/conf=
/machine/include/ti-soc.inc
index ca182968..74346430 100644
--- a/meta-ti-bsp/conf/machine/include/ti-soc.inc
+++ b/meta-ti-bsp/conf/machine/include/ti-soc.inc
@@ -33,14 +33,17 @@ BUILD_CORE_INITRAMFS_IMAGE =3D "ti-core-initramfs"
 BUILD_CORE_INITRAMFS_IMAGE_FILE =3D "${BUILD_CORE_INITRAMFS_IMAGE}.cpio.xz=
"
=20
 BUILD_CORE_INITRAMFS_IMAGE_STEP ?=3D ""
+BUILD_CORE_INITRAMFS_IMAGE_STEP:bsp-ti-6_18 =3D "${BUILD_CORE_INITRAMFS_IM=
AGE}:do_image_complete"
 BUILD_CORE_INITRAMFS_IMAGE_STEP:bsp-mainline =3D "${BUILD_CORE_INITRAMFS_I=
MAGE}:do_image_complete"
 BUILD_CORE_INITRAMFS_IMAGE_STEP:bsp-next =3D "${BUILD_CORE_INITRAMFS_IMAGE=
}:do_image_complete"
=20
 do_image_wic[depends] +=3D "${BUILD_CORE_INITRAMFS_IMAGE_STEP}"
=20
 TI_WKS_INITRAMFS ?=3D ""
+TI_WKS_INITRAMFS:bsp-ti-6_18 =3D ",initrd=3D${BUILD_CORE_INITRAMFS_IMAGE_F=
ILE}"
 TI_WKS_INITRAMFS:bsp-mainline =3D ",initrd=3D${BUILD_CORE_INITRAMFS_IMAGE_=
FILE}"
 TI_WKS_INITRAMFS:bsp-next =3D ",initrd=3D${BUILD_CORE_INITRAMFS_IMAGE_FILE=
}"
=20
+IMAGE_BOOT_FILES:append:bsp-ti-6_18 =3D " ${BUILD_CORE_INITRAMFS_IMAGE_FIL=
E}"
 IMAGE_BOOT_FILES:append:bsp-mainline =3D " ${BUILD_CORE_INITRAMFS_IMAGE_FI=
LE}"
 IMAGE_BOOT_FILES:append:bsp-next =3D " ${BUILD_CORE_INITRAMFS_IMAGE_FILE}"
--=20
2.43.0


