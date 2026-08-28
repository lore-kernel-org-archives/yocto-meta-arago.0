Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8264DC61DB9
	for <webhook@archiver.kernel.org>; Fri, 28 Aug 2026 08:16:34 +0000 (UTC)
Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1691.1787904991873205615
 for <meta-arago@lists.yoctoproject.org>;
 Fri, 28 Aug 2026 01:16:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=proofpoint-05-2026 header.b=K2BW6+8S;
 dkim=pass header.i=@list.ti.com header.s=selector1 header.b=bDDbDNCd;
 spf=pass (domain: list.ti.com, ip: 148.163.150.75, mailfrom: prc@list.ti.com)
Received: from pps.filterd (m0380145.ppops.net [127.0.0.1])
	by m0380145.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 67S72K91871137;
	Fri, 28 Aug 2026 03:16:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=ktLWSTIV29gHfL49uRtAbvHESH2WPuUgf5ioZXqZ5
	ZA=; b=K2BW6+8S/gROqAhkcS9fFl2z/Ba1Gcqzjanlzxw1zKxpcVTy7MB9N/cQg
	nZehyHehgY7u5MuCIGhEnYaVzQ/TfAqNbbf6fnqHQ+e3wEPRtrLkvefjgJn3l2BV
	HlkxWP417onKDnZJeee2DZJH7rSxbXooA0jTZlIeQfIs6JTtVvTgI6lZGHNKfqJF
	eOB8m60TF+xoFDRJq+EUuswpOQkQA9gJD4DDXWt4A7Hr88ZdhBc7+HDDm8u/MCon
	JLKgZg2X0L43g5KBfXtBvGW6qrnt85h6QqRqxpgLlkRvpQQP1kFx6b2gB4vRZX+9
	zNyB90NmBOJM81JCAuHLwN5AOu1/A==
Received: from dm1pr04cu001.outbound.protection.outlook.com (mail-centralusazon11010066.outbound.protection.outlook.com [52.101.61.66])
	by m0380145.ppops.net (PPS) with ESMTPS id 4gb5kdgc52-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 28 Aug 2026 03:16:30 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mMCF9SnTlptHA2Qtqhpvawo3ehjv2qZsl+LDPG92UZx0ttGRHzH8gzW79tIr2ZEprMGYCfbEjoln6gi4M3rzTj3PKqyTAvctXdCYh05Suv4QH4SzeZfBXqDKwTSeK7kRStIYCljOzVGH/U1Ga2WrE3iWgpby52E7ST2MZoRXM+DkJh2W8bVPouwU9gGZkHdclTn2LbHVXQVj3vFGAwbQ+rTwLYOCr+1RF7pRIldLvFl3ib2l9NU36stz7fsmtKSS7KS9rk0ZYZjRBaos3qdcr6cyt0HPDg2LGlfrJIHUsh30BAdQOzKW5+i1iqD39sYEmkR97T845TmhbqHS8jCciw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ktLWSTIV29gHfL49uRtAbvHESH2WPuUgf5ioZXqZ5ZA=;
 b=npLWIKbYRxZCh5EoGu9CgrM/rhXOyPZ0u5ndJ+3LQuqIrUOqsJRGr11hK7qE5MSKwa8l7+i+LUqDJpq05736z0a2mmZY39G6ftoZd9kyPhRmEDKgb4uK4VJCRsL8nFiRsYsA1sZPmimnUG3dHxs0Dqv3I6qDx7PsQus98zjqm6dnjKvn88EI+xrtDRVF3gIXao2oT7FgiWlHxI0B+0bJTTomVxsvgqGYPRHprIny9w/YuzZuXnxCJa2mKwWsnIue9vJy0zQo0o34gmcCXGQpZGbCwPi+Y6d3DKPoaqtsTeyVva2sYwl7gGk0EbtGNZ6tDqQpugUQ9QlmtJMwKBkzPw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ktLWSTIV29gHfL49uRtAbvHESH2WPuUgf5ioZXqZ5ZA=;
 b=bDDbDNCd8RmHDAaIvs9WpriK/EVpUjLkNb9T1/lXhlKOGRx4VkKVQ0sZqP6ki6wJJ04o5W8UNpyGpA/V5kGWk03B36OjOxJ1Dfo7Yu4tArCRTMM+oMHNcKeu4ucrWyWuNZZCWVw4d8iYd/emNaUMcY2PqoGcyV0HJ+Dpj3EitQiedrkdKj0Fg6PZO08pcK8dbz05m3uIpwYPw28tZsc1rxYQudCBtDoGvjjXTtVnFaI6UIjNNIHSgGbnNnf17HRthSgfZaKeh/decijEVDtZZpd2a7b+CqXGi1SBkGC0FCHkFSpjxyQ9M8YfEwEAR0LcSJE2ya2pWaFXag32syjHtA==
