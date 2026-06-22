Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 11C75CD98F2
	for <webhook@archiver.kernel.org>; Mon, 22 Jun 2026 20:08:30 +0000 (UTC)
Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.5970.1782158903955106384
 for <meta-arago@lists.yoctoproject.org>;
 Mon, 22 Jun 2026 13:08:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=proofpoint-05-2026 header.b=FyJhzhIF;
 dkim=pass header.i=@list.ti.com header.s=selector1 header.b=nIzNiQ39;
 spf=pass (domain: list.ti.com, ip: 148.163.154.28, mailfrom: prc@list.ti.com)
Received: from pps.filterd (m0374956.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65MJf8qN3910560;
	Mon, 22 Jun 2026 15:08:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=2ymD6dZ0VAlLl73ua+RQnCXFlza+CneR6Gl+trY7A
	k4=; b=FyJhzhIFZuFWNm4AfJIEVSDA7OBPm+h3GnS9wVRjx/MNrSynHY1DEm4uX
	bkQ44zcRxaSbb1fvoBkMZ1R8mqSyxwK535z4vBjtlrF1bjliTQ9HdJaeLJNsWqcN
	3eKHJpHN0vdHjrC0Sr9mXTwGy5eGmsvpoDuWTANorDeWXEmOfmO05scznQQ/LWBX
	89UHpZ7WFtE7dMQsWOjBv/EiZuIl0y/4YTgd4HMGgy0U22Od7nUESawEhtkuU8+i
	8/TDA6SrhWbaY1oxQMxklo9Zdm5sR6oL1LCdxBsIOEJvpHbDTYGppnDv7WWi818K
	4P+nNpcrtROVlId8OiIddR0hHK6hA==
Received: from dm1pr04cu001.outbound.protection.outlook.com (mail-centralusazon11010004.outbound.protection.outlook.com [52.101.61.4])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4ey43bjvrk-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 22 Jun 2026 15:08:21 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=p+zv3q5VTkU6gTmIZIrbMn6VnnIf0dWcoCPV0CRVuTqo9IcLDyppgghsUclrI4jLQe5qcohrntB5326sG/doPV2dJS21Dj6t7YdkSQtKTRSnn3ISNJPCasgyq2EyFG5Ga1EpoAr39NcqX9+kRtTmTlgf4DBYosZgm9Inlren5fhSUSe9DInYXV+Ss/WY4O3/Op0BLLjNNntV8K3YhrWNaexFDZudGmSZVNWHZVdS7NvmX2tgK+wutYTiD3f6gLvfrCJGwtCTd1Uk5y4Mfh7qogo5Q0slI3McGPoV/KNONsLnz/xPIbpqoSWXCMNI/PDp5tiNJTDMk7Sm0J3f11n5vA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2ymD6dZ0VAlLl73ua+RQnCXFlza+CneR6Gl+trY7Ak4=;
 b=yLWTRW5FEgXQ/qoSNKMRk21GaNKfjD8p/hzwaxW0chKCxOfPtci4VLfsIvhyWZwSZOl1yViARyA9bLSEyA9/L8+/ui69GLQuW0OtBt01vxcS64wfGe0BJICROpSQGb6gIsqkstDpcYdITk1gAFqjfyv6+b9Ebn8flpDte1nHsSrZHPlpI4xbM8UgM2whOrB/cQ/f+f4kwd2tibd7+mijAtGElbXX8J6BzWhbLljv4vBOCm6nfu3JcTsD/M6vbkP1uFailiqzOmpKHApio5GWGIVBrpTMhrqklZByikHNRua9apLnY8KtOMWsGZpAjN9BR0CdqbRhXbLTL/2LcjQCAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2ymD6dZ0VAlLl73ua+RQnCXFlza+CneR6Gl+trY7Ak4=;
 b=nIzNiQ393Y979E4JXUktWpq6BQ9T4Wysa3wTrs8JAoKGXQeH4Z0IZs8Zmf0+iW2rZjNtH5Kpc7UlO4QWtBsILjxJFwfj4A7hAFOiLvjTZjXfXyQ/uavgm4oRojuiM4WwdoXrCPjbt/oadahgpGJbxpTKdqVMMOp/jl/dCIk/moDivrgvnNtGAgcUn3rxl6YMzIj9vm6MPYmZYj/Wy98DMwYcntfqHWazZ5NiObv570qR6MhS92sV3F8Ggro+77jsk/jabKnUbQaN+J9M6g55Ou5e7gHu+bfRM6h8xmB1YSrF2SLFZTjSXtoSnP306ZtwVaagD9qzVpH36gxrwfo9AQ==
Received: from DS7P220CA0056.NAMP220.PROD.OUTLOOK.COM (2603:10b6:8:224::14) by
 DS4PPF751CD7230.namprd10.prod.outlook.com (2603:10b6:f:fc00::d2c) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.139.20; Mon, 22 Jun
 2026 20:08:19 +0000
Received: from DS3PEPF000099E2.namprd04.prod.outlook.com
 (2603:10b6:8:224:cafe::8e) by DS7P220CA0056.outlook.office365.com
 (2603:10b6:8:224::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.139.14 via Frontend Transport; Mon,
 22 Jun 2026 20:08:19 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 DS3PEPF000099E2.mail.protection.outlook.com (10.167.17.201) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.159.10 via Frontend Transport; Mon, 22 Jun 2026 20:08:18 +0000
Received: from DLEE215.ent.ti.com (157.170.170.118) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Mon, 22 Jun
 2026 15:08:12 -0500
Received: from DLEE212.ent.ti.com (157.170.170.114) by DLEE215.ent.ti.com
 (157.170.170.118) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Mon, 22 Jun
 2026 15:08:11 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE212.ent.ti.com
 (157.170.170.114) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Mon, 22 Jun 2026 15:08:11 -0500
Received: from fllvdckhpci031.itg.ti.com (fllvdckhpci031.itg.ti.com [10.64.72.41])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 65MK8B1f656641;
	Mon, 22 Jun 2026 15:08:11 -0500
Received: by fllvdckhpci031.itg.ti.com (Postfix, from userid 60899)
	id BDFFC9ACF4; Mon, 22 Jun 2026 15:08:11 -0500 (CDT)
From: PRC Automation <prc@list.ti.com>
To: Ryan Eatmon <reatmon@ti.com>
CC: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-arago@lists.yoctoproject.org>
Subject: Re: [meta-arago][master][PATCH 1/2] packagegroup-arago-base: Move to libpcre2
Date: Mon, 22 Jun 2026 15:08:11 -0500
Message-ID: <20260622200811.192665-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20260622194435.3385168-1-reatmon@ti.com>
References: <20260622194435.3385168-1-reatmon@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS3PEPF000099E2:EE_|DS4PPF751CD7230:EE_
X-MS-Office365-Filtering-Correlation-Id: bc3f452a-43e7-4330-35d7-08ded09a0084
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700016|1800799024|23010399003|82310400026|376014|18002099003|22082099003|56012099006;
X-Microsoft-Antispam-Message-Info: 
	pjgkZQDap+gvfvQ237q0gOoF3j/gvwN56Kgh8lZy6hrgQvdiS9M3VBN2JI04rp44dJ1Ab4O5/et5AVLKYREUX6D/dc91jMRMNDHe1N8e1F7JxnHr1gvWizJNKN94vzs2Gi6C9cwGjbJmm31G8sFDyJ1j0uqyLShhZAt8Tcr43EDRU/m1O2X7uLit5WWqg7BZPbN9U9qr5JECQPta6yb9pxaJ7xacWEuCw1g+8ywH39UqOBCdnQiSh5avGE2kfGjn5lekcCGgVuil4przeomf/WB/UtT9RLSGvwMoFyZwo7M68fD8kAbPXBWdDgkLtqNxTtnevLHpsgO455MfsoWOroGj5qHwmt5427NNJiTJQWe27nVeTVAWq0FB5nAgkNQB1BLRjUm2OCYvSNPr5CSC0IhdArnhELRRlL5czXVUPA7gAhVh6/uFqtGuEkeGVBD0zmpzQteBpyV7HxXvIbvGI9/jRjRGrdCR9AbT8jed3XUzuO5iN0/cw/O7lholPgfqf5hLZLJIOyhpNEs9kSJX2balZIFL7y7m5JL04FSZUQnt6gMX48CKv3RsLrJUAXtXNgrdXmTDIkppvqgShs0TeQDAEvndRBQD1lfioL7sI5H34FsmL2xkyafHh+fe96++R7HQFXzF9MnE1eACwyYQD+iOQ9OJ/+XiGMii/Q7pmgwCUSTtR1U+S0uJZCVFChw0XzJ6hTosrkA8UWnpau5PvA==
X-Forefront-Antispam-Report: 
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(1800799024)(23010399003)(82310400026)(376014)(18002099003)(22082099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	5/8uCKIKOTI8k7prhvJoLn0lD31Tjk05aScJlH7OR3+mF5Ao06BMcxpASUUgbFNNSVe4RXWd76+XG2ND794nXHGUT6QwfL2zkcNyc1bH7JtJluJ8AYONobWsTbC/K1CjtTBXty2jr1kU80wXkX9nevrWuXqLEM3OTETZK24DnMTSceBjYxLs9chSGr8pOY4OiQuQA7soUaHxeF6MOG23OIi4Pa8leFnuhJ/WpthTbgkJY2SqRQcb+AahuxJcdVsSf5F6cynZjKnfnMZddCSNxKDw+FJw01UlvzU6BEf5qA1AoMqBZDUoil7gHmFU6XcEdr7hPN5+JMU8EPtTbswLncyjq38w1MTdQaaTeDxyMvj+Q6CSJY/vkKo75I0av2RCycUySo9jhZW502g+aA9vyVhJ49zx8jsrBxoGN7Y28JGZpH/mFxMGt+6qpKxj7tkq
X-Exchange-RoutingPolicyChecked: 
	CbI0bX1C/0IzDZh9hk3w5e43ez09jaD0YI+4lYNayx3ncOltWHv6bddxs742eo8rrexhb1t3pn6omtZI9sPbZrmIDyFPiXf017YQKpi66WF9NcqYP8lDDMOGy69m12H4ELUMTIbX50n/D8LPLlRI4S4lG5fsEubku4Uua8UdJR8XL1D1of8UgaaTVpmyXaENthJze+dXpXLQJD9WB+3IuZwPNos5ENcGm/anMmteR1m0H4+pZDs/ssnf6eIgBfShlnI4Hz2oXO9GjhTBauuk3rpJo3otIj8Myem+yuQsXOw81gB4dj8CZs71pgSIC2NQiwrgfWFXj3qRnpuhBXdqkQ==
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jun 2026 20:08:18.2813
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bc3f452a-43e7-4330-35d7-08ded09a0084
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DS3PEPF000099E2.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PPF751CD7230
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjIyMDE5NSBTYWx0ZWRfXyj9gP6xiNqbf
 +7DdtUONBW9ts5Ngi2O8x03DGcwnpcWxw0DvULWrJ6/t24l4JWwr8PUZzsZWCnhbhcor2RkirCa
 ARU9WigJHhreLDLla87k6/CrHGNhIuI=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjIyMDE5NSBTYWx0ZWRfXyXfRmuo/nIKC
 hpItaC03YSNvG1U0n1wTDntdz0KtIZCe/vDmBO62AUO+oR2PE+Ytq3F3kXhZFNVCBCNrWjOpDl6
 HCsShDgh/rhSfUgr9hY6ycRM8ECxdWv7aKOm+pilXDyy06pHqLIWV4a2/sT04J/BIviWrHxHUFI
 +xKsXDAsAhBR9QgoH62F3TjZwPO0X+kRPUHxQxYFyoBVphLaXQDSdCW0NDH59+xW68kEgH6fTyg
 uKDKLVhPgGLJUfHNiq6hqqlrUHRh3aqFse8zS9FJtIaUrUrAfB1iRr0XB0h8k6QX62BmgnfY1n1
 e4EGZJu4vBAyIiX16RXfCfA0mBRHun0AygvcUSFnghn9hhI8Tu5xFO+J7yE7xMzLYN++k4hSubn
 +I7NYLtaX49u5kM/cvki3iJVRzuo42JzAAaBHzkNkhr1NRGl+c3EkJBCCX1JRoimE7d1dlD+bh8
 ggng/HV96d5CfwH+f/Q==
X-Authority-Analysis: v=2.4 cv=TPl1jVla c=1 sm=1 tr=0 ts=6a399635 cx=c_pps
 a=R4qMYQySjg0trGpnu7oNJw==:117 a=f+v6EHfkeJbVwR46tk4DMg==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=FelO9ux0wxsA:10 a=s63m1ICgrNkA:10
 a=Vs-ZokuVWRQA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=jwouBfj2j3NM8CExmVVE:22 a=sozttTNsAAAA:8 a=k-42gJp3AAAA:8
 a=uxrnY9e3lzdP7uIZ_OMA:9 a=uCSXFHLys93vLW5PjgO_:22
X-Proofpoint-ORIG-GUID: df024EHOCkwZ_O5PX7lWfpj1xL6vwhe3
X-Proofpoint-GUID: df024EHOCkwZ_O5PX7lWfpj1xL6vwhe3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-22_04,2026-06-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 spamscore=0 phishscore=0 bulkscore=0
 priorityscore=1501 malwarescore=0 clxscore=1011 impostorscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606220195
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Mon, 22 Jun 2026 20:08:30 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17572

meta-arago / na / 20260622194435.3385168-1-reatmon

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
- Patch Series: [meta-arago][master][PATCH 1/2] packagegroup-arago-base: Move to libpcre2
- Submitter: From: Ryan Eatmon <reatmon@ti.com>
- Date: Date: Mon, 22 Jun 2026 14:44:34 -0500
- Num Patches: 2
- Mailing List (public inbox) Commit SHA: d62a2ac01fbb8f6ced24e0663dab550edf8a1290

Applied to:
- Repository: lcpd-prc-meta-arago
- Base Branch: master-wip
- Commit Author: Denys Dmytriyenko (TI) <denys@konsulko.com>
- Commit Subject: README: update and clean up
- Commit SHA: 79304c22d45b9b3a735576932ed1108fb6c896bc

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




