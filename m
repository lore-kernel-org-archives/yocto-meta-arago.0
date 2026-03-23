Return-Path: <j-sahu@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 92AE7F46122
	for <webhook@archiver.kernel.org>; Mon, 23 Mar 2026 14:01:56 +0000 (UTC)
Received: from CY7PR03CU001.outbound.protection.outlook.com (CY7PR03CU001.outbound.protection.outlook.com [40.93.198.22])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.18264.1774274506599397688
 for <meta-arago@lists.yoctoproject.org>;
 Mon, 23 Mar 2026 07:01:47 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=JuV22xLY;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 40.93.198.22, mailfrom: j-sahu@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=y97YfYFDOMTJ3JmVxrVhPxoMrBUNj2jN2IxeG5O1EOMyQNMysX3j6g2pKF1gf2IzPNuzdahzrrp0lI54gBaWuEdG6+aOM+8p+JRZvdBKImQcuQy++nW5yKeCasHoEavDCl1oUAL//dL5qhVCGaatbXplLoDnE7U6Og4HfE+VCxGoy8QUU2YcvNXVtflfYEf68d3ARlaHKutBKXR9z/gpuMghyDKerG427Xu3XC0tbJuYYkrtrPtHwkN3oRCNBJenQqTxdv0JUDiWUq1BV/MJYMhxlqZObKfEpzugKpWspaQMP5HBH3dGXz/rwqBYeflNrh+DE3zGtUz6dF625JjttQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=L7A9ZnJV//jNgU+ShnSQ8klZbeX9HK2n+8+HlS+1vXM=;
 b=XgcOTnQvX5uuOMrhFuk5GWzYQMdA2UWc0kv/ssJ7J8HC+j2nkBv2dx65xfxnyeO8xeGzi9nZJbGEgh3ijLMq6rm9hZiSFeU5+S2oB5Yzrn/LJhbN96GdFtjbGolkywGOwPNawXWftLkH0dlq8RYIspXknSmEin913z34kDlKpesWXy+ObetH1LwQhKzsq4YlC/rI2yaroQ8Hyt+gIcVZHJ1+LugidFXitZZE0+KKw7YykQjCx27CsDJ/Gtim+aKc42B2aw68PdbFBMfDpPF18vtCAoYV+Vy+aUJTOmUg71DoiL6es1fzdthwTJgk1ncE3Z1fjr9IvXE3ndB4GQKkNg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=konsulko.com smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=L7A9ZnJV//jNgU+ShnSQ8klZbeX9HK2n+8+HlS+1vXM=;
 b=JuV22xLYSUEaFqVjDb9kM92A27w5ZIF7qsgZLUbaPUEW0iAtVhmrhng/dEtqUB/68r7KU9/MGfT8D2Uzyabwtht61CTAojQsfDzJ0ONJr4k7P/qt+5URTUXf0gX2BMUN6MwN/jOJ+1OlC7UhtsNF/WbvA8eVV7NT2aUXVXzCJjg=
Received: from MN2PR03CA0006.namprd03.prod.outlook.com (2603:10b6:208:23a::11)
 by SJ5PPF8337777B9.namprd10.prod.outlook.com (2603:10b6:a0f:fc02::7b0) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.22; Mon, 23 Mar
 2026 14:01:43 +0000
