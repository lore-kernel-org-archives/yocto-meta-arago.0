Return-Path: <gehariprasath@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3D5E6C61DB9
	for <webhook@archiver.kernel.org>; Fri, 28 Aug 2026 05:51:32 +0000 (UTC)
Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.345.1787896290834558974
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 27 Aug 2026 22:51:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=proofpoint-05-2026 header.b=YrPygUgX;
 dkim=pass header.i=@ti.com header.s=selector1 header.b=PyWbXprS;
 spf=pass (domain: ti.com, ip: 148.163.150.75, mailfrom: gehariprasath@ti.com)
Received: from pps.filterd (m0380145.ppops.net [127.0.0.1])
	by m0380145.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 67S20AiI283501;
	Fri, 28 Aug 2026 00:51:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=4AWEXDqUnDJc8VO0WK1alV2rfNtL5Wbr6JbEzCDeW
	Nc=; b=YrPygUgX1W6uk2PFPKSPUN8AZOTmleKroadzqFeD+AdDgsOc+wymtqO7V
	XQB9S7wZC3sU3xlvnPvy1pWcS5rU7G5HLKC4jq6zvor3jrKs4CiaRcKA0XD5iZpd
	E4MwWFKvjRgQ4H1F8uF2YJYP/NMckNkLRFvZD2chaGNl2EjP4Vk8w2UD77lU51ae
	OnVeUB3zi4iXb+PeJAtDF7a00hFqQkxYA8PcKlrsh9VL/iy1nKhydLu4yQaPo9TK
	1JMS3SG5uFeMSk9HFC1mDPrayx6ZRvk8KHqf+ReKE1qMMie2rJNkxdJzsyN4ODd4
	uHMMFOK2WoZU/cLYQghHksMhkrGXA==
Received: from sn4pr0501cu005.outbound.protection.outlook.com (mail-southcentralusazon11011050.outbound.protection.outlook.com [40.93.194.50])
	by m0380145.ppops.net (PPS) with ESMTPS id 4gahg3f4qq-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 28 Aug 2026 00:51:29 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kUdyJ+Gx2qqaoBf0yQqNqZkEgVPUgDCATIk+bVWQfKqp5tbMaGc+A9+QLmKzwWT1oM+LMVJO0k2nFNs3y/WJyiCwQP0Pr/aPGKOrsL6hto69+2SDcRNGmXRAHQTXpeGdP4Uh1yL4/ioztffsuFl4+eEpuutZ3irl7yo43/iWLRc3J+GSI/du7JBi7BOEkgRlOrsDylkrQT/SCTF6ullCtutk5wqpTlot5PGg7pY5VxBX4MXYKWpkJzwjXb5BttMn4u2Ip7HhIW/xpsjuFvIZlEbkERQRLnSSvwF4nlvwy+DDWRQUClMkAgTk+7AlmhTVZysazhxvLvJEiUbgkruMYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4AWEXDqUnDJc8VO0WK1alV2rfNtL5Wbr6JbEzCDeWNc=;
 b=txp1Exz59K8jetuwQF/ZQ5rtpjF04VOvOrbvGwPtG6WKDxhvkz4IEbPLFKth3dlMT33/P3Q+CMKqcrgcKqYlT+Yh3E6HlbdiJgwVjilZFTv29JrOnJmlvXx4749DPFYA8uHOolq0mrhfz7hLcWsC5TldyuOiVzXu2Htbu5jEDG68k8vbFaVGVk9eAdo97ty+i6aM7wax9DGSrkr0MupEafRx9R6IEYlCdy3wZWPzywl+M8XlL55DUNAk5PKYBSzTKUy3hLQbN5JzhKb8i5nQEz4OpHu+vF/7xMuSGXtNdHvzJIcAIeY63XcgNfMy6gio90xil8ag6S3eiJV/ISI3Mw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4AWEXDqUnDJc8VO0WK1alV2rfNtL5Wbr6JbEzCDeWNc=;
 b=PyWbXprS0Ym+i6nhFRPkUFxRc8g5FjuxgYuGPl1R0QhIGUZ0ia/1DNd/sxgDOqJ6eW5vj6DAdR1pXf9yw+mr4MyVx3zDBaEwaCbDyXMyhUnrtY1dWAqelYLTT+ZrBfugVegRunBqzQbAbs/Q1TAYcSOUnUT0EG75J0CUIc6btlc=
