Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5F833C61DBD
	for <webhook@archiver.kernel.org>; Fri, 28 Aug 2026 05:56:02 +0000 (UTC)
Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.392.1787896557422270718
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 27 Aug 2026 22:55:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=proofpoint-05-2026 header.b=hcuAZjtz;
 dkim=pass header.i=@list.ti.com header.s=selector1 header.b=CC4VGupP;
 spf=pass (domain: list.ti.com, ip: 148.163.150.75, mailfrom: prc@list.ti.com)
Received: from pps.filterd (m0380145.ppops.net [127.0.0.1])
	by m0380145.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 67S20AB9283496;
	Fri, 28 Aug 2026 00:55:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=7IqzGzLMCwPgcMxXk0gI/9m5YP0bHBZVTpRBdzT0S
	/Q=; b=hcuAZjtzIhMNUjC436EPDwGfctGp9Ubh1HxCrZxLMf61p7pOd1Hfaofc4
	TJDigFusL+w3ox1vqHfE6GJbXpm0B9nh8zSTe1ldxwl1HXfy/uksPf9iCB1ZEeM/
	Qosd41YultzQYCU/QqnUlj1ZXA9kslDcN+dv+3Oy7lHPI+HC8XzaOyvghA3eUhXL
	pP0ISCR0CBhaUAnkp3aeqNB9ImQr+uR67VapU+m6R9jywMT4LLude5WkcrE+Q1an
	jPlobuOCNXffN5COUxxUN0OxGul4nWC00HJeWf/N6DvXLa1TAP3nYHeNwcADgOhr
	YprCCzf6vE7N5f14exNS3FKKcF5mw==
Received: from sn4pr2101cu001.outbound.protection.outlook.com (mail-southcentralusazon11012005.outbound.protection.outlook.com [40.93.195.5])
	by m0380145.ppops.net (PPS) with ESMTPS id 4gahg3f5cd-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 28 Aug 2026 00:55:55 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SvWZCZ0479kh0IBnpD42/GnqWzvzQ+yHM6lfcyOrdv5nsny8SHkuUEsZiKiJhfYc2Fq0wGAvjWs/3DBwulgLP4xw37iO83qlXTM+lP//Gp0bBjd57LxX0LlTMYgEnCzKRzUbgqtL/8r/cQHUzx6SKmcYAN08EwNCzDUJt9TuDoe32UcezQWBhFhZIg4KwDnY7e457tHrNlvxcMsJ9BUM6XhYR3eKwhB1f3QqXJteMrnbbLID2+B8cgXG2GaQ25rWKLadK0scWyIVQEN5fA3zxSD1ODQ/Nq18OKB6ffYvdJ7SEGIsl1flEI/sWjoqkPQMOIMAXo2qvy8DVkL4Q50Lfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7IqzGzLMCwPgcMxXk0gI/9m5YP0bHBZVTpRBdzT0S/Q=;
 b=v7w9K230SeM7xBnXE44IWU+E0Ery/we6gEr4JDQLqPFfJ0QtwrzlRNYe//W0h+uTSFHGOY4m4M1lFSEfCjFWivANX8saVjRcRHhZ+LUVMUtQU1g3Ov2I//tCH0IsmpGTcO9yY4yg+vPPtGUmYVJpWyjPO1RZxjHpR8jMG7gIa7WZ+vjrF3lP0wb/+HJZiGxS8m84uOeeEW4MhZUCqqnVcNd3etRUvgtN/w6LM/FXsPMBYdrfiW9zFpO0+My2G9tfmBQC0pmNKhtY/lZkOo/MIG/EozBgzE27lyd3bCJWg+Gbxv7PnehKO1YjZM1UBnmvzgemxNCBQMQK83h5Z2qNJg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7IqzGzLMCwPgcMxXk0gI/9m5YP0bHBZVTpRBdzT0S/Q=;
 b=CC4VGupPBbP945PQ3dJeMwfjPRNKlqcvpYRxUAZp9JUG8vK7vr2uHBoAda9j8QFJJBcjzeNtXsH40gD2n0EQeI8P76V7OKJty3n6ouKZQL2PXSwwjbyxDbImG4UlLCcc07Oz3XUjuHfPYTV8cntR25ehuxcj7mRiBbIQ9PrAtjTGE3+C4J/Zrn7fDHZ9Sj590EinLjYvTsl2TwpzUhcBPVba+SNLtYz3Yw5326rCXXMpDszeVgLdhtKA4IfkzLGEgTR+oMAuJKgiG3GRv6L1yKm/zYFDFAtdvTXeGBDoBNefqEKRaph8SPwSR0/9Qe9BLl2HnbAecUATeBkL33a6lQ==
