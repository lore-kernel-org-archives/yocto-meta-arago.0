Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8BA78C61DD3
	for <webhook@archiver.kernel.org>; Mon, 31 Aug 2026 20:53:27 +0000 (UTC)
Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.6395.1788209603571768089
 for <meta-arago@lists.yoctoproject.org>;
 Mon, 31 Aug 2026 13:53:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=proofpoint-05-2026 header.b=cE1fDMwt;
 dkim=pass header.i=@ti.com header.s=selector1 header.b=IHdgr0rt;
 spf=pass (domain: ti.com, ip: 148.163.150.75, mailfrom: reatmon@ti.com)
Received: from pps.filterd (m0380145.ppops.net [127.0.0.1])
	by m0380145.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 67VIRoHn1643254;
	Mon, 31 Aug 2026 15:53:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=
	content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=proofpoint-05-2026; bh=tUhaVbui/x/1c
	dgf2v5CrVtlpuCTAk9f9xZNPRn094E=; b=cE1fDMwtyRfnzraWap29TSQY6D6Jl
	7rMVw8G7KX0jJHA/mhQAWMsLB9dCFu2nKHXyjKj2a6oNZKOMYPp6VykI6+mAOuwq
	fPqZjl4LjP3H+1uNB6jVAbFBBIRDp6EEfoiUrMgwiZxe11oF4kurkLGv37gJKUUZ
	qcJlV9CUaoIkpFwVt1ZstaO/19TcwqdyOLs19hJkF0fstZN7rdbogdHeundjcnFB
	bDfTS4JNnkYS0zmZqIFOVHzAREo6WLnGFaixlQSpidJF879bjS55BOuCc93aiNLp
	YBvwwStt65GVjGg75d4ivh6knLvQV04RFvW8R5ThS2Ds4auQwJpGdzFCQ==
Received: from ch5pr02cu005.outbound.protection.outlook.com (mail-northcentralusazon11012034.outbound.protection.outlook.com [40.107.200.34])
	by m0380145.ppops.net (PPS) with ESMTPS id 4gd44ncva4-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 31 Aug 2026 15:53:21 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ofvCghoKKV6rAxEtUbjtW5mS17MXvQVq83PeZD53LEmBtx8QIvlwD9NENl3XKeH5rKF4EfOT61n3h9ytwf0c3tbjK7FLrWr53BWdMDbH0MbBuZndiczveV8gXDAjyC8PBQ0NQew6oXFD5v+GW9CPLCuh0dx5x8xZ/Vu//PZuTRGL2WAvdGqVPu0bCEKzlWOTKym5g/CHXvmeTlBga1w69uoYEaaLI9Rho5PvrYOncXTJ+NT/7Mk0GyrW3Tu6Y9HrzOIvDTvUw38oajL9cHLyIpYKqPti/rGlfUyst99UkcuD2U8Y9SHl85H8hhGIyJdivFdnkJzFAvAXFHQzWDTNmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tUhaVbui/x/1cdgf2v5CrVtlpuCTAk9f9xZNPRn094E=;
 b=vlE2aray79hkYt1M0y9WRKt45jPH6TtsUnGagB9S9ctgyd2xK2G83fPCgHPhPQqG0imGQDKAsVQ6YXrLDyquGQSw8z6yfpWWj8A/Lmpu0cQs68Z9vTGcexKtQ2yFjwn3SnTyZs/P2VzmguALfX+6CdAQyLi+9TJWM+zJCIZcW8ufrUJy9+GT5iFU6eSg1n7uyMi9YGPvgZqqnvx3Rm1R2x0IKfxUPT6r9TLFNvT21+D/5gfVGjuZt3Znq965MXZi3yNXwmdm2iJ90chtJFla+n6D5Ycaqu28v4hFqCHUy9dLDnrRRRhuE4htvG5en4Mt9o9quuH26xsg/HEdIP47sA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tUhaVbui/x/1cdgf2v5CrVtlpuCTAk9f9xZNPRn094E=;
 b=IHdgr0rtwJy3cRKFICJLHO/ZeLPZLyqsGK8+Nv6laLUR1940h5js0OpNNmMiWek2QwLHcPtq24WcpZYmFxcBCzEr2xvrgwlShTQI+UmfhboUHJ0qQBfSYpQNI9XbKE3NchFzn2uirVhZKqD0iEUYydsDpUKAnQIfyJM9HjTAgUE=
