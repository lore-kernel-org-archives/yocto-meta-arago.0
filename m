Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 629F5C624D6
	for <webhook@archiver.kernel.org>; Wed,  2 Sep 2026 13:47:39 +0000 (UTC)
Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.13354.1788356856039994698
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 02 Sep 2026 06:47:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=proofpoint-05-2026 header.b=YcoEqO0b;
 dkim=pass header.i=@list.ti.com header.s=selector1 header.b=I7B4c7kl;
 spf=pass (domain: list.ti.com, ip: 148.163.150.75, mailfrom: prc@list.ti.com)
Received: from pps.filterd (m0384305.ppops.net [127.0.0.1])
	by m0384305.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 682CV3S3974134;
	Wed, 2 Sep 2026 08:47:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=o4BVV4AnSS3OAqW1M0m/C8XmNpqmamYQmh9p8kmfx
	54=; b=YcoEqO0b2p9lEWCvkJ/7S/0xwBTb0ffXUO6ZyFVPd1fcdyDUjKyzrbsz3
	S5B3/1MKHnKQSC2Mp5PVpvAhv4STbntN5M+iy/53rMVN1FFOOt+pyxyUl0qHWhrL
	dHV8PrxVvBdJ9CoHLsysZYl1227TAuSv0F1VHB6hcna9MkLBRDsffjoGEr/s/PKw
	jsbf1jmSMvHScZZsEGpiC4JuZK0SeXz9/zdenDg/a5PzXJSt2kvVunUDZRi8uF4O
	cOEpvUvn7e8GZShVUCYejxFXsbsVmGK4frwncUFTtAGwCPCmEJLvsb8QAcW4ThXP
	yGtuxq16ZfP2+nDsThRGwJj9W4BEA==
Received: from mw6pr02cu001.outbound.protection.outlook.com (mail-westus2azon11012033.outbound.protection.outlook.com [52.101.48.33])
	by m0384305.ppops.net (PPS) with ESMTPS id 4ge7cgce7f-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 02 Sep 2026 08:47:34 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EjBNc260NF/duXpCYA0HYn2kiBt2WOJYZWVngaiI5o65t7gKzKMwfiiWIQglNUNXL5c2xvIqmvwqTch23UNugy/X4Hpa4oxhIKPb5PMh43OnH+H1IbRj4rmSQDMgi3hrHY5ftRcbHn0AmtHOrRbQKDLHBktaNTVUoyDCQvTlhGNaH4IiSBhO8fpoScz7WYUYL26Vd1eBFatf6xh4t0S154WeLui9cgBV4wsC2/dmkkqIcrOsP7wtvjkOVg1Ej9sIXkWdmAMlab9yrI9JVJI5cl1TRvTgGzClOpZkeSbWiJJn3RN2BDqtLW3KnY9Ejv98kiD4doIJFDD6XVz66UUtGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=o4BVV4AnSS3OAqW1M0m/C8XmNpqmamYQmh9p8kmfx54=;
 b=yJhKf+qxTgSuluTBKfR7babGLYQBKwW5RQ2/Uad/fcmq+WOY9GZNmy4Qq0DCQtSkynKm2sqSIz5N2wDyX4C/gpKCIqThDMs186dzQRQuArqaseWQRrKPx2C0IhtU23t6HUuj4pvFqbyG3fYtJvA0IalPSbrOm03EB2hHzi2Ne78VXSjsi1VYur0QA+dKzwwf24luTT9tZ7kyK6tmI22TAHsjYPyXctt+IGAq0jP4pSCjSCVFuMEkCbITltzxQuqfUK5P9J1HJnRB0gIuEKwmFr13qXnOsmuUIjwk99B1NufDbkSin6nom0cWUZ8Mt1DVa4dHLm8DPCkWiw46OAb12g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=o4BVV4AnSS3OAqW1M0m/C8XmNpqmamYQmh9p8kmfx54=;
 b=I7B4c7klrY16EZ2DbuCPhN1VUB4Wzfy7X3/pg9OIkxscLns2BN8qiLJGfD6GGawzwv7yVCPqgMDF1olzPiHbZzXr+nxpcNYQilxYvKLjzaGlRcLvBePKzAomPdlMBoLY9NfNs36zVHs6X80TF42kqQqud11snXfyeDLwasMKwGKg4kNGUUYQakz41XZ4snbRwscbV+K8Nepp8/Uz0DMw2P3Uh9U/sksELVDypKAUxTZ//epJlgm7f6+YLF4mMXrsTffH3bpKSB2Osn7vIXtOwjCV2uU95OAmM/96UDQJ5nwawrsL5C+lKotY0zzW6MWBf0BSZQjIu5xGtq2rHUO72g==