Received: from BL6PEPF0001AB54.namprd02.prod.outlook.com
 (2603:10b6:208:23a:cafe::7e) by MN2PR03CA0006.outlook.office365.com
 (2603:10b6:208:23a::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9723.31 via Frontend Transport; Mon,
 23 Mar 2026 14:01:40 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 BL6PEPF0001AB54.mail.protection.outlook.com (10.167.241.6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9700.17 via Frontend Transport; Mon, 23 Mar 2026 14:01:42 +0000
Received: from DLEE213.ent.ti.com (157.170.170.116) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 23 Mar
 2026 09:01:26 -0500
Received: from DLEE212.ent.ti.com (157.170.170.114) by DLEE213.ent.ti.com
 (157.170.170.116) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 23 Mar
 2026 09:01:26 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE212.ent.ti.com
 (157.170.170.114) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Mon, 23 Mar 2026 09:01:26 -0500
Received: from jeevan-HP-Z2-Tower-G9-Workstation-Desktop-PC.dhcp.ti.com (jeevan-hp-z2-tower-g9-workstation-desktop-pc.dhcp.ti.com [172.24.233.81])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 62NE1Jqb380851;
	Mon, 23 Mar 2026 09:01:25 -0500
From: Telukula Jeevan Kumar Sahu <j-sahu@ti.com>
To: <meta-arago@lists.yoctoproject.org>
CC: Ryan Eatmon <reatmon@ti.com>, Denys Dmytriyenko <denys@konsulko.com>
Subject: [meta-arago][master][PATCH 2/2] arago-core-bundle: Add K3 system firmware and expand device tree support
Date: Mon, 23 Mar 2026 19:24:42 +0530
Message-ID: <20260323135442.2056179-2-j-sahu@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260323135442.2056179-1-j-sahu@ti.com>
References: <20260323135442.2056179-1-j-sahu@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB54:EE_|SJ5PPF8337777B9:EE_
X-MS-Office365-Filtering-Correlation-Id: 4576b7bd-785c-4450-729b-08de88e4b645
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700016|1800799024|376014|82310400026|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info: 
	fm72dL0AnMDqsPHrLxJViKiuUX7sNJu56iu16H9iPa4K1Q4iO5H4SBdRR9wZAS/aLnvTqMrs72XHbKNmoBGjFjiAh6OeSP8Wi1U3KdBMXDL7gv+FxK2ndw+z1sUQFVLc7E5oHJP3SeIyC1TIh2VO7hWlYOpdQT27wsLaX2vb5XjJNu05GtFyzMFF+ARGreVfetWwqCmzAfofjDjyqLgcQZYmflaQloOBDMor+J2JkB8sh4DPsqqC0AZ/vJ6R5cyt4soKYcJ2mczhYRjx32SbBIFzo6yuVUnhb4k+HuuOuq9ZXivsHjbd20qXXigzZ2gZsBPZS6PO+N+Z7A7xD0jiqo0aLbcjgOZg3mZPg6dltY0x60BHMig8IUdCllEzGJraAxQ1xkZWLa2ykI72th9jlBLJQk3LpQcdnBiCmnqhTE0VX5Z82tIjraPKeTFHrvQ2mS985eh9s3oY51oHur9rxPHUsfxhz0HWTQWa6RyQl0aArY6mJNiNrWAKtinPAXZOUhoKHOSNer8LSv4Qwy7lPXRdXA1CozPrfo55dAJ7jI2vop2uOFeL37Qq26tx2ElAWy0cO2C9vVwlvtbYnzIiCy8aidgqQkvycmj8O3pOwQKlxAMtAstgiuPKTuWGzv+SOY+WeLfZAe5hER9yuB0DSgxK8t76+FyeRrP0YNYDkkzqyxwgflr2LrjcHMaOFtM3SpPVXqcJorZOBTYEzG/LeZxyWpc0OQGlbWUq7FXuHcohGu6grl/RHR8jJqJG5ho8cg3vEbc9xZa8nNsNZ0ZvKw==
X-Forefront-Antispam-Report: 
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(1800799024)(376014)(82310400026)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	Ykw7X4D/VSIAnvTP60ebeSb9m0bNGUyyx0Luoyqh8l1X0Nt6Psb5QdOmRbp4EB5wD5sKeQ7xedHcliuCTsP3YwDdNrJyKQ6FrQIzgQl1Pra9C+XGKuRstKUWP7WlbxT0JGlz8K6x3Or9EQmTuthTfwC5AAF1jkAdvbLFU3RWks/TCIf4dYWzuAAwwtqW/6AZ+J3sy+EJFnceAGfGaOX3/6XNvP83jyy1TWaGaaSce/TYHWJ2IvtiFQb8OZi5KD/Z83soBuOWbeDC49Cj3e+RK8xXnyo5c14FkbkE3rL7G/4K8+ExIlqjRsLEFr3RyD81zoh9UH31YZf04w2qGrb3JfuoOHsYUppDpXOSZLsI1G1cR7Y8BNwGJMUPRN2w8FDXR0KqVjOABmFn8mzgCr6V0MVXmISg4cmRTeTRUFlXGhMLbDHNsYuw67QbgqaxdqZg
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Mar 2026 14:01:42.3978
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4576b7bd-785c-4450-729b-08de88e4b645
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BL6PEPF0001AB54.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPF8337777B9
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Mon, 23 Mar 2026 14:01:56 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17417

Update DEPLOY_SPL_NAME, DEPLOY_IMAGES_NAME with wildcard patterns
to include all the boot partition files for all device variants.

Add the default boot ti-sysfw binaries in pre-built images using
SYSFW_BINARY for all devices generated using SYSFW_SOC and SYSFW_PREFIX.

Expand and update DTB_FILTER values to use correct device tree naming
patterns to include all the supported device trees in the pre-builts.

Signed-off-by: Telukula Jeevan Kumar Sahu <j-sahu@ti.com>
---
 .../recipes-core/images/arago-core-bundle.bb  |  8 ++--
 .../recipes-core/images/arago-core-bundle.inc | 42 +++++++++++++++++--
 2 files changed, 42 insertions(+), 8 deletions(-)

diff --git a/meta-arago-distro/recipes-core/images/arago-core-bundle.bb b/m=
eta-arago-distro/recipes-core/images/arago-core-bundle.bb
index 5af8774c..cb4f22f0 100644
--- a/meta-arago-distro/recipes-core/images/arago-core-bundle.bb
+++ b/meta-arago-distro/recipes-core/images/arago-core-bundle.bb
@@ -8,14 +8,12 @@ DESCRIPTION =3D "This creates an installer including all =
the default images\
 require arago-core-bundle.inc
=20
 DEPLOY_SPL_NAME:omapl138 =3D ""
-DEPLOY_SPL_NAME:k3 =3D "tispl.bin tiboot3.bin"
+DEPLOY_SPL_NAME:k3 =3D "tispl.bin tiboot3*.bin"
=20
 DEPLOY_IMAGES_NAME:k3 =3D "trusted-firmware-a/bl31.bin optee/bl32.bin Imag=
e fitImage fitImage-its-${MACHINE}"
 DEPLOY_IMAGES_NAME:append:am62lxx =3D " trusted-firmware-a/bl1.bin"
-DEPLOY_IMAGES_NAME:append:am65xx =3D " sysfw.itb"
-DEPLOY_IMAGES_NAME:append:j721e =3D " sysfw.itb"
-DEPLOY_IMAGES_NAME:append:am65xx-evm =3D " sysfw-am65x_sr2-gp-evm.itb"
-DEPLOY_IMAGES_NAME:append:am65xx-hs-evm =3D " sysfw-am65x_sr2-hs-evm.itb"
+DEPLOY_IMAGES_NAME:append:am65xx =3D " sysfw.itb sysfw-*evm.itb"
+DEPLOY_IMAGES_NAME:append:j721e =3D " sysfw.itb sysfw-*evm.itb"
 DEPLOY_IMAGES_NAME:append:ti33x =3D " extlinux.conf"
 DEPLOY_IMAGES_NAME:append:ti43x =3D " extlinux.conf"
=20
diff --git a/meta-arago-distro/recipes-core/images/arago-core-bundle.inc b/=
meta-arago-distro/recipes-core/images/arago-core-bundle.inc
index 63b73229..ae2c5b1b 100644
--- a/meta-arago-distro/recipes-core/images/arago-core-bundle.inc
+++ b/meta-arago-distro/recipes-core/images/arago-core-bundle.inc
@@ -21,10 +21,46 @@ DTB_FILTER:ti33x =3D "am335x"
 DTB_FILTER:am57xx =3D "am57xx"
 DTB_FILTER:ti43x =3D "am43"
 DTB_FILTER:omapl138 =3D "da850"
-DTB_FILTER:am65xx =3D "am65"
-DTB_FILTER:j721e =3D "j721e"
+DTB_FILTER:am65xx =3D "k3-am654"
+DTB_FILTER:j721e =3D "j721e\|fpdlink"
 DTB_FILTER:j7200 =3D "j7200"
-DTB_FILTER:j721s2 =3D "j721s2"
+DTB_FILTER:j721s2 =3D "j721s2\|am68\|fpdlink\|k3-v3link"
+DTB_FILTER:j784s4 =3D "j784s4\|am69\|fpdlink\|k3-v3link"
+DTB_FILTER:j722s =3D "j722s\|fpdlink\|k3-v3link"
+DTB_FILTER:am62xx-evm =3D "k3-am625"
+DTB_FILTER:am62lxx =3D "k3-am62l"
+DTB_FILTER:am62xx-lp-evm =3D "k3-am62-lp\|k3-am625-sk"
+DTB_FILTER:am62xxsip-evm =3D "k3-am625"
+DTB_FILTER:am64xx =3D "k3-am642"
+DTB_FILTER:am62pxx-evm =3D "k3-am62p5"
+DTB_FILTER:am62axx =3D "k3-am62a7\|k3-am62x-sk\|k3-fpdlink\|k3-v3link"
+DTB_FILTER:am62dxx =3D "k3-am62d2\|k3-am62a7-sk-edgeai\|k3-am62a7-sk-rpi-h=
dr-ehrpwm\|k3-am62x-sk\|k3-am62a7-sk-e3-max-opp"
+
+# K3 SoC system firmware configuration
+# Maps machine types to their firmware naming variants for prebuilt-images
+SYSFW_SOC ?=3D "*"
+SYSFW_SOC:j721e =3D "j721e"
+SYSFW_SOC:j7200 =3D "j7200"
+SYSFW_SOC:j721s2 =3D "j721s2"
+SYSFW_SOC:j784s4 =3D "j784s4"
+SYSFW_SOC:j722s =3D "j722s"
+SYSFW_SOC:am62axx =3D "am62ax"
+SYSFW_SOC:am62xx =3D "am62x"
+SYSFW_SOC:am62lxx =3D "am62lx"
+SYSFW_SOC:am64xx =3D "am64x_sr2 am64x-gp"
+SYSFW_SOC:am62pxx =3D "am62px"
+SYSFW_SOC:am65xx =3D "am65x_sr2"
+SYSFW_SOC:am62dxx =3D "am62ax"
+
+SYSFW_PREFIX ?=3D "fs"
+SYSFW_PREFIX:am64xx =3D "sci"
+SYSFW_PREFIX:am65xx =3D "sci"
+SYSFW_PREFIX:am62xx =3D "fs*"
+SYSFW_PREFIX:am62pxx =3D "fs*"
+SYSFW_PREFIX:am62axx =3D "fs*"
+SYSFW_PREFIX:am62dxx =3D "fs*"
+
+SYSFW_BINARY =3D "${@' '.join(['ti-' + d.getVar('SYSFW_PREFIX') + '-firmwa=
re-' + x + '*.bin' for x in d.getVar('SYSFW_SOC').split()])}"
=20
 # List of target side images to build for the SDK
 TARGET_IMAGES =3D "arago-base-image arago-default-image arago-thinlinux-im=
age arago-bootstrap-image"
--=20
2.34.1


