Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BC003C88E4D
	for <webhook@archiver.kernel.org>; Fri, 11 Sep 2026 18:36:17 +0000 (UTC)
Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.46500.1789151776711622137
 for <meta-arago@lists.yoctoproject.org>;
 Fri, 11 Sep 2026 11:36:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=proofpoint-05-2026 header.b=JoedZhI+;
 dkim=pass header.i=@list.ti.com header.s=selector1 header.b=J4gJ5FfK;
 spf=pass (domain: list.ti.com, ip: 148.163.150.75, mailfrom: prc@list.ti.com)
Received: from pps.filterd (m0384305.ppops.net [127.0.0.1])
	by m0384305.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 68BHV3ow213764
	for <meta-arago@lists.yoctoproject.org>; Fri, 11 Sep 2026 13:36:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=sDltLuWZHal77BGFeYsVUGBUuSkWphF1NJRIkhqkQ
	cs=; b=JoedZhI+No68o1lwQ8dmyBAuHWAdp7DjhUtmF5MAmHj45Am28omYW0Yal
	duC5crktjOC2dPexHAFIMrIFWrNRx44hYm382wAyHE/bimZwRp969CLhPVgBgGck
	tC+/Y3uoPJ6lVOvr6c08fIl2+LCYMY/u10J6CPcGEqClrR2Gnvimn9+PcHgPBAAe
	YsL6/t93MV/6/ZbaPoiKz3zQPACQAdM3GqmdtzSLQiHtBA7knOT/2kt+Cgo10wEO
	UNkJO5VaNF+CVJmUtrJW7kIvlYlsxj1IgZ1v44TGZ2YsqUhrZ0qBycHARezmMNqR
	OZhkY0hucX19IZoukJchbb6LzBcgA==
Received: from ph8pr06cu001.outbound.protection.outlook.com (mail-westus3azon11012044.outbound.protection.outlook.com [40.107.209.44])
	by m0384305.ppops.net (PPS) with ESMTPS id 4gm3yyxj9j-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <meta-arago@lists.yoctoproject.org>; Fri, 11 Sep 2026 13:36:16 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JPefHD4z7liG/F6bFddQyF1pSe76Qcq5pqO9LN9Z72kr94DqvQ6tLzYbBLeNJ+TwEP9+11rqokE7bavp4oYm+GlJ5gqGYeZ4qH28aVftcH0BIlHQL9S/NEngxagYFQSY9xylZ1Qz1khT6WfH3GUmsSieZDWHIMCJqqXcbLXwH8fjf0YoEo4vdZ5xwPxbBDJPos0/EIqRAX6ypQE7j4L9rOwpPxpWM04Dy28xILYecDKxfNNsEHJwg2cNx9vNhhBelxVlnzlJqAtPlSdYmB3gyv1h8Bzl3zYsNlldZYVf1iGrLQHSKuV2bmuXCwbcfy2aCzFlJOnizFQlwVH1ZMxbLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sDltLuWZHal77BGFeYsVUGBUuSkWphF1NJRIkhqkQcs=;
 b=guh2ke2ZkAILbUXOA5NbrdfoiFeVTlH6daxgUzjVSzMH9ZmhLE9y1mUus8llHLcBqrVsFx+YW3cdxeKFc+k/1vCg2m5aeeMZ8LjfvQsI2SfUf4VnjoRG32Zv5qup6UwXH3l7ZCusK+Rn43FMGso3Td9/8cqduS8ujdlj+W8hQbmDYh0nk/tgSXhcwfpUWclgq/mpQyB/eNruEt+4cORC7kSH+uATRR1fs0CfOCsUDHOM4wbT9vErXvSeeBenhz9qfXgRmJnwliG56DDlob0dbINPezNn+mdh3CqP3JvEs+vOSrZ0fAAaSDclNFPyxRnbZyJ0Qz8n+a701ZXW42dAiA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sDltLuWZHal77BGFeYsVUGBUuSkWphF1NJRIkhqkQcs=;
 b=J4gJ5FfKwaftpzLgcJokkEOAOTrCszZNA/wkg0Sw3QGuhtoFPrlf26QiTRdy8/Izu6BNCYfEuVHWRuZuQPyb9L+05NjuZKGTdx6zsrOce0DKqqHJdJvkd8E4u0ZfO8Sk9LxR2mGrM8auid5rCmMlplXTGAU2Pn9R8st/KmLaGv/pWxPjgYXP2Xu7o5OrdPiszNhttJ5rz5dlSVo4gXgjzbVIQLYQ5t9YT3p+a59TApM065Bs/sshz1kTNR0rxwy2G0FdP98jK5CsYLFGFu0UahQFZJOnenkmQki5kHvRNx/MzmEdmLe/6sbQpF5tlifRCJy1d5cgq/BtqNxbp0k/Kw==
