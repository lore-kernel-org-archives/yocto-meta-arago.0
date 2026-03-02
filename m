Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 062CEEA4E11
	for <webhook@archiver.kernel.org>; Mon,  2 Mar 2026 15:01:36 +0000 (UTC)
Received: from DM5PR21CU001.outbound.protection.outlook.com (DM5PR21CU001.outbound.protection.outlook.com [52.101.62.65])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.162358.1772463692853475487
 for <meta-arago@lists.yoctoproject.org>;
 Mon, 02 Mar 2026 07:01:33 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@list.ti.com header.s=selector1 header.b=nPB4cW3G;
 spf=pass (domain: list.ti.com, ip: 52.101.62.65, mailfrom: prc@list.ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ndu4BqYDRWcMIVwfSsVNOG4IeFRRHlujtsG8v2+AB3qLKm8bAXLIM/H0x1Nve/oxTvaQVZZGvRlHL2hKcKRdDVGzAJoKbae9Uq0lM+X1iBqhjnLyCK53gVvUUwAoKqt7u9+40DnY4faGDDpfkn3ZY5UtwyS5qRkb46E8kJkqjdD9KAtwQM1o0B8giJLJ/KOYxtYA18644SEGhpyZCfuT9W3pYY8b4AT+zK5vETlPaat1Lfvd8/aQ4N9BD1mn1I7IXZmGrZcsgm9T3xf54rkGBzCekU7VoO0hD1KAWdr759j6lolz9mCGE/Q0dgXCFgdEzcoDosE0iRrbR6fX+UkCMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RZl4cD1QcgqrIt/QPC0DEL7iofheQVzR4RoOMn8G6kk=;
 b=x3VgPgx2Q4VctaOQeVdLceJnSqZFRwAvCW54QMGf0t9WJ6K6VLGGymwPab7OiNcCTB3VMvg9yK3d2k6SGJkW+t/TxXhpRUtdlMANlez1QPYLAnGRYwDXxnzmBnRUx2izqhAOlenBhneCHuPm5CQOTxood0X7UnTcjkVWox4huMzX4BqK8GOhMczfgvz6cAWjPaGCqinQI2bflv1P+JP889VmZ2fYw2KQLSO9qg90t53ozAdxAvie0E407YZ5PcZnWj8gU5RmuWCUCVfjir8G/0vj93ksAoh1iDB51PFugVcOIr2pA6WEafk6WTGRm6te8n7nr82UPToq+Xj4cJAWfg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RZl4cD1QcgqrIt/QPC0DEL7iofheQVzR4RoOMn8G6kk=;
 b=nPB4cW3GqWCoE6GoH7MNWbKJ8Y9YkfYSeOHRv5SOZjrNkDrTSjgfUun9tJ72QDFzc/XmbKDyse8uur2zuDb18V97ajbCN+oFAVVubhskPnoSMdQFwGjXvjLhyx5m0i93jqcJxbp/+8pJ9pF3YBuw6fqSyNmT6RmaBhEbIKB1UqfjJXTlokafCUF7shmuCg8RNO41JrO+bBm6O8QEWud4AN9rYOGIgtQytcRZx6BOMvCn27n8zEB8EWPyOYvUNXbXaQtEMbsfKYNknQrOcYbLws/cBq99q8IDllW/iNiH79lX1DzgagYAvKsTRnEKo5wyzfg4gYDRju2oLWojKxY8/g==
Received: from BN9PR03CA0766.namprd03.prod.outlook.com (2603:10b6:408:13a::21)
 by MW4PR10MB5809.namprd10.prod.outlook.com (2603:10b6:303:185::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.21; Mon, 2 Mar
 2026 15:01:27 +0000
Received: from BN2PEPF0000449F.namprd02.prod.outlook.com
 (2603:10b6:408:13a:cafe::3b) by BN9PR03CA0766.outlook.office365.com
 (2603:10b6:408:13a::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9654.21 via Frontend Transport; Mon,
 2 Mar 2026 15:01:23 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 BN2PEPF0000449F.mail.protection.outlook.com (10.167.243.150) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9654.16 via Frontend Transport; Mon, 2 Mar 2026 15:01:25 +0000
Received: from DFLE213.ent.ti.com (10.64.6.71) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 2 Mar
 2026 09:00:37 -0600
Received: from DFLE204.ent.ti.com (10.64.6.62) by DFLE213.ent.ti.com
 (10.64.6.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 2 Mar
 2026 09:00:36 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE204.ent.ti.com
 (10.64.6.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Mon, 2 Mar 2026 09:00:36 -0600
Received: from fllvdckhpci031.itg.ti.com (fllvdckhpci031.itg.ti.com [10.64.72.41])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 622F0a8I472938;
	Mon, 2 Mar 2026 09:00:36 -0600
Received: by fllvdckhpci031.itg.ti.com (Postfix, from userid 60899)
	id B768313F521; Mon,  2 Mar 2026 09:00:36 -0600 (CST)
From: PRC Automation <prc@list.ti.com>
To: Pratham Deshmukh <p-deshmukh@ti.com>
CC: <meta-arago@lists.yoctoproject.org>, <afd@ti.com>, <reatmon@ti.com>,
	<c-shilwant@ti.com>, <denys@konsulko.com>, <v-singh1@ti.com>, <khasim@ti.com>
Subject: Re: [PATCH 0/2] meta-arago-extras: Migrate ONNX framework v1.16.1to v1.18.0 and ONNXRuntime v1.20.1 to v1.23.2
Date: Mon, 2 Mar 2026 09:00:36 -0600
Message-ID: <20260302150036.2889338-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20260302145846.828106-1-p-deshmukh@ti.com>
References: <20260302145846.828106-1-p-deshmukh@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF0000449F:EE_|MW4PR10MB5809:EE_
X-MS-Office365-Filtering-Correlation-Id: fd019ad4-3d3c-4089-5e0a-08de786c936f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|82310400026|1800799024|34020700016|36860700013|13003099007;
X-Microsoft-Antispam-Message-Info: 
	9ZMdB7tGGZFLA9vohE/C8RzNc6boj3oJjDbns9Yg03EvyyYbvgnoRvcNrGOsKGdxnjBJqoHQzLrQgxvV4RYPHeziFTReHqbxKUHIpWoDmG4d6b8/SL3+Y55KgVW3X1VLVlATyFhp/aDlQqqS5Cf6E9/ai4yzNHRqg5Su+cdFgnut6B8MOEdL1WgCB3Qy2KEJwJiKpgCGuK5NonwDyBRkPevqUTIEGHwcUtY2bvepxMdT+X7M+KTsWzKz51UHEOXOidCx3uJr1nCz+8/7P1dUs8nYFHCSDwbkSHPddxhE2PT/crKYdtSvKmYvoG6Vm8BUGuzw6/F++CLZoKcFkZLWETZDjj8tYWQZ7t9x3IH/vQ7POSp4IqDwkaX22jiaWjl8Ld3h2SXjWgWtZzH/FB1dwfrzVXTub1QajPa9FNEM4W7xKzZBAiktySYJWokI0M4bsNbyN99KrC8UdVBYFYckikpseJpYf0gd+u751sYm9LKXF8FLThzUvaD4e34kM35aATGxNT+ICWjkI6KwxTuZyyiHVIdQlvl74QsuQVju0DgnhbQW75jp+I2VKKcVG2WMY7RdUsIvmzK4Ohk3Y2EbYncHy1G0pBoho0ySWSRWOaLmemMWWyhSKv9NcDI2V6IgAVvLvdrdVysTfJnxKWOTf3E0CT5QhQIDNSytb5vO3n06gPhiw/FqKIY584qjbRnz3+2wr9TMBDd8mcWNkFV3tw/i+zbGf2vnGUNzykBt3R+AmqwXDmTkF1FsxJL9Z/c5RYJKdsPdIAgCDt+khc3XPXtD2eWaUAPheB6bVPiBlN/odF5EJaTqgi2qZgR0cPaHljxqVqapoKm+z8rRU3Bndw==
X-Forefront-Antispam-Report: 
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(376014)(82310400026)(1800799024)(34020700016)(36860700013)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	PIYXmNVsz3DgaP7qeXnZ9G9yBHjm4glIjlzE8wT97Em3uneN2qMBqbhb6OBseNWNykLwwL7oRxab+UdPN/Occqwd7RBNzZmn7axFQ/RwzV/z4vC+2jQhiLJolVfqhxRWbgi91Hu42NWdaozw9Ee5GohpexfCC2TAvuNZNqI6d2drCf47ft+rbHQu0J6yN2DdDnoxkYRyUYLLoitOYCK5y7j0ph8uejD8XGnWHMVlJcVJvr/evZpe3YA7o5BoYikIK1mF45ht0jjMXZTefqNtVS8coc8hPBj5dXUZBg70EETebnPwXHOMy+Ak8fcuGzcG0hNkgVQxHrcT3tU8gq2mIz7hinShejSB4WzghS67whr71Y7TurFgSvCS5Hc7lN8BT6tAb5EJ3wrHN697aWniPUMQtkmMt7AoWQHLwmsHkxqw0lCnsdiQqGDy00nMQQ9x
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Mar 2026 15:01:25.7292
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fd019ad4-3d3c-4089-5e0a-08de786c936f
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BN2PEPF0000449F.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR10MB5809
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Mon, 02 Mar 2026 15:01:36 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17173

meta-arago / na / 20260302145846.828106-1-p-deshmukh

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
WARN - [PATCH 1/2] meta-arago-extras: Migrate ONNX v1.16.1 to v1.18.0
    WARN: Missing branches specifier [master/scarthgap/XXXXX]. (META-2)
        patch:68
            Subject: [PATCH 1/2] meta-arago-extras: Migrate ONNX v1.16.1 to=
 v1.18.0
   =20
    WARN: Commit message should not include directory path to recipe: meta-=
arago-extras: Migrate ONNX v1.16.1 to v1.18.0.
              meta-arago-extras (COMMIT-MESSAGE-3)
        patch
   =20
    For details on the above errors/warnings visit: https://lists.yoctoproj=
ect.org/g/meta-ti/wiki/40887
WARN - [PATCH 2/2] meta-arago-extras: Migrate ONNXRuntime v1.20.1 to v1.23.=
2
    WARN: Missing branches specifier [master/scarthgap/XXXXX]. (META-2)
        patch:68
            Subject: [PATCH 2/2] meta-arago-extras: Migrate ONNXRuntime v1.=
20.1 to v1.23.2
   =20
    WARN: Commit message should not include directory path to recipe: meta-=
arago-extras: Migrate ONNXRuntime v1.20.1 to v1.23.2.
              meta-arago-extras (COMMIT-MESSAGE-3)
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
- Patch Series: [PATCH 0/2] meta-arago-extras: Migrate ONNX framework v1.16=
.1to v1.18.0 and ONNXRuntime v1.20.1 to v1.23.2
- Submitter: From: Pratham Deshmukh <p-deshmukh@ti.com>
- Date: Date: Mon, 2 Mar 2026 20:28:44 +0530
- Num Patches: 2
- Mailing List (public inbox) Commit SHA: f1d53c08e24f7ba12392b9435678731d1=
54d6ae9

Applied to:
- Repository: lcpd-prc-meta-arago
- Base Branch: master-wip
- Commit Author: Ryan Eatmon <reatmon@ti.com>
- Commit Subject: arago.conf: Remove temporary hack for DEFAULTTUNE on armv=
7a
- Commit SHA: 58966cd5a2d433b4c915e652f21f2e2b2475ec21

Patches
----------------------------------------
All patches applied



=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
  check-yocto-repo: FAIL
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
master
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
FAIL
    ERROR: Patch is not referenced in any recipe. (REPO-1)
        meta-arago-extras/recipes-framework/onnx/onnx/0001-Apply-onnx-patch=
.patch
   =20
    ERROR: Patch is not referenced in any recipe. (REPO-1)
        meta-arago-extras/recipes-framework/onnx/onnx/0002-cmake-Fix-Protob=
uf-target-check-by-calling-find_pack.patch
   =20
    ERROR: Patch is not referenced in any recipe. (REPO-1)
        meta-arago-extras/recipes-framework/onnx/onnx/0003-cmake-Remove-Pro=
tobuf-directory-exports-from-config-.patch
   =20
    For details on the above errors/warnings visit: https://lists.yoctoproj=
ect.org/g/meta-ti/wiki/40887




