Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A9013CF6481
	for <webhook@archiver.kernel.org>; Wed, 19 Nov 2025 21:52:41 +0000 (UTC)
Received: from DM5PR21CU001.outbound.protection.outlook.com (DM5PR21CU001.outbound.protection.outlook.com [52.101.62.25])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.18945.1763589159094803670
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 19 Nov 2025 13:52:39 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=EH3tksbs;
 spf=temperror, err=temporary DNS error (domain: ti.com, ip: 52.101.62.25, mailfrom: reatmon@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vOdc6q7brkdOyaBd44dEAiGmLkrxUTyMP/XJXA7VczF6rLwyft5kbiLa/S59Jdo1nXodo8bFZuduorWg3r3b+znwxUSXaoPrG8xKjzIvM/y6qLTbrYBGXNPqaBWVBaMWN0DtEnDci9o/TwKCr/pN5QcXz0bDTHyoj5PLE0m8hApzmd00Xuc9utwjamExiXo33fdWsnkZwYmeTAutCmwsp5yl1YrY8Bo4MB7AFv2piTcqTttzj3fC8FGut4Xv1IsziRGe3zHe8PMl8IjbP3ymONoVfrHrGPG7mJyZE6Aho2qGOOMTlR3mv4ySurwHJ4YXTx6plpoC2n+8+gJUodgTLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sEYal8x2RsQ6j8gZSvlfbpf2JU1Q7P/OaarSbiagIzE=;
 b=b1xNXbwaOeONkK1cntza2RHzEqunMNDfb1bSkqwWtTpnnyXZFqa0GVH9sz9mK3M0XQYnM5WAIRlK8V7snhUUuMojjSgfk1nNMGLln8RK4KsFilnvYaaZxNB4VsFSg/r45YYT9BT+C5aV0pla8AkZ+a+QZNknLEHSmo5gCkhGJJJh0Tr5Vb0KDi0HKP0VjEZR/EgUy3uX09z11MjDiePqhO1Wgowuot3GIeuxudMHHFPAmdlAproT3FNFd0wJiUOk8+lY2IKOARfLKJJ1LgFfb2piI769mVx7W23kh8apL6KLAdOi+kzVZUR9es8HhECFRrFjN5zhZF9joVE5fjBt0g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sEYal8x2RsQ6j8gZSvlfbpf2JU1Q7P/OaarSbiagIzE=;
 b=EH3tksbsI5FnLjHHUxvNTp2Fgomkk3JStTMv19y7ei0FLHFWHkXdEreYLyazPRDT+dhWtO5pSHhlNgHb47sE7HEY3MQuuTnrjklS8yrDKX+3JYlLiIWlMXysGHtDU4c6Y/D5VNRdiMpTNcR9Hy+jsEoIeB7CvgJvPcIbJY5LRyM=
Received: from CY5PR15CA0203.namprd15.prod.outlook.com (2603:10b6:930:82::25)
 by SJ0PR10MB4541.namprd10.prod.outlook.com (2603:10b6:a03:2db::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.10; Wed, 19 Nov
 2025 21:52:36 +0000
Received: from CY4PEPF0000E9DB.namprd05.prod.outlook.com
 (2603:10b6:930:82:cafe::7) by CY5PR15CA0203.outlook.office365.com
 (2603:10b6:930:82::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9343.10 via Frontend Transport; Wed,
 19 Nov 2025 21:52:36 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 CY4PEPF0000E9DB.mail.protection.outlook.com (10.167.241.74) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9343.9 via Frontend Transport; Wed, 19 Nov 2025 21:52:35 +0000
Received: from DFLE209.ent.ti.com (10.64.6.67) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 19 Nov
 2025 15:52:28 -0600
Received: from DFLE211.ent.ti.com (10.64.6.69) by DFLE209.ent.ti.com
 (10.64.6.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 19 Nov
 2025 15:52:28 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE211.ent.ti.com
 (10.64.6.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Wed, 19 Nov 2025 15:52:28 -0600
Received: from grumpy (grumpy.dhcp.ti.com [128.247.81.229])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5AJLqS2s2530967;
	Wed, 19 Nov 2025 15:52:28 -0600
Received: from reatmon by grumpy with local (Exim 4.97)
	(envelope-from <reatmon@ti.com>)
	id 1vLq6G-00000000mCn-0b2u;
	Wed, 19 Nov 2025 15:52:28 -0600
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>, Denys Dmytriyenko
	<denys@konsulko.com>, <meta-arago@lists.yoctoproject.org>
Subject: [meta-arago][scarthgap][PATCH] nnshark: Set missing PV
Date: Wed, 19 Nov 2025 15:52:28 -0600
Message-ID: <20251119215228.185294-1-reatmon@ti.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000E9DB:EE_|SJ0PR10MB4541:EE_
X-MS-Office365-Filtering-Correlation-Id: 4cfce782-df27-4da5-2203-08de27b5f2fd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|376014|82310400026|36860700013;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?Rqc+qaS2tsNAKXouSVnWUg/B7/j64HFhs1ZGfoZgEAI6sqndWNIJzEJN6EoN?=
 =?us-ascii?Q?IDY60wg2KiaUK1NokBLWIqU5ivS9463lY9J9swGsOOlWgY+U55mzNAdR5gA+?=
 =?us-ascii?Q?0II4zK8g6BzSUm4ZpftU4u/4BbZwsAMwtW/dLcTKn0JwNHV8R1CNKOL1DtG7?=
 =?us-ascii?Q?w1OEQgeKvOlDLxO7zjU1sMOiIOSF/+7yAHx7/aomU10i7H+kSz8vfhRiN5qk?=
 =?us-ascii?Q?qs5CwQTOTXv0vZInWk0tlA8Tn93oTObyYyZrMyvleHHC88BZpiTdKheA4O+p?=
 =?us-ascii?Q?Wq1Cw1787SgZQZTC3NOc+Bp5yB0oTvpPNq9ab57EOLsL6PTPqHxq8+Snuhh8?=
 =?us-ascii?Q?/h8e9XC77Y3eJPXpbkleIoD5ZuGrgppfVXcJGS8eFZg2Lh0KPILfiNoH8y4P?=
 =?us-ascii?Q?dnN6Cv/JrAcOBNhOFzziieV+PCn8hV7w+E9h68eqXOwZcqGc26kmr8Zc301J?=
 =?us-ascii?Q?x6TbifRZJpTk55yVAKBFilLDSAOywZuWhqkCB/QATQt0+imJlo7Zckzt6krS?=
 =?us-ascii?Q?X/yRxQpyWi5LxJ0kC4vUzCfaqW/tvd0uJY5K3hMnJK0TseqxKMDyLh/88gal?=
 =?us-ascii?Q?ZA8d/7lj7jmSlJAa7jecGg1P5+RXAtPJ5/SAnO56yoVFqFKCNWz2lJV3umdq?=
 =?us-ascii?Q?Ov6b7Ppq8SzRPHWdRkd66lZdgnwE1CLprDRWNy87y2nDl6/u5+fJ1xynguPn?=
 =?us-ascii?Q?k8REIIqtZmyQONvrVYYqK3AgnI2yxtCG0LlLfWlUjwYqZc1kDfjyd6+oDKDK?=
 =?us-ascii?Q?4kY8xSquLQGHNDsjgofbfZc+mWMUTy9G1SDS5HUQ0CiyAygh0xtJyu/tgy4F?=
 =?us-ascii?Q?9D3EOzzokuy7EHSpiqByNqrR6leGPFuhZABNaaOm25+S7LMy2FIOhWzumD/Q?=
 =?us-ascii?Q?DIZcg05QfXIah/1Q8K+Qd3p85eX0uN7bOjg1Q5PTQSi2tqVN8+UMYr0Sl0ed?=
 =?us-ascii?Q?cz8Nq6PAm62fYph3goSEkuR0MS4dML24YeT9moTrAQE9HHV9TP4GHjqbJd9V?=
 =?us-ascii?Q?G1B42Z0b9Vkiij6TOd8Lh8fw2BxOTQCaJh+/2guuP4L93fGQ6sAXau/ggK3g?=
 =?us-ascii?Q?jpfNzI8RYot8Iarvh3tGvU1vCl22vumVKAFI+FT5xEHYrb+cUo/Wem+S34nw?=
 =?us-ascii?Q?Wsf2T6F5T7h9ZWTl1KnX7LxGRoyfMHkf9KVKPtodVfSE5lF/mpbsTETgntgX?=
 =?us-ascii?Q?DzOD8krsFfUiwA7PbzMkYZeygp++fKaQ3W+6A7qas7oiyhbMC51l5egSvWYW?=
 =?us-ascii?Q?CKti0CB/Ub9cWYkv3cQFHVnD2bdBLeQEKMXqrYPAUsmmWPswWykX1t0prgcZ?=
 =?us-ascii?Q?YjTNZNeBWoeTQvCWfjUjmiDjkJhbDnOQyMWHFOFFAczmC5wjBVdf19ZoPaBC?=
 =?us-ascii?Q?9Sr+bPGLaT0yiF3kSz6cvEJNiudCF8LZOBpGOHYCqvn19tzS5r+ZozE07k7M?=
 =?us-ascii?Q?If62b+sjkOg6o9ti5cRBBH6lI6OBuRU77Xejnk3wSV66bkQTlTZEtXbWEHRA?=
 =?us-ascii?Q?iYN0ozZ7jEfGNLLZh8nbARvm9glNQajtwn387X8SiAz2avl+2pjemmmDIROU?=
 =?us-ascii?Q?wLi/ymiKsOcys4X5wiI=3D?=
X-Forefront-Antispam-Report: 
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(1800799024)(376014)(82310400026)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2025 21:52:35.1676
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4cfce782-df27-4da5-2203-08de27b5f2fd
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CY4PEPF0000E9DB.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR10MB4541
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Wed, 19 Nov 2025 21:52:41 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16810

Based on the git repo, the latest tag was v0.6.1 and then some
additional commits in git.  So tag the current PV to 0.6.1+git.

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 meta-arago-extras/recipes-multimedia/nnshark/nnshark_git.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-arago-extras/recipes-multimedia/nnshark/nnshark_git.bb b/=
meta-arago-extras/recipes-multimedia/nnshark/nnshark_git.bb
index 505aaa4c..89be15f5 100644
--- a/meta-arago-extras/recipes-multimedia/nnshark/nnshark_git.bb
+++ b/meta-arago-extras/recipes-multimedia/nnshark/nnshark_git.bb
@@ -5,6 +5,8 @@ LICENSE =3D "GPL-2.0-only & LGPL-2.1-only"
 LIC_FILES_CHKSUM =3D "file://COPYING;md5=3De1caa368743492879002ad032445fa9=
7 \
                     file://COPYING.LESSER;md5=3D66c40c88533cd228b5b8593670=
9801c8"
=20
+PV =3D "0.6.1+git"
+
 SRC_URI =3D "git://github.com/nnstreamer/nnshark.git;protocol=3Dhttps;bran=
ch=3Dmaster;name=3Dnnshark \
            git://github.com/GStreamer/common.git;protocol=3Dhttps;branch=
=3Dmaster;name=3Dcommon;subdir=3D${S}/common \
 "
--=20
2.43.0


