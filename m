Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2EE76107BCDF
	for <webhook@archiver.kernel.org>; Fri, 13 Mar 2026 19:23:31 +0000 (UTC)
Received: from PH8PR06CU001.outbound.protection.outlook.com (PH8PR06CU001.outbound.protection.outlook.com [40.107.209.4])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.24293.1773429803095509985
 for <meta-arago@lists.yoctoproject.org>;
 Fri, 13 Mar 2026 12:23:23 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@list.ti.com header.s=selector1 header.b=j7qKzztb;
 spf=pass (domain: list.ti.com, ip: 40.107.209.4, mailfrom: prc@list.ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HO0BCgHUyu/tmh2le5deRLYjsLUD2Bx0z6u54tcoLrhGYmqZ/XSaFeS//2WXeHHl+oUa83EHIj4MD2ORGROUQOkcLaijPurWVQXzSkmmxv1pMDhGhynOOOEIlS9KK6S5C3QQn2iHjCx2wcFYnX3itIQV0H31IXdmEj7HDsZU1aidaF0/W5R9iD0yrciIeM30VQdKUf9DUWGBGpuyXElNSHEoNzQwFvH9/q1gxtqPV8SUBTkRuAoOEW35CHlJLCdHY5gQwTcMdElLHQlKTolfV8kPMpu1o3H9nT53pPd89+EJ+Ir1vxCDuQGqczB02ln1qPeNzvkwJIVHBgs7Ej5pdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bq/ho2L0nJnowxBWJj+5MGs5DhGN+Hgs+pA5vwHxgxE=;
 b=oKUvfilvgFnSUJL+V13IACtsjvMugGhiiWLDy8nQoOyl+wfG8/bbAZfInwHgavZKh4rwgdr3fb4gzXTjcLrLR/LXanXK8nTIZUdyEoeF801Ner7/F0DZJVdMcngE+MiUZyOcEs0lY1zpBJlGU5tmo1RQCQwqcBTmWuvyKDKmXtniETMGb1hwISr3bQS/N4QKdHfXxKpfBeKD1fF7d9Z9OxEhNB12xK7d6oSqNi77Mtemwb7mczbfoAE1BeF0W7DUCKKhxOPDoUZS7xrv/BzOKvJMz8l/8T6s01UkkeuNaRCRBCS0NW3afaEGDGdpskWFaTPGE4FNsoHGR0My5EKnNg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bq/ho2L0nJnowxBWJj+5MGs5DhGN+Hgs+pA5vwHxgxE=;
 b=j7qKzztbWy6xCXJjzxpuU6MEt5j3fu8yLu5grDJV5lIxAXdgdE9zw/b+WGUdKXlbPE70N+ylrT39WXerVSSKC8iRw94LnLU/r9dTmsYhJSFpTQR238fSOHBZirSmuCYtOYX5mH3qZyop8h1Z+VFIjR9N+4QphU2rVyhXNEz9LgSPtCIUEI3SwevkfojjUR03ZlIPjkU62FHIvXTD3+nFJ+UkxLSY5j+vDEmeHhSAjx6ISyQu6iHWPmlvwIq87AEebCI6i0AGSQAm9CHtyJEKRKjUhFVPsQ7a95HBD2or3tGVqD7kEzm75zbtqWBL36fClpQZEWilCIoyQq7EhcRb2A==
Received: from BL1P221CA0015.NAMP221.PROD.OUTLOOK.COM (2603:10b6:208:2c5::34)
 by DS7PR10MB4845.namprd10.prod.outlook.com (2603:10b6:5:38e::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.17; Fri, 13 Mar
 2026 19:23:19 +0000
Received: from MN1PEPF0000ECD4.namprd02.prod.outlook.com
 (2603:10b6:208:2c5:cafe::5) by BL1P221CA0015.outlook.office365.com
 (2603:10b6:208:2c5::34) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9678.27 via Frontend Transport; Fri,
 13 Mar 2026 19:23:14 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 MN1PEPF0000ECD4.mail.protection.outlook.com (10.167.242.132) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9700.17 via Frontend Transport; Fri, 13 Mar 2026 19:23:17 +0000
Received: from DFLE215.ent.ti.com (10.64.6.73) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 13 Mar
 2026 14:23:17 -0500
Received: from DFLE204.ent.ti.com (10.64.6.62) by DFLE215.ent.ti.com
 (10.64.6.73) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 13 Mar
 2026 14:23:17 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE204.ent.ti.com
 (10.64.6.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Fri, 13 Mar 2026 14:23:17 -0500
Received: from fllvdckhpci031.itg.ti.com (fllvdckhpci031.itg.ti.com [10.64.72.41])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 62DJNHWI1077510;
	Fri, 13 Mar 2026 14:23:17 -0500
Received: by fllvdckhpci031.itg.ti.com (Postfix, from userid 60899)
	id 39B999ACF4; Fri, 13 Mar 2026 14:23:17 -0500 (CDT)
From: PRC Automation <prc@list.ti.com>
To: Ryan Eatmon <reatmon@ti.com>
CC: Praneeth Bajjuri <praneeth@ti.com>, Denys Dmytriyenko
	<denys@konsulko.com>, <meta-arago@lists.yoctoproject.org>
Subject: Re: [meta-arago][master][PATCH] ltp-ddt: Sideport glibc 2.43 patch from oe-core
Date: Fri, 13 Mar 2026 14:23:17 -0500
Message-ID: <20260313192317.1192187-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20260313185728.259606-1-reatmon@ti.com>
References: <20260313185728.259606-1-reatmon@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN1PEPF0000ECD4:EE_|DS7PR10MB4845:EE_
X-MS-Office365-Filtering-Correlation-Id: fd223664-f0e8-4b1f-b611-08de8135fb37
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|1800799024|376014|36860700016|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info: 
	riNOCRJL27mD84fcx4hYpLgMrCWVztZuBMoXBtulql5VgXBkPFgV/pBcU/IpJMDX0JrtyPJ5xUKq9WCVelUgRXulqh8cu1YuZReC2NJt6t3U9JLCnTIeAN1l9bdF4rqYrh/hJBrE7sPmTXRrcr407IxXRaHFgJnqiuwZzPBZzqvDVIrfH6+revDJo5mK7/Q0IrIQfsiQvZt/NkmjVTWxPCS+RXG3Ry8KlIWKFSUIISzZVRPSs1idrLn8cK5g07kmeovQ06w7McAiig0Dr4xZroXHG8fxKokMdj5jVp9nQxRCw7X1GzOk7eKC+UAvNBiOOQkuMi2aTKNKAjgS3C94vQadmgNlDHPJ58ynKEcjG8CNMcXGp1l7WdLfCXhcXBjPRqeXp9sEEfCbnHNro/pvRY6fq+qQrexzc+zps924GT/MnObkfp1ngkzGcFFxYU6Ssl0gonePX5JglXRb37qxCUdB/RRtGVHm1R5Ga2sIcO2SjVKW2XQAjxj8QiCP6Is/Zh9hjdeZmQzmr/cEI3FDm7BGHL50g7gtkfkcWUeFu9dZUZQ6vyAPlxoKxd2SogihEfQs2kkk5j+jfK1CF2KhyO4V01DyusodTs3iN+XmBK/d2ZYQA2Q+mbeZn+WO8sIir5epyk9PMymTtFkwV3odW+U7+iuWLCimbTNYZrLUC3CNCyT76L9OXq+/P5EU37bWvExTC57N/on17i3cXzTpHzp+7Uxmw3+u76uSlxbunicHVeAdcBRKI9uMnZK0BloIYt5g6GxFfp3ptltqBnN9Sw==
X-Forefront-Antispam-Report: 
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(376014)(36860700016)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	cU/HSprBJWVx0dBtxzYHC2ia16CV/9Kuffo1JqT5Cj6PKywZIuX3Ax+e+WX84NwINX9pPXvmfoU0nEMuESzKMY5S8CDRzwzsFQ0HvBRUmoaISamRNYHiCeJeERvxxJOZk0zic35yZPOV+yesn83lJenZWzEmfjdLjhbImJjY8EDQSPKkOG+KHbN43i9yYxCi/yD0ORdIhZKdSZ3iKjhu/dnagdGYniSLjEP6sAD7L/DZitvtkkL1oHDH0hd+4fBE4cBUP7yNUFEnKdso3rPiTmYwuMiNeC+ks09UjrC8xPG+XvCY2ANLQVa1M8cvJtWWm5+An4cHnLV+EC+z+NOnYvc1ZRawA0kpyT6C44HvB79OZPQUIdD1nFo/DT7k4OXs5RXWKFWwIWTUj/h2e7LIg4qNwuDzeWCeNEAzj1tHHb8nkFjyO1YwJG0mEMj0SD0P
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Mar 2026 19:23:17.9966
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fd223664-f0e8-4b1f-b611-08de8135fb37
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	MN1PEPF0000ECD4.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR10MB4845
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Fri, 13 Mar 2026 19:23:31 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17339

meta-arago / na / 20260313185728.259606-1-reatmon

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
WARN - [meta-arago][master][PATCH] ltp-ddt: Sideport glibc 2.43 patch from =
oe-core
    WARN: Commit message should not include directory path to recipe: ltp-d=
dt: Sideport glibc 2.43 patch from oe-core.
              ltp-ddt (COMMIT-MESSAGE-3)
        patch
   =20
    For details on the above errors/warnings visit: https://lists.yoctoproj=
ect.org/g/meta-ti/wiki/40887



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
- Patch Series: [meta-arago][master][PATCH] ltp-ddt: Sideport glibc 2.43 pa=
tch from oe-core
- Submitter: From: Ryan Eatmon <reatmon@ti.com>
- Date: Date: Fri, 13 Mar 2026 13:57:28 -0500
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: 90cadbca80be19149629ef2afa5b4a160=
ec29337

Applied to:
- Repository: lcpd-prc-meta-arago
- Base Branch: master-wip
- Commit Author: Ryan Eatmon <reatmon@ti.com>
- Commit Subject: ltp-ddt: Sideport glibc 2.43 patch from oe-core
- Commit SHA: 7f7f74b57d9a62b24cf8c5509fd2f3c9abfdee8c

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
ERROR: Nothing RPROVIDES 'weston-examples' (but <build-dir>/sources/meta-ar=
ago/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-graphic=
s.bb RDEPENDS on or otherwise requires it)
ERROR: Required build target 'meta-world-pkgdata' has no buildable provider=
s.
ERROR: Nothing RPROVIDES 'weston-dev' (but <build-dir>/sources/meta-arago/m=
eta-arago-distro/recipes-core/packagegroups/packagegroup-arago-graphics-sdk=
-target.bb RDEPENDS on or otherwise requires it)




