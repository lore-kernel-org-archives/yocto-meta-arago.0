Return-Path: <rs@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04F44ECD9B5
	for <webhook@archiver.kernel.org>; Thu,  5 Feb 2026 22:56:34 +0000 (UTC)
Received: from PH7PR06CU001.outbound.protection.outlook.com (PH7PR06CU001.outbound.protection.outlook.com [52.101.201.3])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.33821.1770332185484779279
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 05 Feb 2026 14:56:25 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=EVS6wweq;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 52.101.201.3, mailfrom: rs@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=K7yYuONdQp6Sj5oLkrzGP+TVKKal9oRj5LuxrSU8CU94VXxzyfozOBzoFt6MKzzqBUNaQ/qhz2uJicrk82PN2qAKC7xf1yoGH8rzpDD4rTpXWCdw3RtEaN2khAfmvgv5/j2uqqvTrYPn5xDj7erVQIgonMKqXOdIjH+1PisxZm9fjEvxvcBL87hocsz2kEqU8DLkfmT3HBzMVGXKoz56mVPit2/3SFgAEc3DlGy6mJipuYrtfFeFGvSWlhBHfFxRiLFcfm3iabPeoNdasa4h4MXP7QNcGuY5autsRQ9B/uLIAS7Qke6wGXXVOa61O15ySXf3Lo1jUw7pX6i4dv/kqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Kanfo0HqvGDpZeVMYs3g6YVnSwFR4ZiYkkCweLPGgmc=;
 b=bpsoR39CEUKN8szEbnvkKBiWmatZWJHJDXp+jOzFP1lSFfANuXbu9uovP3KcStdM5YG3HY6IC7OWqWwFOb2euwQ7zGyHoVc5IFG2zxNMKP7MAF8uuXTSnE+zv5qrPm04Rd/g/qXrHm+FCGpmssRuppmDAMWDpwX++aZCurWQpo8LuJSpm9gkp+sEqVj2tapxLiyy5ODHCOAtkBBewvw85Ai60KIevcyYKQ8AoiXTG7ABGIHYiW4/VXNPR/Ac2HE3Hga7eYcUXLeL5EsOkeAPS2GHbRH8OFXqE7uwQNeRj19ss5NOhH60b04jtCtJtqj6OHSdWANtRSRYgLayca7arQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Kanfo0HqvGDpZeVMYs3g6YVnSwFR4ZiYkkCweLPGgmc=;
 b=EVS6wweqkF4HEoTr1vwhhnwrOzacUf6qvTSz5luf50vnelOY667jgYu8Myfu8x523pX0Dy5QSQeOHfRbX8XeH7o8peo/IpKJISNCHF0EOl/btocLQUQHWzFydzznx9ZGO/zIJQ9iqAfTzypX2Dn5e1xzmH0zlHX4jZ85L2rNaC4=
