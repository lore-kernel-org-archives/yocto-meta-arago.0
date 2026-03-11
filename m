Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 76F0A1125850
	for <webhook@archiver.kernel.org>; Wed, 11 Mar 2026 16:19:40 +0000 (UTC)
Received: from BYAPR05CU005.outbound.protection.outlook.com (BYAPR05CU005.outbound.protection.outlook.com [52.101.85.57])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.182.1773245976829427317
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 11 Mar 2026 09:19:37 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=sl/XjT5x;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 52.101.85.57, mailfrom: afd@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cZOD9r17Y065ya4QagCVAzzrCOwVGQhwIgT9PEXYy9CMSr6wj05z06CYbo+G/nH3WWQf2XqMTuKXSfKpO1nNhflF6wjzo3O7DKM/1cQqlFbtu2I0EO9Dd85Vd8vK5CzSVL4KfGPBf8NF1jrSKDsjfx7N1EtlZdfQo07zS1f1KEEQzsoH3Z+hTk66A+15/cZk+dHDdHpxLmRoaB8HkAUfHSFMjdHVAh5FygpF1ti8Q7EuRWuai6Mo6Df+WZk9mJI4Z0oMoVnx4F3fCWy+YCV8ww1Bb3jl0GA2uMp5AdfPO7szUBWFSSE3GS66SAkTbCNjuTrLTveNc/STmJN+S+uJsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=z4mdBzCGJidkNG52wMsHEIjHiyj2wcwdN0lTbV5EupA=;
 b=SuB9HKUyBGpTOXIr8Y5axHVfJjhKTK9DmOtEyg1xYxsrQSPbjeoxZ/oHbfpffwHPga+E2iwDlyjGm/3Qw7mCesdJNer5G1qoGSBdSwn8M0RtMgjTiRk55pdFpPUrj2xfalvAnOs4xXMlflDaOd9tl0HCr/JoUrkgNn5tOA2Cw4bgB5X2RgqtpU2UBAh4bVzwFaK1ieIa38CxDh/o5Ybjkx36pIn6eAUElEo4awR+xX4FZjCfl4i6RU82n/6MhZBXUlmHdQWFq8ljKT/PWX1L/nbCw4zvqr1YUyHWeBuVEOtuy6XBwb12jF2HbPyYJBMir99v4zFJYhdruel9AFVmbQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=z4mdBzCGJidkNG52wMsHEIjHiyj2wcwdN0lTbV5EupA=;
 b=sl/XjT5xTk2THPkukinql1S0XsDTaF6zaGjftIWyBLdG0ZBPTRLHoeX/+rmzCsGrqkKSrV+7bCpXRbeoPvfbJYlOvPieTXAgatGbhvdUM7+s3pK4HyOUmg/LkMvDD5vm2XI9+SVdkJRbsKg/RGYnBAtsKPkbjLo9r8omsoeAKCc=
