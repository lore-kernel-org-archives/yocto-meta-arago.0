Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 48401106FD67
	for <webhook@archiver.kernel.org>; Fri, 13 Mar 2026 02:04:29 +0000 (UTC)
Received: from PH8PR06CU001.outbound.protection.outlook.com (PH8PR06CU001.outbound.protection.outlook.com [40.107.209.5])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.6850.1773367465966078907
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 12 Mar 2026 19:04:26 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@list.ti.com header.s=selector1 header.b=xG6bpPyb;
 spf=pass (domain: list.ti.com, ip: 40.107.209.5, mailfrom: prc@list.ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=b4w8fgO7cHntH6gjqfxSfzsFO3PI1hJtnYh1QoVZzF2rc+sRlhU1KjPrnLExpRn0P9H646bGYiLJJp/V10pF2NLG7YvHLYxZGSwLevnyuGTH4OCRqc6AE2OOKjE9I9IPcbagDLDte3ox6ls/k8UFYw8X9bBR/lHVhAVuFYP0BQRFduLvGYcMyvMgFiVll8JbODsQ9fUeXLnxh+sQQUEsfTtjaPFkRQYCGhfclIPe2H9QPgSD0QD2YOk+BTtUOhF4roegR5El3iRm0FVx0pDPk9Cs+Bj8HRC+v/FCA80r0sBHziHxIQzIocIxhqPJbbIfISr7WD0RXzoeUS4h3ezdlg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LVxLr7GetOndbJX3C3P1KcVJo+yWH/gIGBTv9VqpI2M=;
 b=pSVTcnmkDatD5nmCpBii4h4EZrQK8JzLK2IlXYjxAdyS1n6nNLww0tVovVIhuJwNzbpZRQloyMuzhZmWh2YMasblU17FvQyLboBGD7CLKIGvMIg6UGrdKx+cpRytgh99U8GI+dwXx1O/Z059FPuirtySu0qMX96GAaJXuDHfhMbT4Kh0n9iMiVqKC54qUqEvuPGxGF1+GsEl4N2QQwOozIKHv36szpdOwAekWB60gZAICaYDD12x7dfCp2v0dS8cbIKTyo2kiX0rTgyW/Eyy83xSNdHQbuR7yX47MXcy/qHsZXI5qVmq6uh1JDAQI7q3Ld6r9wM0XQHSNkO+rv3F0g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LVxLr7GetOndbJX3C3P1KcVJo+yWH/gIGBTv9VqpI2M=;
 b=xG6bpPybNEBiY1+HEqrFs5w7SykVQYKVyiBCfZr4nUZLD7kWRlOrjpskihD73c6rQweP2MFbTF68A4tAgzHdfWb69TfjtYqOB11Wnove6cEFwYOeObm7QociI2AesQxTP8XQ96riwB2h54fYYGBSMm65KZsnr7C6tj98Z9A+hf5vK7xoWHa8s7Y1QnhEiWtEieChNHLxrvvz3l+IlBjQ6g6nyhUod1/yUecdVYyPiVC0mrOLq1tprlPsgQdY98aM+55eyu9TNkqLxPnYQtvAILWZ5yCXYyyudfcuq5gyvsXRwOCce/rmGfhxMSA2LrKFlOwmltdY+N7YXkNhvm6ecA==
Received: from SN7PR04CA0068.namprd04.prod.outlook.com (2603:10b6:806:121::13)
 by CH0PR10MB7483.namprd10.prod.outlook.com (2603:10b6:610:18e::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.16; Fri, 13 Mar
 2026 02:04:24 +0000
Received: from SN1PEPF00026367.namprd02.prod.outlook.com
 (2603:10b6:806:121:cafe::bb) by SN7PR04CA0068.outlook.office365.com
 (2603:10b6:806:121::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9678.27 via Frontend Transport; Fri,
 13 Mar 2026 02:04:17 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 SN1PEPF00026367.mail.protection.outlook.com (10.167.241.132) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9678.18 via Frontend Transport; Fri, 13 Mar 2026 02:04:22 +0000
Received: from DFLE213.ent.ti.com (10.64.6.71) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 12 Mar
 2026 21:03:52 -0500
Received: from DFLE212.ent.ti.com (10.64.6.70) by DFLE213.ent.ti.com
 (10.64.6.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 12 Mar
 2026 21:03:52 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE212.ent.ti.com
 (10.64.6.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Thu, 12 Mar 2026 21:03:52 -0500
Received: from fllvdckhpci031.itg.ti.com (fllvdckhpci031.itg.ti.com [10.64.72.41])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 62D23qeQ3383795;
	Thu, 12 Mar 2026 21:03:52 -0500
Received: by fllvdckhpci031.itg.ti.com (Postfix, from userid 60899)
	id F08B19ACF4; Thu, 12 Mar 2026 21:03:51 -0500 (CDT)
From: PRC Automation <prc@list.ti.com>
To: <a-christidis@ti.com>
CC: <denys@konsulko.com>, <reatmon@ti.com>,
	<meta-arago@lists.yoctoproject.org>
Subject: Re: [meta-arago][master][PATCH] flutter-wayland-client: patch build to include cstdint header file
Date: Thu, 12 Mar 2026 21:03:51 -0500
Message-ID: <20260313020351.1359326-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20260313013519.1055960-1-a-christidis@ti.com>
References: <20260313013519.1055960-1-a-christidis@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF00026367:EE_|CH0PR10MB7483:EE_
X-MS-Office365-Filtering-Correlation-Id: c050ffa0-a3f9-42df-74c8-08de80a4d872
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|36860700016|82310400026|1800799024|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: 
	UB6UQ0fPv0M1LEK/TW5on+cWiQ5D2VGRaYWaSRbagW5o6HrGR27MXmVQVr+RzlHHBvJWPwm70Q/zmEPqX0NXZcQIPfo+4qCDXDIWWephDHVBCDEYC22ZFwopUZpgQbBc3shuGGWSSDhjSc75eqSanQXFOkTlo4IqHsRlAb4+ordjBXj71f/q/QzvgkPoJ2NhUzYQp1MziVujTFw3h8szzCUUlm0DK7aO/C8r/EkIFRSsal2fm/hf2Fz+/a+27TZU+Hhe88pfGWGeXCAU7ZVmSuajcepYdXKEn/snmVh7q+91ldM+HgHQfHholcCZnADvXDnsoJTdXO5+dYYL3HJGTYyUyEDvyoSMyKleG1NrOIpAE/afpxJuC9B8DOuSc8a/gpmfZjs/yq4hUgVq46sYSdam/kGhn6qEKb5biIR787eJ8661rFxc2x1SLXVlA8oNehC9RQr0ElJgv0wsj+WDYWnayqv5dDRczulFEO8Bdgme11p8KmLK1bN2rOAO6J3upgdcz0tWcKSXwnyAgo+31mQqBBHZ4J58dFAG/vrAFSkzNl5KEwdGXdVXunCjhAx9X+jVCXmRXhhT22CJBGoa2NVjy5Sh4S81NV4/5RhIrtUzGppiVLEBgwZKHbYvTYdXyuC0ihJH65pzZOpJGuERKD09A+C3Jj8Plo9bao7WcEuGoY+pYag1PUQf2hg1QZ37XHiUSg/pWD9elooVu2tmLvD1NSGdOn+kJCPUa5Uw47twbsj15udsITl+9ZKA5SYc+ku7vr32cqJxa7PT55gsYw==
X-Forefront-Antispam-Report: 
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(376014)(36860700016)(82310400026)(1800799024)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	0w7VOfjhbSgVDZxeL49hDzrO7gcgPJ2xqY377V++RiBxnTnV9CtNDuEA6gNFdAtE6C6dUVH72ZRngiHdOoe933NNj6c9WxG4SIp5y1DRPrlPs9LItrMSejXzXh4pZoa3mJIuEKJOReHhlxK0vJyFyZRsi/unQ81jW9xi9fKai1Y0mdf4SynJ/kh8ILRi902r+HJfOBkh3BHyxFxN4S94dSITP+cGwSV0qiFdFA7PQ/6P7KNQWvtNAcpQSKH5TFu8EvNe/xcp1VysYNFoYGQwbQdn7blfS85EmOZ7SiZozQ0KlDlQ3qhHKPVEsXTx29HXFkj4m9vs04BpRjulfv3ojUakqzI9v+Mfz2YHrJfDaByWSRagRo7r2Kgv6jA1pdRWp8NFLkT8o98QjUpyQUGLOwJ/FZjTyGCiQ1uOs8AtXRR5zSZM+rT1PN6bJ9X9yQaE
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Mar 2026 02:04:22.6825
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c050ffa0-a3f9-42df-74c8-08de80a4d872
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SN1PEPF00026367.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR10MB7483
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Fri, 13 Mar 2026 02:04:29 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17332

meta-arago / na / 20260313013519.1055960-1-a-christidis

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
- Patch Series: [meta-arago][master][PATCH] flutter-wayland-client: patch b=
uild to include cstdint header file
- Submitter: From: <a-christidis@ti.com>
From: Antonios Christidis <a-christidis@ti.com>
+From: Antonios Christidis <a-christidis@ti.com>
- Date: Date: Thu, 12 Mar 2026 20:35:19 -0500
+Date: Tue, 10 Mar 2026 11:01:28 -0500
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: 0fb73fd0a8a4e068ae60ab125f25e2d05=
14a1761

Applied to:
- Repository: lcpd-prc-meta-arago
- Base Branch: master-wip
- Commit Author: Thorsten Lannynd <t-lannynd@ti.com>
- Commit Subject: ti-test: Add request and websocket-client to packagegroup
- Commit SHA: e6c3ad9bdbda5c0703f96f48577df273c0e338ba

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
ERROR: No recipes in default available for:




