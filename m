Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ECED9F33A89
	for <webhook@archiver.kernel.org>; Thu,  5 Mar 2026 15:14:24 +0000 (UTC)
Received: from CY7PR03CU001.outbound.protection.outlook.com (CY7PR03CU001.outbound.protection.outlook.com [40.93.198.16])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.46484.1772723660796367894
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 05 Mar 2026 07:14:20 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=BopxujVb;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 40.93.198.16, mailfrom: reatmon@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gN/cLxH87sUnMv0sn1Nw7RS9xdpTWFIYOCeGViZ/f4WUyJ2Lx72A9HHUTXquuEBfYkCwCT+Q8mf7gWeiLvk59uW7KXkrj6LqwBMVnBCMVCGyI8yz9oWFNE9lueID+ejAE77zstLTmJYPI8dKSy9JSokeI4MXUQ7bMWln/JGLW0zZiiktjn1OaoUjiTLt/2mtqvOSUWUhMd/WJ4cYNo2xXHWnbqpU0fJSA6DqEPGIU/s9wfoZ3S8ZJ9ckCrkPn5GnFstubOYsiE2ORswCXaSyXC63OuQedBdDwQmzKMKHyZ6rzkMQs3WBh2w1zeRB9p2VU1RJ3BMPTshnx2UKi/Urpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vSmljhIVuLcMpYkaPEhBia71SSROUx1Qg9l6w50uKzg=;
 b=GSfvJVHgA0bxZidAwLke3JLbJPKlB5/XfYDF8rZzORosu2XCGqNnT5ezfKINhZB5jZGa3YhhdMbla3K1MACRngvGVBgy5RQ2Y/Ot8ncKr9Ulqtp0+iRXtaGjNXlJGZb+KMp4cRRRU3ZzpSl1/LpLEQmktyihbrqTWSuZqHYP6Wy221libDiccaZxQPr0XCxzVnjjWYjEWiQqm8rTzk46kXFQDeXZ2dlXzN52p2E5C8fpn098nBkWyPQ23IPqxgcmeKw8WYSpPvIJDFoiXGoLpkS1dO4ZE0oKWOWWr1Rr/ZlCqDzxksSR7tD9jUcHN1vNfK/fVotwaJC4EtOXDn+2Cw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vSmljhIVuLcMpYkaPEhBia71SSROUx1Qg9l6w50uKzg=;
 b=BopxujVbHSqN5F1lz0P9sH4MtZ85fg51J+XCMf7p0YLyfFBX/pG/7plX8moQR4g7qJcF23cvMP24uYcS+iKFIcwEKP+tAo23ZNaiNSA6fZ0DDr5MZjGIU6kTcbvIc6dQdfnQ2hea2q53BXsIo4jYY9uJTGxPunuoPR+83iKWCyQ=
