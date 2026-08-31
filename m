Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C0E90C624C6
	for <webhook@archiver.kernel.org>; Mon, 31 Aug 2026 21:17:27 +0000 (UTC)
Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.6996.1788211045299874261
 for <meta-arago@lists.yoctoproject.org>;
 Mon, 31 Aug 2026 14:17:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=proofpoint-05-2026 header.b=Pocc7GYX;
 dkim=pass header.i=@list.ti.com header.s=selector1 header.b=OOD01vUp;
 spf=pass (domain: list.ti.com, ip: 148.163.150.75, mailfrom: prc@list.ti.com)
Received: from pps.filterd (m0384305.ppops.net [127.0.0.1])
	by m0384305.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 67VIRmre430828;
	Mon, 31 Aug 2026 16:17:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=iU/8tzf87X0JV1N0uAV8jt4nQ/76BVKXH0dKrUUi1
	n4=; b=Pocc7GYXZqd+8qehJIMDTe/O1AHL+Os15/oJDocx0GaM2MswppKFiO5z3
	+RA1f9rAHOghiK7YKMFfiX2wnInxkZXidpcCESbu5k3P0/mne5pEvJNcndnv/i8Q
	ZSRk5QIUsDxerwDi/BTWHVjutsTzHHKD5O9txkRxLksUQ7vNs8aKt+PYeoxwQCJw
	IZLap/z55YoLZ8qTdEBEyW0GkzW6G1OptsxPL458MWuQc0G3YoQgHUVQluxkF0/w
	jd4NU5i5gqNzispCo3/bLlk8iISu+a5ExSeWwyvvuaae9AvNoVpdByWSVAlwCLI7
	HRdgj9yjlPyUq0zEhMxT4GFVyq5MA==
Received: from cy3pr05cu001.outbound.protection.outlook.com (mail-westcentralusazon11013009.outbound.protection.outlook.com [40.93.201.9])
	by m0384305.ppops.net (PPS) with ESMTPS id 4gchcngj6u-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 31 Aug 2026 16:17:23 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vi+D+swzVQXHpeXYGW8fD1HTQdPwgatsQo79iOmmDvSGVEkdB+P9v6wWazETAQSQdwWCCNp364NRUKTvBWgCvxYwNL/d47W9m2aadLf1+NSxYPcITz9MTRAerUVUK1610moGW31/yJg0I13HnZkIzXWajjs+d4bOLdZ8sOpfnGivN9PEcTPJHgg2d9nHogEntrXOdP7Jg1TDuVjPQmLWzj8T2lBdsbGtp6Hi4jMW7zS/tmlM8ystD9ZRTi+Q+amUoNSVD4rc+7TzZUrldq42+OizX1+8d0oqNcEbyQPj3xlIURF5a4/nPF1h1kN1fPdq7FFQ1NedKfnrlhQme2E8pg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iU/8tzf87X0JV1N0uAV8jt4nQ/76BVKXH0dKrUUi1n4=;
 b=pcmTu40mWjM3rp7Jlr4tXkTJVCPtiRdyCKQzNKscLdeOzFqPq0UaaW4bXTANt9c5OxGVyhZWJ/8v250KN7OQdiN4txNz6JowB4zIKIIXL0RFE8dZuOO3uREbyfL3vVf7FlfTFSANnzLtoC2Cfg5lElEILreQhOMskFQELV3/OtvtVlmzIFrFDIjlnpkXyZqFdg3pDNRVHc9Tvj2Swdotak+YnnhsjqTaing3OS4Nd5w8sza1YvKoeAzugAyVvZ4+0LwoT7sDG0FRI+zjmsOHQP06aMU2tMDbUB4jARdMaWLZaFB98D3ZEKNaMbCG/lxgamvitf41mb5cjQTl3zSIyw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iU/8tzf87X0JV1N0uAV8jt4nQ/76BVKXH0dKrUUi1n4=;
 b=OOD01vUp8ecNSUuSCDUq85q920sG9JvEhOIQwvxwOJuIj8KeZnRePDdHMbLSuTWZWCsJ25wcPdifoUIeA6FzzvVETLMQVqKvjxpRy1MJfeHzR2sXyuaRp8RUrdcMROAwKl9fDaTgVuc4CVY1+CgJ/8OvSquaL0JYIU2gp7w+plRmKSi713+Vww0ZXX9w1aGx0jdxMvNvP/32OolhtrfOm6T2r5j6j4NmQftE0+U0Bk5IP1Ote8I0N9RLpg+456mFamzh6SCqEmeGGsaLaDamyVyEiJ5Ui4ly1QXLUG7JdHXUGpdVNSqw1vqCb6J4GZiNGhuGuVHhMwZ3462FS48Jtw==
