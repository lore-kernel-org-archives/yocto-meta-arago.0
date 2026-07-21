Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 229E8C4451C
	for <webhook@archiver.kernel.org>; Tue, 21 Jul 2026 18:58:30 +0000 (UTC)
Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.31016.1784660308369462855
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 21 Jul 2026 11:58:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=proofpoint-05-2026 header.b=FsOPpctg;
 dkim=pass header.i=@ti.com header.s=selector1 header.b=gRg83mvc;
 spf=pass (domain: ti.com, ip: 148.163.150.75, mailfrom: reatmon@ti.com)
Received: from pps.filterd (m0380145.ppops.net [127.0.0.1])
	by m0380145.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 66LH5woS1424445;
	Tue, 21 Jul 2026 13:58:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=
	content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=proofpoint-05-2026; bh=RgYr89mKCdKYd
	zLoB8Qma5EqbJw0rEWDpMqOsmSrYeE=; b=FsOPpctg74Vu1gY1/Zgu6TIxIgiqT
	PxiPqmXUJXTWHI4xS7/Fb/BC0aRDhhZ3pn9iIojvWiaYS4JyfteZNWZb1rTXRbfS
	ZNPSHzlEZEQ/sQXycsbR/Rc/a5PSv0yariOTnlEZyNXq7L63LTcIdG//bUQ2gEF4
	s367huvdXuzOW7Utca3XS23nHmfS7YqmdkVsc7dcf8lflqeUwXom9LPfL3bTRliH
	57OwZ3ekuysXJCtR5W09J16qiKWkz7mM0el4ld9/lqNf3Jq3vu2+W8935qRmvPlH
	st/0fokEhCzsXOCYADmJTmGq1eoGwfj2dQ2QkdqyFEKcJ9NuK0rbI8lug==
Received: from cy3pr05cu001.outbound.protection.outlook.com (mail-westcentralusazon11013023.outbound.protection.outlook.com [40.93.201.23])
	by m0380145.ppops.net (PPS) with ESMTPS id 4fj077n6qr-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 21 Jul 2026 13:58:26 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YmgCpYObuy2P9HrWT3MzUiM5cLg8gR6oO/ERPX8pIXr8dyPqtgAt6mL1VD4m6W9A92R6+5NXK/E5OUEzQXX39/26CkmIdU+6TNQbD6Ta3lEdGH+D6nGFvOKv8GgCwP9MPK2GHaipewD2zODpYEcLyOs0k4XcTmBfU0NxZJWTKfZDQhQGxYFND1FCRTzC9i4Lasfl6orCCiqGAcTE3gdUYgZaLU9zs3pgYB6ioaXJlni1TERMFDPUzHwllX4qOK6oquwfUukps2c5ZNSmNwe56X3OKW97OVvtkpspLhWWVeXbcTTI9JRhk4cozNUKunah22Y+0DlbvbX7lAaW3HaXOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RgYr89mKCdKYdzLoB8Qma5EqbJw0rEWDpMqOsmSrYeE=;
 b=JcHoeLvROkCfq9I1OSuc+StwFDcDGstRbZ/x1yXM294sn9SBoQfk/TBkodnkrquqJFn+WBf7pe+nYbrXWS4ZMVWzo3DN/fftM3Il53j05HGHxYl8bNMAPGAA1OZqA4er1ZqvyuSC7pdCyuK3r/kSHo5+1wf+zAo2RnV4IRpbRQEBUWwUKnme7yeyU4guo3efajnfhEf4EaBdAN3ZH38MyoRACDz2uU2ixehXPF9eEtK/oyI2yNqBYKiQ/kxIdbrdzA3oOriGe93s0AFxkPG66UV3d9N2ihAXBlJAn4kMgmEwSvyIVl7UVTRS/I6RzChPjL9lXXXKrRiFKcibY9snIg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RgYr89mKCdKYdzLoB8Qma5EqbJw0rEWDpMqOsmSrYeE=;
 b=gRg83mvccuoHGEX1X25Aq9HnjSeKuERjWQ/AHcZ5ONj7cAS8EKYgK9qVvdLWat8S9YsuGcd4KTfB8QVi1NekiyHhz5BQ3Rce/DX44V9FCynpHYIJI3qoh1pcT5FRzWJ6RtTfqciPipHfYOtUUCuanGoJxJ4mZpeOQjyGKnmDjTE=