Received: from CH0PR03CA0021.namprd03.prod.outlook.com (2603:10b6:610:b0::26)
 by SN7PR10MB6644.namprd10.prod.outlook.com (2603:10b6:806:2af::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.382.7; Fri, 28 Aug
 2026 05:55:52 +0000
Received: from CH3PEPF0000000D.namprd04.prod.outlook.com
 (2603:10b6:610:b0:cafe::7e) by CH0PR03CA0021.outlook.office365.com
 (2603:10b6:610:b0::26) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.360.10 via Frontend Transport; Fri,
 28 Aug 2026 05:55:52 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 CH3PEPF0000000D.mail.protection.outlook.com (10.167.244.43) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.360.3 via Frontend Transport; Fri, 28 Aug 2026 05:55:52 +0000
Received: from DLEE213.ent.ti.com (157.170.170.116) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Fri, 28 Aug
 2026 00:55:52 -0500
Received: from DLEE207.ent.ti.com (157.170.170.95) by DLEE213.ent.ti.com
 (157.170.170.116) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Fri, 28 Aug
 2026 00:55:51 -0500
Received: from fllvem-mr07.itg.ti.com (10.64.41.89) by DLEE207.ent.ti.com
 (157.170.170.95) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Fri, 28 Aug 2026 00:55:51 -0500
Received: from fllvdckhpci031.itg.ti.com (fllvdckhpci031.itg.ti.com [10.64.72.41])
	by fllvem-mr07.itg.ti.com (8.18.1/8.18.1) with ESMTP id 67S5tpWn1681877;
	Fri, 28 Aug 2026 00:55:51 -0500
Received: by fllvdckhpci031.itg.ti.com (Postfix, from userid 60899)
	id B8F4E137CE1; Fri, 28 Aug 2026 00:55:51 -0500 (CDT)
From: PRC Automation <prc@list.ti.com>
To: Hari Prasath Gujulan Elango <gehariprasath@ti.com>
CC: <reatmon@ti.com>, <afd@ti.com>, <praneeth@ti.com>, <denys@konsulko.com>,
        <meta-arago@lists.yoctoproject.org>, <s-kapoor@ti.com>,
        <p-gupta5@ti.com>, <u-kumar1@ti.com>
Subject: Re: [meta-ti][scarthgap][PATCH 1/2] ti-vendor-kernel-headers: add recipe for TI-only dma-heap.h ioctl
Date: Fri, 28 Aug 2026 00:55:51 -0500
Message-ID: <20260828055551.3604033-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20260828055034.1106316-1-gehariprasath@ti.com>
References: <20260828055034.1106316-1-gehariprasath@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PEPF0000000D:EE_|SN7PR10MB6644:EE_
X-MS-Office365-Filtering-Correlation-Id: e57d0270-2bc1-4e84-8b3e-08df04c904c0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|23010399003|82310400026|36860700016|376014|1800799024|56012099006|10067099003|6133799003|22082099003|18002099003|13003099007;
X-Microsoft-Antispam-Message-Info: 
	U51yLREoc15uhrtn0DgEwBD+4h3NYj1zzpbNc8BQqc/OLsKsrzalYoCn0NC3OQeodomRG27IDUb5XwdRNrT9fV4LDLVB747vyZp3WHLoy8CR4cnOBOLx+fn2rQpe8H0tpAW1eh2BUTTN9PfgPA/TJuVIC3XpAUPnj3vdGU9hLnbpmroxmibsHZYusNEDB/YHjch1bdFgxI0WZWD9l+inLT2F6WpbYc/TD73Sv0YfxLRANV+XhYS+B5+yZJKfN+7aB2g/atXy1v5//S86kKGc2Q8Y8kLoL3CbVN87y287tQYrbkZvgFMkV8bw6xhhsG4dVZlDB0A6iSjhMVetfIuNONpCeoA+eM/rjXWBfHiNawCoP8dDZ1E8vG4vVvPT6VoRp3idoHGrNFKqVCZlqbultqMfSBBC1PC/zeUeSchgtYXkCiYOycYHsj1Ld4VpJRSKIkCI9fQAhFLsTOx90nJU5wuPhbDZStfKTfnhYDz0Em+8qVDSLb7OhrMIVm51q/KnvfAoU93tNXWo4/Hbyu2n9xG9C2KSBXshGZpK5jxgST6FABJgeuDHnHBriaohWDpKd80pElpfiFvmhckiqUH9KLyqi7zuiMYrMk+KDU8sNial8jlLu7/YAY4SFCAZ813IFW12BmgamVy1+IEA9XP3Tw==
X-Forefront-Antispam-Report: 
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(82310400026)(36860700016)(376014)(1800799024)(56012099006)(10067099003)(6133799003)(22082099003)(18002099003)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	snBdnnQ1Uryiry+xCsw8dy/tx/TfsAJvA1k2UuKZtFApevu3osjENgupH8xZCM0MTB/IAzx+TD+bmNUBhVVOiU7YUTiV5F7uTLRDAqP3Yt4nLhUwfIhu1VXeYA5oV23fnpmhDuozpwU7oPGt5gooPnKWLb+49+xEa8oZbg4LR8TZc9O2iky+i9MnRak/1FO0v0MFhwbX4kr/AIkEWWCuZSO4iiIOs1c7TWVlPnx/IDSpjdsX3YDRPZUdJMXl/Z5cXRqgHot4gdQC5ZvBIBTFkPJlffTs3591a/7bvxz82GL+5Mm4GNVO0R29z3bI1vu8FJdzvZleQh8vJsY+0Shw00W9Nn8bGqcBZ0/m5VGzli0tpe8QGpslc0r26Ajr/904cwMI5A5z+LDGRRPpGTXfFhNXEibc/ZKJ0MkL9OgPlMpaEKpwTVPaKNrBPucXslIC
X-Exchange-RoutingPolicyChecked: 
	zkgHQwn1Ib/9RWnG18KzU1FxbSwxf41wxKdSpVAJaGf0e0UtvUvoOgN03PJjo6Ed00elHkSf9PWqjzl/4/81qWDGRZWA2gSBvY1Cc3lSIpCbu+CilCm5plZ8+8Z57HcdqzjN2tWFFCrf+dELBVY+DaNHfCoir7USWKl3OMTFda3m9ILSFir3i4OVKDJG4y6XSE9f/7xBtn6e3TJ3vvpZPj1u1porMYZAzjS6GCHraZVvP+kFwtV/4qK1BxaJNMr/E9WFT2/AqQFuMq7VAfWjxwP/8Z/4xXbAg8hQfxhpM3d0P8U28vDa/VPjB0inaaKKkNDHa0ySm4/z8cmRvqsKSw==
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Aug 2026 05:55:52.3585
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e57d0270-2bc1-4e84-8b3e-08df04c904c0
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CH3PEPF0000000D.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR10MB6644
X-Proofpoint-GUID: yyk8z6mU8Snaj0Fzn5S6eU3qa_WWwHvw
X-Authority-Analysis: v=2.4 cv=M4597Sws c=1 sm=1 tr=0 ts=6a9122eb cx=c_pps
 a=Wms0yhV2hyGqr6ZNmSx9tw==:117 a=f+v6EHfkeJbVwR46tk4DMg==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=Sv0fKeRqtYgA:10 a=s63m1ICgrNkA:10
 a=Vs-ZokuVWRQA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=gO1vWkAQAl3rybz1DQOp:22 a=iGHA9ds3AAAA:8 a=sozttTNsAAAA:8
 a=UVL9wXhN6NU4wXYN2roA:9 a=nM-MV4yxpKKO9kiQg6Ot:22
X-Proofpoint-ORIG-GUID: yyk8z6mU8Snaj0Fzn5S6eU3qa_WWwHvw
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI4MDA0OSBTYWx0ZWRfXz2kY8BoyOB6y
 HmIgWPIpR78YQOj5OvWRun4XUnrwSFAqVaJSbsiWIF4odCp5wxsq/HkdXMS4Ys4o3AxFS4X5s6N
 dD6LtSFq8LKUTOMHZ3rdh8qXycE1VNovfvmeISmS/yozZzhpL5TzE17zPyn/gjpybHism44J2ZY
 UnJiD71RD0H8NEOnt0FjdvtBuDNCD4RSBEAn7ysHq1QaihITrLaqhk3oEfGw5IySFm8ZvPJF4VF
 wK1Mj3DJ7SlA+YS3J8sz0vLmtG5VAGCXCw3Gv4tCPfJucHvvGvynugagGyEFmdDSjgnmbBioVAm
 3xoUjYop8FR/FufibigjOe0iKHLO8iUNugIlzEQJe/GYaWcv/tYYY5p6cwLcfWTZ+lqEG5oCx2g
 jPGimu3Ngu4BjebdG1/l4k/kWgtdUBQFA20wLXSx1OBMKDvwvMQtPwdwQb/uJgdONnz91N0GVS+
 stgavNhy6QhXlPZM1zw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI4MDA0OSBTYWx0ZWRfXzfTGqp5PM0np
 RYAycH3sIInM68f7ZA/Q+z4rtMKVvJjTqI/XaKNvA9UPUEsOuJyIUwMXtpSIz1by4b16keY/yU7
 jyuns69pvNxjUNrRKM+VlN6r/zvyXJY=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-28_01,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 impostorscore=0 spamscore=0 clxscore=1015
 bulkscore=0 priorityscore=1501 phishscore=0 suspectscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608280049
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Fri, 28 Aug 2026 05:56:02 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17615

meta-arago / na / 20260828055034.1106316-1-gehariprasath

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
scarthgap
=====================
Summary:
- Patch Series: [meta-ti][scarthgap][PATCH 1/2] ti-vendor-kernel-headers: add recipe for TI-only dma-heap.h ioctl
- Submitter: From: Hari Prasath Gujulan Elango <gehariprasath@ti.com>
- Date: Date: Fri, 28 Aug 2026 11:20:33 +0530
- Num Patches: 2
- Mailing List (public inbox) Commit SHA: 1edab4bb624176409468e5b5850b8033bcff7cd2

Applied to:
- Repository: lcpd-prc-meta-arago
- Base Branch: scarthgap-wip
- Commit Author: Ryan Eatmon <reatmon@ti.com>
- Commit Subject: libyang: Fix CVE-2026-41401
- Commit SHA: 73ab0405254988a501b849d221acf5f468cb8997

Patches
----------------------------------------
All patches applied



=========================================================
  check-yocto-repo: FAIL
=========================================================
scarthgap
=====================
FAIL
    ERROR: Patch is not referenced in any recipe. (REPO-1)
        meta-arago-extras/recipes-connectivity/hostap/hostap-daemon-wl18xx/0001-hostapd-change-conf-file-for-better-oob-startup.patch
    
    ERROR: Patch is not referenced in any recipe. (REPO-1)
        meta-arago-extras/recipes-connectivity/open62541/open62541/0001-CMakeLists-do-not-install-git-directories.patch
    
    ERROR: Patch is not referenced in any recipe. (REPO-1)
        meta-arago-extras/recipes-connectivity/open62541/open62541/0001-tests-fix-typing-of-size_t-in-printf.patch
    
    ERROR: Patch is not referenced in any recipe. (REPO-1)
        meta-arago-extras/recipes-devtools/abseil-cpp/abseil-cpp/0001-absl-always-use-asm-sgidefs.h.patch
    
    ERROR: Patch is not referenced in any recipe. (REPO-1)
        meta-arago-extras/recipes-devtools/abseil-cpp/abseil-cpp/0002-Remove-maes-option-from-cross-compilation.patch
    
    ERROR: Patch is not referenced in any recipe. (REPO-1)
        meta-arago-extras/recipes-devtools/abseil-cpp/abseil-cpp/0003-Remove-neon-option-from-cross-compilation.patch
    
    ERROR: Patch is not referenced in any recipe. (REPO-1)
        meta-arago-extras/recipes-extended/sysrepo/libyang/CVE-2026-41401.patch
    
    For details on the above errors/warnings visit: https://lists.yoctoproject.org/g/meta-ti/wiki/40887




