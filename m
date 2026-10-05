Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DC6B9CA5FFC
	for <webhook@archiver.kernel.org>; Mon,  5 Oct 2026 15:33:27 +0000 (UTC)
Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.22734.1791214406455590428
 for <meta-arago@lists.yoctoproject.org>;
 Mon, 05 Oct 2026 08:33:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=proofpoint-05-2026 header.b=Ddjveihw;
 dkim=pass header.i=@list.ti.com header.s=selector1 header.b=ecQhiQnh;
 spf=pass (domain: list.ti.com, ip: 148.163.150.75, mailfrom: prc@list.ti.com)
Received: from pps.filterd (m0380145.ppops.net [127.0.0.1])
	by m0380145.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 695ERqx94183673;
	Mon, 5 Oct 2026 10:33:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=ocUi8ScsUYv0wDy/jDk8vqlFGOpZkfQi6D7xUZP6t
	is=; b=Ddjveihwjzcazp/rCxOtyRk+Kl8o/2IeTcboUxC2XaT6SMqH/+E/WVWuJ
	gh+Wm3ZI+/1nHNiviuolXWnzCOfr4ztw9mtTy/O6Tf+vGzrxesckD6jVZGZ0m2WM
	nf8A83PBAmRiFwcxL40FSzBBdKgDInSWy7WUNOO5eC1tgbMKcYCBMsKfUjq47wo5
	rDwiCuMWYwRaAr9T4j7y43DvL+3IewcxiMtp5MwI6kkapmI81/Cc1q3+PT0zsXT9
	4OERTy2wQxrALa9HnHSf8ielpa3Lg9OnqLla+3B63Nk2iZS0tpyhMvgFpDMXfvPZ
	LolgDlPQk0v1Z3G30ngxflNsGyTlg==
Received: from bn8pr05cu002.outbound.protection.outlook.com (mail-eastus2azon11011053.outbound.protection.outlook.com [52.101.57.53])
	by m0380145.ppops.net (PPS) with ESMTPS id 4h4d7drnvt-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 05 Oct 2026 10:33:24 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mSTW6+jmPblz+zjLvdlqBJu6gxkkahNspLCJMXddLa2ByrBFeVE+bVXBxBvJUuSTu5Ejl5gcZUVFfygnn8uBMWUfgsG16Rl4tO8PX74VJaqjHqzuIiXUgZ5ILz1gJlycgJSUrt6diegKPhI4YzumV0UqWtncqsab31l3ATcPXhFLrEfqELl5RcGMB8671t8rZmFLaAheRA2j6SIoDqrtLDjkvletyfP6xvZW6rgkkIxhJHyV4NCA8Acm9JeemdXnM0Sgd0RtKq1gpSEBRVPrUeSbH2Boutshe2yY7ed5uPUEX6jT2KWPmFhrbHJocu463Pi3oHaih1JY9auLQZXQgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ocUi8ScsUYv0wDy/jDk8vqlFGOpZkfQi6D7xUZP6tis=;
 b=KEHg8SuW2DD26QIuYwO8POIG3RNh07xnlNDM1WVmrSm5DyRg3CWsGNST8K8gbijUVhnthJjxJy3fpNsYWZ54p5IMQnxmiGusqY2OLfNd2J5DOit4g+/2PhuS+0wKRq7x4FSmADBbUe1KcdBFWOuspXMRzdC25En2ccshbKPEsxwRCIKt7yT+x9FibdPEzS8M6ukKVNGeo+A1+CKoaL/H7Aa2TlcxerBCvyXQpeNkK5JWISlogWEozjsil9emU2INQh06HXOruhP0MyGEAgZP2GDIcqf59Q/Dr+/Vbvk261pauq4MKPK/qbveY8/RhYWh64iMm09hrTjbgEZ3H7PDjA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ocUi8ScsUYv0wDy/jDk8vqlFGOpZkfQi6D7xUZP6tis=;
 b=ecQhiQnhhUzUE+cDBwo6c7f6Gu7dj7yMbVw3Ccr6jmAy9+oFbAr7FYKDzrGHBUE71rBB98A0T+XgaYO9WEpI9mmPO6NBNIIYJvgLUABDLcjkllB+dZNZeorCCQpDRRX1Jo1ETRTtla3kwKev3uZAca97EEz0scauICwdrABkJOGSeM6cyOSfZ+kTnkLL+I7Wh1fkJmXZOAhupCYsUcDmXQBxS8wkgNbrp6hEeMBXGtNbbD1H8Oh70Didv6CJ6IYjUrpy1wWZX0A7ItZd2jEVy2fuGY9sHaHPbbbDApSlMHytpLKsmA7UrbbycgAvDskAh3JfuohFOH5TL5UngnYnqw==
