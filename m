Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 58185FD9E23
	for <webhook@archiver.kernel.org>; Thu, 26 Feb 2026 23:45:47 +0000 (UTC)
Received: from CO1PR03CU002.outbound.protection.outlook.com (CO1PR03CU002.outbound.protection.outlook.com [52.101.46.8])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.84166.1772149537551812303
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 26 Feb 2026 15:45:38 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=UL9HORBR;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 52.101.46.8, mailfrom: reatmon@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CYEWTsDJKcA92fDIzW5oPjvE3eVrXkOHHkjHgz1tvoh8EK2/6KkZtA9dz0k5uMcM5qTRV7yb+Z5McDMKDJlwFKdnCgCBHYbvqF65wJqc2mFUx5q2io0PZDipPUtHyi++hTUukin2acMQDXdDA8mln/gfFzsqNkXy5n5EwbySmFHV8aD0zmaPDe+NtQObFjIEmwbRMTgq153I/Q6iZ253WfT5UKB1vzUOVbl8a3zXPaPz7tnDCUrFDbbqy8brAkOv+cQdfraPY7Zj/3PzzCogIZw1hvLTuVMG3aiyAeUTdwQA4EMrcTAC7O0o9k7Bd0mbdQBBBfqyeKvlL3Bb7EYiuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jh+qV6cbewllfvgMf326kEREYCgq2J6QuLyk8TB8hN4=;
 b=E2ZDcJYOk84HU5YR/LcZTxOcdyxb6XHcQQSdUGDlToaU3KVZ1B2V9iYc8fxIE3D+7xar0jbnzVvjI+QL3UnV/nIlch/ZI3cAx3b3dyG/xFmBP+HnNanvj1mpv0kxsjot8+4P9DRbSF/Y3BMp9W+h1nAyT0rNpH3kx86YDw/udNOvuYVWshmul2y4dQzwZogbvIH8OevJedztYOvcWDMdoyO076zqnvah4bU63GlCdpb+ab4AQQlgVVDEqQBC4ukOa+7gI2YVJGUWYAKBg+5kt618852c949p0kQGigayOGVzLQgoZjKkCWZ8emn8Z1dpafMX7I+zudNIS941jP6lRQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jh+qV6cbewllfvgMf326kEREYCgq2J6QuLyk8TB8hN4=;
 b=UL9HORBRk56wJV0QTdxF443tyTztesU6RkXeCKrnwzQIVqvBbcnuvFoB3+5UPcLXoO0ykNPbnDLrTf8d/EHUo/DXMVVCWCVWM2VUBDpcYSBvb3CKTVdDNnF9LmvZ1Z/6taPCYm2uGHUHgelK2M0yh3g1BmobuepEMTxY5hmUyOg=