Received: from BN9PR03CA0587.namprd03.prod.outlook.com (2603:10b6:408:10d::22)
 by LVWPR10MB997837.namprd10.prod.outlook.com (2603:10b6:408:3c1::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.7; Fri, 11 Sep
 2026 18:36:13 +0000
Received: from BN3PEPF00022BBA.namprd04.prod.outlook.com
 (2603:10b6:408:10d:cafe::9a) by BN9PR03CA0587.outlook.office365.com
 (2603:10b6:408:10d::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.406.9 via Frontend Transport; Fri, 11
 Sep 2026 18:36:13 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 BN3PEPF00022BBA.mail.protection.outlook.com (10.167.248.116) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.406.5 via Frontend Transport; Fri, 11 Sep 2026 18:36:11 +0000
Received: from DFLE210.ent.ti.com (10.64.6.68) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Fri, 11 Sep
 2026 13:35:25 -0500
Received: from DFLE200.ent.ti.com (10.64.6.58) by DFLE210.ent.ti.com
 (10.64.6.68) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Fri, 11 Sep
 2026 13:35:25 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE200.ent.ti.com
 (10.64.6.58) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Fri, 11 Sep 2026 13:35:25 -0500
Received: from fllvdckhpci031.itg.ti.com (fllvdckhpci031.itg.ti.com [10.64.72.41])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 68BIZP4Q1604700;
	Fri, 11 Sep 2026 13:35:25 -0500
Received: by fllvdckhpci031.itg.ti.com (Postfix, from userid 60899)
	id 764999A9C3; Fri, 11 Sep 2026 13:35:24 -0500 (CDT)
From: PRC Automation <prc@list.ti.com>
To: Thorsten Lannynd <t-lannynd@ti.com>
CC: <meta-arago@lists.yoctoproject.org>, <reatmon@ti.com>, <detheridge@ti.com>,
        <b-brnich@ti.com>
Subject: Re: [meta-arago][master/wrynose][PATCH] meta-arago-disto: chromium: restrict force-h264-youtube extension to supported boards
Date: Fri, 11 Sep 2026 13:35:24 -0500
Message-ID: <20260911183524.503285-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20260911182432.526086-1-t-lannynd@ti.com>
References: <20260911182432.526086-1-t-lannynd@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF00022BBA:EE_|LVWPR10MB997837:EE_
X-MS-Office365-Filtering-Correlation-Id: cad364e0-071f-410a-0d90-08df10338dd6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|23010399003|1800799024|376014|36860700016|82310400026|13003099007|10067099003|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: 
	aOgm13fiH8l5A53Eh3FL56eF7KKLgVyJSZ40imc6zFMQCF/uRmZPeXrk+mK6a9u5QVrYfMF8Ku29W/AWZ+p3U1dv97HN1CAzY0/Jf44mpsWYuOmDCBoV1Kc+ii4bbA7TPUr9AVNI42W3noZrkYfXPH03b7E8+nDqxCWWQTS4/YzQPVhCMMA4sY59aUxlXuSs20N74mrWVkUU/tZKyhs2+IdM88TdKJjqenghazrbhBUSjatZt5JHshkcyIoO+XUNDjVKglqRHWJfocEuJtOz/L/03nGf4AguM1VwlZ7tzsJ6jumVAVBXjohwSatZgMgZ+4Eoty6ICoEVfLQYliYfDp5WSvsp4/hvQ6LzX2WHUM+LLsgAe/bL1Ck1l1MfkBoZCGY5oNHQS56zqcpRAWsQmoNdGzTTnN/smmqnZzegop7NljsBF8yzpRgozPy3D0FbOrEeB+2zIkDJBEwzaxWG2V6h/eGzTCCUTN5S+viDoy3zLXc3xcKhpx6zxVftPtq3B8i/2okvTZb+y6JpnhzO4em4DyNqNBUr9iCJ9j0tjSTH5AFphiExALcBnNnNjiAtPevO4YcEYspOdhXV7MdrwaTWTTbwxe16hKkdel8BtN4vpMORLkqGwnHV7TFpSPYGS9a9W1oy6TP4SnaBgjjneQ==
X-Forefront-Antispam-Report: 
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(376014)(36860700016)(82310400026)(13003099007)(10067099003)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	cychZqLTnL9X863zgLpZCyxph5oTpkBbAJKwbjzLNffy8MdJ5w1jAokDJToveNjyJU3Mj0aIozqF+K9h5Z5nix3BjNtxVYkQoZbaejTO2q8WcvEXo9f01V8Bk0sQJn3WdZCPqoMUelfgtYKL3WEUYvEUHQspSs4KPYPXO3sRu6tRxwYKcRN+MKl6OQgB2q/6Rh5CgYFg82GRE3Kikzy9K+USGzgpzfUMRild/nszwHKnnpOSIgznDmWS+krn4oRhmx3W8DZkjSIOSJ+P9LKPVsQszg33VwsWUePlZIODdECRwkm1RE1+ktyB9eZNs94S0hc58IHmVRjW0+8RkinECCNiY1bb/r7v0Bw5blC1YjcSqEin9K5j2fJ/YqLvBi3EyG7F0dYC+mIHx4+3MUjzvtMWo4TDGTre+aOd57W1aT4ut1MA5gz6aj/QkgacIdX6
X-Exchange-RoutingPolicyChecked: 
	bvYZpgSNnb5LkAY+eLR0dFnQDj0utovmJr7NT/ZnpsF9hE9J6WnWoqwBZ5kALCKO18X6+IL2VShQkvRZ8zsioRnH8WnsItuLAW99OX05lUMX5bbtfXxxwVKsoBjOV93bHtbuiCCAdem6PP/64yoyw9bOFFr9P5xctr8QH1utqavDbAS6i2v2WPoPnPZWCRFEjTO7VGNaBvbGIEtUNAZbFeXsUYCzpFVTw4EXopRv4+u3P241Ri4kenlkylfvgnMJbGzz4323u/xVrwweHaQWp/MoTeC/zgLtnGt+XTrU7Z1hKqGw2HuZGMVnlt2FMGl9yxbTRv2Bfcgh+YZY13dUwg==
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Sep 2026 18:36:11.7753
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cad364e0-071f-410a-0d90-08df10338dd6
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BN3PEPF00022BBA.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LVWPR10MB997837
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTExMDI2MSBTYWx0ZWRfXxXeK9v3ovnoR
 ssOgjTZVdgaJ38sK58cosScHE0NP55yn3R1m13LsrqIOtG3oDg8Ijfd6injYwvzreFrdiwd+q1L
 31nsLUgOu7pa3DIJmO1sUF4DAjU+obc=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTExMDI2MSBTYWx0ZWRfX+m4997XlcCCh
 US80jYd2V0yebYszo2ksius+Ohi9TF3TDnuiklonCJGOzTz0g+gpzPg0PCHooVnRyXxjOaUwhJe
 nHkNkUaNvfIHEr+ZiB8bxVSArvSQHOkkxeLKGfd+1dO5lH1uHYBr+GhX2VSISCi6+1DO5MaSfcl
 KFl+x1CjNref+uhWU1eBqPf+IVSVDA1gzMFF/9IEjhP8zhsHx5zal9fN/iLc4EXwJL4D2yCPn2Z
 zlzT6EIMoRSsM6X4+ygiQ3FTMKoG4Fy5u8CD2emhcj+iMNu8GobCeGVW0+fEVQHJUdQGwBOQL6j
 y4VZAhvVjVVG6ISwW+Zr+KnlwFf1dWPq6BZe8g8DKVvUdhqlTsUmGUBAUP0s96uqvyfAZ1El/D1
 Uqrbh9Ow7S27fGjryLVqtoECiphyeE1rCLqObFMqKb0+8kVUXeF5/gnB/toYSdlgG3rh3+g/iLy
 311qRC84i8Ri/W70Qsw==
X-Authority-Analysis: v=2.4 cv=Y8FtIReN c=1 sm=1 tr=0 ts=6aa44a20 cx=c_pps
 a=rlKp08D5gBKtwCtLUzcdEg==:117 a=iwqwCZQqcuTv3JOpYdM7/Q==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=VdqzKS8jKosA:10 a=Vs-ZokuVWRQA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22 a=taLDd7a_hP9WKsMzeGRc:22
 a=iGHA9ds3AAAA:8 a=3u1Qes_hY_y-wkTqsqkA:9 a=nM-MV4yxpKKO9kiQg6Ot:22
X-Proofpoint-GUID: BTgP5_44DEbpxSf-uGSBoK0zHyPogy_5
X-Proofpoint-ORIG-GUID: BTgP5_44DEbpxSf-uGSBoK0zHyPogy_5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-11_06,2026-09-11_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 impostorscore=0 phishscore=0 bulkscore=0
 priorityscore=1501 spamscore=0 lowpriorityscore=0 clxscore=1015 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609110261
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Fri, 11 Sep 2026 18:36:17 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17667

meta-arago / na / 20260911182432.526086-1-t-lannynd

PRC Results: FAIL

=========================================================
  check-yocto-patches: FAIL
=========================================================
Patches
----------------------------------------
FAIL - [meta-arago][master/wrynose][PATCH] meta-arago-disto: chromium: restrict force-h264-youtube extension to supported boards
    ERROR: Commit message too long (> 80 chars): meta-arago-disto: chromium: restrict force-h264-youtube extension to supported boards. (COMMIT-MESSAGE-1)
        patch:84
            Subject: [meta-arago][master/wrynose][PATCH] meta-arago-disto: chromium: restrict force-h264-youtube extension to supported boards
    
    For details on the above errors/warnings visit: https://lists.yoctoproject.org/g/meta-ti/wiki/40887




