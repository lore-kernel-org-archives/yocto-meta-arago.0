Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DB717C5DF94
	for <webhook@archiver.kernel.org>; Mon, 24 Aug 2026 13:05:36 +0000 (UTC)
Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.16047.1787576729479542525
 for <meta-arago@lists.yoctoproject.org>;
 Mon, 24 Aug 2026 06:05:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=proofpoint-05-2026 header.b=Wxe7lSlJ;
 dkim=pass header.i=@list.ti.com header.s=selector1 header.b=Q37pYI0q;
 spf=pass (domain: list.ti.com, ip: 148.163.150.75, mailfrom: prc@list.ti.com)
Received: from pps.filterd (m0384305.ppops.net [127.0.0.1])
	by m0384305.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 67OCssaP2511966;
	Mon, 24 Aug 2026 08:05:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=Y7S18Ud+iA97tC+R0vbqMmRjwoC0QqkxyK69dgS/j
	zI=; b=Wxe7lSlJG7cGQJKNcqapX1whIv1vFIPb/bk4gECqtVXRxc7EYNBsijWbS
	wiSiZ0TiLYZS8rCRyoBds7q+yzsorDwnSegZte0VnLyC1Mp8s0RsSAvoh6YeYoBi
	pdqKy1ZRUrozIsV8PZIS2Pw+d5zzu2T/KIR6VO1yat7iCPRFxe61gPYHebHRvKx0
	d1ed0dj9OM+GSjVGPPG0WKlkMiVPrZGb+mcq7hq4hp3z+F1SeQ0rKtsiv4S8jXcm
	zb9DOi6WTlHdhm0wL6FDeInE79oXIjhCgqEUzqi5o1YY60to088M1erpXXGmmOYU
	kI1yNV34Y3+CUGJ2pTX/N0UUjJXEg==
Received: from ph7pr06cu001.outbound.protection.outlook.com (mail-westus3azon11010047.outbound.protection.outlook.com [52.101.201.47])
	by m0384305.ppops.net (PPS) with ESMTPS id 4g7wqnp197-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 24 Aug 2026 08:05:26 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zUkf1M75ix0LHgS6iqzMvzb3P6bEHn3Ti0hE0xvecWhEaV4oomxMWtcFw/9vMecXQ+Qg65ZS89/4+PWhocxOKSgG2SebIp5lnVTd6eDjmL1EpLkUvwNuhD1kuZ2fRK1N3J8LuV5IXlOHCzwwAgRtpFNZL6ahCdIiM0cvqZVaZuwQkls1GGIQyiYgBJQb4647wiFBMSPdmMC99tg0ODjEY2FUZFoWbVolYqJz1ziBkJ2wpthnTP17+2GVqNJRUErFSFPnbmO9UDGvyqe/TcHcMHhvrepW0XndlnLwhXB9VAwPHw22ECfIBxgREasYc6he4m7lZgsJ3klAm8K6zjHq5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Y7S18Ud+iA97tC+R0vbqMmRjwoC0QqkxyK69dgS/jzI=;
 b=HtOC7/Tq1jQXS0y9OXRPmrNxjNZtiMhQkgV68s1A6Tfgweo9mN0lWyqnkanQn+Otzz1cdg4fCrhkD0zOc9fY5RK9mND6OjGXX6MmpU2YzXNnvdP7LIOUAqp6/VTYRomAe8NGfiEY5YvEU+1noHCT8yHSS9CMseDB5UXBSco0LoqMIosGPVeCBiPeKxvSk55roD3HX/pE8n97DSsyYkCpjGfslWMLrC5VfINSyNXTAx2g+0HmqdrpOBXOdh/XVnanfWDZSUvVTPEUY9c5by5DZ2AEQicZbSble1+cMh6dx8I6C9VCRu0gyHtCUYKuBFRWTLyJ7Wag0E9sGizD6DGvzQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Y7S18Ud+iA97tC+R0vbqMmRjwoC0QqkxyK69dgS/jzI=;
 b=Q37pYI0qtYooigq5iu/Jpg+KRb2cQE6oIs4HCsIsVg7iGk+nFyjsVKUiLrdJetfpSuC0M6gYiIyASYORPUChCobhYCrlgYhcjwoE61lCLdxjZsWu8WrXBfkcat3PXklnuIy0ljoVK+bhDijS2O6Bdr8rqC7Xosj4U8mO34kamvHf45GlFlEvvzb1STeyE7vbLfUBHp8vAnXVm8gYcvRrsCYWwB33u9gRHxDoVS2bzvwLS/5Pr1bCUXUjNmD7IzF1syiBpcUKd++h4b69cYyubewA+BvhDI9J4FfCXJXMBJWX/qvj6GkmEJfIlZailRkmN1juCbgmMmzdBRhK/0YZzQ==
