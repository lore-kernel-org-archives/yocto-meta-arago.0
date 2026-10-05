Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 32D43CA5FFC
	for <webhook@archiver.kernel.org>; Mon,  5 Oct 2026 15:13:58 +0000 (UTC)
Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.22303.1791213227820547945
 for <meta-arago@lists.yoctoproject.org>;
 Mon, 05 Oct 2026 08:13:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=proofpoint-05-2026 header.b=Aqed8DCl;
 dkim=pass header.i=@ticloud.onmicrosoft.com header.s=selector1-ticloud-onmicrosoft-com header.b=DhB7SxqI;
 spf=pass (domain: ti.com, ip: 148.163.154.28, mailfrom: reatmon@ti.com)
Received: from pps.filterd (m0374955.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 695ES5YE210977;
	Mon, 5 Oct 2026 10:13:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=PoTjxf/8dnU6XCbqxNLBvU8mqjiKp8of+bdrKX7Ua
	hc=; b=Aqed8DClGsLCz3VHInnVXw/DHuDqB/b/RzRmUwhiwo+5TMQ6oDaMNRedJ
	ITR5JRKwZVQFurvpr+hbC1HZD5Upb0Q2DFA+IEIBEfD7ulSkKzPbPD+aklnlsF+M
	pjrs8q0Z+kezTpp5JqAiwe/lVzX2aX7ByG6SqMDY1Ze9utIIRgAXqmR+yRJ/xxk3
	3biL8Sk0jIPs3+P585POEo9d1LuJNJbMa46RKDFU2aTPb9+0GES8LAhRSlqaQP6U
	EgdEbK5WV2LAr9yKkwexnQjHYe4fN50pV7AI1MK16mF5AGJXco3XK8hiazvifXQ5
	6EQ3vEfgCldNz6T29qYoVFBELws0A==
Received: from co1pr03cu002.outbound.protection.outlook.com (mail-westus2azon11010040.outbound.protection.outlook.com [52.101.46.40])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4h4d7c0gpx-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 05 Oct 2026 10:13:45 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LRATj3677JCDyd1uqElzldlxWDS/LSO6hNzOGc+RXpRLZ7Vnl29WR21Dz5H247eplq77UFQZK3AT4nxyMVxUuDh2QgKjJL+5RWehXNOCE3jEEJa85nD/9UabTZM9ki5uoGQQWMljUMgENgBX5BSbppw361wReOXFcZdvRrpxUA2/yaMsvC29wPjXK2d78ipsIYqsrffDg/PjtfvmGyfPH5B/aVoMZ/oYdXzxaY0ByuGZNdmHSghabsjv0NkzOWasijEFU56tCdQss8XAq4OSd7paxpChpAyKpw8DaPnSiqWDG5JW9NReAlY95d7/QlbG+LKl5FVAwfWbi8b2SeUVug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PoTjxf/8dnU6XCbqxNLBvU8mqjiKp8of+bdrKX7Uahc=;
 b=lmcb1SFd3lNhxPf7sm0BGfpWSFbXkSGXaZ2DclQMoGszguI/OQK9mlMoqa3Lem0qcBTHr2GE2DoYRoGbOwF7BzQAvS6H5MfRenG+ZhSACg8i4JHNN+0oiw4BRBI0Lk8Lx4t5qdhP5nu1puPkEr8yiGSmlthdw1iNJMyHnEk8tHQwSuryEtFjV/zXtSRZkQ5tjqPDqXc37To9kfzeU7Chg+zGpq9jgOk5FmMBxdK9idNYuSHGSendF9445M6ED+LpOZpu44eGFtC8qQnfge/+2/ZgoB/UhyJIemKX1T3IO8ognKEPPT/zKil2FXyXa/57VQLQr5Y2BoI5OizwNiZhcg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ticloud.onmicrosoft.com; s=selector1-ticloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PoTjxf/8dnU6XCbqxNLBvU8mqjiKp8of+bdrKX7Uahc=;
 b=DhB7SxqIf9+i2ua07G0MpZf5Y29Xr+bUTz+FHOOlW67qbQRhjSvzSDImjr/zeLZEbxkrnyZJo0cktz33eplFFPa5P1L4BiO0rr4/Q+S7xVX2hgBnbLrJ0o8xHmBlhRxyebdVJoa2s8NUe8oHTAvAc6WRpQ4f9HOaWtojQqLumt0=
Received: from CH5PR04CA0007.namprd04.prod.outlook.com (2603:10b6:610:1f4::7)
 by BL3PR10MB6210.namprd10.prod.outlook.com (2603:10b6:208:3be::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.7; Mon, 5 Oct 2026
 15:13:39 +0000
Received: from CH2PEPF0000009B.namprd02.prod.outlook.com
 (2603:10b6:610:1f4:cafe::3) by CH5PR04CA0007.outlook.office365.com
 (2603:10b6:610:1f4::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.472.20 via Frontend Transport; Mon, 5
 Oct 2026 15:13:39 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 198.47.23.194) smtp.mailfrom=ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 CH2PEPF0000009B.mail.protection.outlook.com (10.167.244.23) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.496.14 via Frontend Transport; Mon, 5 Oct 2026 15:13:39 +0000
Received: from DLEE210.ent.ti.com (157.170.170.112) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Mon, 5 Oct
 2026 10:13:13 -0500
Received: from DLEE210.ent.ti.com (157.170.170.112) by DLEE210.ent.ti.com
 (157.170.170.112) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Mon, 5 Oct
 2026 10:13:13 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE210.ent.ti.com
 (157.170.170.112) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Mon, 5 Oct 2026 10:13:13 -0500
Received: from grumpy (grumpy.dhcp.ti.com [128.247.81.229])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 695FDDge1381153;
	Mon, 5 Oct 2026 10:13:13 -0500
Received: from reatmon by grumpy with local (Exim 4.97)
	(envelope-from <reatmon@ti.com>)
	id 1xDkNN-0000000Fbpc-2uAI;
	Mon, 05 Oct 2026 10:13:13 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-arago@lists.yoctoproject.org>
Subject: [meta-arago][master][PATCH v2 2/2] arago.conf: Remove "x11" requirement for mesa-demos
Date: Mon, 5 Oct 2026 10:13:13 -0500
Message-ID: <20261005151313.3720270-2-reatmon@ti.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261005151313.3720270-1-reatmon@ti.com>
References: <20261005151313.3720270-1-reatmon@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PEPF0000009B:EE_|BL3PR10MB6210:EE_
X-MS-Office365-Filtering-Correlation-Id: b3802a60-1409-4352-663e-08df22f33c3f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|1800799024|376014|36860700016|23010399003|6133799003|18002099003|10067099003|22082099003|3023799007|56012099006;
X-Microsoft-Antispam-Message-Info: 
	Nbrx2C0g0h3OJJTFJJxo86FXeb0dq5DDj17s8w3U4If2O8Usd9hotCyHfPSbjgNJYf1dpXolatIqPk2H3KWsV4Qox+9RpvH9Fr8QEvvllq5m5A4COOT5U9Iyhbxre84dvg/z7CMLEd2Hc1itqWXwbsmlHuS2Sb4pYw5LEkydBdB8wHkd9hSLia6PKNzpF4li7XwyxWLImwEzOimV9R7VHGgk+dtD7dzYag0B/rb1G7wF6fnx0iEJejMiYFkbdJNLSphjWSI9zjhSVMaD3/iHM8RJlnYOEyJtK5nzQzDeNQH6MMQ7ZXrk8/SnzAcpyASMu5kOJ7v9bVYxadXY2KjAR9jn9kNC6Mh+V/Gc6xUqkQBpHI1q9Auttyv6YewaASAOqTRfaXE3YMYw5xIoM80wWEko20MhwNFyseYesbauUlkWapFRTGZ30zvGDBnMZO00qMSQM/cu+zap0M2b9mnSoFYgcYJnfYlCYebCmdqVhnc8/H49EUbLds3G+nn+tu+y2SzLsm5ygZCEULyaIHbEA3gvuC0zudHk8ruRJp2pqdOk7IMMTxjCMGBaWRXVNn7zlQJdzoyyqhrYJKOJgnxYwXMuyOlNW5J98LXhMbNRIbz7E0A38ubhXOvLXRcBvpd8dhWh5Yij/fuM86VpbAFjE+bHIBiIIT49nDzmObEJPdXKUj+rxvoTG1v3gYOis9qIQRErZvKeVFv2QimjI4MJsw==
X-Forefront-Antispam-Report: 
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(376014)(36860700016)(23010399003)(6133799003)(18002099003)(10067099003)(22082099003)(3023799007)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	NK6AjLJzpdPzMDf3/R2QrZjlVS67PX5O6cs+dFlLL3cSPtlbrutUHL+4zpE4j3e2rKsc4smeHQzThFwGt0XMe0vzmpOQb4OR+tsIrtj1ApRptjoZ911ITBjrLO0ryL+eF9r1Kz918dqM2/DTKIzCopihLT7gBafkh7qAJHYa26GOR97i5ZMDYM/YSVDg6r6jjrRMbl8LGJ0i58yikRic6teYJn4cLBWRooBwC5B6hbtonefuY2LD6quO4XAsq195w7cbqRcKO0gtLzcFRAiT0ruwngDG4KM0+mW2X5czMbcede2EJBXpA836Mw6Zk6QiOO8mcK0xFHiAmeaE7cvqkjkk8tqOuxGlxrStVneOErTC22TLf9KXt5+un7zj+MOoFCb0WP4fR4t2WW9IUShDYoS3NhLX7odkBncAxZLjFeCvqTo8D133Cu6p1xNm9dq0
X-Exchange-RoutingPolicyChecked: 
	Bnl/3YOa6/gGDHKgoCk0Ik0kdJPDliTkGTWFMiVAlCOyLjQ9hx0L4M49/tNDKIVsTpT7WBiotTQEenGKSsP4Wn26w/cnIifXDhrbtWrSDN2WACzf6apLfaBKsqOUg35layWnsmIazpytzB9E8G+aHmfgz9bvtq/1H+6caMqsA+BAViy49c4d+mkAuaw0hzghmNme3ZwiYbjdzGG8gdm0GEbtDdt3nerNeTkXjxbpRuAcLnmi+h5cB2Ng4yqDQvsgOsqr6VSdvv/C8pmUvhzxmggqGlQeRrcgDjliC7rw+l7xj1vFrBoXJS7g0GFyOjyaVx9DTvRm2Gete+qxUx2jtA==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Oct 2026 15:13:39.2114
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b3802a60-1409-4352-663e-08df22f33c3f
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CH2PEPF0000009B.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR10MB6210
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA1MDA1OSBTYWx0ZWRfX1/Re/85CDFdn
 0caOhyPWJJS/0T2VoTkvKcPoIKVI9oMTpbAQ2G7VQlgrcKkVDwj4Zornuie4kRkgmCb28An3Uq7
 X3G/XAzpI+1OCxllGRV8rnjyzPGeye0=
X-Proofpoint-ORIG-GUID: n372MCKogtG201k19fw3DNIV8Itn3iSY
X-Authority-Analysis: v=2.4 cv=RfYFmFtv c=1 sm=1 tr=0 ts=6ac3bea9 cx=c_pps
 a=AQ8jqBFaYtg5UXnSSWtk/A==:117 a=WotqVVQAdb04rnGuttW3Kw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=660iZSQnnn4A:10 a=s63m1ICgrNkA:10
 a=AlMIdn_sM9wA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=fPAWb5peG099m5CrUpKH:22 a=sozttTNsAAAA:8 a=r5tcPUTaiqWKKPCq__EA:9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA1MDA1OSBTYWx0ZWRfXwFBHeERJ94id
 WhEv2sjr9i8eiWCpwMx14o5SgpIaziZEwd+C+Pilr7+2/pVE0b3gd9LBrsldcv49C2QUKA4RT8B
 P6mSLkcx3Kors22Meut44wYHXuIp0vLpRtKkTRTFWpknU/H5YAQ7TtY13XP1IIGe92fwZaJpPkK
 p/onzXkwnmfHr2FywlgwHxmDgDkfu64KPITMAdIv4C+alQ6wepgQOagzW3LCAGEwnL5DQXA2FYH
 qAj1w1ULgwNVysEFBM6IXAuCAlpisbTM1A/xeh/vsK4MxOeExgdXjcFxKT3jX4muOdNDEH0p4q/
 BWNDmaFcjciAdEOEsZEGdGJrCMtLhszaxhzGNpD+MjJeqV1zTqB9C7Ynx+veNPl9igR+ZF0BOp2
 8smtc6LkrNEgBlgTb2PSGlzZOjjxtZRN92tfy/xGXnVBtNgkEvrdcMsGWEt0OZnYrrqlyzdDZMT
 zf/ca79Jp7cBJYlgEag==
X-Proofpoint-GUID: n372MCKogtG201k19fw3DNIV8Itn3iSY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-05_04,2026-10-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 malwarescore=0 lowpriorityscore=0
 adultscore=0 clxscore=1015 bulkscore=0 suspectscore=0 impostorscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2610050059
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Mon, 05 Oct 2026 15:13:58 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17734

We are working to get this fix in oe-core, in the meantime we can carry
this change in the distro configuration.

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
v2: n/a

 meta-arago-distro/conf/distro/arago.conf | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-arago-distro/conf/distro/arago.conf b/meta-arago-distro/conf/distro/arago.conf
index 4a020466..4624d957 100644
--- a/meta-arago-distro/conf/distro/arago.conf
+++ b/meta-arago-distro/conf/distro/arago.conf
@@ -113,6 +113,9 @@ PACKAGECONFIG:remove:pn-opencl-cts = "opengl gles vulkan"
 # Add OpenSSL support for HTTPS protocol on ffmpeg
 PACKAGECONFIG:append:pn-ffmpeg = " openssl"
 
+# Remove x11 as required for mesa-demos
+REQUIRED_DISTRO_FEATURES:remove:pn-mesa-demos = "x11"
+
 # Configure RAMFS for jailhouse linux-demo
 JH_RAMFS_IMAGE = "arago-jailhouse-inmate"
 
-- 
2.43.0


