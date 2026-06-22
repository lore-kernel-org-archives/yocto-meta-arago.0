Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D7727CDB476
	for <webhook@archiver.kernel.org>; Mon, 22 Jun 2026 19:44:49 +0000 (UTC)
Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.5370.1782157483705140788
 for <meta-arago@lists.yoctoproject.org>;
 Mon, 22 Jun 2026 12:44:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=proofpoint-05-2026 header.b=XLMG1/gi;
 dkim=pass header.i=@ti.com header.s=selector1 header.b=xghTuf+l;
 spf=pass (domain: ti.com, ip: 148.163.154.28, mailfrom: reatmon@ti.com)
Received: from pps.filterd (m0374956.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65MJf7cG3910540;
	Mon, 22 Jun 2026 14:44:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=MgYjVfGoEToiIwP9H5P92yrK0sDJhmgUjfx4uRz3i
	Jg=; b=XLMG1/giECKzvGTzcKNva1HR/o0A99rC7/aR7jjYBWgs1b351/Fa1aii8
	atreVDtyp67sFIbvB2i0Ct7eMKaSNsQn4j+j/V0OG7VeFnzIWmHuEfwP4xTx2qxt
	dq8O0BbtHbcgsaVXOnyp552yWfyNlsL0u3JzsMAWgDznCbZ4jxAIavYjnlNuU/mF
	Nk3N4gzlMhJTN1O9TmbLY1t3alLoqg803cR7tDWH2wUa5BQ7wDnguF09ZNN6bOAR
	w1y6Vwqt9Xltyu3owdB37gG2bmH9Wv/VXBv6rckS+AFd7QTwc/G5x3ZLA+1iBrAk
	NL2KCh2kUCyX1jTcxz642oECVMYrg==
Received: from sn4pr2101cu001.outbound.protection.outlook.com (mail-southcentralusazon11012049.outbound.protection.outlook.com [40.93.195.49])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4ey43bjryk-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 22 Jun 2026 14:44:41 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sTyPra79ced6isNiwow/AQDtWSFvhc8ftuwjZJNUBC1IcxpSKQCoYYWaJ6AG0zz9diF234VFoVXAhoLagBzPJrfcrqk4RhfrIJFKhBx5uLOhMc/43aTOaA9UksPjHvNJ5f3IHHvaKaeJAp4qo1W/YuSxppZAYpkV1FPWL5COr3/d1qqQ2dLiTr1oZpshwQCKvgokVvbSqqxR/ZkbL6e6EHhfLq0aEvthwMUEayyxKWAdgCNDPFJ5qezhtUek/9zh3kN7NhvgjPy9DcJGRvqzxKyZPK7kTusyaUDNO7A/3xHeA7kMWlgJhhqI/9I0MoipFfgWcwZ7IyjOnJ9Qbd2wnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MgYjVfGoEToiIwP9H5P92yrK0sDJhmgUjfx4uRz3iJg=;
 b=XdzPZHMP+AHS/DKcS11J8TuFNYjWYGPW2taSSgtZbew9ijfsoLQXP6u2jf3Hj0hUWWPNltF+mfYNVQfwhllD/Qj+TnN9i3OACdlQQEgzxuZ4kry8zQ/fL3T2vPvVZGxDwn+c6InvU9N50HEfILvJ5YOcT1bXb4XP1RhaiYrmmowD77Rj5891i8vHXHbupiEMb1c8LVkZy0QpjX3M5luZHluEFG0cGUIaQMWIhG8It4TigYQ+DOpGDN4zKy1Jm4rDVTBtICVo9MChBADf0+rO0OQcxhqFEOesnPjhLAvRD2WhsKFjBfafRQEUjdn8Tr3VbLr84TH+lApCJZJURJx3tQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MgYjVfGoEToiIwP9H5P92yrK0sDJhmgUjfx4uRz3iJg=;
 b=xghTuf+lCXQcW0jW20Ji2v4TYzawGxxm99gEUvURkud8Y7Bzve9ZpPU6ndUzzNI1omOKDg7xf0NvVP6sbYGuDXqL8dpdpeat5rL35oMvlAnOVhw0fvTRbvdVHks9Vou0GVsCT6J1pMZlNW+zNbgU6M1/qEA5KXHJjQXPVpmZ4WA=
Received: from SJ0PR05CA0160.namprd05.prod.outlook.com (2603:10b6:a03:339::15)
 by EAYPR10MB997900.namprd10.prod.outlook.com (2603:10b6:303:2d7::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.139.20; Mon, 22 Jun
 2026 19:44:38 +0000
Received: from BY1PEPF0001AE18.namprd04.prod.outlook.com
 (2603:10b6:a03:339:cafe::73) by SJ0PR05CA0160.outlook.office365.com
 (2603:10b6:a03:339::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.159.11 via Frontend Transport; Mon,
 22 Jun 2026 19:44:37 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 BY1PEPF0001AE18.mail.protection.outlook.com (10.167.242.100) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.159.10 via Frontend Transport; Mon, 22 Jun 2026 19:44:36 +0000
Received: from DFLE215.ent.ti.com (10.64.6.73) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Mon, 22 Jun
 2026 14:44:36 -0500
Received: from DFLE209.ent.ti.com (10.64.6.67) by DFLE215.ent.ti.com
 (10.64.6.73) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Mon, 22 Jun
 2026 14:44:35 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE209.ent.ti.com
 (10.64.6.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Mon, 22 Jun 2026 14:44:35 -0500
Received: from grumpy (grumpy.dhcp.ti.com [128.247.81.229])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 65MJiZuC1215812;
	Mon, 22 Jun 2026 14:44:35 -0500
Received: from reatmon by grumpy with local (Exim 4.97)
	(envelope-from <reatmon@ti.com>)
	id 1wbkZP-0000000ECfH-3I8v;
	Mon, 22 Jun 2026 14:44:35 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-arago@lists.yoctoproject.org>
Subject: [meta-arago][master][PATCH 2/2] gstreamer1.0-plugins-good: Move to 1.28.4
Date: Mon, 22 Jun 2026 14:44:35 -0500
Message-ID: <20260622194435.3385168-2-reatmon@ti.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260622194435.3385168-1-reatmon@ti.com>
References: <20260622194435.3385168-1-reatmon@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY1PEPF0001AE18:EE_|EAYPR10MB997900:EE_
X-MS-Office365-Filtering-Correlation-Id: 22ed6935-dd27-4b4b-605c-08ded096b111
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700016|376014|23010399003|82310400026|1800799024|56012099006|6133799003|3023799007|13003099007|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: 
	VOj+RP6UywxwwT6n20tgyXX54nvv8r05Ak5o2vnZUqALAkI3jRP/DG9I71mcV2v9fSEAJ/Y432srcREoUTa42xLntCzytQ5VPrFzvP2pH+aE2dJaF3sp/xI8lokgTvKYyjyvjcBrt5bWvthPT+OqgmGWmjqXcacMt30CAvtSlk1y1J7/OLQtOhwTUWYD/UcCa6HkVYEJ/bjQud3ohmeGwaURwOlhlzpT1qpcspb2SSRYb7p0NMhC+7Zlx3XRrOIpaJWUhk5D8e7PCTJch09F9S1g/EnafV1J6ZWBqJORxAEZ8HPkef6CBZZocIozPUIffgeXq8crP5wwEVeELDBBhYrA/hf+SHllyIMtOPuGjgU0AZB+zuwfbupRwZ+CMxjNHEu2KPRM8wFEs4vUNCjDNCjNqrHmuGzmQyMxK9zeHF5886h9LkaTVPU+Vk9lk5QRp3tMJvNria621Fgmu+HnRrx1Kr1UmvByefRno8isQKUph6gZvrkFrvkFx1lHXhPJFEuQifyZFq+yeRWRn0AOVo9DvPfj/uATZdoZwNe5kVZP///WzpFLxApNXlLxG25Be5EA0y80MpmhkC3HkhZJS2NHF60OJUfuOj1fhu5COAQFnwE2nIp1oAtYrpi7whJ+xkQ6IKIs4g39XqJxT3MRY2+ptPZQ+KD3MCs0YqW3RSuqtpZQ+KmJLNBNXAODoSlBIW0VisxeVQu4POO/BpQfXg==
X-Forefront-Antispam-Report: 
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(36860700016)(376014)(23010399003)(82310400026)(1800799024)(56012099006)(6133799003)(3023799007)(13003099007)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	1ZxCi7V+bTTILigB327Q4165lQEUqUEZTGf5zSf2lA9vFKQh475RPAGxMnl+oAvdTtNwYsc6txcWuptgNOrlDNdWu79QDGeFCa6pzbkQUV2/XUyTR5cmjpvsxdslXiX30d9dDYkzoVbwURZK5M1TQoljMVPB9xCaGrAWo4X7dxfdp1nVOFfq5RPjFobNUfIhOHJV0qco9C07YRj7LgPyKIl4916SU7MGqxPLlUiB2nlXs3dfLJi7X9m/ASp4haEbpftYW8rGpo/cVPpSYsMA850Lg51YWNxbfnLSPSch/bEP93g7bFIMBgZ43HOvYdlnIRbFCbFZqT+Tebvvr/cT3TCZ00+0C8vTkiycec/lWvqQJEZI29elm08C+8Gj4iUMlrKEVJG5uY2wtKyN5618pOraV9BV4PQxbNB6bEH1QbTaP1o+QdGC+XpgzWaoImFw
X-Exchange-RoutingPolicyChecked: 
	a7fQwFxSrlvRS2Hs6WqTVKkK0pbkzmsrnnW6DyLskyxwOZRy7AJPmrMbj7juEhqQEzHmlypvFtDhomERpwXH+j77DPW4K4Q4B9tsaXZ7KprEMJ4QGqaLIJAb7kBpbcPmghnSnpnjqNUL1fe0GoO2FHlDzhSkeq6dTQrBjTlWTNOsgTEwS0b19i389RRqfaq1cw0ouRpM6h6ywHDVa1W6+BZDhZ9VlSKYS7xmNlQPbKwm8r7LSST1KgMw/YgqijOn4FvW3R/vqNjtrw1M98Zi1/XfzRMuoc5e3GergmoDNm/q68cOpDYMmUQBM7I/9gmLWN0iHo4YchtQLfC8rgI5aA==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jun 2026 19:44:36.6176
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 22ed6935-dd27-4b4b-605c-08ded096b111
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BY1PEPF0001AE18.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: EAYPR10MB997900
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjIyMDE5MCBTYWx0ZWRfXwCRMMwP2c3r8
 MOKshLWQjba+m/OG3k2TehgaggdddP3ZVw+YTTWNA8EICGGM5jr6g7gpfAj4x1cjAB5UPIOKHwy
 Voagm6zhjNsgJhHQjIy00N2dsmtoqjg=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjIyMDE5MCBTYWx0ZWRfX3yJDsCdS3Uu3
 C8JN81tDjpA+Kd3f+WdrvUeWLmydYZf4Zi03IT1X57m400T3OOSyjP2lauVKEzKCM7TskmcDogd
 4n/S8E+f8OcOg8EaAELoKwRJXkZfpN0QSTqvU42k1ZCfTRW2oJaWLIYWPMxJ8iTubfM1CnpPn4U
 T96BFFi92ZOm6UQ583WJVrBrykjJJ7+W6D8yceCVj+39q+F2Z3IpRBoyFLsTlkcG5gVFFW6uZ4k
 /ru3Gt+JGz+5K0AJErWY3AgBHNpt2k2jPloXygbjM+zHSf9WxRhgH1KYs65+iiE/g9530b/UxwO
 yZLgqShL4GZrRYBSi9NjF9rpTWG32P/pft+ylRmeF4NGklraqBT4/TkY4sRH5plfsdFarHGGneu
 7XjnIp80IUkOH7lHU9kuFiEeSoulu8fHyWXaUEo9sE3UWnIxK1VKdmpX/t6OuQQwUhZJhipLDWE
 6J572qFy1nWpNg856jg==
X-Authority-Analysis: v=2.4 cv=TPl1jVla c=1 sm=1 tr=0 ts=6a3990a9 cx=c_pps
 a=nvwb1BjkeYK3HDx+lqLWkw==:117 a=iwqwCZQqcuTv3JOpYdM7/Q==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=FelO9ux0wxsA:10 a=V5UXEbMT0ywA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22 a=jwouBfj2j3NM8CExmVVE:22
 a=Q4-j1AaZAAAA:8 a=sozttTNsAAAA:8 a=KWvlojpNHRZ8j1zzLcAA:9
 a=9H3Qd4_ONW2Ztcrla5EB:22
X-Proofpoint-ORIG-GUID: DtC3o86oWQneFQ0PKnk1josF_T5Ap0l1
X-Proofpoint-GUID: DtC3o86oWQneFQ0PKnk1josF_T5Ap0l1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-22_04,2026-06-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 spamscore=0 phishscore=0 bulkscore=0
 priorityscore=1501 malwarescore=0 clxscore=1015 impostorscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606220190
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Mon, 22 Jun 2026 19:44:49 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17571

A recent version update in oe-core [1] has bumped the version to 1.28.4.
We need to update one of our patches to match the new code base.

[1] https://git.openembedded.org/openembedded-core/commit/?id=430c35bc1e4358173ab3b6d1e2e5e94f58357359

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 .../0003-v4l2-Changes-for-DMA-Buf-import-j721s2.patch     | 8 ++++----
 .../gstreamer/gstreamer1.0-plugins-good_1.28-arago.inc    | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/0003-v4l2-Changes-for-DMA-Buf-import-j721s2.patch b/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/0003-v4l2-Changes-for-DMA-Buf-import-j721s2.patch
index b4622fd6..e369eaca 100644
--- a/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/0003-v4l2-Changes-for-DMA-Buf-import-j721s2.patch
+++ b/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/0003-v4l2-Changes-for-DMA-Buf-import-j721s2.patch
@@ -24,7 +24,7 @@ diff --git a/sys/v4l2/gstv4l2bufferpool.c b/sys/v4l2/gstv4l2bufferpool.c
 index d85f036..e6a60dc 100644
 --- a/sys/v4l2/gstv4l2bufferpool.c
 +++ b/sys/v4l2/gstv4l2bufferpool.c
-@@ -83,7 +83,7 @@ enum _GstV4l2BufferState
+@@ -92,7 +92,7 @@ enum _GstV4l2BufferState
  static void gst_v4l2_buffer_pool_complete_release_buffer (GstBufferPool * bpool,
      GstBuffer * buffer, gboolean queued);
 
@@ -33,7 +33,7 @@ index d85f036..e6a60dc 100644
  gst_v4l2_is_buffer_valid (GstBuffer * buffer, GstV4l2MemoryGroup ** out_group,
      gboolean check_writable)
  {
-@@ -1584,11 +1584,22 @@ gst_v4l2_buffer_pool_complete_release_buffer (GstBufferPool * bpool,
+@@ -1624,11 +1624,22 @@ gst_v4l2_buffer_pool_complete_release_buffer (GstBufferPool * bpool,
              gst_v4l2_allocator_reset_group (pool->vallocator, group);
              /* queue back in the device */
              if (pool->other_pool)
@@ -62,9 +62,9 @@ diff --git a/sys/v4l2/gstv4l2bufferpool.h b/sys/v4l2/gstv4l2bufferpool.h
 index 60340c2..cec4207 100644
 --- a/sys/v4l2/gstv4l2bufferpool.h
 +++ b/sys/v4l2/gstv4l2bufferpool.h
-@@ -124,6 +124,9 @@ gboolean            gst_v4l2_buffer_pool_orphan  (GstV4l2Object * v4l2object);
+@@ -124,6 +124,9 @@ void                gst_v4l2_buffer_pool_enable_resolution_change (GstV4l2Buffer
 
- void                gst_v4l2_buffer_pool_enable_resolution_change (GstV4l2BufferPool *self);
+ void                gst_v4l2_buffer_pool_release_buffers (GstV4l2BufferPool * pool);
 
 +gboolean            gst_v4l2_is_buffer_valid (GstBuffer * buffer, GstV4l2MemoryGroup ** out_group,
 +                                              gboolean check_writable);
diff --git a/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.28-arago.inc b/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.28-arago.inc
index 9e418b86..a2204efb 100644
--- a/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.28-arago.inc
+++ b/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.28-arago.inc
@@ -1,11 +1,11 @@
 FILESEXTRAPATHS:prepend := "${THISDIR}/gstreamer1.0-plugins-good:"
 
 SRC_URI:append = " \
+    file://0001-v4l2jpegenc-Add-support-for-cropping-in-JPEG-Encoder.patch \
     file://0002-Adding-support-for-bayer-formats-with-IR-component.patch \
     file://0003-v4l2-Changes-for-DMA-Buf-import-j721s2.patch \
     file://0004-v4l2-Give-preference-to-contiguous-format-if-support.patch \
     file://0005-HACK-gstv4l2object-Increase-min-buffers-for-CSI-capt.patch \
-    file://0001-v4l2jpegenc-Add-support-for-cropping-in-JPEG-Encoder.patch \
     file://0006-v4l2object-use-actual-stream-resolution-for-encoded-.patch \
     file://0007-v4l2object-Attempt-non-contiguous-if-contiguous-form.patch \
 "
-- 
2.43.0