Received: from CH0P220CA0018.NAMP220.PROD.OUTLOOK.COM (2603:10b6:610:ef::30)
 by DS7PR10MB5151.namprd10.prod.outlook.com (2603:10b6:5:3a4::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.13; Wed, 11 Mar
 2026 16:19:34 +0000
Received: from CH1PEPF0000AD7B.namprd04.prod.outlook.com
 (2603:10b6:610:ef:cafe::69) by CH0P220CA0018.outlook.office365.com
 (2603:10b6:610:ef::30) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9678.27 via Frontend Transport; Wed,
 11 Mar 2026 16:19:31 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 CH1PEPF0000AD7B.mail.protection.outlook.com (10.167.244.58) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9678.18 via Frontend Transport; Wed, 11 Mar 2026 16:19:34 +0000
Received: from DLEE209.ent.ti.com (157.170.170.98) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 11 Mar
 2026 11:19:34 -0500
Received: from DLEE210.ent.ti.com (157.170.170.112) by DLEE209.ent.ti.com
 (157.170.170.98) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 11 Mar
 2026 11:19:34 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE210.ent.ti.com
 (157.170.170.112) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Wed, 11 Mar 2026 11:19:34 -0500
Received: from fllvem-mr08.itg.ti.com ([10.249.42.149])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 62BGJXeg653061;
	Wed, 11 Mar 2026 11:19:33 -0500
From: Andrew Davis <afd@ti.com>
To: Denys Dmytriyenko <denys@konsulko.com>, Ryan Eatmon <reatmon@ti.com>,
	<meta-arago@lists.yoctoproject.org>
CC: Andrew Davis <afd@ti.com>
Subject: [meta-arago][master][PATCH] images: Remove C6x GDB and dsptop related packages
Date: Wed, 11 Mar 2026 11:19:31 -0500
Message-ID: <20260311161931.394451-1-afd@ti.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000AD7B:EE_|DS7PR10MB5151:EE_
X-MS-Office365-Filtering-Correlation-Id: 82a512eb-5f52-48a0-13f0-08de7f89fbf9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|82310400026|36860700016|376014|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info: 
	ryE89TFNHsjO0FNOIhfBFAIlUPIawDB4uAf2Uu0LYBNzIZ7IKatH7fvmwZfSu9/uXPg5VRytiLg7MdULLVfPTK1pCAgB9PSXht8isNM74rSpZ7prmkRCzkhGBksTaTUBONmUoRUQox9ichmMDPxfou5w+E7srcL/FPGRQ/MP3YcQmImnAOVSXZfL8KKKPjbw3JsC8dl6Csgd/JQs0fKdnEHPRhOzJwUEs5wIVqa4ieRn3XG/sqSxCUqIhbDl3wlLLHkNwYye5QIe4qXedEwlRvRkQAt0jE0IfAsxL238QMf2DHmXIYmgZdOVi3eGJZWtXERN60BNeq+hwa4SpSCSWSkPW9hdh/sfsg06cyWAIdXVcUGgwExcgUSaoF8aM+CO9W4YUxTm/fjtgFHW8a0h1Xv1nQiD6RUMrdaEPThAhAFXEHJ2UVgczp9Bf57iv3l5gM6TrJ6RXPucg5PEAmOX0+vnFiOPTLtA9tYwpmieqCuqunAnvGsgSgKhIxRsP9ij6wa6ne9V/ETy6biVRqzH8D61R8ivnF/sgJBcI8WWeJTFiHcdLATjfjG/CDVcMyQSBZFzJDDGXgk7OnNQC60Rnq/cq+HUtRphIpxPwhUVHt3refKazhZDq8BiHWyBlOzCeAZYUuOwBYipgNYt3H45mwfzJHT0tygZZsH9wUPmou6f1oMe2R5NJJx/eD5wDt6E1qW2F0ZSmCEUeFBgRxOLEq4cBva6gK1kbnX+SEgA3nRKpX7vAppQ1n3Jqw0g6yOtOEkXIlrpP1KhT8EFkgOwkA==
X-Forefront-Antispam-Report: 
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(36860700016)(376014)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	e1jk3qG1jEfo8MoBKGfIZ6qQAHatmpdv8AyLlc7cVn9alx+mIgnP4SRdxPBk+ERUTzA47AdBbWeuQre5cn77CsDK7PhecPNQo+JQ/mNKeHusKUTRvU2nQpTXN7OV5gJEcZvVoGmAzdI/lIeXuhTK9AfKFvAJNTJaFokx2xa2CWnZkJ8iEorwiAJvRtAVXelTOkNPG8yyIJv4+BxY2UwFCTYPT7Q/+74hFpfgx3fvBqUwbwdBc42cIwWUf/pL5dWHnmEGE8IyrbydMDzFUcBVjK+EgMVPpQpqshIF6hV5xPOV6tJw5Lt/7okt21HQaCFngsoJ067mpxzOpBRX/OGfDiWEzn3UD76oLqP+vRzbyZjQ3EvrO0lTjximS78GSv90Y3yYKGbpd5lq7c3VAndocMyERAL1AJr7ZPi2JGEEEXCrjbFSMMQiq19oLhHKpOAQ
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Mar 2026 16:19:34.6955
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 82a512eb-5f52-48a0-13f0-08de7f89fbf9
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CH1PEPF0000AD7B.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR10MB5151
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Wed, 11 Mar 2026 16:19:40 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17311

GDB and dsptop for C6x are deprecated and will be removed from meta-ti
soon. Remove gdbserver-c6x, dsptop, and libulm from Arago images.

Signed-off-by: Andrew Davis <afd@ti.com>
---
 meta-arago-distro/recipes-core/images/arago-image.inc    | 2 --
 .../packagegroup-arago-addons-sdk-target.bb              | 7 -------
 .../packagegroups/packagegroup-arago-addons.bb           | 9 ---------
 .../packagegroup-arago-standalone-sdk-target.bb          | 1 -
 4 files changed, 19 deletions(-)

diff --git a/meta-arago-distro/recipes-core/images/arago-image.inc b/meta-a=
rago-distro/recipes-core/images/arago-image.inc
index f085fa23..e6739d2c 100644
--- a/meta-arago-distro/recipes-core/images/arago-image.inc
+++ b/meta-arago-distro/recipes-core/images/arago-image.inc
@@ -17,8 +17,6 @@ TOOLCHAIN_HOST_TASK:append =3D " nativesdk-buildtools-per=
l-dummy"
 SDK_PACKAGE_ARCHS +=3D "buildtools-dummy-${SDKPKGSUFFIX}"
=20
 BAD_RECOMMENDATIONS +=3D " \
-    libulm-dev \
-    gdbserver-c6x-dev \
     coreutils \
     coreutils-dev \
 "
diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arag=
o-addons-sdk-target.bb b/meta-arago-distro/recipes-core/packagegroups/packa=
gegroup-arago-addons-sdk-target.bb
index 54c7c4c9..ae8f063f 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-addon=
s-sdk-target.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-addon=
s-sdk-target.bb
@@ -25,12 +25,6 @@ UTILS:append:k3 =3D "\
 	ti-rpmsg-char-staticdev \
 "
=20
-EXTRA_LIBS =3D ""
-EXTRA_LIBS:append:am57xx =3D " libulm-dev \
-                             libulm-staticdev \
-                             gdbserver-c6x-dev \
-"
-
 EXTRA_PACKAGES =3D ""
=20
 IPCDEV =3D " \
@@ -43,6 +37,5 @@ EXTRA_PACKAGES:append:omapl138 =3D " ${IPCDEV}"
=20
 RDEPENDS:${PN} =3D "\
     ${UTILS} \
-    ${EXTRA_LIBS} \
     ${EXTRA_PACKAGES} \
 "
diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arag=
o-addons.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-ara=
go-addons.bb
index 67f3de16..00836a03 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-addon=
s.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-addon=
s.bb
@@ -9,7 +9,6 @@ inherit packagegroup
 PACKAGES =3D+ "${PN}-extra"
=20
 UTILS =3D " \
-    gdbserver \
     oprofile \
     ptpd \
     strongswan \
@@ -26,10 +25,6 @@ UTILS:append:arago =3D " \
=20
 UTILS_UBOOT_FW =3D "libubootenv-bin"
=20
-UTILS_DSP =3D " \
-    ${@bb.utils.contains('MACHINE_FEATURES', 'dsp', 'gdbc6x dsptop', '', d=
)} \
-"
-
 #                       pru-swuart-fw=20
 UTILS:append:ti33x =3D " mmc-utils \
                        switch-config \
@@ -72,10 +67,6 @@ UTILS:append:j721e =3D " pru-icss"
=20
 UTILS:append:omapl138 =3D " ti-ipc-rtos-fw"
=20
-UTILS:append:am57xx =3D " \
-    ${UTILS_DSP} \
-"
-
 EXTRA_PACKAGES =3D " \
     protobuf \
     ccief-basic \
diff --git a/meta-arago-extras/recipes-core/packagegroups/packagegroup-arag=
o-standalone-sdk-target.bb b/meta-arago-extras/recipes-core/packagegroups/p=
ackagegroup-arago-standalone-sdk-target.bb
index baa2a4bc..2a10bbaa 100644
--- a/meta-arago-extras/recipes-core/packagegroups/packagegroup-arago-stand=
alone-sdk-target.bb
+++ b/meta-arago-extras/recipes-core/packagegroups/packagegroup-arago-stand=
alone-sdk-target.bb
@@ -14,7 +14,6 @@ RDEPENDS:${PN} =3D "\
     ${LIBC_DEPENDENCIES} \
     libc-staticdev \
     linux-libc-headers-dev \
-    gdbserver \
     alsa-dev \
     alsa-lib-dev \
     alsa-utils-dev \
--=20
2.39.2