Received: from PH8PR15CA0022.namprd15.prod.outlook.com (2603:10b6:510:2d2::19)
 by CH3PR10MB7805.namprd10.prod.outlook.com (2603:10b6:610:1bc::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.382.10; Mon, 31 Aug
 2026 20:53:16 +0000
Received: from SA2PEPF00003F65.namprd04.prod.outlook.com
 (2603:10b6:510:2d2:cafe::c) by PH8PR15CA0022.outlook.office365.com
 (2603:10b6:510:2d2::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.360.13 via Frontend Transport; Mon,
 31 Aug 2026 20:53:16 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 SA2PEPF00003F65.mail.protection.outlook.com (10.167.248.40) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.382.8 via Frontend Transport; Mon, 31 Aug 2026 20:53:15 +0000
Received: from DFLE213.ent.ti.com (10.64.6.71) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Mon, 31 Aug
 2026 15:52:33 -0500
Received: from DFLE209.ent.ti.com (10.64.6.67) by DFLE213.ent.ti.com
 (10.64.6.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Mon, 31 Aug
 2026 15:52:33 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE209.ent.ti.com
 (10.64.6.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Mon, 31 Aug 2026 15:52:33 -0500
Received: from grumpy (grumpy.dhcp.ti.com [128.247.81.229])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 67VKqXG81495267;
	Mon, 31 Aug 2026 15:52:33 -0500
Received: from reatmon by grumpy with local (Exim 4.97)
	(envelope-from <reatmon@ti.com>)
	id 1x18zZ-0000000DmUB-1NYT;
	Mon, 31 Aug 2026 15:52:33 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-arago@lists.yoctoproject.org>
Subject: [meta-arago][master][PATCH] open62541: Bump to version 1.5.7
Date: Mon, 31 Aug 2026 15:52:33 -0500
Message-ID: <20260831205233.3284636-1-reatmon@ti.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF00003F65:EE_|CH3PR10MB7805:EE_
X-MS-Office365-Filtering-Correlation-Id: b69e29df-34aa-459b-8bd2-08df07a1e0dc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700016|23010399003|82310400026|376014|1800799024|18002099003|56012099006|10067099003;
X-Microsoft-Antispam-Message-Info: 
	fNQ4uDIKDUHsvzxOC0BeC42QkB9R8tCpMr74f+ZeQD9werOaZIs8/PcvIQBs26yCEaHQeiX2lWLo3ROMPEsNzABVD80klQPbNiUosrA77v6XJWvi9J/jvbd21cBsUepxhvwhwmarNE+6ohRY08demDOindMEm01ubguKa/tE0Iq3mepAwc58a8zy4Ic1FKKMRz5Of50aiWEa1cVvzkhgNmKE8WIs1HIrmMCHEtV7cQL9f6cbvf7iVobItvYl5hg1+4Z8FtR9MMtuKrqKFbi2bls05gK389BMTHCEeNv8eTeFLyPLncBi5UOuQ28hNGl5Q+sTVROjx8ct0MMfP48LZP+eXKNULDpVoxBqjCjS6M+kaxii6E3g1iuNPWEvFcTcOMQyrUfEwaFfWeNWWzDhuqs9nKUvGTWpuKZdoJK1f6uDdFSW0AGdV+HcAGJHtnSXCjkqox4CWKuUCkz/1ChngfVSlcUAFVKJjC7pi+3JlzmeekeaCEg3NI34dBfxYtpjy0nAum6PlKfImhSJs+9MmDemIo7Yqox9fLkvttvfO0aD7glebxh/GIGFeM+ja1EfmfwkaHuRTKnm3G2oYLQZ9tUBtMVFZWea7znROyyyq80RqsexglDqaz95dpYfndFaqB9CNrSufqoA1oR9nxcz6nslfLb+es/rY3uG93QYE/o=
X-Forefront-Antispam-Report: 
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(36860700016)(23010399003)(82310400026)(376014)(1800799024)(18002099003)(56012099006)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	fbpVZKXyz4ic9mo8ixgV3g1VH0KpXOV/Tkfa3YCpqSZmNAh7CilFFG7fnIYJ0PNiF9MEN7yoHZ7sHCjEkGPUPppnwkz3bkHMBKBgkjD1jXjgQWzq97UqFZowLwXt+oWOIP8KNok9PDOfeSoYuAo+7APBzqZKLhhBg/oI8HCu++s/6KWaMxRpEq4ktNlPy5WND0MknFcFpqNKlF8/EMquiNt9Eyx2kM79E4zZmhLWLfyPYHvqCGMfo6/Ae/hkvijdWWSCiidW0mJSrjLAV/HGieaH0k6SK/8+Ls3PPGB2ZLTzs7ZvUVImv7DdgHnfMmxQTqwmPRuyIp4n0o6qEl7gtg47C5NUnXnQ2+EkV7iqY9ug1rhK4XKGOsoe1GUO2Q+cZOMuVITkhnGrQutu++t2i6urEhDM5Q08sWBySTLLGY4lkDkY51VVJW7zDV2TWK7Y
X-Exchange-RoutingPolicyChecked: 
	taa9T8WyMhNkhW1Ex9hNlGF/o63nqwwXufc+pOwL34MNQMHDici2SexfACB7ZDxUR40V+556Y93Jz6yw4Pk9fg7Z/C+pJ33XXqb3TrHzmjvPzfgtEmsL9OlajQkX3yKNGvy22ZieqkBEPE3zvPKUJHAbwHpRkTdQpSpsjaj37eZvgEHdPPgQG5csnhrtMRWbmU+QNM/sZTwdBOW6t0uDWnFeySJhBn5018rbkBMuw7Y8iNXLk9Q8sQv7V7ciQMJdq+zKKGAGRiMWVi8g16Nj/D+oIIZxjaxkrXdkMggbU+j0ITKKP5zKGGv8II5tni4DPkN/6k4liyEkz5xM6hmY3g==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Aug 2026 20:53:15.2882
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b69e29df-34aa-459b-8bd2-08df07a1e0dc
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SA2PEPF00003F65.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR10MB7805
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODMxMDE4MCBTYWx0ZWRfX8LbE0Wmg3zk2
 7k6OvS/Ep/FQfexeIn57CGrljROHzFWaIIrdyqlsrmvWRjuvL8VGDpT471k8KRNtBfEqGfCdlUD
 l1jXMAZFtXmpS5eF0OJTsiMKwOOjYaXfNhMf2Lib+pS3e51yYCflA8wO9stn0aVx7IeLdf8hKg+
 WhR4NMEAq6Y4JTHktNuGypqknLnAIjjDnnmDNRkOHJoaU7rS5x9/LXwWElznl3HPQCa/Y5Y8WjI
 p9zbn+nITqLnpieQwDcTQrZyGY0g6B3LQFEMcy73usFLf1ifAWIrUMhi0TdjeAGCKESP6k364hf
 5cbASnQuQSIXIUyDVw87gW5P3YEHyl49b2fZSo0s+A5ma6OzeOgSDAEiB43pThiB5b+KMthWAb1
 OtxqMHPmYEjDGnLYaL302S5NdWCee/mrKBHWkSfauyGdDU1NBDO2CC6Ec5GfjZYnnlqfi1/tQY6
 gHebdizb/e7m6z/BEcw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODMxMDE4MCBTYWx0ZWRfX8Wc0rb5WNLtC
 uh3AED1qvftQu3bj6ZrlDINYWAKIUcGlwsiDQktw5r6M4yyA2DCOqQyAJaysYHvECfGzpEKgiUF
 Gh46NFnnjNiIKO6B7mV8v+NSDYAfBgo=
X-Proofpoint-ORIG-GUID: HvY01HY4MQIKmBTA5Q_u9g204Z4t8I1g
X-Proofpoint-GUID: HvY01HY4MQIKmBTA5Q_u9g204Z4t8I1g
X-Authority-Analysis: v=2.4 cv=T7W8ifKQ c=1 sm=1 tr=0 ts=6a95e9c1 cx=c_pps
 a=9AcDkMntNQwiSFi2uhiI7g==:117 a=iwqwCZQqcuTv3JOpYdM7/Q==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=Sv0fKeRqtYgA:10 a=V5UXEbMT0ywA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22 a=gO1vWkAQAl3rybz1DQOp:22
 a=Q4-j1AaZAAAA:8 a=sozttTNsAAAA:8 a=O8hz-KBhv1zwfnnLhggA:9
 a=9H3Qd4_ONW2Ztcrla5EB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-31_06,2026-08-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 malwarescore=0 impostorscore=0 suspectscore=0
 lowpriorityscore=0 phishscore=0 priorityscore=1501 bulkscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608310180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Mon, 31 Aug 2026 20:53:27 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17626

We need to follow a commit in meta-openembedded [1] and bump the
version of our bbappend to 1.5.7.

[1] https://git.openembedded.org/meta-openembedded/commit/?id=b6c09f6630d5e88a993252cb7e5ee23aec9fd569

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 .../{open62541_1.5.6.bbappend => open62541_1.5.7.bbappend}        | 0
 1 file changed, 0 insertions(+), 0 deletions(-)
 rename meta-arago-extras/recipes-connectivity/open62541/{open62541_1.5.6.bbappend => open62541_1.5.7.bbappend} (100%)

diff --git a/meta-arago-extras/recipes-connectivity/open62541/open62541_1.5.6.bbappend b/meta-arago-extras/recipes-connectivity/open62541/open62541_1.5.7.bbappend
similarity index 100%
rename from meta-arago-extras/recipes-connectivity/open62541/open62541_1.5.6.bbappend
rename to meta-arago-extras/recipes-connectivity/open62541/open62541_1.5.7.bbappend
-- 
2.43.0


