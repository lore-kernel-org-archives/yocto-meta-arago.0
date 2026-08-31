Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B787AC61DFD
	for <webhook@archiver.kernel.org>; Mon, 31 Aug 2026 21:03:07 +0000 (UTC)
Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.6606.1788210185253078162
 for <meta-arago@lists.yoctoproject.org>;
 Mon, 31 Aug 2026 14:03:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=proofpoint-05-2026 header.b=DvqYU0dK;
 dkim=pass header.i=@list.ti.com header.s=selector1 header.b=MqPrgkgn;
 spf=pass (domain: list.ti.com, ip: 148.163.150.75, mailfrom: prc@list.ti.com)
Received: from pps.filterd (m0384305.ppops.net [127.0.0.1])
	by m0384305.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 67VIRnap430845;
	Mon, 31 Aug 2026 16:03:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=AEKCKKTl1gv/+NUm+/j2Qv1GMdUQ793sAyk30ULAq
	jM=; b=DvqYU0dKaCLvYxMzpChUs5NIEKIplFNZMq7a9mqjfuGnZ/BUNyXqyJtIM
	VpGihHFE75H+XuSvgez2R0e6emwXrBLXOkIxRdty8WuZ+SsH42B851zz5Y+oPit9
	aJof3zO/Xa5lyhBEFqof36FeadCdPKcKt+Yk1u9clQQsg5DxFoGq7xY7AWLUfxnC
	BejVyBOMbBOVTcZSUDvWuqU8WfQ2yPdO08p7qao0JFZ40j8idWg39JPvB0iUDM6B
	P1r3IAkyyurWA9gNFCMtjyJDHgunWf9/zuljBwsOXyjA7a8rs06TG0C0aPaqRN/e
	rCVZkVQUqvsfyLb+159z2QdFQ3DBw==
Received: from ch1pr05cu001.outbound.protection.outlook.com (mail-northcentralusazon11010039.outbound.protection.outlook.com [52.101.193.39])
	by m0384305.ppops.net (PPS) with ESMTPS id 4gchcngfk2-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 31 Aug 2026 16:03:03 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UXmIuPlz3tjCKuPI/FPmPVyGjDEPV0hT2JOuHy57uHIhNcXmadMSEEbMqQgT9gaw2yy7R7XHSlKS7My/gUSsZb5+eHNGmtDmdATU17Qz6o2N0cQg39algZOgrQ/uDIar/PQjF1HukkvF4fYt9YCcl/uG6SYa9uqPCGQ1nshmFkDotLe1ReV3/InQqt1DDi5EQP9c3LYUpuqDVJRDdP9ck+5XCprgHeu9ObiPMu7/a98ngFHEJHwWsX6BU5mEhY5fd3jieL43uUqmgiyW55hz+gdqsrnewrGmz69olJt8RYKS0ubMb22ovLSNuWO0R61FJEESWcd7QcitFFYf8Y+Irg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AEKCKKTl1gv/+NUm+/j2Qv1GMdUQ793sAyk30ULAqjM=;
 b=tC61Uu7UKqld8B2xu5u+Bh2d7WCpI+yiBfIVUEjK7vko2vM+r6SKZDNERRPlTL7PDBjiiiKkEv91IewszkyWdZsn/13iGSjvgEe0dJq990dhleQIAo7zVPaFcULAbmamji+g0/B3ff9nULRXg28+lV1F1KPuV7vFrBQ0lcOMk2BH6vFXBu5dDNYHMHL4TH9iZI1C0+9/bV5iHwOdXSxlg2dtrZP+w6CKCqlacm0yPpkeEL0Q9GOVJMv6mvGqadnJyffHxaAQ2ii53Q+bp9Q9WXlhQu4ug/Dg5342w33W5vnVwAbWYfm6yXZnu37ZNFdQkKCVnFZy4ey50L1hlTdVgA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AEKCKKTl1gv/+NUm+/j2Qv1GMdUQ793sAyk30ULAqjM=;
 b=MqPrgkgn8AfIpWYiCzM4f7YT6AjJpue8u3g87ssjlVOcvy7eClYIMoDjqniT9nJie0mooX6Rix7Se/Z36AYRjhA8wQqfL8QNVzdpkEHRf0v5rumiBgEVjLXhM+B0KxTkO3PPAXmzKkFeNN6fdvLlP5Zkse4sGXtHB3zrAJjEEZVVjAP/2aKMvG0QpwT7gqG6Rpi5Oof34xVOnASy8nc93nep6mQ4zcq9WxXE42STb4IOxQ+QXRkxHnO4FCuG9nbn0V55kckYqVC5DfqdKCFkqu6k2J4C7rJDxfwdnIxqgCmY8+CTGCyzwknZYdDnguenS4O36rFsvj2NbT9Td/Glwg==