Received: from BL1PR13CA0433.namprd13.prod.outlook.com (2603:10b6:208:2c3::18)
 by SJ0PR10MB4621.namprd10.prod.outlook.com (2603:10b6:a03:2d1::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.18; Thu, 5 Mar
 2026 15:14:18 +0000
Received: from BN2PEPF000044A1.namprd02.prod.outlook.com
 (2603:10b6:208:2c3:cafe::3e) by BL1PR13CA0433.outlook.office365.com
 (2603:10b6:208:2c3::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9678.13 via Frontend Transport; Thu,
 5 Mar 2026 15:14:15 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 BN2PEPF000044A1.mail.protection.outlook.com (10.167.243.152) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9678.18 via Frontend Transport; Thu, 5 Mar 2026 15:14:16 +0000
Received: from DFLE208.ent.ti.com (10.64.6.66) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 5 Mar
 2026 09:14:05 -0600
Received: from DFLE202.ent.ti.com (10.64.6.60) by DFLE208.ent.ti.com
 (10.64.6.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 5 Mar
 2026 09:14:05 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE202.ent.ti.com
 (10.64.6.60) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Thu, 5 Mar 2026 09:14:05 -0600
Received: from grumpy (grumpy.dhcp.ti.com [128.247.81.229])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 625FE5ij2551737;
	Thu, 5 Mar 2026 09:14:05 -0600
Received: from reatmon by grumpy with local (Exim 4.97)
	(envelope-from <reatmon@ti.com>)
	id 1vyAOr-00000001vhQ-1xPv;
	Thu, 05 Mar 2026 09:14:05 -0600
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>, Denys Dmytriyenko
	<denys@konsulko.com>, <meta-arago@lists.yoctoproject.org>
Subject: [meta-arago][master][PATCH 1/2] packagegroup-arago-connectivity: Add iproute2-bridge
Date: Thu, 5 Mar 2026 09:14:04 -0600
Message-ID: <20260305151405.460115-1-reatmon@ti.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF000044A1:EE_|SJ0PR10MB4621:EE_
X-MS-Office365-Filtering-Correlation-Id: 641707b7-3ed1-479e-c87a-08de7ac9ddff
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|82310400026|34020700016|376014|36860700016;
X-Microsoft-Antispam-Message-Info: 
	OpHo1PnFf2YNiA0bo9pE11SEA8rff/nDYUmSxOz3G1Z9i+6Fjyy/G8nVTKB4DD1/czx2ahBPTVHBCJwveI2I8DH3WXBQSk0ADAKj36TkTMfJnYw9IJhrNY0BrxSz1QZcl9exlYtc6RapX8kVAjx8s7thsPl8PGXbWzsbSQxjVkoZNX675CkLP32lisLLWpOpZled0fKZc8iaV4CeQ/BKzI17rSsHAVXHiXHJrKINTWqvojSopi4ivtBbNuXdxn39d3epRXoNJkMI8vhPnWnuCrTeYxfjute6BO1p2bnoWFn3fMJOSNws3HC2HAVMa/hJuleftkIoBxaa0bt1BkTApGD/JOLM/6KQMz5it5XPedV7/pMyiZosVHFX9z4I9aAEd4KpUboUP/fN6VCFbllHoe41yWSA9+dvvMD2U7SfnAFDQaztTUBf0V5f+eoPQWNL5tXnZX0R46R9Jf8k6dt3Xj3ZzThoDat8qU2L7d1XeNvfUSGv6dJIYq/sZUpmn9Mvk+EWVcoxmWQjVWvCtEy1V1p1HyYSnNteIMA5CuqIQvqD59WXHqTROx4zvB0Wkx0km6PBZj+dbqLJBk/aHGH3UlbC2zETGflfo9fVjhr9CMHqTktMTFRRCVdPUqz3Xsg13zQHUIuGgKvIC3MYikf4gf1Kd2x95Ad+psZZ4A+x2nHqUoXcAcZcNFCvlb3LTyGfAlaMa9+tU1owM8+uJCBtwqLv8RMWoU/yzynobpOnXVeZ/Ua02+2EQ75TyZMsZRBWzUpHlgCTYSiFGFffpw9umg==
X-Forefront-Antispam-Report: 
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(34020700016)(376014)(36860700016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	CLCmrSSxoDvciduXJ0IssJ4xZtKOtOlmG3bz3nQAASjX4VMPPyORnBw0V6wNm0wWp3mDuqbh3wBvDDJ/Q55UL4g9S2f431MWMJDuFHRMCWRJtBDc0HFXo1oPb7aSF71t0VZRHriSzT3GPI7HzEOBdXFCxHQvdL6YQCNiqqH+gTB2l/gfhjh0A7SqLZzjCUYjxaTxImk1QlKce34hma9RPry9wVQkqvLcpvOSfP/6Htt3EdizEGTVTyxTHXLtY54jKuBGKNVOl1pmMuGM6Gw0WiLXF+mlzy0GT+DpTO9slsPSvSjFrH610rCLkod7fb2Rl/Q4mEgLathLW24pif1ryTHI62jLO4ZlRz7htyLCbqmeQ4viMFeushzhXaS3vE30X8WYa7HyHfpAfMg/b/CxTQXQyiDwtWpWOXUhZHpyAxffKJMQnuCmhSH3WKHe71RB
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Mar 2026 15:14:16.3559
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 641707b7-3ed1-479e-c87a-08de7ac9ddff
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BN2PEPF000044A1.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR10MB4621
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Thu, 05 Mar 2026 15:14:24 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17236

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 .../packagegroups/packagegroup-arago-connectivity.bb           | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arag=
o-connectivity.bb b/meta-arago-distro/recipes-core/packagegroups/packagegro=
up-arago-connectivity.bb
index ab299391..98e8f897 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-conne=
ctivity.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-conne=
ctivity.bb
@@ -62,8 +62,9 @@ CONNECTIVITY_RDEPENDS =3D " \
     htop \
     iptables \
     iproute2 \
-    iproute2-tc \
+    iproute2-bridge \
     iproute2-devlink \
+    iproute2-tc \
     ${WLAN_COMMON} \
     ${WLAN_TI} \
     ${BT_COMMON} \
--=20
2.43.0