Received: from MW4PR03CA0290.namprd03.prod.outlook.com (2603:10b6:303:b5::25)
 by IA1PR10MB5899.namprd10.prod.outlook.com (2603:10b6:208:3d5::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.15; Thu, 5 Feb
 2026 22:56:18 +0000
Received: from CO1PEPF000044FD.namprd21.prod.outlook.com
 (2603:10b6:303:b5:cafe::6) by MW4PR03CA0290.outlook.office365.com
 (2603:10b6:303:b5::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9587.14 via Frontend Transport; Thu,
 5 Feb 2026 22:56:14 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 CO1PEPF000044FD.mail.protection.outlook.com (10.167.241.203) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9611.0 via Frontend Transport; Thu, 5 Feb 2026 22:56:15 +0000
Received: from DFLE212.ent.ti.com (10.64.6.70) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 5 Feb
 2026 16:56:08 -0600
Received: from DFLE200.ent.ti.com (10.64.6.58) by DFLE212.ent.ti.com
 (10.64.6.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 5 Feb
 2026 16:56:07 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE200.ent.ti.com
 (10.64.6.58) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Thu, 5 Feb 2026 16:56:07 -0600
Received: from rs-desk.dhcp.ti.com (rs-desk.dhcp.ti.com [128.247.81.144])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 615Mu7v7034061;
	Thu, 5 Feb 2026 16:56:07 -0600
From: <rs@ti.com>
To: <reatmon@ti.com>, <denis@denix.org>, <jcormier@criticallink.com>
CC: <meta-arago@lists.yoctoproject.org>
Subject: [meta-arago][oe-layersetup][PATCH 4/5] oe-layertool-setup: fix bug with branch checkout
Date: Thu, 5 Feb 2026 16:55:28 -0600
Message-ID: <20260205225528.92769-6-rs@ti.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260205225528.92769-2-rs@ti.com>
References: <20260205225528.92769-2-rs@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000044FD:EE_|IA1PR10MB5899:EE_
X-MS-Office365-Filtering-Correlation-Id: dc1b8668-08f8-498e-821d-08de6509c418
X-LD-Processed: e5b49634-450b-4709-8abb-1e2b19b982b7,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|36860700013|1800799024|376014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?8NkxCYhbIlRgQRAy1QStCAVv5ALpzRbf9qyUtpEcFK0+WW3v1U2FDHH9dtRP?=
 =?us-ascii?Q?T+5hDm7kGgh4q5qlEuT67BQZAD3o9dcWyX34gTN1a9/zsR90AOeMz9owNqGc?=
 =?us-ascii?Q?5QxOABBaBBhwuyUcCo81yoBT+qcXvHUeCnfsjYiSLaj3vU7Ni77r90hG60Aa?=
 =?us-ascii?Q?pjmlcd2aDai5NlOCqOQVQZerALEaFHbPn1/3lgDKt6IpHadC65PEN/rGTH5a?=
 =?us-ascii?Q?9EXRXYSDNSoejDrD51WyPpWv6GKRyMxDVB0Xk+YIloeJvxLmF80dCVrqhe81?=
 =?us-ascii?Q?C9wKG6lu3OIOk2xtjQemVIYp54m/HusmCJdJ69tGZs97sJ9tHA1iRWHmBm2J?=
 =?us-ascii?Q?qvo8xtFVnE4quLjN5231cNBtMXyoguvD9NfPTIWFUdW7GKpqQBtLGECiO8hX?=
 =?us-ascii?Q?wOS0dxgz4SeuxH/jtH67o18PqNQeJlDCmSVKdS7pWsR3EojfG9/SjYFDCxh1?=
 =?us-ascii?Q?JYvck+a+rZkPqPwVJ/mqxNNoa/ktz89VxTlUt201I8mB6UHXugOCewUfgwA2?=
 =?us-ascii?Q?OGtdzSXcX43crlfftQvGxO5+sACg/hS9aVSxvoV1bjeJn1ER9rVNI9lZwNOG?=
 =?us-ascii?Q?0GYIj77SfsW8ZUYr+uAXowHCc7KV8GzglSaatI7g1/kOlxg7xZu5iAj6wgH5?=
 =?us-ascii?Q?pO8WwyYJEvzo9ApO77gFxmDT+wIN171oLujGb09pnMBrxubFlTMHQw1FD1/I?=
 =?us-ascii?Q?C60QHxl7NGaBDO7ZP28MvAHPgpkIjph96YQ9UiobJOCv9yQXYdwlBo9U1D7E?=
 =?us-ascii?Q?PeMsO6br7ab6uY3iWH0NTm3sln03rWI1WjukrpITm8D953lNIRvvK8SL2cup?=
 =?us-ascii?Q?2OeUddh0btSSMqXPq14CIQnb7RAfhkebTkKRZUKP4FoqRNvlGBKB5Be03CVc?=
 =?us-ascii?Q?DdRFBMxSmO8d7U76cBQ02/kFILOtLX/QzBT8vzSrviLvpwvHqG1uEhYiIOdv?=
 =?us-ascii?Q?etp/974x55MGPWI27agYIUBeW0FVffr05jXLVcNEq1yMSCJdgT0uyKNB+y3t?=
 =?us-ascii?Q?8ZyX9s9R8GaDUYQKURpPKnu9lekej9hIE34WAFUWpMlvXLbVcMM2rdUhmbJh?=
 =?us-ascii?Q?/0q1Qatjk/wEsm3pCzF0KQPQ74VnC/4BljU5qewZKECf6hFbLAQJVztZl3GA?=
 =?us-ascii?Q?xi1qFsTI9YaBJRMRsozFiWtfsvGG6Hm0QnLAM7gdbhzFFe7nQsgvmo4Zj+8Q?=
 =?us-ascii?Q?R3jrS76bAkU1f87pw1tcBr28/3cA1mBGqChWXMKcfXiJ8xWmkk4v092pdKFr?=
 =?us-ascii?Q?Z9uoQhI4dLC3ZPkVnLqZ3xf1tehZ+0dUxc4VyWCEXmBht9zFpQ9m0bCc1vaW?=
 =?us-ascii?Q?ti++nRZ5VKplVpCm5RyD7AAwGQRDe2EhnRlAo9lRANVxVFcQPBIqPtlLvvTw?=
 =?us-ascii?Q?tA7qEvOnOtPCRxssHKLbWA3uRUwTLz6WkjwOsC8hI+2Qtp/qYTLgHAP1Dw8j?=
 =?us-ascii?Q?4MeWiyZQhZJDaPpIGzN6yXlRml+tugwSqloxkCelZ1IlzrIkxyvc6W+Qjtxx?=
 =?us-ascii?Q?pCkvemStNZ9F8QPPSCoWxWouiU3L5GCMFhzF+iPtTJ/+lVHliHx36JNlN1w3?=
 =?us-ascii?Q?iesUJlngxYiAEkY0983N5NfhPJxCMq29DYGy5wBNAAR7dwPllPGIi0cp5k0+?=
 =?us-ascii?Q?3aLt7OR2XTBwbDfiu41QVZU=3D?=
X-Forefront-Antispam-Report: 
	CIP:198.47.21.194;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	P4jeImaQaACYKQyyd4Gc3eXKQ1ggZrO2jZ65Tcbnrv/piWhImaGhoNVmM/UqzVMUTbcZfHAgB4u81cfqcqkBmKtDl3Tf8+Uh7DjdU6e7tVkQeo2GXb+sOJU/PMdoeu5RIY8GMyvOJIVR1WSEJHbLINZbBf0Qxg6SLBPbPafs7Qi/1Ti4KqojNdecD44AoGNymMkseZ4E6592PLOv5nLMP5dNbFTQmRhdggjZmMNwKsffNO1FFT7dqSW+v74l3brwfP07awA3YT4vnX0pm7Ev0mE4rxZQwTUAkL4cNx2qmdPA/XMFwTdzxtdDYjRbZ4U0vdResfWC03EIqgVa3xDyGTFM/ya2i63oako5KcHBp2HWRQXDh1CabjoyKId/gaTlPJLlNj7IhZgEMHSDrenDaGNy6NSYkA6OTWllKdPQGRbsAAXaVGE0FdVyYHxjzOTe
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Feb 2026 22:56:15.0924
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: dc1b8668-08f8-498e-821d-08de6509c418
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CO1PEPF000044FD.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR10MB5899
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Thu, 05 Feb 2026 22:56:34 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17091

From: Randolph Sapp <rs@ti.com>

Switch the if/else branches to correctly deal with a local branch that
already matches our expected branch name.

Signed-off-by: Randolph Sapp <rs@ti.com>
---
 oe-layertool-setup.sh | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/oe-layertool-setup.sh b/oe-layertool-setup.sh
index 979390f..db870af 100755
--- a/oe-layertool-setup.sh
+++ b/oe-layertool-setup.sh
@@ -462,9 +462,9 @@ checkout_branch() {
     # else just checkout the existing branch
     if git branch | grep -q "$branch"
     then
-        git checkout "origin/$branch" -b "$branch" --track
-    else
         git checkout "$branch"
+    else
+        git checkout "origin/$branch" -b "$branch" --track
     fi
=20
     # Now that we are on the proper branch pull the remote branch changes =
if
--=20
2.52.0