Received: from CH0PR03CA0278.namprd03.prod.outlook.com (2603:10b6:610:e6::13)
 by LV3PR10MB7818.namprd10.prod.outlook.com (2603:10b6:408:1bb::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.382.8; Fri, 28 Aug
 2026 05:51:24 +0000
Received: from CH2PEPF0000009C.namprd02.prod.outlook.com
 (2603:10b6:610:e6:cafe::a5) by CH0PR03CA0278.outlook.office365.com
 (2603:10b6:610:e6::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.360.10 via Frontend Transport; Fri,
 28 Aug 2026 05:51:24 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 CH2PEPF0000009C.mail.protection.outlook.com (10.167.244.24) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.382.8 via Frontend Transport; Fri, 28 Aug 2026 05:51:23 +0000
Received: from DFLE200.ent.ti.com (10.64.6.58) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Fri, 28 Aug
 2026 00:50:48 -0500
Received: from DFLE213.ent.ti.com (10.64.6.71) by DFLE200.ent.ti.com
 (10.64.6.58) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Fri, 28 Aug
 2026 00:50:48 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE213.ent.ti.com
 (10.64.6.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Fri, 28 Aug 2026 00:50:48 -0500
Received: from gehariprasath.dhcp.ti.com (gehariprasath.dhcp.ti.com [10.24.52.136])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 67S5od6Y3254751;
	Fri, 28 Aug 2026 00:50:45 -0500
From: Hari Prasath Gujulan Elango <gehariprasath@ti.com>
To: <reatmon@ti.com>, <afd@ti.com>
CC: <praneeth@ti.com>, <denys@konsulko.com>,
        <meta-arago@lists.yoctoproject.org>, <s-kapoor@ti.com>,
        <p-gupta5@ti.com>, <u-kumar1@ti.com>,
        Hari Prasath Gujulan Elango <gehariprasath@ti.com>
Subject: [meta-arago][scarthgap][PATCH 2/2] tisdk-default-image: add ti-vendor-kernel-headers-dev to DEVTOOLS
Date: Fri, 28 Aug 2026 11:20:34 +0530
Message-ID: <20260828055034.1106316-2-gehariprasath@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260828055034.1106316-1-gehariprasath@ti.com>
References: <20260828055034.1106316-1-gehariprasath@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PEPF0000009C:EE_|LV3PR10MB7818:EE_
X-MS-Office365-Filtering-Correlation-Id: 83145b03-1e63-4f40-e3a9-08df04c8643f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|23010399003|376014|1800799024|82310400026|36860700016|10067099003|6133799003|22082099003|18002099003|56012099006;
X-Microsoft-Antispam-Message-Info: 
	kQxftRrUvHX79FfZdCxQAtaN9tiRFR1BGQ0HzVPlZsS4Pxhq6VNsSwe9cOUbtS8T+ftAL/80O6bgXiQnh718oEQc21+3dQQZ7EraH2GBmw7axUzWBhQ75NdyLhgfJ3fAVakkLK0GariRQFU05bAB1ZbqUY4TgDyEJ3KX0I9d9Mxad9k+kMj0oKHLsI6Y4fiRluWeuKGBYZABwGmX1X7iRRzTWmgvkvYuPDtIGQ+34AstZLfYosyg9dhbhTgsuSDAtwz8n+ENF5QHxTPZQS6XK1QhD+qViWov6LGuseDdUiYXQSCO9jRAKU9pQ0/9ymR9+qVqw76sbkPvdWFcwzlvpOwalNqHOe2HuXFE85/TKFZAl30K72GsxNNGVInJvnPXypYhYRO02Q7Mu0OU2RuUCroJ7eYWFpXGIyS2elu+o5lT+tXh6/+0BfF6D+VNcNwu9Jp1724EkjFHPplg3D5+QjUMaPhvq6avFC8X0TXIF+0VklNVAXKI3sQGvqruRSWP8v2cpp9OT4JQucoUm4s5ELBzj0Of4lO9Nz/nljgaOAVChZKiZba4OALX7YVvbbeyDBgpl/bXaDJ4J2f+Pojuy3NhuJ8Tsnza72epPyQV41sBKyw/QxNe8R2IOEbK0XBWUcLOdGTtKo3g0w8bCyaw9WOI2/PQ6NFOLCV2vK46KebStN0k62eaTgZ6hrd9s1xxOuqGh8HloMkJeCgz3/j0gA==
X-Forefront-Antispam-Report: 
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(23010399003)(376014)(1800799024)(82310400026)(36860700016)(10067099003)(6133799003)(22082099003)(18002099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	w6a69Q6s+W4/I+kWvfPvTMWJu50NWV0tKea5W/CtOnp/IGUZ4ANZKJvM2hHJ0n4hw1DBV7T8OWSCRbquXJn10n6jWtDrtvIYxhO+mznCrm0oZYrbzgWH77OvoRuePKJCcTu/H5AopZYpvUxD4T9+Vd2UddJpVg8YV9+1vjGpZSEMwqMzav3u5ZkVYS9RvVpgLnTqCrL0TU15M/v10p1L096M00zcIpQa0Ff4IwEIQzJReZdbjFay1ZXu0bSG3PjXAqkGtMKl4HdA8nXEz46gPVPFNykFgLY9E62ZF0Zq+gj5jxtMOlRpozX/JtRjFocqyKgERlrAzpkZwJ2Gs5c1Vlut8emnN/dSTxkBOOyEWtUqIV2kmFY5sF0kGsZkB5DqaGYyRdWZ+74Ih8Qrc7IR1QG5LnLDJeqF5UqGgG/KnhyJUHqEPL6vBfR5lETR+cA8
X-Exchange-RoutingPolicyChecked: 
	1JdqO5JO2QUr0Qaz5Fnrd3MYFaBvGRYQCerXfDaH/Pb6VdZdCSFDQqeGS8e9KNE0l4L6rOh4EGFo6QAaMxJOaY+ll8evGG0b+26giEjEGhew0/0A0lf4RVGIh98LDg6jZp7tl2EuQDJHT5ZJNp2bYzIOmQueMHX54epgGP49LKLQafzlvsvAmF5a7qJcOZXnVNsFN/5aj7ECz/25q0/ejvTVAonDOq9wZ61RZNs2p/2YXDm5YizDcgkXOvRjUYYgOGSwjqpBzMTSXnoNwOwAYK89Zi4KQ3+bRj7/s9oZJsOrS8hjmvN8MSjYa1Szi3jF1E5fwRPJ3ZwYQ9U01bxn4A==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Aug 2026 05:51:23.0822
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 83145b03-1e63-4f40-e3a9-08df04c8643f
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CH2PEPF0000009C.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR10MB7818
X-Proofpoint-GUID: xqbXxTofl2j1_-jGSVFt_JvXKUaazqQO
X-Authority-Analysis: v=2.4 cv=M4597Sws c=1 sm=1 tr=0 ts=6a9121e1 cx=c_pps
 a=UNZgSj2+zgRPHH//f1mBVA==:117 a=iwqwCZQqcuTv3JOpYdM7/Q==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=Sv0fKeRqtYgA:10 a=V5UXEbMT0ywA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22 a=gO1vWkAQAl3rybz1DQOp:22
 a=sozttTNsAAAA:8 a=iesYxoW1svnkQyt5-KEA:9
X-Proofpoint-ORIG-GUID: xqbXxTofl2j1_-jGSVFt_JvXKUaazqQO
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI4MDA0OCBTYWx0ZWRfX+RndHZn4Ymvk
 6iZzkG4128tFJVLdr6rWA43ikm7enS9QU/uottBLD03Hjd5XaM5MhjRvcA7aVgwCc2i30nPs4vC
 F4M7QkhvFn7eRRrtzwjveUvSEf1kwqM4NBa3A8z4tbYgn+NoMCRsK7L0WgJOsu0LnmUivX+pnJV
 7WTB5jAxLtK0oqirxlxz/QxXkElu74v0qV+Tex6iQqMAM9p+Pm/6EmfMqVyCj65gQxtjF8GYxMJ
 5eJQ+B4Z6rAdunThnCOdGlnzpfPwDZXHX7MyiyCwk4pvAJiz4nkFlHzOV74vwsiq/TiX229fuqs
 aPgRONoeEbW9ddDZLScu4VLNbZeKpuryoclMnx8mMC2qzVoFfW/h9BxuMQy+y6cJgEfGa7WINUI
 AfNVNAAzOQnV++HGHvptDbw8RrjQnZPkcVvJmC//Z07LLSC8NuyILrHxwY2Y5EM8TRSSu8KDvMJ
 2SB4jArKcSFO4Zx7mlQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI4MDA0OCBTYWx0ZWRfXy536X8pBL56n
 31YMdwECgAC3/a/WJNm6pCYUTxooYI2knSYWI3TwjErkaNxHgiGn/ErdAmz+jIPGeNmoLe5aWtm
 X/Wk/EnMmFNOvs/oLSLFbmGD4VBQROw=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-28_01,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 impostorscore=0 spamscore=0 clxscore=1015
 bulkscore=0 priorityscore=1501 phishscore=0 suspectscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608280048
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Fri, 28 Aug 2026 05:51:32 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17614

TI vendor kernel uapi additions (e.g. DMA_HEAP_IOCTL_EXPORT) isn't
present in the standard header provided by the linux-libc-headers,
so on-target compilation against them needs the ti-vendor-kernel-headers-dev
package alongside linux-libc-headers-dev.

Signed-off-by: Hari Prasath Gujulan Elango <gehariprasath@ti.com>
---
 meta-arago-distro/recipes-core/images/tisdk-default-image.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-arago-distro/recipes-core/images/tisdk-default-image.bb b/meta-arago-distro/recipes-core/images/tisdk-default-image.bb
index 264d1b2d..cac6628e 100644
--- a/meta-arago-distro/recipes-core/images/tisdk-default-image.bb
+++ b/meta-arago-distro/recipes-core/images/tisdk-default-image.bb
@@ -36,6 +36,7 @@ IMAGE_FSTYPES:remove:omapl138 = "ubifs ubi"
 
 DEVTOOLS = " \
     linux-libc-headers-dev \
+    ti-vendor-kernel-headers-dev \
     build-essential \
     packagegroup-core-tools-debug \
     git \
-- 
2.34.1


