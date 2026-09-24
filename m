Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A4214C9830E
	for <webhook@archiver.kernel.org>; Thu, 24 Sep 2026 13:56:45 +0000 (UTC)
Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.8403.1790258202230491696
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 24 Sep 2026 06:56:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=proofpoint-05-2026 header.b=a8NJqbZl;
 dkim=pass header.i=@list.ti.com header.s=selector1 header.b=tk8XN00q;
 spf=pass (domain: list.ti.com, ip: 148.163.154.28, mailfrom: prc@list.ti.com)
Received: from pps.filterd (m0374956.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68OC6STo3501700;
	Thu, 24 Sep 2026 08:56:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=UQJuXtd4j/eceIWEV08PnjucK0PVsXB0npu8ZKSXP
	y8=; b=a8NJqbZlE2y0MuabLstRWHW6VXAVriEfO1jKEiFsIEh855NqT44veOIvx
	jQI87D/VRGCkvY9dNc71vN1apN2zGfjCG3qW5oOUgYoXRgQe0pInJyLe83+FcBhW
	4jOEyEj5Y3BIT4C/Nk3Un3pZSGg2a73g9/kcaeFUzDDghkhPBkPtRqtKM033GvwF
	FTq7ImORgCB+CXky4LbcT6Ulsa2WLKaOPvV6i/2KxCUNtU6qttaeFlWzxejrCjhx
	lCjcpxnZbDsyVcZodE+7hzPssisNmD+OwnQNI11ZtONkCIdgJ7dboNA9EtDUjW26
	Kvy9HEO54f6p0s0aXGJoVxqkEdYKQ==
Received: from sn4pr2101cu001.outbound.protection.outlook.com (mail-southcentralusazon11012024.outbound.protection.outlook.com [40.93.195.24])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4gvwm32q8a-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 24 Sep 2026 08:56:37 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jFClSQUbVTfvofCOAx+6qIw5BJ/kKNGLmRqj5YBrMpaZH5Xen0RnEwrsgruMUbveTfL6JawBlF2Uejnly47Rpwl1JYy4OKeB21AtoDxRBdc7VCTZHu2aoDsV+xPsO3y+JP3kpsKWLilvinorVLzuSLxekWr2od7uMigrwS6MXzIW/6F9bYVNbprnOFHvI3BXIMMBvcX4MuSIKVLLngm6DDRBmiil/mNY7wLX0w6FjCCf5i1Auf/vUBuWrP+5JqidJvB4XtDSCWs8VFzW1PoOzftOGYbPjdSvd14LAFwHlk9PqAYTCtaB8fImzLVxxwrc55OGGGBz+4Lnn2NS/RSSdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UQJuXtd4j/eceIWEV08PnjucK0PVsXB0npu8ZKSXPy8=;
 b=FY7+T0T8/6ALipa73oACHopALO5eveJpP1lt9w7OrK0b3RJHckF7zUa1R+E7RCDPAX+/hYtso33fMr6An8hawp5SuDHErBXd+OyZcvb5FFqqubW5bj/N8LhAR53O58CvHHAUFVOGFxXLFX8qrXTQy5maKRct/G1bZ2pvEpTXf3xvrz348Pnr3nZEK7ILICup+7gJ/9ScZV0VPyWEpFdYTZ02qqK0hDDAM+qnUATi2wwfjAUe5vcYy2VI76RKzoR5wwDJ7jQhQPpqIVbn3b1Ih4sBoemXSaVR9cFV5FAR+9q5MjnA7UKb9w7wlnc3VG1ewNLJecOIlwNzvQVhWOdBAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UQJuXtd4j/eceIWEV08PnjucK0PVsXB0npu8ZKSXPy8=;
 b=tk8XN00q73YVdtzLP3LyNi9NixwE/FOeKplNEYiVoIfTfU+SvkQZk22hjeNgL/c20YhbX3ZJoK1HU9hiahlB7QuN5Lr66My4m9Q1MWyJYIVpfjEGEUtRoi7qC+Pdv6G16iN6I0wURdgS/k2OVGrkf0QWWdSiDWHS2p5Xr+Km6lS+NW/SY8mA7hJCZV7cNtlETIriAVuqwQEexEVPGWKPSOHbhLNAIEQLT0VRJHtadJhM7wufHeokLxSphMH96YHJ/rPjrAD79ZuuC8/XaW+aJGvOK/DMDVu6fzFAsQ412Zw437ljBXMEu4Ljh33SGNWzc6nW8aErgBT/EJ7PdhH/eQ==
Received: from SJ0PR03CA0053.namprd03.prod.outlook.com (2603:10b6:a03:33e::28)
 by IA4PR10MB8520.namprd10.prod.outlook.com (2603:10b6:208:55d::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.7; Thu, 24 Sep
 2026 13:56:32 +0000
Received: from CO1PEPF00012E60.namprd05.prod.outlook.com
 (2603:10b6:a03:33e:cafe::5a) by SJ0PR03CA0053.outlook.office365.com
 (2603:10b6:a03:33e::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.451.18 via Frontend Transport; Thu,
 24 Sep 2026 13:56:31 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 198.47.21.195) smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 CO1PEPF00012E60.mail.protection.outlook.com (10.167.249.69) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.451.8 via Frontend Transport; Thu, 24 Sep 2026 13:56:30 +0000
Received: from DFLE20.ent.ti.com (10.64.6.57) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 24 Sep
 2026 08:55:40 -0500
Received: from DFLE215.ent.ti.com (10.64.6.73) by DFLE20.ent.ti.com
 (10.64.6.57) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 24 Sep
 2026 08:55:40 -0500
Received: from fllvem-mr08.itg.ti.com (10.64.41.88) by DFLE215.ent.ti.com
 (10.64.6.73) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Thu, 24 Sep 2026 08:55:40 -0500
Received: from fllvdckhpci031.itg.ti.com (fllvdckhpci031.itg.ti.com [10.64.72.41])
	by fllvem-mr08.itg.ti.com (8.18.1/8.18.1) with ESMTP id 68ODtdQO2961181;
	Thu, 24 Sep 2026 08:55:39 -0500
Received: by fllvdckhpci031.itg.ti.com (Postfix, from userid 60899)
	id 47EAB9ACF4; Thu, 24 Sep 2026 08:55:39 -0500 (CDT)
From: PRC Automation <prc@list.ti.com>
To: Denys Dmytriyenko <denis@denix.org>
CC: <meta-arago@lists.yoctoproject.org>,
        "Denys Dmytriyenko (TI)"
	<denys@konsulko.com>
Subject: Re: [master][PATCH] meta*/layer.con: update layer compatibility for blacksail
Date: Thu, 24 Sep 2026 08:55:39 -0500
Message-ID: <20260924135539.1481851-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20260924135133.1406245-1-denis@denix.org>
References: <20260924135133.1406245-1-denis@denix.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF00012E60:EE_|IA4PR10MB8520:EE_
X-MS-Office365-Filtering-Correlation-Id: acdcd8ee-da11-4872-e00a-08df1a43a298
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|1800799024|82310400026|36860700016|23010399003|18002099003|22082099003|13003099007|3023799007|56012099006|10067099003;
X-Microsoft-Antispam-Message-Info: 
	/uZUBPjTlNjbQ2TNYrs5EVL2EONXnigxf1WHKrSx08RSHqJr9x9U+sha2XbU6MTdHrAj7OFkUpBirEWPnrSELNk6JRTlYV/nwXM8fKfbWeFGvn1Pk7rxjOZEZ+dSU+UBHDbZJmnJo6PZYBRm1EmZvTuM2/a9Lp4JYu+oj5vq+BE6vP8rQrL9L3ooPjiKMTY5qykMANYf1AGcn4vQVfisKoCopJeBdjhDYNkN8//DCqxBG6FzTpLfXOnh34vH9PPxeOuHHdukqsf+35jiwaLUsREN57ymLDzUEHyPC3TvSuN61LmCNc3KPGh8nhYZ/bbHobmqfpjbDAv8JN1UM0lWWAMMMrxgwDt1+dcab89MLx5MifqRwo7fECDPd8968KeWRJKS2atQCZc3/lar0cfPD682WMBWvO/aqgWZYTNZSJTX66nssE/LnfP0kGlQ+s589yBmJ+izjLVsdczsxXf3j8pIhhmtuAOg+MTthIDO5q6dM1HHSOfwKziwUY3c0dutuWAAgEeeaaNfjpr0I/MnKJc9NtEawoZp57rkCu2vieXBbEf2EF5weIRSu2VMCZM4hkwIziWo+Qc2iaLlLPcV/2PEQ3gLtrL+7ZdrG8OtuA4HUdOwsqcw3sRdIpP3Q7RID92+TCQFIitwdXaeGydfWw==
X-Forefront-Antispam-Report: 
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(376014)(1800799024)(82310400026)(36860700016)(23010399003)(18002099003)(22082099003)(13003099007)(3023799007)(56012099006)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	L7dea37IZo74VWc7fd6c6ZNMv69JLX7tJCLY8Fakvyh1TKwBfvq9fzCBCTo8vmMNj8hAXJhBBZNs31pyKIl/sI/lFOymYMZ5CW+NV1yILM60W+pnZou6V8tWUb1DMSXJuvNs2TrkTgqwVov+8PbTXlTzRUdTou6c8GMKyI6gUVcLjQ+bqXVPVuNnTVGOTS4LItyzlpR3zPmMysn3tgP5Gi9zdmjLwbNItZGtqxwMIARm28HK5tz58rp3HOkrTFod1u6w9qmjLYSTJcqzCLv6qZjR6MrTAbBhl9kym2s4UzcUULeibf6P+/+BDOBOqhrI8Mc3I8O1yEmzpVc/RUBQCGodTvz6IEq3BhajyIqlOy/TuXT9vfauNQrelEFZiSX/vBvpl4chpO0V1+ke5Mr+dAb+t3G2K1KkSRiuSZbuixgpkTcH8jeUP5AJ74/q/udj
X-Exchange-RoutingPolicyChecked: 
	2062KyMOw3IoCfypko+r+yt6TAcHSqy57GEXOgGN/dhwk6nbuXexAThNMU4DKRHYXclwF1V4sBarLGFgdzMfp6ivcqPbV4zBHEDHs9FZyGZPim/duEYcL7k2Dup5OT1bgido2wziwpl2fwsm9jHumaHjVjNfo6OZ+r2tUEficPNEB7jxdE1Sv5iGG9C7gG9OK3DPSQpHbFUsHTGURCAdg+CoEWU/XpI6TZ/q8/t0pHs7l4mPd8WE9EJHpETqAo4LirTnsA5l6xmUgbeGTlk8pxtklHCp1JNcB93WwoHCq1UOOsBHJGf5bWwCBD6UlkCMj/aRha7j7HLz54dSq0Qu5w==
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Sep 2026 13:56:30.1577
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: acdcd8ee-da11-4872-e00a-08df1a43a298
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CO1PEPF00012E60.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA4PR10MB8520
X-Proofpoint-GUID: WkdagpNDrDAW4yN09VtjC_hGCikKqYSG
X-Authority-Analysis: v=2.4 cv=EvdHPicA c=1 sm=1 tr=0 ts=6ab52c15 cx=c_pps
 a=j0vpRZT92jK8pnwqK8unXQ==:117 a=tJyPKKxUohctrY4NYmUjkA==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=VdqzKS8jKosA:10 a=Vs-ZokuVWRQA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22 a=jwouBfj2j3NM8CExmVVE:22
 a=iGHA9ds3AAAA:8 a=0gcC27t9AAAA:8 a=k-42gJp3AAAA:8 a=sozttTNsAAAA:8
 a=chpGjVVJpKQ_F8wwT3kA:9 a=nM-MV4yxpKKO9kiQg6Ot:22 a=f5sM90hAhNS9OGT-JDKn:22
 a=uCSXFHLys93vLW5PjgO_:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI0MDA1NyBTYWx0ZWRfX1lzDiDtMLLM7
 D0N/MVYLR2vAjXzIe+HX7x2aCXAwM3ra23xqkyv/ScqD16Nr0jTxrZV7kZYP0cl7FEhy8w26yfr
 jgequ6MkIlEgSKeIqNVdMeLonNo+iq8AgRSyZonFbwmOATB/QVi4wLYLlheSu/Joyo1ly7L3fKj
 dk2ReGpJGMGjBtyGqglSM6zeKBJF6+Ik5HQvuJMhmjdN178lnPJU5VamqGmkh8W+7LXHEZAzy3s
 BAQwUh0wn01Wda4kFMn+z3yaKNq1Wm8EL/gOq2vPfIO8SfMeE6hhzbc9vISe3gsmS5MajsobHMg
 TRRoyiuZ6V4Bsckcei71u3Dcaa49RmpSfFdhOmmJ+9pYcRLovphhc+h53nBQ+DXZZcYPaHW5vDy
 zVpq23AL6hS5Z2oW0WrWzCx9UoZVOn2zlCMKIp9Yj4lKXLBLYBcizq4/C3oCs0Z/SdamMKntq7u
 GMsuqMviZNzOMpygsVw==
X-Proofpoint-ORIG-GUID: WkdagpNDrDAW4yN09VtjC_hGCikKqYSG
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI0MDA1NyBTYWx0ZWRfXw4Wvz6B5Gjpt
 dQftkOsxnm6NcA/PTy+X2KbE2+iwVItxn9jz9p8mPvIFLg8BnjN8shB4vCpQmHifkOJkwCJMBaY
 7IW6yw6KJZGhdg1ySfJ6/4rgQYQ3ytU=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-24_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 bulkscore=0 phishscore=0 spamscore=0
 priorityscore=1501 adultscore=0 impostorscore=0 malwarescore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609240057
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Thu, 24 Sep 2026 13:56:45 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17707

meta-arago / na / 20260924135133.1406245-1-denis

PRC Results: FAIL

=========================================================
  check-yocto-patches: PASS
=========================================================
Patches
----------------------------------------
WARN - [master][PATCH] meta*/layer.con: update layer compatibility for blacksail
    WARN: Commit message does not include file/recipe name: meta*/layer.con: update layer compatibility for blacksail. (COMMIT-MESSAGE-2)
        patch
    
    WARN: Missing Signed-off-by by sender in commit message. (SIGNED-OFF-BY-2)
        patch
    
    For details on the above errors/warnings visit: https://lists.yoctoproject.org/g/meta-ti/wiki/40887



=========================================================
  apply-yocto-patch: PASS
=========================================================
master
=====================
Summary:
- Patch Series: [master][PATCH] meta*/layer.con: update layer compatibility for blacksail
- Submitter: From: Denys Dmytriyenko <denis@denix.org>
From: "Denys Dmytriyenko (TI)" <denys@konsulko.com>
- Date: Date: Thu, 24 Sep 2026 09:51:33 -0400
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: f09cd55804092ac4e596d40ef0cc1aedc54b6c7e

Applied to:
- Repository: lcpd-prc-meta-arago
- Base Branch: master-wip
- Commit Author: Ryan Eatmon <reatmon@ti.com>
- Commit Subject: ti-world: Clean up chromium inclusion
- Commit SHA: 8d45f3306bed149cd69de36737e54f90a7d03d63

Patches
----------------------------------------
All patches applied



=========================================================
  check-yocto-repo: FAIL
=========================================================
master
=====================
FAIL
    WARN: The use of :append with other overrides needs to be manually checked. (APPEND-1)
        meta-arago-distro/recipes-multimedia/wireplumber/wireplumber-arago.inc:20
            SYSTEMD_SERVICE:${PN}:append = " wireplumber.service set-audio-defaults.service"
    
    For details on the above errors/warnings visit: https://lists.yoctoproject.org/g/meta-ti/wiki/40887