Received: from LV3P220CA0019.NAMP220.PROD.OUTLOOK.COM (2603:10b6:408:234::11)
 by LV8PR10MB7919.namprd10.prod.outlook.com (2603:10b6:408:203::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.14; Thu, 26 Feb
 2026 23:45:34 +0000
Received: from BN2PEPF000044A6.namprd04.prod.outlook.com
 (2603:10b6:408:234:cafe::5d) by LV3P220CA0019.outlook.office365.com
 (2603:10b6:408:234::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.26 via Frontend Transport; Thu,
 26 Feb 2026 23:45:34 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 BN2PEPF000044A6.mail.protection.outlook.com (10.167.243.100) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9654.16 via Frontend Transport; Thu, 26 Feb 2026 23:45:33 +0000
Received: from DFLE213.ent.ti.com (10.64.6.71) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 26 Feb
 2026 17:45:31 -0600
Received: from DFLE203.ent.ti.com (10.64.6.61) by DFLE213.ent.ti.com
 (10.64.6.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 26 Feb
 2026 17:45:31 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE203.ent.ti.com
 (10.64.6.61) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Thu, 26 Feb 2026 17:45:31 -0600
Received: from grumpy (grumpy.dhcp.ti.com [128.247.81.229])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 61QNjVYK3211152;
	Thu, 26 Feb 2026 17:45:31 -0600
Received: from reatmon by grumpy with local (Exim 4.97)
	(envelope-from <reatmon@ti.com>)
	id 1vvl2x-00000002YCt-254f;
	Thu, 26 Feb 2026 17:45:31 -0600
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>, Denys Dmytriyenko
	<denys@konsulko.com>, <meta-arago@lists.yoctoproject.org>
Subject: [meta-arago][master][PATCH] arago.conf: Adapt to new oe-core DISTRO_FEATURE settings
Date: Thu, 26 Feb 2026 17:45:31 -0600
Message-ID: <20260226234531.608032-1-reatmon@ti.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF000044A6:EE_|LV8PR10MB7919:EE_
X-MS-Office365-Filtering-Correlation-Id: a2615aee-3587-4f99-b6c8-08de75912229
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|34020700016|1800799024|36860700013|376014;
X-Microsoft-Antispam-Message-Info: 
	Yhju2j2mXA/uJ2HGcRkjrT50dY4vr190k2TESZ6xORF7YTRBnqJCIJeeytrvHJaSkp5xSRyJ474ex4bZqiDyvKOjcztzZibahqCIfpNTj/zgsT75OYY+k4g1t5dKDYmH8JNzjNucWT1ntX7Z7Lidub583q0MkY1Bnfl3OQ7gO+WTHWLitSKV5Wml7/YnjRtuVt7+CCxwtDHt4U/frz+DKpNQvNKdGx4ifKwwWujyuWXs0hspoTLzAG0OTgGmYQhIviIEICZJxlB5ZXMiykiV25bUK7/jeHL7qGmg6XferBnC5qbP9L2sDb+SwuDkBSkOmjlrAkQYW/VAP/wgcXodyHf8RYzqSQnGu+PO5dEdrg+UR5lmGkUhgbTJ/7xc01Noc59XlYW9hZFeEkV1YunUVbKRe+9tJHV4MUnX56mcUJl9kyxaxycmm7flf3wzxV3tHpGQVgyJyZiZNkR7Jwh5chC85fHZuzVV4+FKSq+8+Bujhlh2m/Tu7Uu96kDjX4OTK8ZkEOlPJW4jmRCTFOT6S49u6tQ+L2fw0oub0oGvL6GeIs38/DqDUQz6wcUWSJFHMBDH570cd5SJ/19a0g2klhbBmdytbDYtWNNOX7WZeT3MdoOnjrTxT4qOKGglZuoqNM89ioGZxDGHiqm6w8CzPnMHYC9S9th1WCUYcec6mNQKwrM3+dWwsabOcOLYvGxmb9p5xodrs33gK2gYTVCAiaMgRjZcaq7hl7I20v1/ySS6GXjGmmoJDY4yDmqpJFJo/mSuuRd/v5fskqeP270FcyAFmOA0Umr6K6tfd8NNck0p9OL3zAeABozuT/i4o10f1s9bkYs7l3uTT6wBZaKBaw==
X-Forefront-Antispam-Report: 
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(82310400026)(34020700016)(1800799024)(36860700013)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	/eTQDJD1gH9U8m9wesyyOhdOxbcAwj7izrxaRse5t6GDe6ST+IsVQVNRai3AHAxmYbfxdCcJjAhRX0X7cPaiQd9SZjokqJ57tfNEbvZDO+OdXRaxg2KzWI1qFqfFTz3eq2iq+Sn9W7QQnjNAkVQchoq0dZvXKMciuVXUFgUXlLIkIVgxJGF1r7AAN9o9H+R6Ris0su3yW/uS2/EIzrwbYgcsSbm7BbYDhKRFHui4JWa7qLiPwg2dLAo7kM49xZyDzUQgPUdeOxlYMOFM3QFk3NYsK60vVDj0MZ4VyHtk87jOQVej4InJz11p/solHPR5qoPyN1rmIcIwoGIX4EZA0tNxv6644xZ3JsWteDA1zJq/pCh4RwAVB5zI3YD3Xisen4OPczr6kcAQ2Efa8pe9brzJfAvnStHHnzqRCnNMKqHpE6MyEHIWhpRXNL5Yq/09
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2026 23:45:33.5844
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a2615aee-3587-4f99-b6c8-08de75912229
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BN2PEPF000044A6.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR10MB7919
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Thu, 26 Feb 2026 23:45:47 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17160

Adapt to a recent change [1] in the default DISTRO_FEATURES.

Remove ptest, and clean up the features we were already turning on in
relation to the new ones that were turned on.

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 meta-arago-distro/conf/distro/arago.conf | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/meta-arago-distro/conf/distro/arago.conf b/meta-arago-distro/c=
onf/distro/arago.conf
index 17c6fed8..60d3d0d4 100644
--- a/meta-arago-distro/conf/distro/arago.conf
+++ b/meta-arago-distro/conf/distro/arago.conf
@@ -43,16 +43,17 @@ TMPDIR .=3D "${TCMODEAPPEND}"
 DISTRO_FEATURES =3D "${DISTRO_FEATURES_DEFAULT} ${DISTRO_FEATURES_LIBC}"
=20
 # Add additional distro features
-DISTRO_FEATURES:append =3D " pam wayland opengl"
+DISTRO_FEATURES:append =3D " pam opencl"
 DISTRO_FEATURES:remove =3D "x11"
-DISTRO_FEATURES:append =3D " opencl"
-DISTRO_FEATURES:append =3D " vulkan"
=20
 # Normally target distro features will not be applied to native builds:
 # Native distro features on this list will use the target feature value
 DISTRO_FEATURES_FILTER_NATIVE:append =3D " opencl"
 DISTRO_FEATURES_FILTER_NATIVESDK:append =3D " opencl"
=20
+# Do not include these default DISTRO_FEATURES from oe-core
+DISTRO_FEATURES_BACKFILL_CONSIDERED =3D "ptest"
+
 # Set global runtime providers for major components
 ARAGO_SYSVINIT ??=3D "0"
 INIT_MANAGER ?=3D "${@['systemd','sysvinit'][int(d.getVar('ARAGO_SYSVINIT'=
))]}"
--=20
2.43.0