Received: from CH2PR02CA0026.namprd02.prod.outlook.com (2603:10b6:610:4e::36)
 by BN0PR10MB5206.namprd10.prod.outlook.com (2603:10b6:408:127::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.382.10; Wed, 2 Sep
 2026 13:47:28 +0000
Received: from DS3PEPF000099DB.namprd04.prod.outlook.com
 (2603:10b6:610:4e:cafe::f) by CH2PR02CA0026.outlook.office365.com
 (2603:10b6:610:4e::36) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.382.11 via Frontend Transport; Wed, 2
 Sep 2026 13:47:28 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 DS3PEPF000099DB.mail.protection.outlook.com (10.167.17.197) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.382.8 via Frontend Transport; Wed, 2 Sep 2026 13:47:26 +0000
Received: from DFLE208.ent.ti.com (10.64.6.66) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 2 Sep
 2026 08:46:26 -0500
Received: from DFLE202.ent.ti.com (10.64.6.60) by DFLE208.ent.ti.com
 (10.64.6.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 2 Sep
 2026 08:46:25 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE202.ent.ti.com
 (10.64.6.60) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Wed, 2 Sep 2026 08:46:25 -0500
Received: from fllvdckhpci031.itg.ti.com (fllvdckhpci031.itg.ti.com [10.64.72.41])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 682DkPc5705095;
	Wed, 2 Sep 2026 08:46:25 -0500
Received: by fllvdckhpci031.itg.ti.com (Postfix, from userid 60899)
	id 55547181228; Wed,  2 Sep 2026 08:46:25 -0500 (CDT)
From: PRC Automation <prc@list.ti.com>
To: Moteen Shah <m-shah@ti.com>
CC: <meta-arago@lists.yoctoproject.org>, <reatmon@ti.com>, <u-kumar1@ti.com>,
        <s-vadapalli@ti.com>, <a-limaye@ti.com>, <gehariprasath@ti.com>,
        <denys@konsulko.com>
Subject: Re: [meta-arago][scarthgap][PATCH] recipes-core/images: Build ti-core-initramfs alongside tisdk images
Date: Wed, 2 Sep 2026 08:46:25 -0500
Message-ID: <20260902134625.3999932-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20260902134255.2136663-1-m-shah@ti.com>
References: <20260902134255.2136663-1-m-shah@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS3PEPF000099DB:EE_|BN0PR10MB5206:EE_
X-MS-Office365-Filtering-Correlation-Id: 98197b84-8899-4bc9-a365-08df08f8b94d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|376014|23010399003|82310400026|36860700016|10067099003|56012099006|6133799003|22082099003|18002099003|13003099007;
X-Microsoft-Antispam-Message-Info: 
	SVBuz3HVNT93YwGxcvL3WrgkHJbi61hg05yJJ9drZs72jZTPRincIiGytpXpPy3MyScJdvzcCr7msczaIU26jD5hkXq4Tr1/MkaZZse/TrkdRnYeLfY1vNl+VOfDk/3Heg9jGgTJLUSFV9b9CwiSmy+OqRrDNhfpRqVtxBhpChZ/DGy2dCjPFfCuRL7ZpPFOE5OdBONIzq5HRKO1DWRe0qApI2o6nWGHmpWr1r3V2NYcsacLx4J/R/VUykiL4jC7Gh46jLbyRC5HbLIQ8ZEOTFrC28WH37smCYk7k3v+UmOnPadWcCFDuxl04FnYiEpT8bGnfXbZOQ6poahcrig3v9OkotzWmqbGiYOCCM6lLUMJZ6SlX/90nQCHESF+/j1hB3yqjjBEMUBB8O2/lpKuFcnWXpNcIqbcMbiVf7hUdbOEHVSC3048B+H0eB8bFvn5uDlM9S5hiU6PkMGRzX6yXNif0gtDizqWtXklU6T4/io2Pv5Kvp/63oguAXgmEF4c1zG6jo8ICz9n4BAP41Nwa8doW4x0CqKRNE2EnbzYLD3F7cBoUWaV6c26DzRQSb9JwAXj9dm5Ql9MQgmc3H5N+EAkA+o5ewX27VRubiuTl/ib9xCv+nflD5PmBnFoAS549cIfDk3kThPqfHKadOzU1A==
X-Forefront-Antispam-Report: 
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(1800799024)(376014)(23010399003)(82310400026)(36860700016)(10067099003)(56012099006)(6133799003)(22082099003)(18002099003)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	dK87t+wBpVntFq9NpGkEx45JdgOA/K8S/XOMhzj1g6LiMk/mf/5TgOp8Z0AilqEwWbYYn8yrdcKe3mleWHRGprvgKuAqs4LOIo9QlDZBZDs21ciNkPp+6/e12DETyhPQstkb3OTEzCHJEShyo/MhVtj0Pik4bhzyungI7Hbszvh+Vn2vdempVmRcSznGcRxpnyvah518xjyBT5RlXU1ZB8AEHXTD+/RIuNWnO2Nl4bv+xVuSFyIuzITiXYriWAwmy2BptuQOE+br1C9qoIVZtAQ6kgKZYPVPa6GEVaJUr5MtnvyaifIWChDosT/eLaQPhIc+KvU7Sw3jx9vZYgHFdaA32nhKr+5TrVc8a9gzm42/6yslLhUfDRN8RtHQYdGDGBzPurMR3X5vfyT6WFvDsQ6qf+aAqqqZAryLMER+RhI3wfUPhMODEg4kBtI1ww2O
X-Exchange-RoutingPolicyChecked: 
	yw3hwvB7fieNVLE5e4P4Abno+/DiUzpmmBBXdFBR3s2i4sX/CIZV3imPfL7rLli0nCsI9i9NQUhWbjnks1+YQCfOafWqd04ZyI0b4LA+G2WvbhkvLm31ifPQO7CvAprDwWmafvpNPW5x/MorYj8hkj2cjDfG5yFLkF65j0H9DjkrqPfcJ0YtHsqN3zZeOU9B/qHGUdmWpnfshrIMu2x+7Z6Whd6QcPl9ztmVdNbgLBk3OTESGRDN9sgQ9Pb1sQHkbX6ZGKGCneILujpjbqIrx/pr4kks5SbzeDeVhWJo7CJIa18zGS0HdfyvYf5NJTMvnn1oCINbGPSe0xJVKKYwmA==
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Sep 2026 13:47:26.2648
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 98197b84-8899-4bc9-a365-08df08f8b94d
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DS3PEPF000099DB.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN0PR10MB5206
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAyMDEyMiBTYWx0ZWRfX0Gs5YZ57mijT
 rlhXPGWqJ08IyV84mS8/Lvn9OKdgnq092QqH8/2P467wjz2oDwNs0Rap7TORmhoPp6auSE+ZDyV
 dNjda7h+8EYsS65De6ztIYpMf+EBN84=
X-Authority-Analysis: v=2.4 cv=Ka3idwYD c=1 sm=1 tr=0 ts=6a9828f6 cx=c_pps
 a=Pvk2fBMKoGc+EtVHRePnOw==:117 a=iwqwCZQqcuTv3JOpYdM7/Q==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=VdqzKS8jKosA:10 a=Vs-ZokuVWRQA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22 a=taLDd7a_hP9WKsMzeGRc:22
 a=iGHA9ds3AAAA:8 a=sozttTNsAAAA:8 a=UVL9wXhN6NU4wXYN2roA:9
 a=nM-MV4yxpKKO9kiQg6Ot:22
X-Proofpoint-ORIG-GUID: 4QLpG37P91bckZF8sCmJ9JDLF49dqKiN
X-Proofpoint-GUID: 4QLpG37P91bckZF8sCmJ9JDLF49dqKiN
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAyMDEyMiBTYWx0ZWRfX/x4sNXElBrMG
 qBUzgythWViNGMwrvRuwwk1uW/13bKB/kPczbtpjv8qqFIr9wBhTiasd+RU/9axWyaIwNuT5CK3
 GmcBdWSLONju2cHaVrIq8ddgQac6pbkoJP4oWlhu4u4kRTTHDp3jKZGLMH/gviKGJrqrV/CKbwI
 gi5ICcfNWm1xIknIawr8OShFMK9v6u2AvMHLC107Wnb6GjtJPyRJysDP4NZEs4W9SU8U9QIxhvD
 COroC9hNgp4OEpLqMmljjH3yxvsUvP8YHNlD4XAsLB+BY4fI0alwSAb8LWdwlndWB+Aq2yyXfSV
 Ou4kRZufgsrpOcamD1EPNUP+Tn8uDGkIEmlmCkZ/LbjjNUtFvihfhg4adsmJ6RucTus8R+0sfUB
 k6sugy9rCpOPrQPGfUnHG4kZerr/5oXnoO/7tTgYt+xzijCukrtw9ZuzabfXGoHfGNH52Gw40qw
 HN9IBFzHNduzeFkSs3Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-02_03,2026-09-01_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 clxscore=1015 bulkscore=0 suspectscore=0
 malwarescore=0 spamscore=0 adultscore=0 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609020122
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Wed, 02 Sep 2026 13:47:39 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17647

meta-arago / na / 20260902134255.2136663-1-m-shah

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
- Patch Series: [meta-arago][scarthgap][PATCH] recipes-core/images: Build ti-core-initramfs alongside tisdk images
- Submitter: From: Moteen Shah <m-shah@ti.com>
- Date: Date: Wed, 2 Sep 2026 19:12:55 +0530
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: 880a7e38030f3cb34d3e02e642104de69d7b9f43

Applied to:
- Repository: lcpd-prc-meta-arago
- Base Branch: scarthgap-wip
- Commit Author: Yogesh Hegde <y-hegde@ti.com>
- Commit Subject: websocketd: update to main branch
- Commit SHA: dd1b7f9b85c093931f3eed954d28eb6f52e271c1

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




