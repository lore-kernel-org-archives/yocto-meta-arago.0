Return-Path: <p-bhagat@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 98282C982CC
	for <webhook@archiver.kernel.org>; Wed, 16 Sep 2026 16:07:31 +0000 (UTC)
Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.18730.1789574846387401409
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 16 Sep 2026 09:07:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=proofpoint-05-2026 header.b=HrzG8t0c;
 dkim=pass header.i=@ti.com header.s=selector1 header.b=fY9NiMnY;
 spf=pass (domain: ti.com, ip: 148.163.154.28, mailfrom: p-bhagat@ti.com)
Received: from pps.filterd (m0374955.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68GFaVma3542334;
	Wed, 16 Sep 2026 11:07:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=4p/g/707gyPOsU8Dvuo3MD9Akvb/keQZThxj4vYSS
	oM=; b=HrzG8t0cWseUFhoxTEDnVkx0KziTp+R+aOQ5OxwR4sebBE+Yx9fqsWqMg
	wkB+Rj1wf6X9MoLdihsoQiKyT6wMyxyzQNidsp0aj8t0Ndz9o3EFStpvfdjN5fKj
	AKvS9F2eb7cyxsrvSJFMsBP8WkK/c8HY6h8w0JqOYbOqesNM/nfEHJyuA9Jm0jwH
	aqeGwdPs2wbVrxJlh1Hh5gCxoEaDvK3kQhqGbFwVasn8k2AcXFyr4Yu4MbtlQIMW
	Hzpdn3sJps2R+z5FBOu4j/gvaWyZ7I2j9gN3ySatcXUowpXIi4dvLzu1RLM4RP5o
	Xp6Q0yWQ0q89jnevrFysqSEKDzhtw==
Received: from dm1pr04cu001.outbound.protection.outlook.com (mail-centralusazon11010069.outbound.protection.outlook.com [52.101.61.69])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4gqqmdatx7-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 16 Sep 2026 11:07:23 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JM2LQWKpOv3tEAWcQKXIvadP6sJrDbQ8GrlPZm00TplhcJbaLzSNpRkMDuUvzU5osc67aJluQ4Zsgc96JJv83A03ypp2uwyyCnsM1Tacf8WDe5BFQEKyeriTndMYBUO0lx14/lagSqyPInMJTt8y0k8/SwCgDqbZbKj/TKdWX7wNtWbs60W1+d4LsNArW+bVA9yq7f8Fzo3Z6USwpi/9wbafF3Hoo77nkuJjv78ShI0sYWQN2nAUZ4gwjUCWPwTkF5UgPKCFmPIj4RDkFiZU5cJ0Dg9cXbPxebttNeF0CTzFQuMAw1DbG/FRFgf3Q/a9Jb604WmVchV8u4I+whi5Vw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4p/g/707gyPOsU8Dvuo3MD9Akvb/keQZThxj4vYSSoM=;
 b=f8DWmtEdnZgRBCE7ctj9gj/m4WmwDtVqIu8wuU+omYp7PpYqFIeJymAdRbJCPwgeGMXyTI/4Xum9Iqev1GkW7/nZOKrOTMedhvVb0uFui2bMz53lyo/DS5xSUm3dzGG/XIrapIYmsiQ6UTUgH0S09q2yO50Dw4XGo1U1V/aWAy+clnindZfZSH5mLHPlNskn4CcuXjzHhuHtyTOZrnKhsmos5WLM0W7UgZbNSWgy4R+Dv2L5yt7dnfTY3YsFqcNHB2Jpib8VeiyKf//mqZfg6vHplXtR6O9SDR+PrK5V6YwaGFNB4+pW53V9FIG9w5pZGu25SzGh2ycZeevkI/ZIaQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=denix.org smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4p/g/707gyPOsU8Dvuo3MD9Akvb/keQZThxj4vYSSoM=;
 b=fY9NiMnYds1dpnW4EnZEcYXpCvWRv1mgcmzy4oOoeJYnjTzIZ1A/1TE3SKxqAI8/FOtDhI7Pu40tPCMkiccVf41innnFgn7kHXoz6ORRLFPPbwXtwRl6hoLYPXrvuwrbqk4gG6gh+u6WOJLfVekSuRtBOoPBogK2PFLyEvf2cDE=
Received: from SJ0PR13CA0138.namprd13.prod.outlook.com (2603:10b6:a03:2c6::23)
 by DS0PR10MB7149.namprd10.prod.outlook.com (2603:10b6:8:dc::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.5; Wed, 16 Sep
 2026 16:07:17 +0000
Received: from SJ1PEPF00001CE0.namprd05.prod.outlook.com
 (2603:10b6:a03:2c6:cafe::a7) by SJ0PR13CA0138.outlook.office365.com
 (2603:10b6:a03:2c6::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.451.7 via Frontend Transport; Wed, 16
 Sep 2026 16:07:16 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 SJ1PEPF00001CE0.mail.protection.outlook.com (10.167.242.8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.428.7 via Frontend Transport; Wed, 16 Sep 2026 16:07:15 +0000
Received: from DLEE213.ent.ti.com (157.170.170.116) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 16 Sep
 2026 11:06:54 -0500
Received: from DLEE214.ent.ti.com (157.170.170.117) by DLEE213.ent.ti.com
 (157.170.170.116) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 16 Sep
 2026 11:06:53 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE214.ent.ti.com
 (157.170.170.117) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Wed, 16 Sep 2026 11:06:53 -0500
Received: from localhost (ula0502350.dhcp.ti.com [10.24.52.241])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 68GG6qUo2261544;
	Wed, 16 Sep 2026 11:06:53 -0500
From: Paresh Bhagat <p-bhagat@ti.com>
To: <meta-arago@lists.yoctoproject.org>
CC: <denis@denix.org>, <praneeth@ti.com>, <reatmon@ti.com>, <v-singh1@ti.com>,
        <c-shilwant@ti.com>, <afd@ti.com>, <j-sahu@ti.com>, <p-gupta5@ti.com>,
        <r-soni@ti.com>, <s-kapoor@ti.com>, <s-sinha@ti.com>, <sen@ti.com>,
        <y-hegde@ti.com>, <devarsht@ti.com>
Subject: [master/wrynose][PATCH v2 4/4] arago-default-image: Add PipeWire audio stack
Date: Wed, 16 Sep 2026 21:35:47 +0530
Message-ID: <20260916160547.1287287-5-p-bhagat@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260916160547.1287287-1-p-bhagat@ti.com>
References: <20260916160547.1287287-1-p-bhagat@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00001CE0:EE_|DS0PR10MB7149:EE_
X-MS-Office365-Filtering-Correlation-Id: 4659886b-1906-4dc1-7866-08df140c9392
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|23010399003|82310400026|36860700016|376014|10067099003|6133799003|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	tEmxzlp8nAap42E8fpb07vdtMpYN/kJWjQyom+WlclSZhMab3ipEsquRwcnfW73VBWl4Itoz2UY4xgChRSUDjEPmXmd4C1GbCsr52uYeDdmfy+wSJEvKh4jICXpimFuLLyvBLiZJW09R8UGRlghPI/HhqbJcAgVOyZlTP2qy/csKAdGE+zdtpzqGu6+zH6ZnORCjahQGTwmwTkDb9dLXliTuYGr2f/fzT1UuBmh2YWPYSbzy7FGkKiGUxf00/w6L0rNxMAlmJzUnZFLfQTSmfFMYLpq/wwyIASmHoc1CTrbSj5v9tYUi8M/7/fooBhFQMVvRntDD8Hb7X6fQIOhGuT1RxG/LOu19CW2E+6Js44ctNaRPe0EoIIA7v2Gn78Nb+7SP9Fs3k05qU//U1dPW/LuM63x70B6rreCZlmhtE6qLw0T0FweGnSi2IHHKQt7+WnFsDEBV94r9u0z9y95Vzi+E+LHROzzQDuVsm/eO2Dtw7Yo+QSYG2PCyxLTo9oWVJL/c0/k5xduVnLXIvCEv/UZYjLdSJUxggJzOL6pSSPgliMXw64i9Z1jYdBR1cXpB69BmlU1qvZ6OTse8Rf2xTMfbPQk0V0lPbKRuLcopkizmw/Tl15C3jpfRjP6CsboCt1++/aOAtneRXdj0/M+kEv5EjBJi3plTtJsCg2gxMejbARev/MZduh8cR2iLAi2OfgcDF44wb27eRuM6vlvAEw==
X-Forefront-Antispam-Report: 
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(82310400026)(36860700016)(376014)(10067099003)(6133799003)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	JmmasiruAfvqNBuRK79R67WROtKhHOsskocLvlpB5pgv48Rpwsr93fK5nV9t1LrIruDHbJMyb3ea8o4WnBpdo9nzBBj7PMv0Q6qzMkRHXNZLKyxYoJDQNWIXvGA5wKwT+jOVqQo1deKmT7NL+C52zVYf9TfmnYHqfw4Nk2dbpdndRuj4ONiSHZTLjTVqrlDb7gfPYxrxue03CkZbNbgpAzd4JCx/hP10mQyzU7+PGQe7U2VrBBlNGeDKTmJHs/A4A9+Ff33V/ko3aDXDo2qXv0ewv2KKbcTwpt4NuIdz9QuZ5NrapcsVGnaO68xfRTaQktw6ypHSzpfGVDQd/k3UlxJA2OHhpkjY25sElNUbbPUntoO51bcEkFx5bXoOyxRsQRmfVXirRsMOEaFDxVgrX2CrWw98UhtkKMT5IP6BPP12Z2Bqjzuf0Z7o9EHzP/qv
X-Exchange-RoutingPolicyChecked: 
	JHObEFCX7JQ47STb+IU2jtQ3mJuuBiuhNogio58tjTLUxD4dL4xrmu6VoRcb0a8yXQlIrzNyLiXggJAzZAdEHuzPn5JGTxF8f8frmn3Esxy5j5WVvfOVXtvBLUDvT/d37MD6q2fxWmMOBYvVAcxbXRLW/EohP3Pvh96GQusvg6IXu5UJ8aggS3VLqXpP/zwk+JQFYZ42ssDe5GDJQhYYjkxM4Ap65hh29hOXwBz4i37vm9QjDrUGq9lHPbHX31cYElVCPHR1QKQYBYco87oSZsJZfmOBtjhBo3BjqcQUa6IsXfpQno6/s3vR8eyDuVPHMfg1VCp3orHMJN2mGG9aKA==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Sep 2026 16:07:15.6590
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4659886b-1906-4dc1-7866-08df140c9392
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SJ1PEPF00001CE0.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR10MB7149
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE2MDIxOCBTYWx0ZWRfX8nqmtRrVvfZY
 d6/FRDAt1dnqP7X8WiJ75ps57Ulw556wEt4nsLaCZcGlXd7Iv21qWGSo9Of5BnC6pLb/6Ihy/d5
 +ZKUADPkGHMhCGjG4OwIiFCzI/cXwgdsRl4VzrjvNwgT6lF/ZlZaLZUQKCdkCxFlTvQ7vVwuegi
 BynrqKByNJTGK67AQtz1TwAwti+8GMPIr5KfwfOTY5vcQCzqWni4B/kl1qcqCPQvEd3wWFknVLD
 ZQFutswXUszXxRlgm/Qd1nrhhLniWegYgLFIdDdVTLGiYf1A+B+3vdH37te93rVSEOzgdQSf35J
 PskO5u2q4PyZYZmb3PwbWCVAclmmQ6uh5HGsrjnYtBJfuAE9uTWKdCLXRwhuh1b11ztX7e4PcVl
 KflwiYC1Af6Hb+swljdD3TYvMm8dMqfEzn0ajlyu+wx/uhEWa9lbujMXg9bveIWmPaZAyUjKt80
 wx30JVTy4ZfSJc2ubbQ==
X-Authority-Analysis: v=2.4 cv=S6JMU4sP c=1 sm=1 tr=0 ts=6aaabebb cx=c_pps
 a=wsTBi80DslKxnI1CMYi+3A==:117 a=f+v6EHfkeJbVwR46tk4DMg==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=VdqzKS8jKosA:10 a=s63m1ICgrNkA:10
 a=V5UXEbMT0ywA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=fPAWb5peG099m5CrUpKH:22 a=sozttTNsAAAA:8 a=5xKsKj-xuoGtBIhO-7gA:9
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE2MDIxOCBTYWx0ZWRfX4XvKS6iqOf4I
 0IBSUYLHfEdtOvzB6QXzKfLur3PVRFlDLhflD+O2CDoKLaPq8wGfq/RujqOZBYgk2fuAFLWs3Gw
 3WrpQJKYeLvkV+YCAcf2a3TVUYclGAA=
X-Proofpoint-GUID: T5Dy8SJsNID75TEOapOKcmxWbe1XfmBP
X-Proofpoint-ORIG-GUID: T5Dy8SJsNID75TEOapOKcmxWbe1XfmBP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-16_03,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 spamscore=0 bulkscore=0 lowpriorityscore=0
 suspectscore=0 malwarescore=0 clxscore=1015 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609160218
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Wed, 16 Sep 2026 16:07:31 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17676

Include PipeWire and WirePlumber as the default audio stack across all
platforms. This brings in the core PipeWire daemon, ALSA integration,
PulseAudio compatibility layer via pipewire-pulse, GStreamer plugin, SPA
plugins, and the WirePlumber session manager.

Signed-off-by: Paresh Bhagat <p-bhagat@ti.com>
---
 .../recipes-core/images/arago-default-image.bb | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/meta-arago-distro/recipes-core/images/arago-default-image.bb b/meta-arago-distro/recipes-core/images/arago-default-image.bb
index e01f7c2f..0b0c3d61 100644
--- a/meta-arago-distro/recipes-core/images/arago-default-image.bb
+++ b/meta-arago-distro/recipes-core/images/arago-default-image.bb
@@ -43,3 +43,21 @@ IMAGE_INSTALL += "\
     ${DEVTOOLS} \
     docker \
 "
+
+PIPEWIRE = " \
+    gstreamer1.0-pipewire \
+    libpipewire \
+    pipewire \
+    pipewire-alsa \
+    pipewire-alsa-card-profile \
+    pipewire-dev \
+    pipewire-modules-meta \
+    pipewire-pulse \
+    pipewire-spa-plugins-meta \
+    pipewire-spa-tools \
+    pipewire-tools \
+    wireplumber \
+    wireplumber-dev \
+"
+
+IMAGE_INSTALL:append = " ${PIPEWIRE}"
-- 
2.34.1