Received: from BN9PR03CA0128.namprd03.prod.outlook.com (2603:10b6:408:fe::13)
 by IA1PR10MB7419.namprd10.prod.outlook.com (2603:10b6:208:449::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.382.10; Mon, 31 Aug
 2026 21:03:01 +0000
Received: from BN3PEPF00022BC1.namprd04.prod.outlook.com
 (2603:10b6:408:fe:cafe::59) by BN9PR03CA0128.outlook.office365.com
 (2603:10b6:408:fe::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.360.13 via Frontend Transport; Mon,
 31 Aug 2026 21:03:00 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 BN3PEPF00022BC1.mail.protection.outlook.com (10.167.248.120) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.382.8 via Frontend Transport; Mon, 31 Aug 2026 21:02:59 +0000
Received: from DLEE215.ent.ti.com (157.170.170.118) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Mon, 31 Aug
 2026 16:02:35 -0500
Received: from DLEE213.ent.ti.com (157.170.170.116) by DLEE215.ent.ti.com
 (157.170.170.118) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Mon, 31 Aug
 2026 16:02:34 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE213.ent.ti.com
 (157.170.170.116) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Mon, 31 Aug 2026 16:02:34 -0500
Received: from fllvdckhpci031.itg.ti.com (fllvdckhpci031.itg.ti.com [10.64.72.41])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 67VL2YWm1509159;
	Mon, 31 Aug 2026 16:02:34 -0500
Received: by fllvdckhpci031.itg.ti.com (Postfix, from userid 60899)
	id 57BF59ACF4; Mon, 31 Aug 2026 16:02:34 -0500 (CDT)
From: PRC Automation <prc@list.ti.com>
To: Ryan Eatmon <reatmon@ti.com>
CC: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-arago@lists.yoctoproject.org>
Subject: Re: [meta-arago][master][PATCH] gstreamer1.0-plugins-good: Drop unneeded patches
Date: Mon, 31 Aug 2026 16:02:34 -0500
Message-ID: <20260831210234.3346475-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20260831205242.3284673-1-reatmon@ti.com>
References: <20260831205242.3284673-1-reatmon@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF00022BC1:EE_|IA1PR10MB7419:EE_
X-MS-Office365-Filtering-Correlation-Id: 28efb704-e582-407f-8b5f-08df07a33d06
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700016|1800799024|82310400026|23010399003|376014|10067099003|56012099006|6133799003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: 
	Na1+IUp5b1nuQ8qj00CBgEx7FrRhHwpPwAEYfK71XTjaC0pivuxg+HbuR4Owp91Fpuj8cv4KkSyl6G8JCUzvoNTsrYp3c66faz6FHpcX8OrYA+xXlBom127Mhqg7mmSJs/r4Xj6qijBCmhZW2KtzPkgBnbeyWLJ8DMAraDSW0H6PrkDdUEXJW4r683DrGIEhFob6xwMWR07fTvgcVUnaNTzEn682eLDtPgFE0+0kaf5P7cNJS4BOkBG2SxE3+PWFRJ22Dct5pm/0CgK8i6OasEnFzdOAoWEFAIegXRFv3vcea7f1NfnyTCvoH4L90d5S4vqDMIRrrMQNMYUJbkRiYlflEAFmo5uoKiOZSZY8pOudEMo6MsFUZ5+wjNsOX/Z/bIuzsDOb/UsLHWjiwNu5yFYxiCMaxy8stvkvYofZvxZmRHsvjIhyHYDbvPWvnaLBgnZYCWDYhAnVcqxXrnro9ahdnyVUyvs5hTYZgK9SPVA/5nCCxdeO1j8u+OB+AO/3Q6XgV2i2nx9P8fGI+vM8iOPEXsVEoblptmmBwgmfh8OyS8aOGz12DWxwtV1Q4t7BcxYi+jAXdHGbFiK76nvil36ucVN3BK4yCUmqHnkmWUAlVP1wR9mKj/XgrAK8wzvzT770OixZlh2zlqpXwTxQaQXG3cQEd6RGY0gLU3/KcrncUYeNOQHD4cWgKi8AuYevuzE+EtAQQ+Gi4sqcaW5L2A==
X-Forefront-Antispam-Report: 
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(1800799024)(82310400026)(23010399003)(376014)(10067099003)(56012099006)(6133799003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	rIq3jIUlCIId/NoqwaAGhGUMZ71PucRrO4vFg9YZLuVTlJa/Ii7ElGapgXH9XudUOTFxYhTvVoaoNcClegWMdnAqGvrPieUka4CNOXHFpWjjMWLUydgN1oAue+gRbrntIPpgCbq9embZFfIXVGQrXwwOdEbnqghwPVhUr0rNSx1gYiel/U1bleo2ixSjApMsCASpRO5H+TOO4EeJFKvPtTJw+FTCpn7CDEKooDsrJ8AMgmqiv2gj8k083o9474H1M11OWWXskYYiiH5MJa+1UHKLre0L2U+H4lBPEzLwgXxwk+xI6eBJRK/a85n+ToRNsfcs1C8zAwo/7c2kV9ZocUPNEV1OkgiQlEfoGiuJGoUqw1zZe3CeXy65h/V9V3IGUwEoLKKeAj4CKOi2IukyPv+/tzf3mcEJqgcZHR+Eiw1hHyu/0HNHf5UQAPKOsdzr
X-Exchange-RoutingPolicyChecked: 
	gUX2XKZvdm3fMx2ixflHYMsJwLYd5PlZja920ivJiUUSMV5mQn7iUwshSVB6cXaSvNve5aVgDiedlrRd99Vj6K5Hl94K0eZzk3RR434+uv0hWGDyqD6V035IU3rlSn4fF+Dkqied0YKbkWl3G0z4JBDXj5j+XnFp7B2HT4qGdYz3IcaN9ZeE4vVRkb/r1dw5rHjkszznf/QSeWEYlqjFJVyBtezCWhJKIs18xHB4LWYiIuk1mdsaRVccpG+ukzhCj/YCBWPWOE61LOuf9LRlm8H0PnQ3iIwYLvr9gnbm6WwguM+wxv4xlg7KNPiubm34EAquSHWv98ry9lks4ukleg==
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Aug 2026 21:02:59.3579
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 28efb704-e582-407f-8b5f-08df07a33d06
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BN3PEPF00022BC1.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR10MB7419
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODMxMDE4MiBTYWx0ZWRfX5tB+lOIHD/q7
 iTOAM6fyoSe1qQixrN4Zk46qVToGHYkck1WWIDc/0X4gaAmbpXwp66vLmw+ID694YtyOKMImwEG
 AneQVRjKzuQULytrURx4YO+DXN2itRxFPMkcU9sZtKo9OQhpzL/9VnJKSyPkfgI1xStbEGfCQXJ
 /cD+HIXSo5ftUfZkDQU+NfolBTuyitXveSvA1u4sC5f2mMsCXYDOOuUu+dV9LV/NANz1y6M4quK
 Ky+nkoNCO3z7ZEB3r+blp2p4MnJvPpJ+GA2RDmnsJi0T68QbVJ+gIvZHNtvJEjTuJnPAlfk46W/
 3EraC2xlfXvxaBoU2lRVwvwRVp7LOj8FAswtSZRqprFjAldCEZqgxti5lHClJxkhwACkCXI32dr
 yDX571ClZ2G6Sx8j+CNLxiOedtaQzylXkYkbvFj1S8m8iurb6Lt4hj5ESqrimwFC5Oe9DNnXB9e
 5B+03NMw9JwASEMv78w==
X-Proofpoint-GUID: gq84vyLjklxZzkKLnFTy60iSctApG-F_
X-Authority-Analysis: v=2.4 cv=OpB/DS/t c=1 sm=1 tr=0 ts=6a95ec07 cx=c_pps
 a=Bwi9XBBeLLDh9/ECaGV8vA==:117 a=f+v6EHfkeJbVwR46tk4DMg==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=Sv0fKeRqtYgA:10 a=s63m1ICgrNkA:10
 a=Vs-ZokuVWRQA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=taLDd7a_hP9WKsMzeGRc:22 a=sozttTNsAAAA:8 a=Am4ss40yAAAA:8
 a=Fi4FPVUY4ADyM50rjEkA:9 a=lf-hbUz_c89dky27wAWH:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODMxMDE4MiBTYWx0ZWRfX0JPp/Zxdr/E5
 OnaKE6oXhhzjMtcCFj3zuQTrZIdFDHAlLOfBEOTQ5Xa4ZsxYlrIYt/yDtEieDMivVXtTWZ+Trzd
 H4svbegmlBwf5zw+FRNWaUHXays1NqQ=
X-Proofpoint-ORIG-GUID: gq84vyLjklxZzkKLnFTy60iSctApG-F_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-31_06,2026-08-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 priorityscore=1501 adultscore=0 clxscore=1015
 spamscore=0 lowpriorityscore=0 malwarescore=0 phishscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608310182
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Mon, 31 Aug 2026 21:03:07 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17628

meta-arago / na / 20260831205242.3284673-1-reatmon

PRC Results: FAIL

=========================================================
  check-yocto-patches: PASS
=========================================================
Patches
----------------------------------------
All patches passed



=========================================================
  apply-yocto-patch: PASS
=========================================================
master
=====================
Summary:
- Patch Series: [meta-arago][master][PATCH] gstreamer1.0-plugins-good: Drop unneeded patches
- Submitter: From: Ryan Eatmon <reatmon@ti.com>
-From: Devarsh Thakkar <devarsht@xilinx.com>
-From: Brandon Brnich <b-brnich@ti.com>
- Date: Date: Mon, 31 Aug 2026 15:52:42 -0500
-Date: Fri, 9 Mar 2018 10:30:47 -0800
-Date: Tue, 10 Mar 2026 19:47:35 -0500
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: 800e192d68c96e59c17507ce861b5ea40e2a309c

Applied to:
- Repository: lcpd-prc-meta-arago
- Base Branch: master-wip
- Commit Author: Paresh Bhagat <p-bhagat@ti.com>
- Commit Subject: recipes-core: arago-core-bundle: Simplify DTB filter for am62dxx
- Commit SHA: 664e57be59c22fa01922444e2869d7cb71870900

Patches
----------------------------------------
All patches applied



=========================================================
  check-yocto-repo: PASS
=========================================================
master
=====================
PASS



=========================================================
  yocto-check-layers: FAIL
=========================================================
master - FAIL
=====================
ERROR: No recipes in default available for:




