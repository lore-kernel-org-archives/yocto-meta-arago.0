Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 07830C79FBB
	for <webhook@archiver.kernel.org>; Thu, 10 Sep 2026 20:02:09 +0000 (UTC)
Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.23934.1789070519261229920
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 10 Sep 2026 13:01:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=proofpoint-05-2026 header.b=OUczW3zd;
 dkim=pass header.i=@list.ti.com header.s=selector1 header.b=N4InNvQT;
 spf=pass (domain: list.ti.com, ip: 148.163.154.28, mailfrom: prc@list.ti.com)
Received: from pps.filterd (m0374955.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68AIPCRE4057311;
	Thu, 10 Sep 2026 15:01:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=s0YAJYdc29kpiPk7/dL2Uj3kA6IR6HLUigLL8DuIc
	1o=; b=OUczW3zdOHzURqrMoTXfsYo6jlrpYD9+452LSRuf7yUoG11gpz4c3E2CL
	7nRKK5xXpTDqcNr5SWke84tDdhMqPiAU0U5TOwdfCmbS43jhBW7d0i6K809a317i
	OnkEZeCB4SDCV6LREgaouwl6lRolvduPqxxQEQ9PSVrOD7/gxGhuHylaXr7w2YlN
	k2mds60gXpNshIHrVgNxznEEbRVWvGkzM4PBQ/yLQLiAJTXvgp58QXtLX8r2FzOx
	NMLDLMCkBLvhPgtgbzoTXqqu2zeGU+6Ea9qiah4X0xdk7ovHJin/OjviQDGivQ4a
	tU8uZxpSToyyp1R8rNJcn0NrIj8NA==
Received: from bl0pr03cu003.outbound.protection.outlook.com (mail-eastusazon11012066.outbound.protection.outlook.com [52.101.53.66])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4gkyw9hdty-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 10 Sep 2026 15:01:57 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uSdAhUsljogOw4gMk9eEjCVkIx3cnkpESHrfMhLhMrgwVOT3l2dIRfT51SOTJBuXHaAAw/O04vdt5sD6OIxtVK5dCooNRjiyyTmOhFwR4afTv76s6yOUThEMLguvMt6PAoEmoOIDenaad7eFE3JrvCcH95bC6D/THbW/vWSmfY1Rz+SYV6KGxPKq+LQ8CumJZyJJJC5ZdLRDNK2i6oKu9Fx/lXwrNvykW3mHAmNVar1hg/kGOE3TAdkMoVdbnEbEh10tJYVvBiAY+Z5vI/aEuS9GddjXgMM9EafH7bkEqGeY9ytPxUPGsqKfv3an6HW/s9EZjVRs0UWNMRmvNyk9Vg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=s0YAJYdc29kpiPk7/dL2Uj3kA6IR6HLUigLL8DuIc1o=;
 b=QvWvF0DV0xEBe3YdB7KyzkQ5U0glNjaItUuu6DVOxGMs+w2k4OaoR4IJqldNSlzTCXtBEtbkQZIGTO1Ev2iVzys+Zn7+CXGsp2hlcUEWuuQCBLjaNGpjpbM/vSS7XScLfumUsP8b219j+8b0cHHmpvnwgVLxhx5EvFp6QpFBlPBH28mjhXMnSf3bpchzLGEZTjSMrLXuC0Bc+s5Y+M9TLf6amDamq30f2NrBeWZ0mBNr4alLGiVv1iXD+UlMc1F3glc+nkY76i3piJIlUebPYwi6/iqW3y+BvLM5XGJ4rQ2QhuIQCBmXb6vuw/z+wd/4kdSC5cenLl6V0KHPogD8NQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=s0YAJYdc29kpiPk7/dL2Uj3kA6IR6HLUigLL8DuIc1o=;
 b=N4InNvQTcE0hGK33dPLE4d/RJqYpma3dwS2Sui3KF2IvQNVbZj4MN3ZL0RN9cgmI6XQdxK7flxwUfeAsz/tXBMHnsBF+Hss54p55F+g+9Tyj0PUcjpeBZEWR6BuVWVVlQ3nMRUuGFxNvYPiuiC5iVHH+7EarARjVd10QozWsC6XhILYp1bmFy9wcfMpKhqfho8ctmcZIL5q+4wcf9wzcrF8AFSNttqI41t/+3DGUCElTLPTe1MpTWn7ooLcc3KffzgygG4pUSlJ+5rfBpb3PVYkevOAvU3FP8jJEBBRX/aCdPoLkzdBtlLStE8pNiZxBpYBToRr/IRFO/5BsMiJMUg==
Received: from SJ0P220CA0005.NAMP220.PROD.OUTLOOK.COM (2603:10b6:a03:41b::12)
 by BLAPR10MB4883.namprd10.prod.outlook.com (2603:10b6:208:334::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.4; Thu, 10 Sep
 2026 20:01:56 +0000
Received: from SJ5PEPF00000208.namprd05.prod.outlook.com
 (2603:10b6:a03:41b:cafe::4b) by SJ0P220CA0005.outlook.office365.com
 (2603:10b6:a03:41b::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.406.9 via Frontend Transport; Thu, 10
 Sep 2026 20:01:55 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 SJ5PEPF00000208.mail.protection.outlook.com (10.167.244.41) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.406.5 via Frontend Transport; Thu, 10 Sep 2026 20:01:54 +0000
Received: from DLEE211.ent.ti.com (157.170.170.113) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 10 Sep
 2026 15:01:14 -0500
Received: from DLEE201.ent.ti.com (157.170.170.76) by DLEE211.ent.ti.com
 (157.170.170.113) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 10 Sep
 2026 15:01:14 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE201.ent.ti.com
 (157.170.170.76) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Thu, 10 Sep 2026 15:01:14 -0500
Received: from fllvdckhpci031.itg.ti.com (fllvdckhpci031.itg.ti.com [10.64.72.41])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 68AK1EBP2962496;
	Thu, 10 Sep 2026 15:01:14 -0500
Received: by fllvdckhpci031.itg.ti.com (Postfix, from userid 60899)
	id 60BE39A9C3; Thu, 10 Sep 2026 15:01:13 -0500 (CDT)
From: PRC Automation <prc@list.ti.com>
To: Ryan Eatmon <reatmon@ti.com>
CC: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-arago@lists.yoctoproject.org>
Subject: Re: [meta-arago][wrynose][PATCH] gstreamer1.0-plugins-good: Move to 1.28.4
Date: Thu, 10 Sep 2026 15:01:13 -0500
Message-ID: <20260910200113.2719714-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20260910195723.1341293-1-reatmon@ti.com>
References: <20260910195723.1341293-1-reatmon@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF00000208:EE_|BLAPR10MB4883:EE_
X-MS-Office365-Filtering-Correlation-Id: a242714d-9e7c-45ff-1617-08df0f765ce0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|23010399003|376014|82310400026|1800799024|36860700016|6133799003|22082099003|18002099003|10067099003|56012099006;
X-Microsoft-Antispam-Message-Info: 
	RTICsHNq2vOb4p1CG/6N6a7bz0Woke5RxAgNFrzFs9zaPq+WorFPWVsWOZ7l4diXykMNr2rshybk5wunslKIlEQOguPaiQt409ZsxuxggL/yw4rMVnk3w6K9F13g2Ul90B09vlKFckya3JnpqZXkbWq5hUsr4xja1nJD1cDXmMplRGOirmYA33JON6ayw8VtxEbwg8MLP6HNzx7st7lO/zKBrFPgZmVrzbTBjyLLnDAzGztcJRdX8gzVq8QIpHx2uMhQ9IYq+k/sD/9iBrDNF1FDhrAHQ7dADkWeneWyF/nFapIcrh23S1YSSGfFVEqroaQmzF3EKVtwOm7V0WSM1EWLbb2EmDmf2I+wpWau79iR2tjG3my9/FIdTh22+zuw6ygRq9L98mpATKF5MjejZPCYaofQOILHVlbSkNlZoxkSGQO35TDo1naxMKj3U2pW0hue0RTZSFqkbcqbEzieONjj9oG6aBxbpKCf0SB9y0Vi+Bs7JUzdu3Fdn2/dIWZIzHlk1YJwovNoq7XoO/TC/2IkumaHjbQkTbOTN74I9lMTbimOzLbAfJxcbWdp+pTqcXAnsJLHGP7Z6eeATew5vN8y423rd2kjPvZJz7HkAcCtQ3JKec44g+mQKIzKV2ssP2rmpRkVsHGt1f8Ar5Xsx6b9+Ms1H/XCbQEu4sHEd4r5OCYuaNxCFelDHOj/93/8Im41JVlqkoowbkW4uo+gjg==
X-Forefront-Antispam-Report: 
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(376014)(82310400026)(1800799024)(36860700016)(6133799003)(22082099003)(18002099003)(10067099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	SyBOLSB4EmeZUYdevv62pMZlxKdEE3x/66AAhu861yXKYQwsmMNkAU2XE2Ck5y6ThaEhaAMbCk/qExmM2VF0h4cHD5RGJQBfl4P3rd+yYCNKJmMYJ7jKDa4uu6ZgVH6pZ7nBDZDCKcQCE79S2qyA8Mz9Md+x0KiveTKLpZuMofNvf3RZThjQq54nYK5Ugljn5IWzVi4FuxHaXL1fJRnEs0efNGmLQqt7Mu184W8e1Ri/kmvwQX1ZDdNkWm/jkPYhhFm8okT++SUky0sl9UnFV/UNOJ6ML38iO8+pReuu2EoodJhOKRhpV1JsxMlcbfrQXM8I8VCqlq2lqg+pVkjTeG1p5d3mF1d4wdaG/1bHQjmE6tsSU+38hOD/qB7Zt7IEeKTY7KrWg+3MTlorB8+yywJTCrw70x9dXyDcMmWQoM6XQxdJbUBpsvYznlDLYvuI
X-Exchange-RoutingPolicyChecked: 
	GoI+UptTz8vLghoDEwC9CDvuE9v8035/YCKytG7lM+f3foVio2SPLxuGcwqMf/jhCRtu9HdGoyXjIxP69xx0rOZIGbrqAbs+vshTxOx1OYpJ+NGceaIXZqo04g1AVZdvOt8lfvN32zixHkjKm20hBTanjTLpkEAMXlFwLRZ8hISuPD3zGHV8mefmeJ4OiZpbfte4giSUzyZ9mO47V5j6yyMXrsFR48MgkYReebR25qB1cf+yyulqtuxi3yalgsfrWl18KG6KaA5kaiuzKauHUIcH2b5zvFDhsVw555ZG4B8CTA/lsQB6NpbXCQ488+jnQ3fjXSnDANgOIzzwAsC6iw==
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2026 20:01:54.7252
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a242714d-9e7c-45ff-1617-08df0f765ce0
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SJ5PEPF00000208.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLAPR10MB4883
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTEwMDI0OSBTYWx0ZWRfX9oLP9OupukC9
 kADklzNxXTLN3R74tgdO8SHMJ/d1zrqCNSXcGYuZGbK6Etu60ukpcM+a9upomRKHJKPP5PA7NJR
 Cfw+/D1EsFJ41ePo0rd6XKBoP4wf3ic=
X-Authority-Analysis: v=2.4 cv=ON6yTiaB c=1 sm=1 tr=0 ts=6aa30cb5 cx=c_pps
 a=VTZ9QiboGVM1ljQMw9N7kA==:117 a=WotqVVQAdb04rnGuttW3Kw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=VdqzKS8jKosA:10 a=s63m1ICgrNkA:10
 a=Vs-ZokuVWRQA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=fPAWb5peG099m5CrUpKH:22 a=sozttTNsAAAA:8 a=iDmb94SEabqAjfEc2PEA:9
X-Proofpoint-GUID: GDjgsnL9ZrVAZ2uwDZy_c9aQ93hmu4wH
X-Proofpoint-ORIG-GUID: GDjgsnL9ZrVAZ2uwDZy_c9aQ93hmu4wH
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTEwMDI0OSBTYWx0ZWRfX4oSKUz3vgv8L
 pQ0eQ14hwRS/ji2ApVglNAgqzNBigMOeCIKEo8c/D6A2/LbK44wjQcY0axUM6/xLWV+bqdRkTJG
 NVMo85wQ617TFna+LMt2rErRASweXOE2qmHJpBNFzEvoTw2DKzZV5bsFqFeyhiVgVSqWmg0B+B4
 hHrc6KAAZQ38pTP+Uq6k975FrUPIqRy8/vrjonXW0vgWDPtxKmGy2Zf4PcdgUPDt6pzrRAvQsa2
 kRNvvWd836MbsHhiF7wcbbnRHx2BxCDdBQGjgDn5v+isgyQIAb+4zL8CJPM08ZkyjO8BSnyyyOu
 NLfqSJWugYtAYBoPbzrOiwu0jr8jb/MvXm6Zxo0JJhHZeOeL/Y20MBU5FJxWlZg3ToeVqO5AaNn
 bo6FT03oeIQ0O9vt+6Y3fQInFNGKoYFxIDRwXUnpCWy39EjNElpRLhGYPvjPn0g2JbNZVxsUi8f
 8Xoqy4XSJrkplWk8tTA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-10_06,2026-09-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 clxscore=1015 phishscore=0 bulkscore=0
 spamscore=0 suspectscore=0 malwarescore=0 priorityscore=1501
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609100249
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Thu, 10 Sep 2026 20:02:09 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17665

meta-arago / na / 20260910195723.1341293-1-reatmon

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
wrynose
=====================
Summary:
- Patch Series: [meta-arago][wrynose][PATCH] gstreamer1.0-plugins-good: Move to 1.28.4
- Submitter: From: Ryan Eatmon <reatmon@ti.com>
- Date: Date: Thu, 10 Sep 2026 14:57:23 -0500
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: 73d692ef7583973b0425a58e2849682bdfcd6bfa

Applied to:
- Repository: lcpd-prc-meta-arago
- Base Branch: wrynose-wip
- Commit Author: Ryan Eatmon <reatmon@ti.com>
- Commit Subject: gstreamer1.0-plugins-good: Move to 1.28.4
- Commit SHA: dc357c044e81825a503aa301d1b90eab41c1f714

Patches
----------------------------------------
All patches applied



=========================================================
  check-yocto-repo: PASS
=========================================================
wrynose
=====================
PASS



=========================================================
  yocto-check-layers: PASS
=========================================================
wrynose - PASS
=====================
All checks passed