Received: from BY3PR10CA0030.namprd10.prod.outlook.com (2603:10b6:a03:255::35)
 by SA2PR10MB4617.namprd10.prod.outlook.com (2603:10b6:806:118::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.382.8; Fri, 28 Aug
 2026 08:16:27 +0000
Received: from CO1PEPF000075EE.namprd03.prod.outlook.com
 (2603:10b6:a03:255:cafe::22) by BY3PR10CA0030.outlook.office365.com
 (2603:10b6:a03:255::35) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.360.11 via Frontend Transport; Fri,
 28 Aug 2026 08:16:27 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 CO1PEPF000075EE.mail.protection.outlook.com (10.167.249.37) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.382.8 via Frontend Transport; Fri, 28 Aug 2026 08:16:26 +0000
Received: from DLEE207.ent.ti.com (157.170.170.95) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Fri, 28 Aug
 2026 03:16:04 -0500
Received: from DLEE200.ent.ti.com (157.170.170.75) by DLEE207.ent.ti.com
 (157.170.170.95) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Fri, 28 Aug
 2026 03:16:04 -0500
Received: from fllvem-mr07.itg.ti.com (10.64.41.89) by DLEE200.ent.ti.com
 (157.170.170.75) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Fri, 28 Aug 2026 03:16:04 -0500
Received: from fllvdckhpci031.itg.ti.com (fllvdckhpci031.itg.ti.com [10.64.72.41])
	by fllvem-mr07.itg.ti.com (8.18.1/8.18.1) with ESMTP id 67S8G4Ed1795397;
	Fri, 28 Aug 2026 03:16:04 -0500
Received: by fllvdckhpci031.itg.ti.com (Postfix, from userid 60899)
	id 8393B9ACF4; Fri, 28 Aug 2026 03:16:04 -0500 (CDT)
From: PRC Automation <prc@list.ti.com>
To: Hari Prasath Gujulan Elango <gehariprasath@ti.com>
CC: <reatmon@ti.com>, <afd@ti.com>, <praneeth@ti.com>, <denys@konsulko.com>,
        <meta-arago@lists.yoctoproject.org>, <s-kapoor@ti.com>,
        <p-gupta5@ti.com>, <u-kumar1@ti.com>
Subject: Re: [meta-arago][scarthgap][PATCH] tisdk-default-image: add ti-vendor-kernel-headers-dev to DEVTOOLS
Date: Fri, 28 Aug 2026 03:16:04 -0500
Message-ID: <20260828081604.3632941-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20260828080918.1161144-1-gehariprasath@ti.com>
References: <20260828080918.1161144-1-gehariprasath@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000075EE:EE_|SA2PR10MB4617:EE_
X-MS-Office365-Filtering-Correlation-Id: ab5f2acc-a46c-493b-54f4-08df04dca7e0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|82310400026|1800799024|23010399003|36860700016|10067099003|56012099006|6133799003|22082099003|18002099003|13003099007;
X-Microsoft-Antispam-Message-Info: 
	tyVJIfD4mohfaRMxCqfq4svHVGuOeEZv220Rw+JFbJytcXYzL0xDtLwwtnbuhqPgG/u+ADgYIcqyVmyAWEl4J73QUphNZ3+1/aEom8INh1sZ075abzw+8oFZyE2/yHlO1IkKhXp3wVO5uNOEYwx3dIKUrTHqwoEZZ4wtrCGQ8YQnxq7768s6D73n8rcTsD6uRYdKN29+okcgXNjdPB1sizG2LK2sMgTzvuFGsB1N6Zcap/B482GOyA9LSC0II/+UmyyVR57q3BwYHXJNEauZZai6ogEEmqACq7VnPH4V0a3gQ5uaA3qQjsqcMMwWAGjNKMC2sxljHVZ7nPN/o/elqXKjRWlWVqNAY4aLVpme8SLZ05im7gObKiTkNUow1pi1cmArhk/Mbha0UsEMstCOENS2mSDW2E26EZhW69z/fCyz+2RKu7jd8n7PQ/Tmvxyo1qTiHHtSHO8SAq59+r+MNFQAwWpZNHrR8/O9fBzvDW7rdkNzhpzwiuT59koQSt2maI+ISWci5OCdIcvinP3nkM5ButfJKiVoIBq7rzuzTwh8XgZGOqPez6QxX821CKFB1LoycMkkb91cCpVFyLb7vfV2TVtbA4F4WnzsFXwQSL41hvhFgnUooKCRgh0RAuPa3sOh4rwm+5nIUbvZtyvvqw==
X-Forefront-Antispam-Report: 
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(1800799024)(23010399003)(36860700016)(10067099003)(56012099006)(6133799003)(22082099003)(18002099003)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	d6F7YaqDf1drC2nQ45pk2bOVa6/X0rrvUBDa267rm/fuNb5mgaRWvUd1sH84jQqLXUHukHZI8fJwCgk11wTtw3ZtH181WAIr73uONylavkGetArnF7bCrBCuJAKW94xdzmE2CS7Q4l9tlYRN5hFaUKRqSBW8AthgGKiWrb5nkjcyUFpNcELJ9qy4oXg1QTUSc5GESCaco8tQv5Xe2CScnp/2Jd35SEsR7c7u94P8Ibao/vD0pkdyMTF4u1xoPPh++Q7lnnfavb4eAZzD7mVl1ZL+Qm3YZz68BCb1EFCaHtS37tgmqppG9U996DcUb8N4aWLEk15WwIAukXymPK5OT836nCaBveVry7A0WhG76Rsxw05i8zvMD7IWc7PSUK8fiUqdJg7Pvi6nsw+BlZgu2n7f0nmS4OUHW3tnXBpxoR7WjZ5ol2X5m6r7FvV9Rf3D
X-Exchange-RoutingPolicyChecked: 
	4CYwyjLwGTotghgMRF7W2ZDGosbOixbKDGBnySMaQL97VTmMZWehdEYaR05t/yJIYVkSONDIstu4d96egJho+Oz4LF0bheNTqil4yw3wZMMYARVa1JM+PODz5U/PuRkfLo4vbQ9+deFSqGQYAswnf6qotQGszsJlalKiv8bhkIcr1Rszi5Kylg8ENlN7uOM/WMlHw9RhH2C2nh7Iqj7dYjaGAdvDo/8yrax3a85a00TlE/WWrpkNKyEntPTIxlOHeiM31NyCtJXTB50zntBfjzAN4MDYQntrf9lRAFUMUO/EEQoSmT9EuPgoYB0nKT61NdJyO9eDEw+slKSx2pxLsA==
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Aug 2026 08:16:26.4365
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ab5f2acc-a46c-493b-54f4-08df04dca7e0
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CO1PEPF000075EE.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR10MB4617
X-Proofpoint-ORIG-GUID: tIirJVop4yQY1xqxQ4T97i6ZHXm3q7eT
X-Proofpoint-GUID: tIirJVop4yQY1xqxQ4T97i6ZHXm3q7eT
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI4MDA3MCBTYWx0ZWRfXxU4xJInrEIiy
 gQX/gLMfK/YibJg0CsCZBGsj6vXfU/XCHJ9RWteZ63Bh0woeQ80QYJD+EtbX0Rr2IQX0QiRI/WA
 dOK1zcgE/3K0xW7/9Jae4xQ2DhgYQBw=
X-Authority-Analysis: v=2.4 cv=UPPt2ify c=1 sm=1 tr=0 ts=6a9143de cx=c_pps
 a=3Q3Nz7QybYLir9TwqGRfQw==:117 a=WotqVVQAdb04rnGuttW3Kw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=Sv0fKeRqtYgA:10 a=s63m1ICgrNkA:10
 a=Vs-ZokuVWRQA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=gO1vWkAQAl3rybz1DQOp:22 a=iGHA9ds3AAAA:8 a=sozttTNsAAAA:8
 a=UVL9wXhN6NU4wXYN2roA:9 a=nM-MV4yxpKKO9kiQg6Ot:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI4MDA3MCBTYWx0ZWRfXwUHobbO96bw1
 kyDmOP3o1Xu1ov6SiGCNxfkxroUmI91EqRqaeAtAlWKHODRPYruz04C7nlnTNw113GPpztXdKww
 JgzY11gNXX8GoDP9cIhTItO4Ga3/Bukrko2c9bDkIYxJZVyPGJHz8cIItaDGT8/yx12lttHItdA
 KCXe4nxirdGm60XWPB/vNx9ZUeDk91PAWro9ruIP0+kKZ+m/XnGmD7eVV3lFPRG1fWwClV6Ehlv
 Z6n19UJ2UhPH0VkKXbwSgkovPzGW2XAKMsZgHHmsbtzr6y/MPMg92vBEUXw8axHxScE0/kXqlWx
 rWNKxzrTCetvya27GqGhfpvMoMY0K+656MAcQT8pdqhyHH6Ap/7Nnxgskp+qfsOZnhLd/QeaS4P
 Rmd9IBZ/z0tx+GfdlPFW2akAcd059AKLFskYVtNW0uLG9NzBaUgSSL0VY48c5bwnY6TtGWEcjVR
 TrIWdmQnoYVei9IeJqg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-28_02,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 phishscore=0 clxscore=1015 spamscore=0
 bulkscore=0 lowpriorityscore=0 malwarescore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608280070
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Fri, 28 Aug 2026 08:16:34 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17620

meta-arago / na / 20260828080918.1161144-1-gehariprasath

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
- Patch Series: [meta-arago][scarthgap][PATCH] tisdk-default-image: add ti-vendor-kernel-headers-dev to DEVTOOLS
- Submitter: From: Hari Prasath Gujulan Elango <gehariprasath@ti.com>
- Date: Date: Fri, 28 Aug 2026 13:39:18 +0530
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: d15089d5184c0a594494b6c45048ceb95059d136

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




