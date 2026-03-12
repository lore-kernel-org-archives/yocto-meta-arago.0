Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F32C0106ACD4
	for <webhook@archiver.kernel.org>; Thu, 12 Mar 2026 17:30:20 +0000 (UTC)
Received: from DM1PR04CU001.outbound.protection.outlook.com (DM1PR04CU001.outbound.protection.outlook.com [52.101.61.61])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.6.1773336617342372995
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 12 Mar 2026 10:30:18 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@list.ti.com header.s=selector1 header.b=hQ7ADJPQ;
 spf=pass (domain: list.ti.com, ip: 52.101.61.61, mailfrom: prc@list.ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KbeLcJpGPVBB/cQ2mDFDJU263sZ2az8YcKnhgJGsuYZL/Jz24Z3D0EE08E08VYwJjD7XzV17FtqID06Uyg/6cVKeUWjRtobO9x0cRwd4bi2EHa3dg5cxKPyK/kFr4OVaOJflkTHtNsyAb0rREKlS59C4w33mYRllEfHc/Drh7K8HAO1hJWy9hGn9ir4ikskdagqdwG5zAR6P/uufZel9vSU0/TRXTi86ADSQuUtNbNRYlmeG9m6SDq4458MZ1VPFzFtPX5jZdoXBG3QMSmZ2UqfcpHGfFHh3X/750EoZxo7mPiT2Hj9XBIaIBNrS/npG7vu8tfRNUndgO8je0qSxMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/6lfpIX6/Zl+W+oODPbV+EPsO2gpQCqVhJm3f/C+PkA=;
 b=o1m8XajvG5/mB4xiXk+UrzqP+SEEqSM40zcJdBRVRLOiaEwY/TphiVWtN0e1jRmcWrEmeYMUcPSkDLQFusAq/gY7sck2c5pnjMyc4dADXgqAkAlzqs5QYk9TXj8AvgqxhbqaIgceY8XY1T1ZeSjOPaIiLSgxADjJt/1QzOvaOqndbTi1RvwdXc9MLgUHkTzxKzKUBHWe4LDNxfqbg+ynHn/WFug7yWvHn4BhNdgp+bgsqNWTB/zH4D70R7vqGz00rMhlHLm8hwsQt2SkQAC0VLq8RCt4hiwehG7zWEO4evxTYWJkUoyb2hWP+cuVnuvt7LgQLllPI2jX3hEqbVSi+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/6lfpIX6/Zl+W+oODPbV+EPsO2gpQCqVhJm3f/C+PkA=;
 b=hQ7ADJPQ9hXz9zsd+FVz9BTFKvPfWaVss8YiwD+3TFj27oNRc95xhRQgNae/qBiwg2lK/cbPCECePJjXVvKBjloUZXp5b2UwfFMJq6pf31B5GGjHg2n6g+vxbJjNwQzTrq9fL8LczgIvLAF2qI701kDyWAOUh6xCCnjS0VxQD4vXOnRzQ8keiUU1j/a4blsuJm/GD21EkzM9OPxZBn81aSxyPLW3ftK/nYRpPRimdkop4ohxCTO+ZCi4RBid8dPAIRTbFHPkNQdnWVyBpqo6A7xFAWvA2y4yXFtVNYu76Gy5WRt1iwKuqNKX78Q5JIerI8Jubk7eZxG2jSquZ/8bPg==
Received: from SN6PR2101CA0002.namprd21.prod.outlook.com
 (2603:10b6:805:106::12) by LV0PR10MB997636.namprd10.prod.outlook.com
 (2603:10b6:408:343::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.15; Thu, 12 Mar
 2026 17:30:07 +0000
Received: from SA2PEPF0000150A.namprd04.prod.outlook.com
 (2603:10b6:805:106:cafe::86) by SN6PR2101CA0002.outlook.office365.com
 (2603:10b6:805:106::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9723.6 via Frontend Transport; Thu,
 12 Mar 2026 17:30:05 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 SA2PEPF0000150A.mail.protection.outlook.com (10.167.242.42) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9678.18 via Frontend Transport; Thu, 12 Mar 2026 17:30:05 +0000
Received: from DLEE201.ent.ti.com (157.170.170.76) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 12 Mar
 2026 12:30:05 -0500
Received: from DLEE203.ent.ti.com (157.170.170.78) by DLEE201.ent.ti.com
 (157.170.170.76) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 12 Mar
 2026 12:30:04 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE203.ent.ti.com
 (157.170.170.78) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Thu, 12 Mar 2026 12:30:04 -0500
Received: from fllvdckhpci031.itg.ti.com (fllvdckhpci031.itg.ti.com [10.64.72.41])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 62CHU4lO2719114;
	Thu, 12 Mar 2026 12:30:04 -0500
Received: by fllvdckhpci031.itg.ti.com (Postfix, from userid 60899)
	id 9E8FF9ACF4; Thu, 12 Mar 2026 12:30:04 -0500 (CDT)
From: PRC Automation <prc@list.ti.com>
To: Thorsten Lannynd <t-lannynd@ti.com>
CC: <meta-arago@lists.yoctoproject.org>, <detheridge@ti.com>,
	<b-brnich@ti.com>
Subject: Re: [meta-arago][master][PATCH] meta-arago-distro: ffmpeg: Enable OpenSSL support for HTTPS protocol
Date: Thu, 12 Mar 2026 12:30:04 -0500
Message-ID: <20260312173004.1846558-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20260312164411.324150-1-t-lannynd@ti.com>
References: <20260312164411.324150-1-t-lannynd@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF0000150A:EE_|LV0PR10MB997636:EE_
X-MS-Office365-Filtering-Correlation-Id: 90473d36-258f-436d-809b-08de805d0015
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|36860700016|1800799024|376014|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info: 
	+wY/tc+RnltGAJhVJSRO1+Gh75yKgRW1R3vEYA7hkrHuXzdQRBgWLiBDqOoeF0HHBFhghTfU4lNkxa38YsKHq/nC5+yPzEhOMnky+4y5sa1BwDAkbyhCAus8ugxVR63LXil/5p69zYKQSmfRxjrRIcIxmp82I1zjmbh5TiS9PCx0NCasXGf8f0mUzffWhgG82t43ItO2ZpXOBYkRDLf3rJs3t5gYt9WGtHpdzSLJTUqEcdAvzeNPbI58oLS88h/QviVzLZYgF6sUFYJU/z6SLAZA0692Z/r0PfTdbEE8dl8l8IItdqbnEajYxr90bV6HrTGkkQxv1wj62TYI1M0Ya19cahHdNxC5IQdQvkeYfZDR0BzbYG+OHok85qp2LJytfv3hulV03YGLBps6cc8Wt2dOLemRo30XXrlp+memnZMkHDV9IOV5qes+lZzNGkYguqWOoPRWV81FM9acok8wyz/y1tnIsnIMEs3xmqQDwv4pU+tqcHQaqsYd+V7OKtPq+hsIUz+d60PzATIqmHwSJLSd+QvQdGsOcSwtJMAIe5vugoNW4Jiksr8OMnEp/VQ0hsITcmL4+hkuT5DOFjacVp1Tm/teueohiNft0Ac276kr21jaWDrwqvy/9KKPY3QZAeywUNdq5oJ84fxHTg7TjRdMx0BfiFN+1fNqlkJTcKWoCUmitXy/FGAX6cx+SIOL5XrDZnRARV08/qiv2nrkcbl0vsk5eNH19J5cBDKLjD86jAmMPapIqOzqTYFD9egY/J4LtIWV1xMqfEP6vrAolQ==
X-Forefront-Antispam-Report: 
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(1800799024)(376014)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	O0VkVWSEh+fVN6c5tVCA0WXouGoaQT4QZ/4F692TJxv/KPmP0uxNT2oAsFoGia/LowJ0+QcH89SJj1VIUiQYbG0jGPAf0oRJM2qfPr3KtaYkrNkQGGd6ZLuO0MIzNUnvNh4XGAbcb96MsK9DpTAd7ZFKywIBvVjHiuc11wvJ73bQaTVkNUjRloxEjn+r5KKKZtpMU+ywuY14Qx8lmAxHW6abY7wTWwPLCiQc6QkZ7qSDFjTYIPuI9X7QjmgRAa2njIyDRbFBWteiUaIAAbqngAqzXHrZQ5vDYByND/6O1st4riusjm2yCsD1KCPFd2FJTMkACDWWAYHkCMrLZDPgraQZ40oMd4IuwIJculceYgJnVsY+Gmri9HSNzx4Zg8euIQ2HQLfU61IuTOhclErImjL3OwkzKxmlVIxfEgB4UBSK8GqRgPawoCqD5YYbVj9P
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Mar 2026 17:30:05.4240
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 90473d36-258f-436d-809b-08de805d0015
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SA2PEPF0000150A.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV0PR10MB997636
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Thu, 12 Mar 2026 17:30:20 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17326

meta-arago / na / 20260312164411.324150-1-t-lannynd

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
WARN - [meta-arago][master][PATCH] meta-arago-distro: ffmpeg: Enable OpenSS=
L support for HTTPS protocol
    WARN: Commit message should not include directory path to recipe: meta-=
arago-distro: ffmpeg: Enable OpenSSL support for HTTPS protocol.
              meta-arago-distro (COMMIT-MESSAGE-3)
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
- Patch Series: [meta-arago][master][PATCH] meta-arago-distro: ffmpeg: Enab=
le OpenSSL support for HTTPS protocol
- Submitter: From: Thorsten Lannynd <t-lannynd@ti.com>
- Date: Date: Thu, 12 Mar 2026 11:44:11 -0500
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: b9629f22eb6c21724cba1739ef36249d2=
67c9440

Applied to:
- Repository: lcpd-prc-meta-arago
- Base Branch: master-wip
- Commit Author: Thorsten Lannynd <t-lannynd@ti.com>
- Commit Subject: ti-test: Add request and websocket-client to packagegroup
- Commit SHA: fdd93c8301f8301e742b24e1cdd630e5c9706c92

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