Received: from SJ0PR03CA0146.namprd03.prod.outlook.com (2603:10b6:a03:33c::31)
 by PH3PPFBA17DA552.namprd10.prod.outlook.com (2603:10b6:518:1::7c3) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.10; Mon, 24 Aug
 2026 13:05:24 +0000
Received: from SJ1PEPF000026C4.namprd04.prod.outlook.com
 (2603:10b6:a03:33c:cafe::37) by SJ0PR03CA0146.outlook.office365.com
 (2603:10b6:a03:33c::31) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.339.12 via Frontend Transport; Mon,
 24 Aug 2026 13:05:24 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 SJ1PEPF000026C4.mail.protection.outlook.com (10.167.244.101) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.360.3 via Frontend Transport; Mon, 24 Aug 2026 13:05:23 +0000
Received: from DFLE201.ent.ti.com (10.64.6.59) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Mon, 24 Aug
 2026 08:04:57 -0500
Received: from DFLE209.ent.ti.com (10.64.6.67) by DFLE201.ent.ti.com
 (10.64.6.59) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Mon, 24 Aug
 2026 08:04:57 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE209.ent.ti.com
 (10.64.6.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Mon, 24 Aug 2026 08:04:57 -0500
Received: from fllvdckhpci031.itg.ti.com (fllvdckhpci031.itg.ti.com [10.64.72.41])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 67OD4vB23114701;
	Mon, 24 Aug 2026 08:04:57 -0500
Received: by fllvdckhpci031.itg.ti.com (Postfix, from userid 60899)
	id 418E29A9C3; Mon, 24 Aug 2026 08:04:57 -0500 (CDT)
From: PRC Automation <prc@list.ti.com>
To: Paresh Bhagat <p-bhagat@ti.com>
CC: <meta-arago@lists.yoctoproject.org>, <denis@denix.org>, <reatmon@ti.com>,
        <v-singh1@ti.com>, <c-shilwant@ti.com>, <y-hegde@ti.com>
Subject: Re: [master/wrynose][PATCH] recipes-core: arago-core-bundle: Simplify DTB filter for am62dxx
Date: Mon, 24 Aug 2026 08:04:57 -0500
Message-ID: <20260824130457.3264313-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20260824124337.2611340-1-p-bhagat@ti.com>
References: <20260824124337.2611340-1-p-bhagat@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF000026C4:EE_|PH3PPFBA17DA552:EE_
X-MS-Office365-Filtering-Correlation-Id: f805b54f-202c-484f-1a8c-08df01e05bc2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|23010399003|376014|36860700016|1800799024|10067099003|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	0cIeqw+RX0LnPQ5IkUjbcdvDbrKGNeUpC5zzQvcnaoS6C5s6fuImSJ+MyLSFO/jNnI4QadA0Ct42Y8Oen93KVAAUUjZmhpQFCQZ62LF00XjiUXXh1ecmykcLX6ZOIfzauvTgah7nBJlMJ1/QvdJIow3maqTFlDS8DdhSYJ+suL/ZX1TKZPWEeKhZyhpeanCARoWzEI4YDpgQ3Iuf3nv5OGSnvi0b2pmjV1z1g6o3DAR4+CS3Pl1M2BE80LD8H/0tzW/wt8NJjvz4vVPO7rQ2oeaSU+9I5UizuQU0i0Jm+2lqit3aPNStbQnqDjKl9yzTBIafrGsx+kShC3mjYOGEqW4bEK9iRArCI5+znFOL9QwKjnVC3n3VOFCBDfIhp30OaczAFgIASMRbLOdqowZPs0iCSjmOI6w4C5pzyraDTYqUe7HX3Qx7cghaJ6O0SFGP/JExkNlZP7HJpAFIXr1ZZPZC1SkngOVkyNe9YPh1RBbAvWbRLmwnv09Q/cKpC4yqodpJzNN5AHeaU+sbxXYPeCetVvSWsHSfWWjtNo5InVXXTbCJzWRk3IyQ8svGBcLJyzpQN3XGjpf7l4pLPbGhlH02ryUJtPv11hs59reexG62Tm2gGNbtoUA4vdBg4gDBY+Q1Qgj0jdxzsA6vuB7YSQ==
X-Forefront-Antispam-Report: 
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(82310400026)(23010399003)(376014)(36860700016)(1800799024)(10067099003)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	kN8C46Zzu/Ir5PUeJrYEnsO8wWGkZUPzlJkNZW+3OSLPhC5RMXc/YL02UIq3dbNQnyIX8IxJMimD1mnHBEucjANgKGlwl8K3U/F/NDsHkGTy52dH/iO4Ig2qFCJ4Xs4jWBtxz9YARuAKzFuJpzEJdihE+nRGM2DtniiUNU7+30r0P6QAa9AmYALo94n82WmP3mjuGHJ+FgzfwrZTxTPY4rRl8pdLnvkEkVz9aMyN/g+lw4zWqxsBDj0HGhwvTMQTJ0u8Dl7Lkqiy7GtHutmbQSOO1DWNNmSa4ieUbkbaHfs5nSr8nKmGyM3CkTjy6OQtwxvqNYo+K1MdK7TvmKIMfZM2qIoXbc8TrthTRsR4T00wMD5xg5Mh1GHaRrWoHsgUxb9mLSWiDtXFMpi88wZ7Gi4mjqKcLi2JFXnMw0H1TT69bRLfXPm8LPl19wpFDdgO
X-Exchange-RoutingPolicyChecked: 
	r1GPk4+eoTUoR/2RO64y/9T+t6lbfnnwbdQimpYw8gGEzf20Z1EbG0cqlixhajuBkj5GdmbyAROqYgQkZDLkiTlf9QH5Sl3pZEdC2DzParXRnEGaA04+RIab7Biqj3cdrM4EVCL9wz9dsvQ7pXOElC7e3usp58FyXwGpFK8yYfwAMmQHN2d/IyqSEiJVIbM2vxTHz5KdKILKIPO8akFnC8Pqa9ZqEmRN2vQIvFKstFHdwvydjoeCq9GUTrK8irpF/A/J9l1HM8Xj4VSUFFOxmxZBU2wcqLAFtXEoLI1/rxzeaaP1BjYTTD0YhGBbgYr2hpb6bS8t63cf5X1GK75CFw==
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Aug 2026 13:05:23.2284
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f805b54f-202c-484f-1a8c-08df01e05bc2
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SJ1PEPF000026C4.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH3PPFBA17DA552
X-Authority-Analysis: v=2.4 cv=Ss+gLvO0 c=1 sm=1 tr=0 ts=6a8c4196 cx=c_pps
 a=6zE/HbjXcl5L3wBq6eN3xQ==:117 a=tJyPKKxUohctrY4NYmUjkA==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=Sv0fKeRqtYgA:10 a=Vs-ZokuVWRQA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22 a=taLDd7a_hP9WKsMzeGRc:22
 a=iGHA9ds3AAAA:8 a=sozttTNsAAAA:8 a=Zk6IGOiLmPrgp3wYj1gA:9
 a=nM-MV4yxpKKO9kiQg6Ot:22
X-Proofpoint-GUID: IKKti9kj_9cfwlFrjTq5pPrasikAjFcK
X-Proofpoint-ORIG-GUID: IKKti9kj_9cfwlFrjTq5pPrasikAjFcK
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI0MDExMCBTYWx0ZWRfX8WRVTj0FzOa7
 30DbEJIovzQRPV3rbLv4e+eB/77INa110bdB6qYHfDTSOlCMUgucOqkGTkBiEQgZV40LQHshIFk
 YGnyGlushf7qETzoIDlWR7Wx6VVZDcg=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI0MDExMCBTYWx0ZWRfXwUrvRcPIN3VV
 sa3s7nAwphYQgLEcC13HibRDZzETsR6eKlSBuoQljDhI1Ewrh6zNQ6NIGeP1wA51AAtDXSP341v
 17iRJWfHCfEifp521qyqlMpYhgii2cbJfnLvpgiJ7PU+BuH0b2o5ihjRL9fw5yFwlDCBa+m39aX
 5L8xh0P+d5wymeE294ZFUOOjuS3CclzosWWM5WzGlLnUA3dCuD3Rrqv6dH4JkFMOGKB70WJYtXB
 EvwFl99yi43pFjAYJkVRt5xnQBypMs0gSVQVUA1Ov/I9C9Ux8lc83UCUBwURYG/rfNjCt39/kRz
 59xf1CIR7dj0+JPsz7YIZXMcnsf1J+lcMKZPQzpglxM3P24VouGtkSOaXMr5Szp0e9SFLV4vxtU
 ZBDaPiCZ1cNFotKNaejPVCTAHS9vzl5N3fdwQx+6U23vCHf3pwkVtN3QrYbK/SHZNJrh4T6WmL9
 fpGOx7WYlMFy2yz4EoA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-24_04,2026-08-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 clxscore=1015 priorityscore=1501 phishscore=0
 lowpriorityscore=0 suspectscore=0 bulkscore=0 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608240110
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Mon, 24 Aug 2026 13:05:36 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17606

meta-arago / na / 20260824124337.2611340-1-p-bhagat

PRC Results: FAIL

=========================================================
  check-yocto-patches: PASS
=========================================================
Patches
----------------------------------------
WARN - [master/wrynose][PATCH] recipes-core: arago-core-bundle: Simplify DTB filter for am62dxx
    WARN: Commit message should not include directory path to recipe: recipes-core: arago-core-bundle: Simplify DTB filter for am62dxx.
              recipes-core (COMMIT-MESSAGE-3)
        patch
    
    For details on the above errors/warnings visit: https://lists.yoctoproject.org/g/meta-ti/wiki/40887



=========================================================
  apply-yocto-patch: PASS
=========================================================
master
=====================
Summary:
- Patch Series: [master/wrynose][PATCH] recipes-core: arago-core-bundle: Simplify DTB filter for am62dxx
- Submitter: From: Paresh Bhagat <p-bhagat@ti.com>
- Date: Date: Mon, 24 Aug 2026 18:13:37 +0530
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: a2382be3a1569cf030346f2a65a24103ca6cd32d

Applied to:
- Repository: lcpd-prc-meta-arago
- Base Branch: master-wip
- Commit Author: Ryan Eatmon <reatmon@ti.com>
- Commit Subject: open62541: Update verion to 1.5.6
- Commit SHA: 037e392cf0e0e89c0c8472c328fce21fc217f172

Patches
----------------------------------------
All patches applied

wrynose
=====================
Summary:
- Patch Series: [master/wrynose][PATCH] recipes-core: arago-core-bundle: Simplify DTB filter for am62dxx
- Submitter: From: Paresh Bhagat <p-bhagat@ti.com>
- Date: Date: Mon, 24 Aug 2026 18:13:37 +0530
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: a2382be3a1569cf030346f2a65a24103ca6cd32d

Applied to:
- Repository: lcpd-prc-meta-arago
- Base Branch: wrynose-wip
- Commit Author: Yogesh Hegde <y-hegde@ti.com>
- Commit Subject: systemd: drop 15-eth.network and consolidate eth interfaces in 10-eth.network
- Commit SHA: 90da0eb0b9bac7501af14cc1cf1af73b76432e42

Patches
----------------------------------------
All patches applied



=========================================================
  check-yocto-repo: PASS
=========================================================
master
=====================
PASS

wrynose
=====================
PASS



=========================================================
  yocto-check-layers: FAIL
=========================================================
master - FAIL
=====================

ERROR: Multiple recipes found for mesa-demos
    oe-core/meta/recipes-graphics/mesa/mesa-demos_9.0.0.bb
    meta-arago/meta-arago-distro/recipes-graphics/mesa/mesa-demos_git.bb

wrynose - PASS
=====================
All checks passed