Received: from BY3PR04CA0020.namprd04.prod.outlook.com (2603:10b6:a03:217::25)
 by BY5PR10MB4356.namprd10.prod.outlook.com (2603:10b6:a03:210::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.10; Tue, 21 Jul
 2026 18:58:24 +0000
Received: from SJ5PEPF000001D5.namprd05.prod.outlook.com
 (2603:10b6:a03:217:cafe::a8) by BY3PR04CA0020.outlook.office365.com
 (2603:10b6:a03:217::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.245.10 via Frontend Transport; Tue,
 21 Jul 2026 18:58:24 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 SJ5PEPF000001D5.mail.protection.outlook.com (10.167.242.57) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.245.5 via Frontend Transport; Tue, 21 Jul 2026 18:58:24 +0000
Received: from DLEE210.ent.ti.com (157.170.170.112) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Tue, 21 Jul
 2026 13:58:22 -0500
Received: from DLEE203.ent.ti.com (157.170.170.78) by DLEE210.ent.ti.com
 (157.170.170.112) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Tue, 21 Jul
 2026 13:58:22 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE203.ent.ti.com
 (157.170.170.78) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Tue, 21 Jul 2026 13:58:22 -0500
Received: from grumpy (grumpy.dhcp.ti.com [128.247.81.229])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 66LIwMn82015987;
	Tue, 21 Jul 2026 13:58:22 -0500
Received: from reatmon by grumpy with local (Exim 4.97)
	(envelope-from <reatmon@ti.com>)
	id 1wmFfa-0000000EjOx-2Z80;
	Tue, 21 Jul 2026 13:58:22 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-arago@lists.yoctoproject.org>
Subject: [meta-arago][master][PATCH v2] recipes: Convert to SPDX license strings
Date: Tue, 21 Jul 2026 13:58:22 -0500
Message-ID: <20260721185822.3510959-1-reatmon@ti.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001D5:EE_|BY5PR10MB4356:EE_
X-MS-Office365-Filtering-Correlation-Id: 9d66d1b0-6030-4bb8-ac42-08dee75a0a7e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|376014|23010399003|82310400026|36860700016|6133799003|13003099007|18002099003|56012099006|10067099003;
X-Microsoft-Antispam-Message-Info: 
	8NXVAATvMyJNpkfREW1vuWiaXIowG8t/fZUkEoNrsf70GvslC+CHjCzfTJU7OZMGb2b+rIFhkaiu/A/Y/rndO+DlaIcxs9a2cULWlLkVqh+ClGGRQTPBIE9o2qSCenmaIAisUMZix8hCO5SipXuhoFFvJaT/USSOrLQfKkfa6Dh0HkVnoKPIPBYs1dEWaEhhAP+cQj5HZ9dVyGlSMnc0YM/slX16460mpKsrVMnRGHtwJRSelWaRAN8gNQmTFQIF2r68rbHp7ME6+yxtdR58bf8jKAKmclIYAlT/nlwuTUgELBCIAa4KemLgBgelwpCeXFyoF4F9EvyFrL8CTroFmN2hqMeu7TZlhFD4BeDvQkpWIsGzCZx8n4myG0ikDA8s7qdoHwhB8TuC+iaYfjZ29XVONLyRKIUNc2zM3iF1wAQqBO/rUghHa0INHhOop2XrO45GG3PyHku2klWDYs+fhaLGWFtJXslvDXvZomiXgYdEmUuQ+qU3cYsFlQNipLL5QSQhfY9Gw+4VjkuLAGiJsJP7+JdnlG53hjm/BIK6Bl8QlA+Ysx08vSxJVFGKJZdBJZlGjlw4xiIFACw92vaM4vR6NCKFjF66DOoM4aSPf/HqzkpQoGyIK3ntGwMswlCayz0nsrPgB+lw2oImOo1l2w==
X-Forefront-Antispam-Report: 
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(23010399003)(82310400026)(36860700016)(6133799003)(13003099007)(18002099003)(56012099006)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	bH0YoMAah5d8jUNuSeBevwngv4L7vKj1boXmJ1wq2sA0i9JYDrCjoGTk2hEzjYkfq2ims5rItJ5A2LDEEGpLENK2/Bxc968ggjC+nsWk5MjY2Ip56m0W4oOgKfrmdltSqkYr9YHevq9GF1ayODc6Pmk38JcGVjXCWG59cwj20N5C6kvBvXdKlm/eNSFKLUOcRE1WS4zG8Xs8xweQZ5cWu2O8ZH5MnxBSZkqRUoSWY/CABnrMX9dXayyAsYgkdxKUb43JQNuXe72CwXbfcamF7FY7qq1cDPRnxZ687G2VWL0XP6PCnoYM16SMai/Vl4DJawbX9pr2vnJ8aN5y5VSkBd+0px2ASODTCOQM51eb/xOg7Jj5faJ0uBi+IFAbqyJqKn1+U4AGHlrO8336izUMitJsX6lnn4XlSm5ipwly4nspg2ISRLyQrdy4p1D7bwgu
X-Exchange-RoutingPolicyChecked: 
	D51KUc4AA96y066ymxGyzSVEWXIn1yTiszRYCzncbNky6L/21fmydIzJsBY3slW/YWf8O2cKtlk+by/dXZ7siDGF5Ix9f0pMcioj7UZTWeAL3gqPXneRCk8dhxv9gZ4GDZcBSA9vEJHPSmEzRZHrTb3nYIi8mHZa6TwzJGqYZKwPRzRYApRwj6TWzbV4/BRQUhRXHA6YrOcUA1yXGdKywDaJd/OK+KGvOBPCS1AgC7B3ZAQjG5oEAD9ANNQSvyg8Knqidg+BmdlxDXUmJXJ1oK+uU8Lc69/zp6sb7Q4+Zo8eWsv34hw0D6LfsVUhgmPGwxvVMhseyz/FWCcvWWQopQ==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jul 2026 18:58:24.1069
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9d66d1b0-6030-4bb8-ac42-08dee75a0a7e
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SJ5PEPF000001D5.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR10MB4356
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIxMDE5OSBTYWx0ZWRfXxMIgL6p0nrPw
 6yY5jSf349zQJx+yRk19ydFxgafswRFHd9rVqVkQXmiyxL/k6t/ACzaqke7MpZ6fco/cT7ar2ft
 vg5Atu11k0Q53sHA+XYisQSuyGxp4AlHCDpydMPnsieV8K1CecGJWqvDjIaP0z6pNcbTa3X+1Te
 JT0zB9wsIl0g5IrJxYTSIU0RF346GSD6ne7EhDII7fEVZ3uUhvjwIh9Pjdmue5Q0e6Xkha1PagI
 lHCMzFTANuk4kPNHXMiLbxvB3ZC1cEL6LM4XlpKRhAVgg6mPwL7vtLcY2J4ufWOJLxGvh4Nq+GZ
 kcsWzkuX/f4YjatyeJI+e47qDciL0hJm4O7ZVJ7kplmKUmKskCQ9IHaQBeIAtLH0bdtjrrLNixs
 ApqYq3ZRyhvLgWftVppOzlf/DJO//VcomGkgqEm8RuTdpJpXiSWbEK3wcUf+q2wIwpA6b722W0R
 MgWaxp3U5uap7j9P5YA==
X-Proofpoint-ORIG-GUID: IgUMeMwYZt8m91mDpB0MxCZIvObGlVY4
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIxMDE5OSBTYWx0ZWRfXzSRC9MJGHoMs
 ex5Peue4xsTJpEiZeWO5nOO2uAB9nL8ZRIJhuDbmripJ6Dbas/4xLeKzGvH71N/MbFZIuAQ3tQA
 dHszNMWhhIHLdrSvPLrggRYKMz0Zyyw=
X-Authority-Analysis: v=2.4 cv=KabidwYD c=1 sm=1 tr=0 ts=6a5fc152 cx=c_pps
 a=lrInUZDIVE0OTqvzw4499w==:117 a=WotqVVQAdb04rnGuttW3Kw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=RAioF0-LDSMA:10 a=s63m1ICgrNkA:10
 a=V5UXEbMT0ywA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=gO1vWkAQAl3rybz1DQOp:22 a=ZpVaWaFtAAAA:8 a=e5mUnYsNAAAA:8 a=NEAV23lmAAAA:8
 a=sozttTNsAAAA:8 a=BLpkZ4JKV8ieHNmJfgsA:9 a=5tn4MO8azEBWFjlAA-rn:22
 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-GUID: IgUMeMwYZt8m91mDpB0MxCZIvObGlVY4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-21_03,2026-07-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 phishscore=0 lowpriorityscore=0 adultscore=0
 priorityscore=1501 clxscore=1015 impostorscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607210199
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 21 Jul 2026 18:58:30 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17590

Converts all LICENSE strings to SPDX licenses expressions

License-Update: No change, just reformatting to SPDX syntax

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
v2: Add License-Update

 meta-arago-distro/recipes-graphics/mesa/mesa-demos_git.bb   | 2 +-
 meta-arago-extras/recipes-devtools/statcol/statcol.bb       | 2 +-
 meta-arago-extras/recipes-multimedia/nnshark/nnshark_git.bb | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta-arago-distro/recipes-graphics/mesa/mesa-demos_git.bb b/meta-arago-distro/recipes-graphics/mesa/mesa-demos_git.bb
index 62cb0ee6..8dab581b 100644
--- a/meta-arago-distro/recipes-graphics/mesa/mesa-demos_git.bb
+++ b/meta-arago-distro/recipes-graphics/mesa/mesa-demos_git.bb
@@ -4,7 +4,7 @@ These applications can be used for Mesa validation and benchmarking."
 HOMEPAGE = "http://mesa3d.org"
 BUGTRACKER = "https://bugs.freedesktop.org"
 
-LICENSE = "MIT & PD"
+LICENSE = "MIT AND LicenseRef-PD"
 LIC_FILES_CHKSUM = "file://src/xdemos/glxgears.c;beginline=1;endline=20;md5=a481fbdb2ac800ecb12405c33bcfacae \
                     file://src/xdemos/glxdemo.c;beginline=1;endline=8;md5=b01d5ab1aee94d35b7efaa2ef48e1a06"
 
diff --git a/meta-arago-extras/recipes-devtools/statcol/statcol.bb b/meta-arago-extras/recipes-devtools/statcol/statcol.bb
index 09937483..add422c7 100644
--- a/meta-arago-extras/recipes-devtools/statcol/statcol.bb
+++ b/meta-arago-extras/recipes-devtools/statcol/statcol.bb
@@ -1,6 +1,6 @@
 SUMMARY = "Statistics collector application"
 
-LICENSE = "TI-TSPA"
+LICENSE = "LicenseRef-TI-TSPA"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=bb6bc27cd44417c389a180bd62f552a0"
 
 PV = "1.0.4+git"
diff --git a/meta-arago-extras/recipes-multimedia/nnshark/nnshark_git.bb b/meta-arago-extras/recipes-multimedia/nnshark/nnshark_git.bb
index 8afe7def..811ee398 100644
--- a/meta-arago-extras/recipes-multimedia/nnshark/nnshark_git.bb
+++ b/meta-arago-extras/recipes-multimedia/nnshark/nnshark_git.bb
@@ -1,7 +1,7 @@
 SUMMARY = "A GStreamer NNstreamer pipelines real-time profiling plugin"
 HOMEPAGE = "https://github.com/nnstreamer/nnshark"
 
-LICENSE = "GPL-2.0-only & LGPL-2.1-only"
+LICENSE = "GPL-2.0-only AND LGPL-2.1-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=e1caa368743492879002ad032445fa97 \
                     file://COPYING.LESSER;md5=66c40c88533cd228b5b85936709801c8"
 
-- 
2.43.0


