Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B86AFC79FBB
	for <webhook@archiver.kernel.org>; Thu, 10 Sep 2026 00:59:18 +0000 (UTC)
Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3439.1789001955867709532
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 09 Sep 2026 17:59:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=proofpoint-05-2026 header.b=U/ovT+6s;
 dkim=pass header.i=@ti.com header.s=selector1 header.b=ERMVymoo;
 spf=pass (domain: ti.com, ip: 148.163.154.28, mailfrom: reatmon@ti.com)
Received: from pps.filterd (m0374956.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 689MA5RG1425546;
	Wed, 9 Sep 2026 19:59:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=
	content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=proofpoint-05-2026; bh=mztY56fOhAlvl
	EZTFU6DEPLFRjgP+5wiE8VtajDAzWg=; b=U/ovT+6sON3vgR1rOMh15aBdZuhYT
	4+eUUALYETsbojylWI0pjhF50JNfFlvsQ9rUTJmF+pneIfqXkVBt9vHu2iBwx/Wy
	RkGarhK/eowni6ixZYjgYr6Xk2k0q9HcMeFwbONT5IJWTlPcGFMKtwFMBhmc6Nbs
	usbtLUaRGBd1ysrikQrECudIo/vSkKSTVeobsej+JEZHR9IZQ6db0gzWNed9Syk9
	kSlHK2Vs+vawR+O6g2NHi+b/JdNjbtPq8ttLPwHF7WXYwErsIxcJ92qHaWzhrEZl
	Ae3saxqLjQ2N8Pb6i9MXU1WA1lH2xKW5Qlz8mMih/7qJ76RGE1Of3K7eg==
Received: from dm5pr21cu001.outbound.protection.outlook.com (mail-centralusazon11011067.outbound.protection.outlook.com [52.101.62.67])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4gkcxft78t-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 09 Sep 2026 19:59:14 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=u/SPBkVhdEo7EYB1GgzN81s8ZkePdhmlxq/ey8LtZNoF3fwKxNM86LiI1cQ++VKUbCWOUu4BpFAh3rYZpwo3J/LwC8Olsj+feRgJPZRtdjP7BEayBl8vlll431iPrLAIK4jQsgEIpngOCaGGzmOEQeBvq7JT5+zpOHjPJnIdcgcA54yXTxOVsrZTeYc/hMApgT9pXMuYi67qB1++xZux+EptzAOUtlV54smyeZxUcbHhPK6/LvOpNCqQr/ZlETusZbXRwnbEUwlbq5OTBuFprogdWa58NTwTIuEzCrnTDDoJCHFvl8ymyqnwUb+Kb1YvwySTsvxZ4ihET2Gr+JsRVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mztY56fOhAlvlEZTFU6DEPLFRjgP+5wiE8VtajDAzWg=;
 b=KVobHotc+unaZ2AK+k8VJHz8r1lW4uzR1s0cRIC4XFDZL1HFsqMYEBFtB37sQwmzJj+x3wD0SUDbYZxgHaqy7jZWy/4mxQg9m0AkTXtK2Fth3Lmej8InKJIZqb7X6JPJ5JkTbQj7okMV0aUH4575LXL0VQDMr+tJBhVBfhVhHcUFINSq28Wsiwm6SzX3iSZOdNg/EEr24gDuPWZ25WK+bwcRjUNRGlhvC5gzpq56SVqJT2wYV9dc1NwJI2Pk+PsOxKegpjehC5Am0jp1PPxxYSl9Qk2zcfx+frZdGUGqHceJxH6V7dZwRKsVRHxfaLliEyEfs5zo1p7SlKGSSQEjQA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mztY56fOhAlvlEZTFU6DEPLFRjgP+5wiE8VtajDAzWg=;
 b=ERMVymooiMzHX8/cCSYyAtssp29Qa4i7IaXH5am4mhIYiBuOA2lkTiTaJGHWXi7MYVZgAU7EotWmKsNy6ptTUhcqVHKocSef1/XSEdr+zJKopEMt9e8p0zQ+wPtN5iL27WjTR+GC6rGGd/BkRzAWS683aA5vTxNW1EuOTN+ybh8=
Received: from BN9PR03CA0411.namprd03.prod.outlook.com (2603:10b6:408:111::26)
 by DM3PPF1BDA8E55F.namprd10.prod.outlook.com (2603:10b6:f:fc00::c0f) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.9; Thu, 10 Sep
 2026 00:59:11 +0000
Received: from BN7PEPF00000092.namprd03.prod.outlook.com
 (2603:10b6:408:111:cafe::99) by BN9PR03CA0411.outlook.office365.com
 (2603:10b6:408:111::26) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.406.8 via Frontend Transport; Thu, 10
 Sep 2026 00:59:10 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 BN7PEPF00000092.mail.protection.outlook.com (10.167.245.70) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.406.5 via Frontend Transport; Thu, 10 Sep 2026 00:59:10 +0000
Received: from DLEE210.ent.ti.com (157.170.170.112) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 9 Sep
 2026 19:58:56 -0500
Received: from DLEE210.ent.ti.com (157.170.170.112) by DLEE210.ent.ti.com
 (157.170.170.112) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 9 Sep
 2026 19:58:56 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE210.ent.ti.com
 (157.170.170.112) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Wed, 9 Sep 2026 19:58:56 -0500
Received: from grumpy (grumpy.dhcp.ti.com [128.247.81.229])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 68A0wujK2307228;
	Wed, 9 Sep 2026 19:58:56 -0500
Received: from reatmon by grumpy with local (Exim 4.97)
	(envelope-from <reatmon@ti.com>)
	id 1x4T7w-0000000GNrw-2iny;
	Wed, 09 Sep 2026 19:58:56 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-arago@lists.yoctoproject.org>
Subject: [meta-arago][master][PATCH 1/3] conf: Remove openssl engines
Date: Wed, 9 Sep 2026 19:58:54 -0500
Message-ID: <20260910005856.3904973-1-reatmon@ti.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN7PEPF00000092:EE_|DM3PPF1BDA8E55F:EE_
X-MS-Office365-Filtering-Correlation-Id: 342a688a-7d5d-4cb1-bbc4-08df0ed6b96c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700016|23010399003|376014|1800799024|82310400026|10067099003|56012099006|18002099003;
X-Microsoft-Antispam-Message-Info: 
	KSWDkeSwl3vwCMjsl1jZSOWcxUFW0M+QCZHhmRgOv76MmteY1L9PHhM97IAUhUez70ThD4uOeFxTGvpFaBqbYNo8BVXNT7tnO7RLs/ZprVuYEEkgJLASmZun7JS04LzzSP2lFuFICbCkMQvjjebbSUBi4Cti35XvewFYvHPUobeoo2XFJWR5jrD1Y+Y1gIvdqaLmt4eBYQ2kAmVL0+bR5z2qvoM+b82GYV2JoHU0k2qHQF6uW1nmYbXjjzPFXHDnVPje+RPUtlqDVE2IM8fF+ggHL0O/annTDT6Fu5dYKCoKwuK9etTisEjTZJfdPLvX7jLSqXvOL7xfNS4gAhP8phldU9Yvshuy3JGTAf+P6nchK+tlpWQblsuY0zMRx4lo6x/HkVHNXYhIeB8Vm2zJpxpYciZfqPYH5mNwHoeMKBZ54Fp4698rbtnQ7uXduhEOZKfIrXcwqF0XOWW+QrJRr2Hc/tjQeMKyj2pj18+yb/fVCopDvflK+F62nwB6lMtTaAh2YbxRUjj/W0wPLv1OfO3so0OceeQalJHY1/N9p2kDt2UquOZ+u0bggepR9+Ncl/59OKsBdKN8AUGVuL3/Oo2SptaxXwyQGc+LQ7Ah+SMW0cteAVbXib+Ze0W3bjaaxs2LfkHNYefj7lImoC7yuA==
X-Forefront-Antispam-Report: 
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(23010399003)(376014)(1800799024)(82310400026)(10067099003)(56012099006)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	hp4xNeI7ARdcliQUF1WQ1fV5JuYkUgiyEwGElEJG3Sy/0+t4yqzaeHd4PFipUPYNftuTlefMRwEfq77OlRZBNcZRSdhJPdTiiyNcgBAhTR78n+0XXShaZ1jnNi1jzePJlxYIOS/Jz8gWPjWi2E7ozAgYkSiOf8GiZkzuwLWy65czEYlfii3uwfyRjWBCmb67L+SXlTZaLRvQM27Ib2Np6bDN8MmzlsJ2RTyfRQ2FJK+pwvLPpBSPdqjwOFmEXCp3WfP/ewoHjhofjnd8nOkZN5Ej9Tbi/KS1tjV+YLQqOWcpc9+ekvZEb2x87P/nLH5oJygUCwztm4RZpOrVMXdCxOAOvvOdVyobFB3J8GUg5gQ2OHGhOK2m3gMYkdjcF2TDj9mL79hr0S8KVOV2MVdu0PskKKawVfcnlLtMktHrFnMMny3uHWJ5mQ9Pq8g97PD7
X-Exchange-RoutingPolicyChecked: 
	Iyy5W4cEYE5Qv+tg8UZ+tbSJRtndnswgWPZ0Q6PrTkoeixSahOlPWoK+a8DmGxlNoFMgwOkew8CCVQ1gthSwfjRczMYJ4mjmrqYGeKPBWu+9xT54KSJFiaf0I9A5sTFIEaAKGiSTDBAAEFyM27wPrF6TSAkVCK47Rhl1eb/KUCPPwdRCCXjkUnV5Y18rFCWPMgtDzTYbDrmpAxTVZLHgRQmliRIxhjN2HXSnZwnseAneCrTGWBsSt2EqqsNFF4LiiBVi/IRfTKXcpTNRp6TCNFKtca9jH3+2P2YXZSuAowacvHkbrdQxYgOlR0LGX7KJV/jRZidvKVeQ0oqYiX+fqA==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2026 00:59:10.5370
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 342a688a-7d5d-4cb1-bbc4-08df0ed6b96c
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BN7PEPF00000092.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PPF1BDA8E55F
X-Proofpoint-ORIG-GUID: _lX_2wsnHYJcX9Y8a2oEmy3GhNaPl_Au
X-Authority-Analysis: v=2.4 cv=SoAFe/O0 c=1 sm=1 tr=0 ts=6aa200e2 cx=c_pps
 a=GcdpE1at2Es8HfJfZlkF2Q==:117 a=WotqVVQAdb04rnGuttW3Kw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=VdqzKS8jKosA:10 a=s63m1ICgrNkA:10
 a=V5UXEbMT0ywA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=jwouBfj2j3NM8CExmVVE:22 a=Q4-j1AaZAAAA:8 a=sozttTNsAAAA:8
 a=K7HWYLZPZnV_M9nnrQ4A:9 a=9H3Qd4_ONW2Ztcrla5EB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTEwMDAwOSBTYWx0ZWRfX5ZWxGOWyarNc
 Rv1zrrgdAy2hFsDd5Dsy1xONNq/ik5MygOm4gz4SKCSdoa0NHQeldHfM9t65hz2MZvGQGfnH/vq
 dZwhlyvdlmGgL/9vUVNxPwpKsmaz2U0+ECzssTfLkf7LFIoQHNQva9lnVwyfd2JDyFMO0D9cM75
 Q4qbjVYo98NOco8Uts7jdjnjX2piukv8l18UGNJm6ECmUpvXVSlUq8u88Z+Y7AZ3uCGDkzAU7gH
 PuP1+IiJz3vWmGdJOR5zYcBIUPBc1A1Rfpl6yqAoVBYx/Uv7Q3kJV+8RmE6Vl3gGXBxiNkOzuNu
 Nv8EUdWXdpknclKTFhqnpoJqrODYug5GcQQMM3w+SanFzJf443FZH5lohYglxitB9fvrHJFnReH
 mQFU3SyIzumh+4zNFyd3uQbrXAvP6W1Ymrwtc8eGTOsGs3pGtlkM+JfG0OFf9E51yn7mgXheu09
 WhRmwvkLm4h+yUYikSA==
X-Proofpoint-GUID: _lX_2wsnHYJcX9Y8a2oEmy3GhNaPl_Au
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTEwMDAwOSBTYWx0ZWRfX3bKmWVyIs4TV
 f2/jHGLtGB2hEROnvpZ6bFwCKFFJ0G/Tom9mxUpm+n3wLc1qiP98cRNUYoUBUNHUujPRiSVi1Z/
 HoPGmukqCsrVV9OfcC5lkVmoH6N+5yI=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-09_02,2026-09-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 clxscore=1015 spamscore=0 phishscore=0
 bulkscore=0 priorityscore=1501 malwarescore=0 lowpriorityscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609100009
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Thu, 10 Sep 2026 00:59:18 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17656

With the move to OpenSSL 4.0 [1], OpenSSL no longer has engines, so we
need to remove them from our config.

[1] https://git.openembedded.org/openembedded-core/commit/?id=20bf704e5809e95036b998f0f45145cf7205b05b

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 meta-arago-distro/conf/distro/arago.conf | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/meta-arago-distro/conf/distro/arago.conf b/meta-arago-distro/conf/distro/arago.conf
index f3feb8b5..f735c23f 100644
--- a/meta-arago-distro/conf/distro/arago.conf
+++ b/meta-arago-distro/conf/distro/arago.conf
@@ -92,9 +92,6 @@ PACKAGECONFIG_GL:pn-libsdl2 = "gles2"
 # Add KMS/DRM backend support
 PACKAGECONFIG:append:pn-libsdl2 = " kmsdrm"
 
-# Enable cryptodev/devcrypto engine in OpenSSL 1.1
-PACKAGECONFIG:append:pn-openssl = " cryptodev-linux"
-
 # Enable GST_TRACER logging in gstreamer
 PACKAGECONFIG:append:pn-gstreamer1.0 = " tracer-hooks coretracers"
 
-- 
2.43.0