Received: from CH0PR03CA0204.namprd03.prod.outlook.com (2603:10b6:610:e4::29)
 by SA2PR10MB4811.namprd10.prod.outlook.com (2603:10b6:806:11f::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.382.10; Mon, 31 Aug
 2026 21:17:20 +0000
Received: from CH3PEPF0000000D.namprd04.prod.outlook.com
 (2603:10b6:610:e4:cafe::72) by CH0PR03CA0204.outlook.office365.com
 (2603:10b6:610:e4::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.360.13 via Frontend Transport; Mon,
 31 Aug 2026 21:17:20 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 CH3PEPF0000000D.mail.protection.outlook.com (10.167.244.43) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.382.8 via Frontend Transport; Mon, 31 Aug 2026 21:17:19 +0000
Received: from DLEE209.ent.ti.com (157.170.170.98) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Mon, 31 Aug
 2026 16:17:06 -0500
Received: from DLEE205.ent.ti.com (157.170.170.85) by DLEE209.ent.ti.com
 (157.170.170.98) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Mon, 31 Aug
 2026 16:17:06 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE205.ent.ti.com
 (157.170.170.85) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Mon, 31 Aug 2026 16:17:06 -0500
Received: from fllvdckhpci031.itg.ti.com (fllvdckhpci031.itg.ti.com [10.64.72.41])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 67VLH6Il498371;
	Mon, 31 Aug 2026 16:17:06 -0500
Received: by fllvdckhpci031.itg.ti.com (Postfix, from userid 60899)
	id 01F6B9ACF4; Mon, 31 Aug 2026 16:17:05 -0500 (CDT)
From: PRC Automation <prc@list.ti.com>
To: Ryan Eatmon <reatmon@ti.com>
CC: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-arago@lists.yoctoproject.org>
Subject: Re: [meta-arago][master][PATCH] open62541: Bump to version 1.5.7
Date: Mon, 31 Aug 2026 16:17:05 -0500
Message-ID: <20260831211705.3370302-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20260831205233.3284636-1-reatmon@ti.com>
References: <20260831205233.3284636-1-reatmon@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PEPF0000000D:EE_|SA2PR10MB4811:EE_
X-MS-Office365-Filtering-Correlation-Id: ee7f006d-6c2c-4e14-9bdd-08df07a53def
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|82310400026|36860700016|23010399003|376014|22082099003|18002099003|13003099007|56012099006|10067099003;
X-Microsoft-Antispam-Message-Info: 
	iT1VYzuwSDzDEAEfbULGtsPX3TgtdjEMZF8MmVRTXn3+Lv7qnFYA21AaO4AaL4M9mXX2DNa7fgD4BqXHDAeXw3ZXjjkEve1kDVwS4f/ZamF98ZLChH0kZ56maCL3Y6/o7+vxoaEbhkEn+E5royHggVi/L4Bb1VbNDao4juC8tIPHfp8bL6e82Xmo1j/4E8zvJpEVhwUR5ejp4uv2rLihMrhM16efjC7FQbp3rH1XsC/HYtAe6bUViwUbKJ6cw502If9D2+GyLi+oJxYyZ8a/QRD2rj2xY3XfvPCAJa9pQpjxB02ljI2YT6URIL8QzU92I3r8aNMkNb9VoBuQk+BFPagIESLruyaF2jVuD35iY8XdzdH9s6NxwIf+RZaGOk+kzGPW21svqU33PxckHbUP+pYOjD9pp7m8PQ4AYCgsV96d25BTOQ61F543LhiZaW8z4+lpcKyQlv0b1AQrZIJf4qjJCOAWFtO9TPyY7OIdsixAbw4UXhpcqYVTvn3cYPko/r8cBJNEDV1Y1topxiqQXTRAME1L2SJE2YH2riekXF4whXMXEBL4QgNbbozslqZgE+rHLXGJ8hBepRyojul94E4HnLvwSRb+m060EiV3zpRfuYA3kgXqT4wa8C5SpdeR7m08Y1vYprZ0HjZywVzK0A==
X-Forefront-Antispam-Report: 
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(36860700016)(23010399003)(376014)(22082099003)(18002099003)(13003099007)(56012099006)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	vD99fMimRFm9bMAbhgubdJHMV+84sbidB3T+FKBYc4RYkqZn6q2deL0FOH7yIBo7r2wzSJdGI2434WezgAq6UD7hQNkH8g97GArYFXicCNp9HoCUGaOtHSuq0q6d+g601IyHbg2OV8Wepko1K0ISKsYll7rVoVCP3+6YuesurxVhGNcgcJg+ip4UkskNaSgp0RQe9NlMWRofyNOKvtTdBScuptj4H0JDMuImcIg9MZuR8PSaworZe35oqXBlRg75GVJBqpd+wq5HapFN4nzHRd5MCxSNah/87SHULXkfSKI8Z+363oLqsmu9qSvpEd26NHbrL2OX/TVP/SWMeq2H6UaoQtR9Pd8/7hxi749V7KFDDBvxkRVA1zeVfBuH3TnIXCpnney3ugFdk2pc2PKN7bnRac3CrmUaL9MxtGazTboddY9cR8GA71tXDeY0+SOM
X-Exchange-RoutingPolicyChecked: 
	bKMj09dYCd/plBBvVv5t/8eBGviu3nWHJEuMCERSxe21GXDGgi56R7xc00L6oADFCln40g9ARiQzo3jX+Ho2VJz0bkJgjXjQzmv2wOBFbzgZV1DJ41UCQ/8R6ho6qfUq9SzFRUZJ7GQNbMgLQh32UoMwlZ4mgRnwMvGnkJXB42Nbx6jc1/jobToOtJ0SxAsGonU+DoN3VQc6Asu5zZvVbgxJIhRb/T42iD1Ynwt7pz6LktRhyv3TSGvGfhRSiDMDg2iWOrX+9FhWOM5oP9IiEJA5vmInF+TVVD3sqWqKCX0HlOCrGEXURtye+cOTA+F/fHREWFNw5Myyp4WkGAu9wQ==
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Aug 2026 21:17:19.9072
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ee7f006d-6c2c-4e14-9bdd-08df07a53def
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CH3PEPF0000000D.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR10MB4811
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODMxMDE4NCBTYWx0ZWRfX6rHLR2o3JOLH
 tAVvVv/CaNsqcCrX4WySfvNaMtZZOOs3m6FsWVUGjoawHS4BlPTqp38X/S+gOMQHRHrXC532dyq
 YDyFjB/ZqD3jFGSZhQEswjGMNU83myo7ayn9KVz3k3z470XB25tfM0TCE5ZB+xExxRTRcDyK/uc
 bG5Dk1BgCf/k0SEYKbiDDBcS26MZsuIj5xk/xDOYb5TSlJCjAMCaiagbTr5w27RPnL1T8/DCJgn
 UQ0CuzC+lnIO4KP1P97Kyvei/UEzPyzn8tKIOvLhBtuKstwSzNKLY+qLdJ+w+1NhgEm1ALFOcBu
 BaRKcWnVc5G6d68mQ9gl2V+98FLZj5HV9+FV83uU2peeNBr9FGA6D7ae2osh94TLWvyNJMq8Ii+
 UBJuycNQ3b6v7SdWTzskS0lUkD3tPX5QJ8ZQRACvkjBS5PxKCl81bdQsvSHk95x/JFhfcY4t4qa
 s+8G26zAYWWKWc5c1Hg==
X-Proofpoint-GUID: VbA7Gfg-1ZAf6aONP1cJyURNopvJ334a
X-Authority-Analysis: v=2.4 cv=OpB/DS/t c=1 sm=1 tr=0 ts=6a95ef63 cx=c_pps
 a=bo0f5OQ5EW/jR9k4kEC/jg==:117 a=WotqVVQAdb04rnGuttW3Kw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=Sv0fKeRqtYgA:10 a=s63m1ICgrNkA:10
 a=Vs-ZokuVWRQA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=taLDd7a_hP9WKsMzeGRc:22 a=iGHA9ds3AAAA:8 a=sozttTNsAAAA:8
 a=gNeiw1iGy__L40MRSd4A:9 a=nM-MV4yxpKKO9kiQg6Ot:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODMxMDE4NCBTYWx0ZWRfX41pUr242aOoU
 s1igWqtmVr6PAtHNWkp9c6f44t+TOwMmS6aFbd69RlJlhC3UKAxPgLblj5KUSIM0TZ+bFPeI+hr
 gWX0Y0Zpbgsy+Sv0WUA1lSZQsLa0U/k=
X-Proofpoint-ORIG-GUID: VbA7Gfg-1ZAf6aONP1cJyURNopvJ334a
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-31_06,2026-08-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 priorityscore=1501 adultscore=0 clxscore=1015
 spamscore=0 lowpriorityscore=0 malwarescore=0 phishscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608310184
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Mon, 31 Aug 2026 21:17:27 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17635

meta-arago / na / 20260831205233.3284636-1-reatmon

PRC Results: FAIL

=========================================================
  check-yocto-patches: PASS
=========================================================
Patches
----------------------------------------
WARN - [meta-arago][master][PATCH] open62541: Bump to version 1.5.7
    WARN: Commit message does not include file/recipe name: open62541: Bump to version 1.5.7. (COMMIT-MESSAGE-2)
        patch
    
    For details on the above errors/warnings visit: https://lists.yoctoproject.org/g/meta-ti/wiki/40887



=========================================================
  apply-yocto-patch: PASS
=========================================================
master
=====================
Summary:
- Patch Series: [meta-arago][master][PATCH] open62541: Bump to version 1.5.7
- Submitter: From: Ryan Eatmon <reatmon@ti.com>
- Date: Date: Mon, 31 Aug 2026 15:52:33 -0500
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: c547cd6e0826e6c070df5f198635c61832c72965

Applied to:
- Repository: lcpd-prc-meta-arago
- Base Branch: master-wip
- Commit Author: Paresh Bhagat <p-bhagat@ti.com>
- Commit Subject: recipes-core: arago-core-bundle: Simplify DTB filter for am62dxx
- Commit SHA: 664e57be59c22fa01922444e2869d7cb71870900

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




