Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1F89ECA5FDD
	for <webhook@archiver.kernel.org>; Fri,  2 Oct 2026 22:36:20 +0000 (UTC)
Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.673.1790980575782130996
 for <meta-arago@lists.yoctoproject.org>;
 Fri, 02 Oct 2026 15:36:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=proofpoint-05-2026 header.b=mLEyDLMR;
 dkim=pass header.i=@list.ti.com header.s=selector1 header.b=wf2ad4qw;
 spf=pass (domain: list.ti.com, ip: 148.163.154.28, mailfrom: prc@list.ti.com)
Received: from pps.filterd (m0374955.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 692KAsF81368715;
	Fri, 2 Oct 2026 17:36:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=Rvle/tNb1ox4lPqqI/PE4nHHt3dqXflUMLVmZf55r
	6Q=; b=mLEyDLMRmkkhJ225oo0jhV7xZQc0lPJbVeH01O5cAqwGJVxV+w7xqAJid
	IiKjP0g7Z/A3+XdDEziDWd8/wp5HozluPMZ7riOMF673+JwoK8pBgVW+Du3pz5dm
	2r2YFb26ZBVmvwbO7YQztCcrXeQO1PlMuKFARNdxcua8d1tffksIxkTxomdBPKhx
	4flhlgNkVFEqtEq0m+hTEMysyizGDNttRx4mlunhsD/9PADtS7AEQCoNP/odAzFN
	AuELRnPb9Olhqq4Wp8WzfUENWCXUl+CEU2hYwS3llkYCQbVNaBhTzHpAXBSIZrL3
	OHjghOVyMqigyLItvHPY6vr4F2pSQ==
Received: from dm1pr04cu001.outbound.protection.outlook.com (mail-centralusazon11010034.outbound.protection.outlook.com [52.101.61.34])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4h27nxn8bc-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 02 Oct 2026 17:36:13 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YMJ2WgV8FNIFUzGq9ui8ArDX6Ujfjaz34fAIZJpEh1qg8zqfJMuxRfo65tKcROe38ExKG8Hjp6uQvFOoZdKTKEplB+9MbEs/JWVrbdTLQbyc+R8xQxkVfaDBw22KcniZlyfZaiqo/3wCJEq0Wj+1cSLJd10JK6djSepaxOmPvJZpMNtOB4ALstk/ovxnooCSCsC2XRBuXIxOQQOruo50d9Iv2zMcOe1t1x0TVM3voiub1RkTRbzkM74lJ3dc9ZbAUDivxdsLznI1WVrdcTk64yz200/5fl7cW3WutMCVAChDeSonWkpqfzX4CZF58l/kFBbz9dHUnu7iZv11COR3/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Rvle/tNb1ox4lPqqI/PE4nHHt3dqXflUMLVmZf55r6Q=;
 b=UHDTKbZLx4FTxdF/trJrhYTGdxnZqk928fvECKqTTsDswY7yfhRHYV6XGLPC2SHV54NEGc2PQi9ZcZHfnIXcsYPem4ksuniqDMNcc0lrrMoQqJFzqvYYWVbuuPVhq0L67UGzubdoGDBXwNdh7xKvOO7LbsnVeAT0VDkScOxD5Kp8GRPtgW8uOSVWamzOV8LeCnCnyY9Q7Xhle8BYY0jPKayWqeOnhW4+d/b0d0c3o9+7WHyWz2kURvyUBFw/01hb26J6NAIJq16rkNBgjk1Na9gmhF4cuKDj4ImL2wimERnolglP0FJtEPCFXslOfr8sRqEB5nhx8UEsjS32GA4Iwg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Rvle/tNb1ox4lPqqI/PE4nHHt3dqXflUMLVmZf55r6Q=;
 b=wf2ad4qwET9ewfFAqdqmgUqJpYTM0WN1ug73WvxnG2KaQKYd26h6i4ylVAmvbyWWx1044A4WWXYj/2KZg6+V0cIeyAVKuvbAahgXfJNobn5DhlATAg4WIed3+whp45PMFFed/bZ+oD09J/0h9Sywl1ufiEddJdteyyE+g7OMRBl+x57ZLJMa97mwoCOVh2uhRIG2Zrvcn44FQ1gPm8qt0Cg9r/fivMDmdVk/W+fGiNgwmgcxiYVEp56hot+AM9yL3xaiwyYHxEGTpiuHuGGsDN9MEBb+b1gC+OCq/x3rFlXV2tq52kn+RessPTRcPx3vgFUwUoUV5pOCbZ5nKhJ6Qw==
Received: from PH8PR02CA0017.namprd02.prod.outlook.com (2603:10b6:510:2d0::20)
 by DS7PR10MB5071.namprd10.prod.outlook.com (2603:10b6:5:3a1::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.12; Fri, 2 Oct
 2026 22:36:07 +0000
Received: from SJ1PEPF000037B4.namprd05.prod.outlook.com
 (2603:10b6:510:2d0:cafe::2c) by PH8PR02CA0017.outlook.office365.com
 (2603:10b6:510:2d0::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.472.18 via Frontend Transport; Fri, 2
 Oct 2026 22:36:07 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 198.47.23.195) smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 SJ1PEPF000037B4.mail.protection.outlook.com (10.167.244.196) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.472.14 via Frontend Transport; Fri, 2 Oct 2026 22:36:06 +0000
Received: from DLEE211.ent.ti.com (157.170.170.113) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Fri, 2 Oct
 2026 17:36:00 -0500
Received: from DLEE201.ent.ti.com (157.170.170.76) by DLEE211.ent.ti.com
 (157.170.170.113) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Fri, 2 Oct
 2026 17:36:00 -0500
Received: from fllvem-mr08.itg.ti.com (10.64.41.88) by DLEE201.ent.ti.com
 (157.170.170.76) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Fri, 2 Oct 2026 17:36:00 -0500
Received: from fllvdckhpci031.itg.ti.com (fllvdckhpci031.itg.ti.com [10.64.72.41])
	by fllvem-mr08.itg.ti.com (8.18.1/8.18.1) with ESMTP id 692MZxLa455087;
	Fri, 2 Oct 2026 17:35:59 -0500
Received: by fllvdckhpci031.itg.ti.com (Postfix, from userid 60899)
	id 4BCE39ADAD; Fri,  2 Oct 2026 17:35:59 -0500 (CDT)
From: PRC Automation <prc@list.ti.com>
To: <rs@ti.com>
CC: <reatmon@ti.com>, <denis@denix.org>, <meta-arago@lists.yoctoproject.org>
Subject: Re: [meta-arago][master/wrynose][PATCH 1/2] emptty: upgrade from v0.15.0 to v0.16.1+git
Date: Fri, 2 Oct 2026 17:35:59 -0500
Message-ID: <20261002223559.3313239-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20261002222954.3580000-1-rs@ti.com>
References: <20261002222954.3580000-1-rs@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF000037B4:EE_|DS7PR10MB5071:EE_
X-MS-Office365-Filtering-Correlation-Id: f4276d09-3607-4c10-1802-08df20d58cbb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|36860700016|23010399003|376014|1800799024|13003099007|260925021311599003|260925022911599003|260925021911599003|10067099003|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	jgmpPyvGS/dADrqtOjeYU8dFYcddVhssSjCNRNMQc/KLJ5Fn7qpUqjXPRYHvcLgtvizH/1xM7Bd+HrESYkHPQ94URXNBVf+0sS9mSrCQXapE9NUeyQz3i2HFAO+J9AehGvwiAcv3RRr+/nbJhEFrckxonRog5YZ7FrVrSoH7BPdO8DrcWG537gR/brXLXVmS3huppUgA5VNpp9esahtWZQJ68Z/CxsTO0cbjr/YGcxame6vcM+Tdf2yVyL9pqpu/RA7PMrv5rUxfypuBVmmwVRRC7z7ORHEG+Hk52soabjYarnzlPIIVVArmVweryMqIkjfe/5alBVpV2DamFdhlyD8+wpoBwimCjIBGxDMbNdhszYDRrZCyHoQ6xPyL6WfBk+uZKUuAasje3ol8hHl9fKshqaTvTEzJxpklUJw9NZ6nM2faqrdhjPWvzzxqT3g1d+mg8usqrmbVS8NuTP81vlaoPL4gHNg1Ec+uZz33rkv5Oiutp1u85OjNnEa8K3BkjLxp+q9oJcRYrMIqRbRZyGUxihFABNb5ScOCU+VeZ2fMsjniDq10jDz/0Fei7nbkbq1yRR6U1fkX1FUs5Igs7qnSIIKulG736Hmo98eKETJoVGbq9EVZnSBWlBL/buCG6jv6F+virwjMG67WMkPMYg==
X-Forefront-Antispam-Report: 
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(23010399003)(376014)(1800799024)(13003099007)(260925021311599003)(260925022911599003)(260925021911599003)(10067099003)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	7topsNuSKFvMgNrPfmCvS8pGIQ8dGfKeUqcZghvjONFALWzjT4VCrGcCZjnkO83EyMWt3r2Dd3Z+ZOn9IhB7d0NrTcjG6ZoMG1o7lx6VvhPsSffMxEncNzxsXdwS1apjOtr+i6RYeobgw6TIVlg20XGhZ4Zn/vQ6rDP2EgYWZmtorFZhEbQz8EeQtjxKvRCZYcROiVhQvD7YBjwXesyLFOXq1qZ7rquffJoVA0WHfm5gPHntTZwv3T85/mP+jXRZFhfx253L0KKkFwtTzfgCdYDKZAS3SbC3fPEZOMkFuj7OkosT7gIbs8LrKDoY8HYTnOz02iGj2Cu9F3ntPO+ezcQrfRT+FX683zoTP6HGc4c0fqYLdGf2JfL66mZQ3z6NzwvgJqIxyUx6M29TpeuCXrJL64AKGd7BkU37hs6ezk7GTjl9BKy20D/Z3sJRU2rX
X-Exchange-RoutingPolicyChecked: 
	IHRT3hLdiKQMKBQ//AQnhtPcDUxeRJZ4ZCm+Esr8BdL8wB4JSme5nF8ILEzsesFZLsxVciCLK4DDFMtXdfNgwPemwRq7kDNf2+Y80rR5smxqcSK7+JV8CA4YSxxdyBkrdICnb3jECXAgtvAoKJyqinhqYM0quv+L+fScBI6l8yrHHMo/wdqeZVCJrVzLcLqXXqFPyfpsAs7Xda569/SF1KRnKRqh8ra4FuPIuh9zVtUOJBEyrRtqnfs1ySA2qzSPtDLlfNHbMuHV13qYIkXqBQ9TIfaBqlUBp4gNbzUY7e5GaAcA41Qc99y8clu0QnLmDFU1sKcYXaKzkRSlAxrQUw==
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Oct 2026 22:36:06.9738
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f4276d09-3607-4c10-1802-08df20d58cbb
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SJ1PEPF000037B4.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR10MB5071
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAyMDA5MCBTYWx0ZWRfX+n+ZJlJus96E
 oTQJa/vRIP5S3jmBKFDtyvXiLITzf8pK1PNcGHUyvOagoaOJ1zNK8e9q7tB9x9HRo1H/6L1iHfF
 5yc1Iz8rRMl2aWOzalNkSZHLvzC65Kj7gUdtINdvvlfO+ASgXRuFva6FVJhlnKVlvdSVRp7ABry
 9CR4SIHDOkrzXjtoRV5Fs+AotLWuACG2QYC6A5EmpMENM76ebStVDBehErc16+uP8UwEaUcgqHA
 UMH3Ano4zZR4O8vKdUoezcytsizccYldgldOIaSyGkIZtdK5v4FTklCqYcGCX9rwKK4l0NbQES+
 U2x9EoP9Wl8xuhhYTsam63eVlvNrPf1yugvLy7qFOMH2aXiQU1DyG5B5RJ52o+VtiWDyXBvbxsA
 f7K5Rdmb6GQRFFHVbXY0znFLMdH7daY/61qAhyVOp+7z1CBZ8yJO+mJ6KDLTyspmfaACo0cRyeW
 1CmZ1h7Ql8c7PV9Taag==
X-Proofpoint-GUID: kp-szCal7smjc8ZLsT9BfVMUSj6y8lK0
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAyMDA5MCBTYWx0ZWRfX5aBtT3KsZ10S
 V4Br4niVbT8WZ4Mj6oP5o3uf32TL3zlDCWBaGGuofvxFKEkqnrBYbPpye7f3nK3Unb9j0Xn0CzV
 F8D6Q8KKdCl2Q/Mna1dQ0sX+hF8MFaY=
X-Proofpoint-ORIG-GUID: kp-szCal7smjc8ZLsT9BfVMUSj6y8lK0
X-Authority-Analysis: v=2.4 cv=BZ5NQbt2 c=1 sm=1 tr=0 ts=6ac031dd cx=c_pps
 a=IMbvhL78Fdh+aiPumIwVPQ==:117 a=f+v6EHfkeJbVwR46tk4DMg==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=660iZSQnnn4A:10 a=s63m1ICgrNkA:10
 a=Vs-ZokuVWRQA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=fPAWb5peG099m5CrUpKH:22 a=iGHA9ds3AAAA:8 a=sozttTNsAAAA:8
 a=Zkij2XIRoc972lFEivwA:9 a=nM-MV4yxpKKO9kiQg6Ot:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-02_06,2026-10-02_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 priorityscore=1501 adultscore=0 suspectscore=0
 clxscore=1015 malwarescore=0 impostorscore=0 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610020090
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Fri, 02 Oct 2026 22:36:20 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17731

meta-arago / na / 20261002222954.3580000-1-rs

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
- Patch Series: [meta-arago][master/wrynose][PATCH 1/2] emptty: upgrade from v0.15.0 to v0.16.1+git
- Submitter: From: <rs@ti.com>
From: Randolph Sapp <rs@ti.com>
- Date: Date: Fri, 2 Oct 2026 17:29:53 -0500
- Num Patches: 2
- Mailing List (public inbox) Commit SHA: 908c5325f0a5d9e756acfe0934ef7248815946d7

Applied to:
- Repository: lcpd-prc-meta-arago
- Base Branch: master-wip
- Commit Author: Ryan Eatmon <reatmon@ti.com>
- Commit Subject: arago.conf: Remove "x11" requirement for mesa-demos
- Commit SHA: 2a226d3d7228e03f9fa9e944728161e26a872e82

Patches
----------------------------------------
All patches applied

wrynose
=====================
Summary:
- Patch Series: [meta-arago][master/wrynose][PATCH 1/2] emptty: upgrade from v0.15.0 to v0.16.1+git
- Submitter: From: <rs@ti.com>
From: Randolph Sapp <rs@ti.com>
- Date: Date: Fri, 2 Oct 2026 17:29:53 -0500
- Num Patches: 2
- Mailing List (public inbox) Commit SHA: 908c5325f0a5d9e756acfe0934ef7248815946d7

Applied to:
- Repository: lcpd-prc-meta-arago
- Base Branch: wrynose-wip
- Commit Author: Ryan Eatmon <reatmon@ti.com>
- Commit Subject: check_yocto_rules: Add exception for pipewire update
- Commit SHA: cc1013940d3b41154ab5e3e6e82a9b584a02820f

Patches
----------------------------------------
All patches applied



=========================================================
  check-yocto-repo: FAIL
=========================================================
master
=====================
FAIL
    WARN: You might need a " " as the first character for the :append. (APPEND-2)
        meta-arago-distro/recipes-graphics/emptty/emptty.bb:10
            GO_TAGS:append = "${@bb.utils.contains('PACKAGECONFIG', 'pam', '', ',nopam', d)}"
    
    WARN: You might need a " " as the first character for the :append. (APPEND-2)
        meta-arago-distro/recipes-graphics/emptty/emptty.bb:11
            GO_TAGS:append = "${@bb.utils.contains('PACKAGECONFIG', 'x11', '', ',noxlib', d)}"
    
    For details on the above errors/warnings visit: https://lists.yoctoproject.org/g/meta-ti/wiki/40887

wrynose
=====================
FAIL
    WARN: You might need a " " as the first character for the :append. (APPEND-2)
        meta-arago-distro/recipes-graphics/emptty/emptty.bb:10
            GO_TAGS:append = "${@bb.utils.contains('PACKAGECONFIG', 'pam', '', ',nopam', d)}"
    
    WARN: You might need a " " as the first character for the :append. (APPEND-2)
        meta-arago-distro/recipes-graphics/emptty/emptty.bb:11
            GO_TAGS:append = "${@bb.utils.contains('PACKAGECONFIG', 'x11', '', ',noxlib', d)}"
    
    For details on the above errors/warnings visit: https://lists.yoctoproject.org/g/meta-ti/wiki/40887




