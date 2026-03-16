Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A57B3F53D7B
	for <webhook@archiver.kernel.org>; Mon, 16 Mar 2026 17:07:19 +0000 (UTC)
Received: from SN4PR0501CU005.outbound.protection.outlook.com (SN4PR0501CU005.outbound.protection.outlook.com [40.93.194.6])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.56040.1773680834489337317
 for <meta-arago@lists.yoctoproject.org>;
 Mon, 16 Mar 2026 10:07:14 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@list.ti.com header.s=selector1 header.b=Gl/8IlQD;
 spf=pass (domain: list.ti.com, ip: 40.93.194.6, mailfrom: prc@list.ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qkSyj7P2l89DhJSt81qE9SujfAV7Hb1qdIfxjLlqoCKTVfb6J4lV796u5rrkYWP7m31XR/dF376crHtSQje5+ZqQwjRDIi5UUSfzwJ9WsUrCIFQavWZDdcABsWpyGeegMepqLQI7L/Az37Bg+bt3/7QJn9WT6qNdOrWakFXHIMMo1hiWfbT1TrOH1zAmphcR0glwQaLLhGP5eXwOWjF1AN4CQ6svEVTQn8VPvnvLkpTxNOH44e/CFRBGcQODA/En+hexl0y4nhJBt5PXIKthLIz2Zui5QB7aO7v7D6sj4VDaQfCJOYUnECNtx431qYeHOUXEK44w3yPeftjoa1EavQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=r/y689y3tpwGdUknqewHB50yp547lHvBwA7q3Gk1kcQ=;
 b=B5fjs/G8jLWmXx8Vq7JChAj3Eq7eaF8qPxn7oE1pwz/Wf8qxzUB3L8uTDrkVM0SgweNlmQ/T/d/2tUZg7izhhkkDF4s6He8xsSoAnTcukjL58Uj02VzC+3DEh9/oXhcyQKZIo0KyQykXHshSFACIMUuD6ahqxev9UgUzE9lFNC0yTQnR5EUiL4z2BwNz3VYS2AcVajQoifErJwO17v2A/mfPskrVRbRDU8gs9B3pGG9gwUXGVZNUZXFCgBdI1pf/dnWZuu6bBuOm7I9rgnSo7s7csTmxAvJZAJI9FFcRwUF8n5fL9Vl5u7JHsboCeLqCxCNszsvxMTEJnyrZqp8A3A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=r/y689y3tpwGdUknqewHB50yp547lHvBwA7q3Gk1kcQ=;
 b=Gl/8IlQDxm8qCRd6ehdDWmfN2KpNl7quITa4Bhbm44p/61ITDm2LKo/MCVoNCI+HDCA4k14bnroeLzTMGcAKzfIqWfw438EpJUqBVLQLC7mcA0u8SWDFgqSMB47jd1dAQZItiMaTqsU/Evm+dhP5po1QQqbvUNd5bdgquFmnBrvpBwKRMUjuX1h/FylsR56nKxsxJ7Emv4XtNdu8jbtGkeobTJCioFIhIgXAZOyXSAPyNlfB3ofJI6jhF2ygdOSr5KnB6aD/dmhn728H1eoHFsC1zpzzFhN3QxuDFgSWjN7eo/RvvHItY0oz8bRKkw2c/sGpMFMx+lmo91xIRv0Y+A==
Received: from PH7PR17CA0046.namprd17.prod.outlook.com (2603:10b6:510:323::6)
 by IA0PR10MB7624.namprd10.prod.outlook.com (2603:10b6:208:491::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.24; Mon, 16 Mar
 2026 17:07:10 +0000
Received: from CY4PEPF0000EE37.namprd05.prod.outlook.com
 (2603:10b6:510:323:cafe::13) by PH7PR17CA0046.outlook.office365.com
 (2603:10b6:510:323::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9700.24 via Frontend Transport; Mon,
 16 Mar 2026 17:07:06 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 CY4PEPF0000EE37.mail.protection.outlook.com (10.167.242.43) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9700.17 via Frontend Transport; Mon, 16 Mar 2026 17:07:09 +0000
Received: from DLEE200.ent.ti.com (157.170.170.75) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 16 Mar
 2026 12:07:09 -0500
Received: from DLEE204.ent.ti.com (157.170.170.84) by DLEE200.ent.ti.com
 (157.170.170.75) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 16 Mar
 2026 12:07:09 -0500
Received: from fllvem-mr08.itg.ti.com (10.64.41.88) by DLEE204.ent.ti.com
 (157.170.170.84) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Mon, 16 Mar 2026 12:07:09 -0500
Received: from fllvdckhpci031.itg.ti.com (fllvdckhpci031.itg.ti.com [10.64.72.41])
	by fllvem-mr08.itg.ti.com (8.18.1/8.18.1) with ESMTP id 62GH79RL1775999;
	Mon, 16 Mar 2026 12:07:09 -0500
Received: by fllvdckhpci031.itg.ti.com (Postfix, from userid 60899)
	id 710209ACF4; Mon, 16 Mar 2026 12:07:09 -0500 (CDT)
From: PRC Automation <prc@list.ti.com>
To: <a-christidis@ti.com>
CC: <reatmon@ti.com>, <denys@konsulko.com>,
	<meta-arago@lists.yoctoproject.org>
Subject: Re: [meta-arago][master][PATCH v4] flutter-wayland-client: patch build to include cstdint header file
Date: Mon, 16 Mar 2026 12:07:09 -0500
Message-ID: <20260316170709.1762831-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20260316164110.24729-1-a-christidis@ti.com>
References: <20260316164110.24729-1-a-christidis@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EE37:EE_|IA0PR10MB7624:EE_
X-MS-Office365-Filtering-Correlation-Id: 340b071b-87ed-41c1-5566-08de837e75e5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|376014|1800799024|36860700016|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info: 
	oaByipsvaxZEyNPxXrWi7tOLP5tbp30S+E+GMn2gPirX6+Xoo213lG59hINdNWzP0cxKYI6nTZvRc1ksxK/ypBZCKzSJ4QSdgXL04WRm1csWszxy5MZnf5v3uSOHjUqJAsxNPVejOdp4HbmdPadeKAx7gKMfP7d0e+dKWAdMThzoV6+B9IUN/CUU9jYi6JpcO8YVmLwlG6ASQCZCvFzXyNhhyr8HHAxydXUPv/WmkpWeu932ggDNxPuUMABMeOgrVQ3wYdkW33GnTkfKUxjYAPNsbtLEyoFxtcgSAm1Cci/1BWoBbuP7QY3XHrDOGyCfmJs93GScP2ugGKwfds9v5jh/55mn0eetNIViL4dCubavCsdY90Y7nU6u7NRhhXhbjj35XWQtEE7j8PB2zeH/kUI+cS6CknH++T30bWdYfkUnaxKxQHalDSvlDlrsr8XjQ7seuMlwFXd36VH0BlzJE9GITu0IjdJyLsDJXZ9KU3sF34smycDbyO5gtWqhXC7AfvAVib49Rq6g3X6uUZDLYNEQfnFW+psKM01yLgwGAZ9cc6YVpE75OmMUrYVE77Qs21n5nbFQxJFsmhDHZjRCZrwn2t1ZY59cwGkfIR5OboUfsmCmI0lv+hdBltHAOTcSv/WJ9ARXBIl6slzZaAa3Gfkjv8sJtA4Vi9AUflAQmEDnnrblFYzWySMfZFx+EiZ1L+YLV9cE1/MvSb2PDwCcD4XdzOyjPPkkQkvTOCUilV/v+WUHFK5zg2tV4jNJa9yd2LgINz2ocyQTdGx21uo4tA==
X-Forefront-Antispam-Report: 
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(1800799024)(36860700016)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	diL34L8/sL+q1eqnF2rVkwXm2ocZFlsyG9UOtVljxr30XTytX6Aog52+abGY1BE0J/2tZaKMyNXbsxIfSxmAVfEiGpKz2IWcObp8Q82nagzPNtYRh3cguYAVeegQh40SA2xz/5NyR+PSunkJwh1Wxrwpc5bJ3y3lgBYI8AL4IbYnP0jp9DPQQYin6h09wseOO/OSTcYurDJou4PtJp58X1ujWMq5EfWxdKzIouL0QSnYFoFOH/MTSO8qH5db01PV23Haq50mAqRQxWbl4HD3Yn6ZSZJ0czvMch3DegtWS3bJf0ywZTKQyw4C99k+dHinT6T9y/EWvXfE+F5m72jzDNyPmk0EaRN1NfZQmGvfUiUA5cHRxNjeJWVYcWQ1Qu12Sx5R0TQByoU0GviM8bizSdyRzf8sUJak0s9GoBIrwXeRyPzWj+I9ID+f4RDJ83JU
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Mar 2026 17:07:09.9481
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 340b071b-87ed-41c1-5566-08de837e75e5
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CY4PEPF0000EE37.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR10MB7624
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Mon, 16 Mar 2026 17:07:19 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17355

meta-arago / na / 20260316164110.24729-1-a-christidis

PRC Results: FAIL

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
  check-yocto-patches: PASS
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
Patches
----------------------------------------
All patches passed



=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
  apply-yocto-patch: PASS
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
master
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Summary:
- Patch Series: [meta-arago][master][PATCH v4] flutter-wayland-client: patc=
h build to include cstdint header file
- Submitter: From: <a-christidis@ti.com>
From: Antonios Christidis <a-christidis@ti.com>
+From: Antonios Christidis <a-christidis@ti.com>
- Date: Date: Mon, 16 Mar 2026 11:41:10 -0500
+Date: Tue, 10 Mar 2026 11:01:28 -0500
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: 2943ee9c9395dd730f50b789f194c757e=
f295b86

Applied to:
- Repository: lcpd-prc-meta-arago
- Base Branch: master-next
- Commit Author: LCPD Automation Script <lcpdbld@list.ti.com>
- Commit Subject: CI/CD Auto-Merger: cicd.master.202603091800
- Commit SHA: 27f3d88f1cbc33e107604da7df01340b8a67620f

Patches
----------------------------------------
All patches applied



=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
  check-yocto-repo: PASS
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
master
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
PASS



=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
  yocto-check-layers: FAIL
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
master - FAIL
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
ERROR: Nothing RPROVIDES 'weston-dev' (but <build-dir>/sources/meta-arago/m=
eta-arago-distro/recipes-core/packagegroups/packagegroup-arago-graphics-sdk=
-target.bb RDEPENDS on or otherwise requires it)
ERROR: Required build target 'meta-world-pkgdata' has no buildable provider=
s.




