Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.132.1792702327138839627
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 22 Oct 2026 13:52:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=proofpoint-05-2026 header.b=Ose3dCnP;
 dkim=pass header.i=@ticloud.onmicrosoft.com header.s=selector1-ticloud-onmicrosoft-com header.b=Z4ZG9oN/;
 spf=pass (domain: ti.com, ip: 148.163.154.28, mailfrom: reatmon@ti.com)
Received: from pps.filterd (m0374955.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69MHt0pP1029352;
	Thu, 22 Oct 2026 15:52:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=
	content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=proofpoint-05-2026; bh=sE04ZEAQMhJPW
	mYoF2l41O/uFWyACO64uOIZdUSYdtE=; b=Ose3dCnPTH0d8BdW45IhJXY6c7iNH
	PtcyvB+YuxknEbk7HBXP1yo1yqPp/TVx/rLC1Ole9BjSJXQ7k7FY/+jOC2OJQCBQ
	mevO0xC9LAAxMSMAwle4z2VjX1ifjSqbp++4XXFvNICnAuhAWwWHb/aQNNVTRnpW
	gjZGFPocwPiWFbgMPLhVQh9tvc0C/8SAtdAkLQ5NOXwmzsgty37yz/keRoaqVKUZ
	lIXfOE2hZFKcfHJagLWYa4sVfpkYPlEzKkQBzyq6RK1fJHE5Z59p0oEbJzRyZjq5
	5SLraLr0DzHe4y1KPLGls1lY5e4W1pyw5bQGA9RN3oWAgcDCXSdoZVikQ==
Received: from bl0pr03cu003.outbound.protection.outlook.com (mail-eastusazon11012028.outbound.protection.outlook.com [52.101.53.28])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4hfmg02b35-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 22 Oct 2026 15:52:05 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XLGrF3AwOEltpsmoQEKUM5gQ197rb7FD12YU11VGL/msFVUGn0mbALYJobRTdFgwfwT8tExIJua9GKCnjUQs1cgs5GaT/ICebGpcKN7qwopErBlaL4Bovye52SkJqnydtKhNW89kpmphH8LbtMDqWonXIAjR6XZVviC7YYl6BczbNWFsRW5x6n0gLa/36wM95iOLtdLCr0SBIDpJWj20sgyJzVwCUyGzp0hCKxg2LWHw9g+UUnbWC70PvjkApmSRh958zmaC4twtml60nOfarVLkRx0uIEi+s6v620PeWuE1DguEyeu3bBG55ogzaukKdZizfvoJkZEe2YqLUj0cEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sE04ZEAQMhJPWmYoF2l41O/uFWyACO64uOIZdUSYdtE=;
 b=VVCm6LxTOPpAy1UPDEs3xe1mHTBgceDPSV7z2eTimx+RADJ3cdYjiUf+8OI4vSgH6Jdwd2yLr0LSlZnOXzGAbdbX3UJrIIW9WFwyJKvi0M06ag7t6BMA8dobbO6QjisE7t1hh1jyOTt4DRPlYfU0nPuJyehT/tiW7DURUBVOv1xWtq9jNTJHlidownqrjTYOqMu5ALq+w3Y0a1ftX4n58C8PpIdwYVRihNbv5OX7M7pDO2WUpMDQ0sDlE2PiGNDEKkzpWEU2/BLDNa/smcdvxSp8jPCnE/o+OQzx1XqpKVoUG0cFSDcDodfUYe5JHdHPKgq5YmIOvTBMV4yj4jT3Rg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ticloud.onmicrosoft.com; s=selector1-ticloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sE04ZEAQMhJPWmYoF2l41O/uFWyACO64uOIZdUSYdtE=;
 b=Z4ZG9oN//G/rEOEF0M0PqaMhT/Ju5cYk5256NCtV7UFtx1oxILmy9hPbn/mrzQBBelMx0EqcCuObmsrF7r9VQYr6rFrBcW0zhm5fyMKtt7Uu2FzB2jvukf66P5pU64N4VCaYeL+0pleOm9vw2mSceTE6oaCUDWJdZU1YMZM6s/4=
Received: from SJ2PR07CA0014.namprd07.prod.outlook.com (2603:10b6:a03:505::7)
 by DM4PR10MB6767.namprd10.prod.outlook.com (2603:10b6:8:10d::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.16; Thu, 22 Oct
 2026 20:52:03 +0000
Received: from SJ1PEPF000037AF.namprd03.prod.outlook.com
 (2603:10b6:a03:505:cafe::67) by SJ2PR07CA0014.outlook.office365.com
 (2603:10b6:a03:505::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.546.17 via Frontend Transport; Thu,
 22 Oct 2026 20:52:02 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 198.47.21.194) smtp.mailfrom=ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 SJ1PEPF000037AF.mail.protection.outlook.com (10.167.244.187) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.546.15 via Frontend Transport; Thu, 22 Oct 2026 20:52:01 +0000
Received: from DFLE213.ent.ti.com (10.64.6.71) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 22 Oct
 2026 15:51:10 -0500
Received: from DFLE212.ent.ti.com (10.64.6.70) by DFLE213.ent.ti.com
 (10.64.6.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 22 Oct
 2026 15:51:10 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE212.ent.ti.com
 (10.64.6.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Thu, 22 Oct 2026 15:51:10 -0500
Received: from grumpy (grumpy.dhcp.ti.com [128.247.81.229])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 69MKpAfC2076764;
	Thu, 22 Oct 2026 15:51:10 -0500
Received: from reatmon by grumpy with local (Exim 4.97)
	(envelope-from <reatmon@ti.com>)
	id 1xJzkk-0000000FVnV-0fcT;
	Thu, 22 Oct 2026 15:51:10 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-arago@lists.yoctoproject.org>
Subject: [meta-arago][master][PATCH 1/2] meta-toolchain-arago: Remove unneeded ; from SDK_POSTPROCESS_COMMAND
Date: Thu, 22 Oct 2026 15:51:09 -0500
Message-ID: <20261022205110.3697140-1-reatmon@ti.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF000037AF:EE_|DM4PR10MB6767:EE_
X-MS-Office365-Filtering-Correlation-Id: 551bf14b-2ff0-4576-360c-08df307e52ab
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|36860700016|23010399003|1800799024|376014|18002099003|261022105027099003|13003099007|261009223027099003|261021121427099003|261021123027099003|10067099003|56012099006;
X-Microsoft-Antispam-Message-Info: qhRF9yLdxRQyTej8XAekUBFZDx4VANnYea/RLMm2ydkdvLnbBSuBDztJtA6BLZGhAF0vVq2sYv4uf5sWzZoCca5nk7veuzUhZC+1fIX3Tf2A7H5/CAWfjBrRsfYDx04qtNLKI1SoxWmW4K1bLMP+LtnC+9HICHdkkcGsyUBQC6353WFqTfz6wC8pIbd6+taKqs5e8NlhznwtE3xprFDpXox3SPhnV4PDBTPXYKpNXW65GlpO6P2gYfaOg6swMEqQrY3TP09ZmcPAdC2bOf5WV2TwnHDuoKpLUxaC5DQzsELLxJDkn19f2wIDiOF+M5hSd7mDoq3QDm3Dgl1V/7e3c6YZscJxhnAgHxltLBYGQMUHtcXLTpZWBpKUQXwWzdc+eFUeiMJ2OkE2NZ3xvja5wfrEf9G7mMCrjnekfmWIuGynJQQHdv6Zqz7Qf3cKknIfCqJ83VBBS3oNWs/VhdXS4TUi6O4rCCis5AHpY0eS3SZkgJdFpw1J2mYuOpPiXeiwPO2dgB2aSjMJpWyL+fSamffR60t1yjoSU439Z/tFkduZ115UxKpW7WgB1Axxka/XHbgqqJBChVNNBATlaSLrEV6/A5Puprsq28D9oxEa6OVVl9CnIVnB8VlokIpGuxZ4oV83azRV0FSbnp2cei5tsQTgrmBL1paTceY49WxQda4=
X-Forefront-Antispam-Report: CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(23010399003)(1800799024)(376014)(18002099003)(261022105027099003)(13003099007)(261009223027099003)(261021121427099003)(261021123027099003)(10067099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: XJewOBddxYhTZm60UY7yFIB8njYZ6dn8IlKvYbvJFE4y0awbYzIRQUcoeSR1ikQdUlLJbF7oBYX+be+8gcY3vMARHPJeN18dQkyu9icJeODXeSaYzftCSuEnRRej5JPkIL9OD4YpQtx53y2RxOvRq1VVDUpXOdceavszGq0HGjst4I/e98xggG14NpHNYzXmT6BTPEpXNy7qyQ4H69a9G6eCKdYCnXCexJP532gQ5k2VnAN8/krBWDPHWbxXJ8vJb1/ty6q5f2/OuZ87pJjCP9QKn38uXMxcWuIXc12B9U46qfuZxIX+P1R+VO0K3tGrmoBT2Y6mypvi8DbW0hbTajZqv3KRchEEmD4uzJc50TWRX4bATTT5N1soPmG++dltmQUVi2lma70z28I1VjphM77JsvsfRHf91nR+HzzleAd6q6LaM5mBpF9Vpj94kX76
X-Exchange-RoutingPolicyChecked: Ngtndv5mIXgT2i3g6PYladq/68hn9yuL+eR5Mhs2eWqV1+1uc2vSi0vUvMHXl3uz/kEIDNLaOlAnMIKqWNfr+1Z9iUOkqf6CcDmwEw/DH+whI2Tx0v5EXweO7SYMUj8Q1aRWrHfWm/YsXkuhAFuYiAaxb628nhUmgzuUViArqEC0tXOxb8m+332f9JPzGjyDmdVVYwkgrtz+7KvC8Fw7eWgCJNV+ZxGX4tphuSSinW99pdtI8O6NIz7i0WMYwJTYz1tF9/JkkVuNx5oGNFwstYuGA2zZNFrSfYMyH1bZS61Cxd/alg6XyHgt/49BpwiCDGa5qfa8YJQ7xhl59Pt3iQ==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Oct 2026 20:52:01.9595
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 551bf14b-2ff0-4576-360c-08df307e52ab
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ1PEPF000037AF.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR10MB6767
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIyMDA4MiBTYWx0ZWRfX5MbRbw5yk1Bb
 xFxpou+5+Zi+f88zU+NuY8fwZcvRRTlGU81dn7McYbCwC7KNkvoexqPRcr5n6m1klsGGf5bSD5M
 yLGBJk4NoS6bWggHQN27BWwNF/vNp3q3+DpD2w8I/IGc3aE634q2BytjQZviudHsykOhmTYwSmJ
 1xbfsisvf7L4N9SzVEFy3qVV0+uScfFpHh3Y9mVTNZxOsAxp3B8Z5Mf9P+IG/gGvtIpgi4QZd3n
 jeWrm2zIYYRCpKSYI+1aiDKVP6YI8V9SnD+NYxDe+0FYH9MTyexCJvxFvG2Iuy8aYFYWWJTDLOo
 KH3zkenP4LgBmUyLUpQppi5PnZX9sJFvSKfNjX+WwwFeDuYTnym2yHbzmN6TqGlVsxT0/IMh8zD
 pz5zL9hnZeTIoVG0BfnIbuBNqCIzmQJ5qLHfmziO7a7SH/k05QteDx3cVfp6qU4d4/0aK8awOxl
 Gi0/xkgKZDiNsUsP46g==
X-Authority-Analysis: v=2.4 cv=QIL91QLL c=1 sm=1 tr=0 ts=6ada7775 cx=c_pps
 a=B83JijZ7EzXLHUDiN273XA==:117 a=iwqwCZQqcuTv3JOpYdM7/Q==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=660iZSQnnn4A:10 a=AlMIdn_sM9wA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22 a=fPAWb5peG099m5CrUpKH:22
 a=Q4-j1AaZAAAA:8 a=sozttTNsAAAA:8 a=dW3IYHvbCWbODfsYAa4A:9
 a=9H3Qd4_ONW2Ztcrla5EB:22
X-Proofpoint-ORIG-GUID: QA2tN_BP1mJHZzprugigfT1xzIkllKS6
X-Proofpoint-GUID: QA2tN_BP1mJHZzprugigfT1xzIkllKS6
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIyMDA4MiBTYWx0ZWRfXwaMQxP/S5ALn
 EpJas32fHOk5jJ6fAdRmhf7tlQ4Un1UCvJ4zFhZugVoVjwB1PlM6Rud2eGUa7jMUCKqB0HX7Bdm
 8bVU2Xtq/016t5dZCVOmZCPvpxK7Q6s=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-22_06,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 suspectscore=0 spamscore=0 adultscore=0
 lowpriorityscore=0 phishscore=0 impostorscore=0 malwarescore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610220082
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <meta-arago@lists.yoctoproject.org>; Thu, 22 Oct 2026 20:52:11 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17751
Content-Type: text/plain; charset="utf-8"

Two changes in oe-core [1] and [2] made the ; no longer needed and then
added a warning if a ; is still seen in the variable.  Remove the ;.

[1] https://git.openembedded.org/openembedded-core/commit/?id=c3365dfd9ddd7fbe70b62e0f11166e57a8ca6f73
[2] https://git.openembedded.org/openembedded-core/commit/?id=581816d6ce0a27608f7444b97aa8b52596d25d37

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 meta-arago-distro/recipes-core/meta/meta-toolchain-arago.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-arago-distro/recipes-core/meta/meta-toolchain-arago.bb b/meta-arago-distro/recipes-core/meta/meta-toolchain-arago.bb
index 3aae25b4..6ce7695f 100644
--- a/meta-arago-distro/recipes-core/meta/meta-toolchain-arago.bb
+++ b/meta-arago-distro/recipes-core/meta/meta-toolchain-arago.bb
@@ -92,7 +92,7 @@ EOF
 
 }
 
-SDK_POSTPROCESS_COMMAND:prepend = "arago_sdk_fixup; "
+SDK_POSTPROCESS_COMMAND:prepend = "arago_sdk_fixup "
 
 arago_sdk_fixup () {
 	# Remove broken .la files
-- 
2.43.0

