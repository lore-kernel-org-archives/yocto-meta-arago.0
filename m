Return-Path: <t-lannynd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 035A1C98304
	for <webhook@archiver.kernel.org>; Wed, 23 Sep 2026 20:22:37 +0000 (UTC)
Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.4632.1790194954259713765
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 23 Sep 2026 13:22:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=proofpoint-05-2026 header.b=HgMCq9Yt;
 dkim=pass header.i=@ti.com header.s=selector1 header.b=JD8WdicJ;
 spf=pass (domain: ti.com, ip: 148.163.154.28, mailfrom: t-lannynd@ti.com)
Received: from pps.filterd (m0374956.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68NJkjL71620212
	for <meta-arago@lists.yoctoproject.org>; Wed, 23 Sep 2026 15:22:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=proofpoint-05-2026; bh=dmNBzQHbDuxek
	FkoLMVSVInR/hK4Cz0GKnqJ1tEd5cE=; b=HgMCq9YtK3FEXjBUbH3nOoPBfkr8a
	LgWR34Ln8a2/zC7+8+/qLLfe+lqeg6SIVdK+tg8fm6HqyoZ/EhnlDGiBmprVlKdF
	t5Dt/dayaoHbdVIkM+hBPUYp3EmzLGeef7sziXr0vHT2D83J1U0WkfazRrlths3Q
	eiq7QASezi/KkSbOT5+f4xsDhaU6mTxHKgE6AnUWgaXXZGaWVMqjt+RbVDqv2VxZ
	PfSa3f1fMaviGZJeq75FUI+0EJVdJwDsY41tHhQmdoWiXSizQbIN2WXYIyrBcXxQ
	RF5BaXKGDbNmzcpidK3WrRwgR4W4tu6sOVpU0pE1vS9NyjiYMEstFQ2Fg==
Received: from sj2pr03cu001.outbound.protection.outlook.com (mail-westusazon11012018.outbound.protection.outlook.com [52.101.43.18])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4gv54tpms5-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <meta-arago@lists.yoctoproject.org>; Wed, 23 Sep 2026 15:22:32 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cB987zk//UYPyPuTwKcxqe6HmLCOo1bWCV7jGcqXTvzRrHT8fqrl+0wVsNP/mTXJrpf+W2tRpTYMVFz7n2gFnk+/QYIL6XUJM185cMR5q/ENU/LypfHYHQl1r3JUeYDlcc8IC6oCA4KVvxoWLV91j2h1hFNWUGIzDA0FSB5PhKmXkY/9nieiRJ9JUJvxfj+WFUI7EIvOvSyNSR1KXU8dG3/n181KzU5uOo2sUJI1K3j+O4l8NZqVZUyFBChPVYXnOrxZYvAMlqZE/tWNHohjHr0l7sLh/7elcIFmiWzCfnj8YRP5XaKlC4PbF3xp+B5iHxU7mImaeR7GMbMceSxrpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dmNBzQHbDuxekFkoLMVSVInR/hK4Cz0GKnqJ1tEd5cE=;
 b=KDwtArYLbw8F6aoLlwI/u1eKNEkQSu3Qv+tydjdTUwG+AkRidR28PQQIFhg8scCGva4MCFl8PpjY0cde5AcmazeYi8EEm8ZbA15B7LvViclEPZ9SC/d2vT5A5QBPGYCEojDXp/Nm02H2w2acOWHsXuicGfESHH6sR6MRGroHqdRc/HxokXXWFjSRHW9IKnRtVXF8r5DZHQG0t8Diy7KH6tM8OOZJrwQ1Igh4pvZievKsQZ86ufi5WxL0ktX3nCEm6pJMySyMPigopUYYt2eO6Ekmof3c4jxPwH4uV+qQXEHBQKQFik1MoJ84bZ7aOUOVLdUvbP3WlW9VQdIxp/H4pw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dmNBzQHbDuxekFkoLMVSVInR/hK4Cz0GKnqJ1tEd5cE=;
 b=JD8WdicJXK/8pmzBIw4q0f+Fig4bjTSoovaLBqMR8U+3Y6QIi1ZOogfZciohTeUMsPgVPBGbTqCOf4gUX4lmbLuMveCn0pFmBekgst4DbyIJd2sWsIWFQoTNlbQACaR9YtRXWTejZEWIZPksT6CBMlYBrOQ+bkjpDRcINPTfTSw=
Received: from SJ0PR03CA0230.namprd03.prod.outlook.com (2603:10b6:a03:39f::25)
 by SA1PR10MB997580.namprd10.prod.outlook.com (2603:10b6:806:4b9::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.13; Wed, 23 Sep
 2026 20:22:29 +0000
Received: from SJ1PEPF000023CE.namprd02.prod.outlook.com
 (2603:10b6:a03:39f:cafe::4f) by SJ0PR03CA0230.outlook.office365.com
 (2603:10b6:a03:39f::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.451.16 via Frontend Transport; Wed,
 23 Sep 2026 20:22:29 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 198.47.21.194) smtp.mailfrom=ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 SJ1PEPF000023CE.mail.protection.outlook.com (10.167.244.10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.451.8 via Frontend Transport; Wed, 23 Sep 2026 20:22:27 +0000
Received: from DFLE204.ent.ti.com (10.64.6.62) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 23 Sep
 2026 15:21:37 -0500
Received: from DFLE200.ent.ti.com (10.64.6.58) by DFLE204.ent.ti.com
 (10.64.6.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 23 Sep
 2026 15:21:37 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE200.ent.ti.com
 (10.64.6.58) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Wed, 23 Sep 2026 15:21:37 -0500
Received: from uda0867391-2.dhcp.ti.com (uda0867391-2.dhcp.ti.com [128.247.75.146])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 68NKLb942714649;
	Wed, 23 Sep 2026 15:21:37 -0500
From: Thorsten Lannynd <t-lannynd@ti.com>
To: <meta-arago@lists.yoctoproject.org>, <reatmon@ti.com>
CC: <detheridge@ti.com>, <b-brnich@ti.com>
Subject: [meta-arago][master/wrynose][PATCH v4] chromium: restrict force-h264-youtube extension to supported boards
Date: Wed, 23 Sep 2026 15:21:34 -0500
Message-ID: <20260923202134.1085033-1-t-lannynd@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF000023CE:EE_|SA1PR10MB997580:EE_
X-MS-Office365-Filtering-Correlation-Id: 143e34ef-670f-41ef-ab9c-08df19b0634c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|36860700016|23010399003|82310400026|376014|3023799007|10067099003|18002099003|56012099006;
X-Microsoft-Antispam-Message-Info: 
	1h86mUQ4HQxdCAmPzedsAFnHZDLqqsNNMaX5Vq0r9fjzNylwFo6UPe53eA0mv2YKCM6QrH19Sem2SxnIoyxSqIMmuxsAxOKNMYoQLkOj6O4sT7eFy35mARnuaWb54czyJMjDLRmAiT+1B6xsAg7UcNPYBHulReIop/kg1C87dE9w94MZLXkif8yIfawrFFOdxBcdImV41YUuRqm5+QDy/M63dC+t8AUKvHd1nbsyXvbNknKVW58R/E1Dh9lysVM7EF7LLVKGOmsxLy5JvfRG2S5T2bQ6UGKi+5tyu3xRwhe5boIM172+JFnUWPviaPoJ2y0t5ZDmP7wu+Z6D9Tc2kkbmDqJo6tZ3qdzekfGqr2/+eUPZ2AeobOg3iwJisUcFn39ebrm536P1v3MMFslnaTArNJTTI6VdEZD+h0oFwMCS3TVPgGwr3/FAfR6g202g+fvCffdYtXC17GCOyxCUHuCx7Hoq15QEjx3Dku+OLTDtSwoFpRtAKlufxJe7SpN6ukFH93uGt6bimDLUtHTJCBIQO1Ch3ThCzLhJykn8uLQWdfcRSudnxO+O4SAnRfArDRYlzlyPMqEvMvZSDr5Gfrg5ZebAgaYLc/ZvW8Fl+hb89E128e4KA0tzilxGwtvon2PYnM3NIlrfdKlqcl65QeOfng8TsQIX2yn52c12TBmnBKM2YRSj8DjCl4O1zqEUQ+C3ga636KvZ7WOiO+Nr3Q==
X-Forefront-Antispam-Report: 
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(1800799024)(36860700016)(23010399003)(82310400026)(376014)(3023799007)(10067099003)(18002099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	RxNp3tsAWbRFmuV+lq2vw+gppDFf8LUsPsp5NPSBrz9SFrCtIVtRQtnwE5VKBW+xBXPLGGlReyMALoeu6XjlL5QpTPBBlUyMVOE93br+F/7T+i2PU5+p9/M7G3tPtjg4JKZqsigT1iFtMWHWr7+BObReqr2xcJ25dBJp8yc+cAIVca5EoFAYa1FbaiUc++GZZtJvdHSRkZDWNoJD4u51Rcfxz5rhsXCJbIMkyVmbhWYwKaeARxCDnFi3WrF/1SSSQChweypW8MVTnlopjAq6ja/fBGzg06kQyvhsaacHVpF9vxNtHevIbwY2rSVaZz3mWXMVrN20xSF5ZZrrfZeQ/qspiRfpZKrjUuH7Dv0XDLLXhKqAOLWeZqxgrJ484r6MLci0nKBkOi3ENNjvysF7wvGJzMC8KLmwwJlbMoXA68DNg1YtAfzp1IxLsK62Zaqt
X-Exchange-RoutingPolicyChecked: 
	aoxZ+2N8l0TPjiZh8tk6YdsKRXslLzTLAvSD/X3x9hA3yizeq+13kfuxIpN8VC3LhG2prnEKd3cpa68pGA3CKPwWiC7ts37cK6n1/Nm6oFU0WrtampZIJJ/kqYYNuqkqpBszUQEbt3ZkKzKraQacPLVvkRGQQNFA0+DRv1ymCdc7adJbyGcdpdioKHiazxwqKzC+tRCpZEF458q1kguA+OU3osD1/lL5VALf3VEm9Ibdc+LPGQjBMs45MCGZtVk1azXUyKMS8xcCCteLImdTPUkr8PwuctmUneLYF6mSLpr5qdsWqpNn12TXlogFxZFsz1kpWC9mujwVufkLLBoHHQ==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2026 20:22:27.9542
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 143e34ef-670f-41ef-ab9c-08df19b0634c
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SJ1PEPF000023CE.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR10MB997580
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIzMDA4MSBTYWx0ZWRfX+msxVCceMrYH
 HOJGRBLqCsTAKCupoulhGLpauugx5DW3bemEEUvkoTGgXKobedmxgDvCHm84vtHbZLlHEU+4OO7
 0wWcIlINKbkh+RIolkTQgO1XCwJFalc=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIzMDA4MSBTYWx0ZWRfX3VzHfnCxKo1c
 0bAXAIMY+aH3pzks8AaxZNAP2zi9gFiIlAf2m7UB84F6zl7SMp8NDQGmL96AsoFXJTYk1Je+aYB
 qyKuv89dGp7h3k8lZ08jtGjZhz0o+ZMyolAbPYSs/pG/r4nlv/SbaBUYYphBMKivHNIfNl+n7C5
 0ax4y8XM0zfIN4utWHBAvgS1aKjRYtElofxTIirAWlCp9ZGAFD5BJQ8GW5VhBjgY6r1GE8wiS5u
 xyA5eHOxF91af4bmK4HjQTPY8JARoH1b4sj9ICY4YVALthyEFG7bvvaP0hK3j8n05xcWKQos7kM
 HXZEZw1g49bQ0T2YG2klJ530GQ4JdXyHm35dGmX5ksWyUjxSbs3B9ZztbRM1sp8iqvLfeGcMP4o
 z6FUrVD2/ouv7+N6cuJnYxHPBio5kSyXvZEkxrJQYAWNA1MgMRtGvha+6sPEn8NyjIovty3Vag4
 cTRRrsNdEQwuQTcfpow==
X-Proofpoint-ORIG-GUID: Vad4m9_O69m4el68e6bbIQXIQQjX87FO
X-Authority-Analysis: v=2.4 cv=TpFzFzXh c=1 sm=1 tr=0 ts=6ab43508 cx=c_pps
 a=aTmL5QNlyH7IpnOKEqsBOA==:117 a=iwqwCZQqcuTv3JOpYdM7/Q==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=VdqzKS8jKosA:10 a=V5UXEbMT0ywA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22 a=jwouBfj2j3NM8CExmVVE:22
 a=sozttTNsAAAA:8 a=MJ22YsZ5dQk7D5SWMRcA:9
X-Proofpoint-GUID: Vad4m9_O69m4el68e6bbIQXIQQjX87FO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-23_07,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 bulkscore=0 suspectscore=0 clxscore=1015
 spamscore=0 priorityscore=1501 phishscore=0 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609230081
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Wed, 23 Sep 2026 20:22:37 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17703

Split force-h264-youtube into its own recipe, built only for boards with
cnm-wave-fw. chromium-wrapper checks for the extension directory at runtime
before adding --load-extension.

Signed-off-by: Thorsten Lannynd <t-lannynd@ti.com>
---

v4:
- Add branch and layer to subject line

v3:
- Separate the extension into its own package and install on boards with
  Wave5 firmware
- Enable extension if extension directory exists

v2:
- Shorten commit message title

 .../force_h264.js                             |  0
 .../manifest.json                             |  0
 ...mium-extension-force-h264-youtube_1.0.0.bb | 24 +++++++++++++++++++
 .../chromium/chromium-ozone-wayland-arago.inc | 12 ++--------
 4 files changed, 26 insertions(+), 10 deletions(-)
 rename meta-arago-distro/dynamic-layers/chromium-browser-layer/recipes-browser/{chromium/chromium-ozone-wayland/force-h264-youtube => chromium-extension-force-h264-youtube/chromium-extension-force-h264-youtube}/force_h264.js (100%)
 rename meta-arago-distro/dynamic-layers/chromium-browser-layer/recipes-browser/{chromium/chromium-ozone-wayland/force-h264-youtube => chromium-extension-force-h264-youtube/chromium-extension-force-h264-youtube}/manifest.json (100%)
 create mode 100644 meta-arago-distro/dynamic-layers/chromium-browser-layer/recipes-browser/chromium-extension-force-h264-youtube/chromium-extension-force-h264-youtube_1.0.0.bb

diff --git a/meta-arago-distro/dynamic-layers/chromium-browser-layer/recipes-browser/chromium/chromium-ozone-wayland/force-h264-youtube/force_h264.js b/meta-arago-distro/dynamic-layers/chromium-browser-layer/recipes-browser/chromium-extension-force-h264-youtube/chromium-extension-force-h264-youtube/force_h264.js
similarity index 100%
rename from meta-arago-distro/dynamic-layers/chromium-browser-layer/recipes-browser/chromium/chromium-ozone-wayland/force-h264-youtube/force_h264.js
rename to meta-arago-distro/dynamic-layers/chromium-browser-layer/recipes-browser/chromium-extension-force-h264-youtube/chromium-extension-force-h264-youtube/force_h264.js
diff --git a/meta-arago-distro/dynamic-layers/chromium-browser-layer/recipes-browser/chromium/chromium-ozone-wayland/force-h264-youtube/manifest.json b/meta-arago-distro/dynamic-layers/chromium-browser-layer/recipes-browser/chromium-extension-force-h264-youtube/chromium-extension-force-h264-youtube/manifest.json
similarity index 100%
rename from meta-arago-distro/dynamic-layers/chromium-browser-layer/recipes-browser/chromium/chromium-ozone-wayland/force-h264-youtube/manifest.json
rename to meta-arago-distro/dynamic-layers/chromium-browser-layer/recipes-browser/chromium-extension-force-h264-youtube/chromium-extension-force-h264-youtube/manifest.json
diff --git a/meta-arago-distro/dynamic-layers/chromium-browser-layer/recipes-browser/chromium-extension-force-h264-youtube/chromium-extension-force-h264-youtube_1.0.0.bb b/meta-arago-distro/dynamic-layers/chromium-browser-layer/recipes-browser/chromium-extension-force-h264-youtube/chromium-extension-force-h264-youtube_1.0.0.bb
new file mode 100644
index 00000000..16473415
--- /dev/null
+++ b/meta-arago-distro/dynamic-layers/chromium-browser-layer/recipes-browser/chromium-extension-force-h264-youtube/chromium-extension-force-h264-youtube_1.0.0.bb
@@ -0,0 +1,24 @@
+SUMMARY = "Chromium extension that forces YouTube to use H.264 codec"
+LICENSE = "CLOSED"
+
+python () {
+    if not bb.utils.contains("MACHINE_ESSENTIAL_EXTRA_RRECOMMENDS", "cnm-wave-fw", True, False, d):
+        raise bb.parse.SkipRecipe("cnm-wave-fw not in MACHINE_ESSENTIAL_EXTRA_RRECOMMENDS")
+}
+
+RDEPENDS:${PN} = "chromium-ozone-wayland"
+
+SRC_URI = "file://force_h264.js \
+           file://manifest.json \
+           "
+
+EXTENSION_DIR = "${libdir}/chromium/extensions/force-h264-youtube"
+
+do_install() {
+    install -d ${D}${EXTENSION_DIR}
+    install -m 0644 ${WORKDIR}/force_h264.js \
+                    ${WORKDIR}/manifest.json \
+                    ${D}${EXTENSION_DIR}/
+}
+
+FILES:${PN} = "${EXTENSION_DIR}"
diff --git a/meta-arago-distro/dynamic-layers/chromium-browser-layer/recipes-browser/chromium/chromium-ozone-wayland-arago.inc b/meta-arago-distro/dynamic-layers/chromium-browser-layer/recipes-browser/chromium/chromium-ozone-wayland-arago.inc
index d8eb0204..93c802a6 100644
--- a/meta-arago-distro/dynamic-layers/chromium-browser-layer/recipes-browser/chromium/chromium-ozone-wayland-arago.inc
+++ b/meta-arago-distro/dynamic-layers/chromium-browser-layer/recipes-browser/chromium/chromium-ozone-wayland-arago.inc
@@ -1,7 +1,5 @@
 PR:append = ".arago0"
 
-EXTENSION_DIR = "/usr/lib/chromium/extensions/force-h264-youtube"
-
 FILESEXTRAPATHS:prepend := "${THISDIR}/chromium-ozone-wayland:"
 
 PACKAGECONFIG:append = " proprietary-codecs"
@@ -11,15 +9,9 @@ SRC_URI:append = " \
                   file://0002-chromium-gpu-sandbox-Allow-GPU-sandbox-access-to-V4L.patch \
                   file://0003-chromium-gpu-v4l2-Fix-OUTPUT-queue-streaming-in-V4L2.patch \
                   file://0004-media-gpu-v4l2-Avoid-placing-incomplete-H264-access-.patch \
-                  file://force-h264-youtube/force_h264.js \
-                  file://force-h264-youtube/manifest.json \
                   "
 
 do_install:append() {
-    install -d ${D}${EXTENSION_DIR}
-    install -m 0644 ${WORKDIR}/sources/force-h264-youtube/force_h264.js \
-                    ${WORKDIR}/sources/force-h264-youtube/manifest.json \
-                    ${D}${EXTENSION_DIR}/
+    sed -i "/^CHROME_EXTRA_ARGS=/a [ -d \"${libdir}/chromium/extensions/force-h264-youtube\" ] && CHROME_EXTRA_ARGS=\"\$CHROME_EXTRA_ARGS --load-extension=${libdir}/chromium/extensions/force-h264-youtube\"" \
+        ${D}${libdir}/chromium/chromium-wrapper
 }
-
-FILES:${PN}:append = " ${EXTENSION_DIR}"
-- 
2.34.1