Received: from CH2PR18CA0041.namprd18.prod.outlook.com (2603:10b6:610:55::21)
 by PH0PR10MB4614.namprd10.prod.outlook.com (2603:10b6:510:42::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.14; Mon, 5 Oct
 2026 15:33:20 +0000
Received: from BN1PEPF00018074.namprd04.prod.outlook.com
 (2603:10b6:610:55:cafe::78) by CH2PR18CA0041.outlook.office365.com
 (2603:10b6:610:55::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.472.20 via Frontend Transport; Mon, 5
 Oct 2026 15:33:18 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 198.47.23.195) smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 BN1PEPF00018074.mail.protection.outlook.com (10.167.245.202) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.496.14 via Frontend Transport; Mon, 5 Oct 2026 15:33:18 +0000
Received: from DLEE214.ent.ti.com (157.170.170.117) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Mon, 5 Oct
 2026 10:32:57 -0500
Received: from DLEE201.ent.ti.com (157.170.170.76) by DLEE214.ent.ti.com
 (157.170.170.117) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Mon, 5 Oct
 2026 10:32:57 -0500
Received: from fllvem-mr07.itg.ti.com (10.64.41.89) by DLEE201.ent.ti.com
 (157.170.170.76) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Mon, 5 Oct 2026 10:32:57 -0500
Received: from fllvdckhpci031.itg.ti.com (fllvdckhpci031.itg.ti.com [10.64.72.41])
	by fllvem-mr07.itg.ti.com (8.18.1/8.18.1) with ESMTP id 695FWvHn467887;
	Mon, 5 Oct 2026 10:32:57 -0500
Received: by fllvdckhpci031.itg.ti.com (Postfix, from userid 60899)
	id F0A3C9ACF4; Mon,  5 Oct 2026 10:32:56 -0500 (CDT)
From: PRC Automation <prc@list.ti.com>
To: Ryan Eatmon <reatmon@ti.com>
CC: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-arago@lists.yoctoproject.org>
Subject: Re: [meta-arago][master][PATCH v2 1/2] mesa-demos: Remove uneeded recipe
Date: Mon, 5 Oct 2026 10:32:56 -0500
Message-ID: <20261005153256.3414529-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20261005151313.3720270-1-reatmon@ti.com>
References: <20261005151313.3720270-1-reatmon@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF00018074:EE_|PH0PR10MB4614:EE_
X-MS-Office365-Filtering-Correlation-Id: b614a350-3c79-4f64-97f2-08df22f5fae2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700016|1800799024|376014|23010399003|82310400026|10067099003|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	G9ve+y89FdKxYrn0zDzftCxQ2eIFQtH+ZUst/nueobLQPD1nzejKjJdzIJKUwOFKngpLowztvqpha9SgLSSRJgbMrr8IlRJGhmEy8shNTPhhFCyOBdqHR0U97WCKIPslK7FJNMpQPSYtz0q6L5ZSvbRjYvF/jXdW7alJLyYynNEbSnBpHTsSR39QoHn2LLgZo9gNtPUoKcTEKek3xcFY/8wg/kAnVpcpihLqix1ej54vgd3q6ZSF/QKO08H66cdyZyoc6BkloEuU1yyrGezO6yYL8B1FdY/Hxc9Il6o3lgxVKEGRXlqPd8DVn/Kv6rCs4W8nFcfSmWFCz7jiD1/SUWEiUKnofIcz2Raskm/x87WNZp3oEgtnszIu6+ydOtA/gI7jMJ3ee9CJyPmwRE60nWmkiai9VFD6LUnzhonnMvsC13FHnwzSWAWACU9R5UANldwwzIQElBw6GFQP7L2b0in5UBA/XybqeTwEn4yx5PFvSsymkJf5VhinTrs9T0i6b7qcU+v+hFzPYXLXoeRpRXuhyzZYaLK+tYG81EtDrn/cJhJ+piThpKeFNhwA/5lVLJ/W44QJ5UbK5vvcgSp9+GgKUcB+cMtJluXvFBLyDUcke1pb2BjIqCAq6OrJr15mMSEvBsC8wYcrdaLnJpfEHN7vyILjSUf0h8D+vYsBlDgYV8s8dH4RYSkUaitn/riBv/gY/7Lc72JxzBiEE7rpSA==
X-Forefront-Antispam-Report: 
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(1800799024)(376014)(23010399003)(82310400026)(10067099003)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	za3bF8gHvpmWaef6dsBC4d/9fjx2MQu+XlvtFLOjsKX6fFfnmJAKf6iSSF2MnT6pFky0AnmOWfqbpd8ZsqgZI0tAhvI0AFtgnrW2MnKOizuTys/7T1iRKavSDr19VFMlSHiWrgwH7LoDlIpHmK70aNdNBecM8iRNAtl4OCEHPD7IjKVS2W8xioPdS9PMOhkr8nNiRDui9R4vd5+ECmpIDeXqaMoF/+AIfw572NFkemLFTodZH/6fNg1lQn6vVJCQikKv7ukULedS+1blu5+a+3z1qnAffydZv/1HoCtBi9fNTZKGk3pT7zOIzyS//zRFpeqB66ccoPbJ0huhHirYbHvyBmeVenyNDGfp5nLBmuvbm/9+Xfghyuhso/Ba1tPZfg8DR4Xpc4i0Fv+Qd7sNSulF7des1e70Pybd6dnuWsLja/gi6IqXKmfRHuPPcKbp
X-Exchange-RoutingPolicyChecked: 
	sBqcOHki69DfvuDsIQG0uCPlLiHiBaej2Qr/tCVGD2oHH/TEt69uha5pys9hCNa/V0gAltLT/QLr3aaOao53kWDJLCwbBs8ccJYyvE7Ko4+8x3EFv0pAuDWzCr0FSd5csTqZt7KwOoIDLb7oQLF47lZpGUQNJ+0gdNmtWT1mW01uysLtZ/sS5NaApmiWZmb2c/tRUzxdme/ocudEeVxw/4BNf4RfESBWpj4uMAqkdxcIFSQqcCysjmc2WYxARKO2KtB77Ying66iZ9tAZPY/vDdlvpkOP8dYL1DcTABJT2GFOffvOzssrzIHhnKLwFjJP4RAteYYANc85aKXn6ARlQ==
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Oct 2026 15:33:18.0201
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b614a350-3c79-4f64-97f2-08df22f5fae2
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BN1PEPF00018074.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR10MB4614
X-Authority-Analysis: v=2.4 cv=AMeVrcbb c=1 sm=1 tr=0 ts=6ac3c344 cx=c_pps
 a=7AIX19wKKSH4vG2a64CeWA==:117 a=f+v6EHfkeJbVwR46tk4DMg==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=660iZSQnnn4A:10 a=s63m1ICgrNkA:10
 a=Vs-ZokuVWRQA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=gO1vWkAQAl3rybz1DQOp:22 a=sozttTNsAAAA:8 a=7nwM9OaLJaGActu4a2YA:9
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA1MDA2MCBTYWx0ZWRfX7Tva2EGM692g
 0cbUowPEcU6ukpUYW9J17zU/6IWCQ5neR4JaTR9vjiSVnMvvFVucmYYsWRUWSLMlyscAxjbzKNX
 VlXIAP2GKdK7KWQRiRQVSTaPLsnDgrU=
X-Proofpoint-ORIG-GUID: tgvNy7F277bOExPZFT_i4DS157QAcrAt
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA1MDA2MCBTYWx0ZWRfX5Yfro0pGcjYO
 Hp37OsM4HVKqki2bUcKBeKIyuIf2LfoPL5wyWND1qAuznmD7U5hBXhG2ytiZKUeMVqfZ68l8Dlk
 KwQ2GZdlr+2XgF4/i4lZbo9QyaHzmDXRskfQq2Lg7pO0iWQbOa0ivruoB3cPoLhjpQMj7X3oDps
 dC/cY+TZPlJpg34jA+1ijLD512AeSGXP7/mV3OhvUgBGp6UxHXPPFY8swWY2T5R5e4Mj8EmCH1c
 jCVsbCFZ4qPU2/1eZKO2xrJEoW7cVSz+//gqXTGpGHwEFSv7nSnvNZg+W22QTbnanxADDRdiIEu
 pCkXbvslgUQGIyoJ6hDuYOI1lQKsmrFyhbBswNL0aQoDyvbC1hVQyDCqrqjInPm8dB2Q3gyI8XM
 LFK/rt8wP9aTBJHQ498gvPNumNv34ojt9Ive/5Y7bmAuqZyOac+pN6VhN9yPtNLkxMzDCf5Mosc
 w6h72PBxC4N2J4dBpsg==
X-Proofpoint-GUID: tgvNy7F277bOExPZFT_i4DS157QAcrAt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-05_04,2026-10-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 impostorscore=0 adultscore=0 bulkscore=0
 phishscore=0 priorityscore=1501 clxscore=1015 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610050060
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Mon, 05 Oct 2026 15:33:27 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17736

meta-arago / na / 20261005151313.3720270-1-reatmon

PRC Results: PASS

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
- Patch Series: [meta-arago][master][PATCH v2 1/2] mesa-demos: Remove uneeded recipe
- Submitter: From: Ryan Eatmon <reatmon@ti.com>
- Date: Date: Mon, 5 Oct 2026 10:13:12 -0500
- Num Patches: 2
- Mailing List (public inbox) Commit SHA: 2eb0cab00ff8603d21bbb0c7e60e77faa51c526f

Applied to:
- Repository: lcpd-prc-meta-arago
- Base Branch: master-next
- Commit Author: Ryan Eatmon <reatmon@ti.com>
- Commit Subject: open62541: upgrade 1.5.7 -> 1.5.8
- Commit SHA: 170fff909c58178a4c21b76fb3866b17bd9b7cc3

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
  yocto-check-layers: PASS
=========================================================
master - PASS
=====================
All checks passed




