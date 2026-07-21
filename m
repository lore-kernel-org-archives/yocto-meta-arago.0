Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0DE66C4451C
	for <webhook@archiver.kernel.org>; Tue, 21 Jul 2026 19:21:52 +0000 (UTC)
Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.31576.1784661707550946489
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 21 Jul 2026 12:21:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=proofpoint-05-2026 header.b=D6bMtGBC;
 dkim=pass header.i=@list.ti.com header.s=selector1 header.b=CMOafc7j;
 spf=pass (domain: list.ti.com, ip: 148.163.154.28, mailfrom: prc@list.ti.com)
Received: from pps.filterd (m0374955.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66LH621P1403752;
	Tue, 21 Jul 2026 14:21:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=cJwvIYp6cMmyNuzzDiZkVEYnY0zB+RVBOCl2mWCXy
	Wg=; b=D6bMtGBCPy97mUdT5T9vVwIMdQbIQRk+x6tpR5DJN1b+ByNr50Z0RzBKE
	gT/1SoJqOR3VOG+3yz1FOmxsYTr8OpVldpNqbOG+jNSwR5CHkbfuAljEuMsQvWZO
	/naV1MW9A8wTHnavvsP3xMSWdHyMdDvEn1lhc9G0qHjN+w5s+7eIN2oPE1uE/mlf
	doGHuoWfvMqyemLiIKc4Y1RmT/kqYX+7NdJonp2o1cj0im7ZS/tc9Dq+Z2UchsAG
	0WnbT9PxnIThUPTK1SXVCuhNuN/y0+/DIV/pqr1XNtLtjWOnA2dHKihENjMKa2ud
	jc4Yj7WF4Tcke8yE86iV0MNjbuyAg==
Received: from ph8pr06cu001.outbound.protection.outlook.com (mail-westus3azon11012015.outbound.protection.outlook.com [40.107.209.15])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4fj7q932ud-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 21 Jul 2026 14:21:45 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Bt/zeGtjpJFEeaCk/UdWI7L9j5jR61gc8L6oORIb+0U6TfnkpOd7AVQDrhWIe7iBBvnXPsyHWkqwt9++Yl/Jcz/VpkXI+jAy7m88pzvJEfZXslwajC2yhL7LvcfD+b+EW81CRO1QERvIs/zgboQt5AnQ4SrNbzdjSA02F32RMCsp5GendPK7wK9s1KeeuAvnFGtCE9Iw+3QpVreZYWZTjbMkOSQzwXhDivOH62O8kvpEO+YaxYoLZWOPDitMA1EinDCl71pKlzZHNFLzyRv/dBT94w++dFyQmFfQ1w0kKRIPJRZ+ByWauepBfHdOhZA6B8uNRG3RI5A4Q27pmDparA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cJwvIYp6cMmyNuzzDiZkVEYnY0zB+RVBOCl2mWCXyWg=;
 b=oK9hEU9GiXkhWOX8xh498mgA/6XODQhFKfBgn/2DAQpIquEvMbzOX0L060oGyXrR41g1E+JdvbUHi6b6DD+KUtZax/07DS58WiYEfwfLTuVoyDX4AyxMCzUWzgzoR6bj1EJMvlhzWT1E7kIVGynGlqVWjx4OtxsSl85IDxxtrkBtfiebEHIrPVJ/OnoKiosMvIoAzZ1oXuTRAi+oO5jaexuN9kQiPgAW19b/NYcgMyl2sK0PjmcteN2r/Wg6FKEcqTSr6w5c47eXCTnjy1qZQB2rYod3Kuv4qcSckFPXnZvnb6R6fjVzQ9845qk4Wh3wxyndPDsT91C+nzHo8sxN0g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cJwvIYp6cMmyNuzzDiZkVEYnY0zB+RVBOCl2mWCXyWg=;
 b=CMOafc7j7yOimpsbmNdOci8SgYJhqCZXio5ypWtXGYe54ykMbBEWh2BaaEF9AilnRgDOAJSwKlTqRC2GQZ78Ip4K8DDIPWxLLH4Jqh15YMjea5cpOG4VjFBN8sjKK8SXsiqD2UC6DQBcPIIOAnFLuUHJPw5kYouOcSbd1kwXZw+ERVQVXQ/gNhGqBnLsWTeJBIISNhgOzrFNHkxzhMU2glHiA0zkuszMOzAGLOpDE1LczRr3ZDaWo6TX2TcOcWtRGy1YPLd/xrivHuhHQpuKDm0jC/mE3LYUM3yOSnQjFJicqiXBTfNHHKYqgTGghMjJ4B73bgduFI0f5OjMVKa/vQ==
Received: from SA1P222CA0192.NAMP222.PROD.OUTLOOK.COM (2603:10b6:806:3c4::13)
 by PH7PR10MB6380.namprd10.prod.outlook.com (2603:10b6:510:1aa::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.10; Tue, 21 Jul
 2026 19:21:41 +0000
Received: from SA2PEPF0000150B.namprd04.prod.outlook.com
 (2603:10b6:806:3c4::4) by SA1P222CA0192.outlook.office365.com
 (2603:10b6:806:3c4::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.245.10 via Frontend Transport; Tue,
 21 Jul 2026 19:21:41 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 SA2PEPF0000150B.mail.protection.outlook.com (10.167.242.43) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.245.5 via Frontend Transport; Tue, 21 Jul 2026 19:21:40 +0000
Received: from DLEE212.ent.ti.com (157.170.170.114) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Tue, 21 Jul
 2026 14:21:40 -0500
Received: from DLEE210.ent.ti.com (157.170.170.112) by DLEE212.ent.ti.com
 (157.170.170.114) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Tue, 21 Jul
 2026 14:21:40 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE210.ent.ti.com
 (157.170.170.112) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Tue, 21 Jul 2026 14:21:40 -0500
Received: from fllvdckhpci031.itg.ti.com (fllvdckhpci031.itg.ti.com [10.64.72.41])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 66LJLemR2054924;
	Tue, 21 Jul 2026 14:21:40 -0500
Received: by fllvdckhpci031.itg.ti.com (Postfix, from userid 60899)
	id 640B99ACF4; Tue, 21 Jul 2026 14:21:40 -0500 (CDT)
From: PRC Automation <prc@list.ti.com>
To: Ryan Eatmon <reatmon@ti.com>
CC: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-arago@lists.yoctoproject.org>
Subject: Re: [meta-arago][master][PATCH v2] recipes: Convert to SPDX license strings
Date: Tue, 21 Jul 2026 14:21:40 -0500
Message-ID: <20260721192140.3783226-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20260721185822.3510959-1-reatmon@ti.com>
References: <20260721185822.3510959-1-reatmon@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF0000150B:EE_|PH7PR10MB6380:EE_
X-MS-Office365-Filtering-Correlation-Id: 23e97bb9-97a4-4c86-dce1-08dee75d4b04
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|23010399003|376014|82310400026|36860700016|1800799024|13003099007|56012099006|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: 
	0kNYM3yRyUhoYrU1J+fjNj1zmKM/CaRxsOmTczXFdN359v18zkHeun7fd1LgP2YyhI0F6Ed9CylakaR+B8pAssUHy0LU72AEyKs84XoiSaSMkT3/9FvbIqmj6omtmoT7LkvEvyLSBmIWIKuU8qBnV0tAYwAbWt+fN/57clQdt67w3H4NW1cgx2wfnGkqMeVQqqTM8IkUIzaQA42HDFEE7ZfPgdePcB+f6Y/hIvw1pDCxB5fUAR/g1JaAvtJftG52poBlF29CbavseaDUjNQkFsPHMHQqXwtyfrbo52Ghesyn/kIEK0zHBd2qCbY4IsrJtEFz7yfh6Bn1sXW6pkIOTvAc68gD5QMHzQWKe6qCbGJGJrQpeQZmroAAnY88losdr64RNSo6eKx6qpap/yzIjIzfumgp1OQSUjeJZrshKjs4odBLIFIK15VDmO6fPQEbGe75SEcpbRBAXCjBcd6UEx7lItdEmHbUbPqwzzwPM/nNzeXHi0G9Nfij60sAKh4g14CG3WGOPO8aeUMNoCZmb0tqG7TQPRmJddHaQ0K6qc3eJKe7a/dkmNd9F/qggx4Se9l9ddYh+C+jAZ2UcYzNGsU5e8Nr/MNkz1IU6e9ZHeW3FdcV6SYt6BeM3Ypvnfe2h0prXYPyJrmkOlBkLrtzZqJYwOe4qVnkFJYxGgh4wfFxPgC2Yij2mWrfG4c2coYEWw3Hwhr7UJ4ASkgHWS0syQ==
X-Forefront-Antispam-Report: 
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(376014)(82310400026)(36860700016)(1800799024)(13003099007)(56012099006)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	L1hYNkCMvbTKGX628t0maSVqVl7BJBJJuigwSgjf4i07ngmZWzOnoqQ/DWNAzE1syLaSslxIBsbEuYKz30Q6A3DiImDl8n6H1cZTjC/2WHtP56KhqxyzPMB2uRQVNSxHt+5ej5j7rmuhvzNsT5Fq33T44UaPW8xYXeYuoD4wmwEbq8RsiBGnjWVL4Sx4gxzJvgaVPKu0xF0mK/91i7n6zoTMyVPza5acVdRZa7tla5WmKWrx2eCYonYhs+6Yccs5B7+poGinEesE7FKiyTWeq/sP2I4/+DAybFYyxkuzF8d4EF3Ssvp8UDMIWBG8ehxS5qeypOJlL1KcvoAV180del66tJtiJzgjSLxO3w1AIAwS30uf6glQjN2Wd5Ych29EkHv0a5TN3lDcDClXlaa+p+RWH+wgOHtMCnHS7hz0BAbUGAezYWzaP9J4WQfHQt7W
X-Exchange-RoutingPolicyChecked: 
	rAIaYeTAE40aMF9YiJjvKJMWvcpyZ1T/xdTj/8VXeaciNlPZSEXzIgFze8XMiCY8MzCN1dQqXakh3CxfteQqt5XlU50M3j09li008ZqxddEYr7L1Q8Fcp7p2DG/Ss4yAYOuE+g9pWCjqir4Si7gHPge6sKTLPilHDO+xjNWS1tan7cZ1hHEhJw5eFME8oAAhJDNnzLS3OELLUN/3S2/rL51F2nOj7MKunvzi7HNsrkG2x+bfuq2pz7cuc8dOnnZiw2U4O7tcupXmR72426ebxuCKfA92i2ndfWFHJkS62YtEJo1eegX7yfjzokm3dnzhuRKa/rpgpwqhETarFOQG5A==
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jul 2026 19:21:40.9336
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 23e97bb9-97a4-4c86-dce1-08dee75d4b04
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SA2PEPF0000150B.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR10MB6380
X-Proofpoint-GUID: 7uKDc7yKpaxpc8eHl_ehYxCGqbOpjPNF
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIxMDIwMyBTYWx0ZWRfX0RDikpWu/ULk
 evb/5xvSMzPMSR1qyY+goCXanx/x48y/WQ673jZyHw1Upf9TE0O4mY2Dtijwi0z+C6GBe5eRH8R
 gAzaFLQhIS2HPMf4W1cFoRnWJ7NnHWk=
X-Authority-Analysis: v=2.4 cv=CsmPtH4D c=1 sm=1 tr=0 ts=6a5fc6c9 cx=c_pps
 a=YvmT30J82QCmV9938MlLOg==:117 a=f+v6EHfkeJbVwR46tk4DMg==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=RAioF0-LDSMA:10 a=s63m1ICgrNkA:10
 a=Vs-ZokuVWRQA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=fPAWb5peG099m5CrUpKH:22 a=iGHA9ds3AAAA:8 a=sozttTNsAAAA:8
 a=3YxgpxvfQQnjpiIy-aAA:9 a=nM-MV4yxpKKO9kiQg6Ot:22
X-Proofpoint-ORIG-GUID: 7uKDc7yKpaxpc8eHl_ehYxCGqbOpjPNF
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIxMDIwMyBTYWx0ZWRfX94pZyzKmdAij
 MxOXiYHnUJtZNyM7Gp1rGTBkCcrIfCUd6Z9BL+UMNwtGBnq/3f/1Su5ztSxDgrY2G17bHX1l+Ly
 q5IWhJLYweiSiyVonyLCmHqSvDHZgFk2tCARA+yNjpWR5guYpLbkl36fQv33LOe1byrwSUBD8Wv
 1SUg43QvEeD9GyRhT85r9307rRG0e5MfyfFJ1CpxU3HgoF9HW/EuODxZU5FnIP6uslxO50kOK5S
 xt3Ni6Q1FgHG4FfkG/c/sMeTFd/khQddD3+ZXLwkjtgpa6cmGUzdaVOF2kD2ueNVylm2TmiNtZl
 vYWseMtlm0xba2uV2AdIwnBvbWkGQVb2BqTwR6UmUbVIJixBiZ1sLzGMlCeBDYlpbIy9PLKoysG
 8rcjZUBU2Rt3uHlCk+Kryj5r256AAWDWYQiiZfKYo+QjQLOVhaV33BxZzdP0wKLLMMBb+ZVnYgj
 hYz54IEi6eKCtR5GeJg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-21_03,2026-07-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 lowpriorityscore=0 bulkscore=0 malwarescore=0 clxscore=1015
 phishscore=0 impostorscore=0 spamscore=0 suspectscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607210203
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 21 Jul 2026 19:21:52 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17591

meta-arago / na / 20260721185822.3510959-1-reatmon

PRC Results: FAIL

=========================================================
  check-yocto-patches: PASS
=========================================================
Patches
----------------------------------------
WARN - [meta-arago][master][PATCH v2] recipes: Convert to SPDX license strings
    WARN: Commit message does not include file/recipe name: recipes: Convert to SPDX license strings. (COMMIT-MESSAGE-2)
        patch
    
    For details on the above errors/warnings visit: https://lists.yoctoproject.org/g/meta-ti/wiki/40887



=========================================================
  apply-yocto-patch: PASS
=========================================================
master
=====================
Summary:
- Patch Series: [meta-arago][master][PATCH v2] recipes: Convert to SPDX license strings
- Submitter: From: Ryan Eatmon <reatmon@ti.com>
- Date: Date: Tue, 21 Jul 2026 13:58:22 -0500
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: 7afcad4e66d71e7171dceeafa3f31bc9a1dd234a

Applied to:
- Repository: lcpd-prc-meta-arago
- Base Branch: master-next
- Commit Author: Yogesh Hegde <y-hegde@ti.com>
- Commit Subject: systemd: drop 15-eth.network and consolidate eth interfaces in 10-eth.network
- Commit SHA: 32996cd717cb9126e3265016be8b8d711f13948b

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

ERROR: Multiple recipes found for mesa-demos
    oe-core/meta/recipes-graphics/mesa/mesa-demos_9.0.0.bb
    meta-arago/meta-arago-distro/recipes-graphics/mesa/mesa-demos_git.bb




