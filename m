Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ED972C9830B
	for <webhook@archiver.kernel.org>; Wed, 23 Sep 2026 20:16:16 +0000 (UTC)
Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.4479.1790194569169731751
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 23 Sep 2026 13:16:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=proofpoint-05-2026 header.b=IyQdhRFY;
 dkim=pass header.i=@list.ti.com header.s=selector1 header.b=L+7wFL1h;
 spf=pass (domain: list.ti.com, ip: 148.163.150.75, mailfrom: prc@list.ti.com)
Received: from pps.filterd (m0384305.ppops.net [127.0.0.1])
	by m0384305.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 68NJkI4q2897878
	for <meta-arago@lists.yoctoproject.org>; Wed, 23 Sep 2026 15:16:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=0HgJRCIl2SHj38vHtO0qjFWy+RDaOmJG6goz41drZ
	Mg=; b=IyQdhRFYWDmT7WGG3h30zNdQ+m1XjwyJfF5U66py+nXLfG9/vWJDVgmeR
	a/B6zwF9P0kK/81YCS4qqvsXX29J/JpFaFb/rrMQLVgnGk2wvHxZXHi18ZqPBy//
	0tZiT71Ivujh4ibQ2mhBDhFXaZzNFgaL4W1Fp3O9qrOqp2aGsE1VK4zLtZgFA7ae
	rELh6DPt3deuvkzHG/x0OghKv52UnWEEHn2159K96oapb04HzY4pJnQNYdvZ4/gN
	sLxFYmxHLBcQFiR8OUl2xkpHsu2lmir/1LwibyKM5RqQddmBQVnY83xHK5noMJBL
	ARCVB2rsk+8uCsFehJEEUk+y+n0hw==
Received: from ch1pr05cu001.outbound.protection.outlook.com (mail-northcentralusazon11010067.outbound.protection.outlook.com [52.101.193.67])
	by m0384305.ppops.net (PPS) with ESMTPS id 4gvb77vmsr-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <meta-arago@lists.yoctoproject.org>; Wed, 23 Sep 2026 15:16:08 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hNijlArsrGQDVKQwJjFcikoi7/J5WiYUgOT7DsK2sS+QOvkw5ZeDiYAgev63lA5pDropO3+fyyC852NayW03aQQ1Sa9eVgcYMQdfScMIyoPt6Nj2St0T0INE6+sXYXLq1WYhWwI/tJq33kuBH6w3PQ/88K85voJSkdj22ybXSNqcDmWVW9o0R/SfKmaE/X4fN3p974GO4L4H7AGsY6yVygjtwSXI8735KOJmcW3sYBjpnGbnoizEz7tNgdX+59FxDPIBXuZ+A93LWjE+2fIkH4rlV298pmNdpVD6Xb7SFZICfsGlfG3rCULuU8O+97zVWQQquazEQzXBttPa2snPIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0HgJRCIl2SHj38vHtO0qjFWy+RDaOmJG6goz41drZMg=;
 b=wDthHjOSGM2x5Xo/eVV+QF4nqgRaAkxTEyzmbW0lay681Aq/6saO81EtFuz3WaUgHgFjsxmBhOutOA/PYxoeTqOj+TYIRJ8UNONpgJdSlNgAWOPDdZCYoi08NsI+YwDwwnzbxylF609ZApb2r2OPhDnMwCuC0rmmt9u9HOTSlXnRUXsVjE8aubrKkwXAV5QyYuHGo5uOjt4ZDlitK/YJCDpfQXvRosWaIdyOGbyJevSMHQoejlajLVY8bazAPAMYS/Hummbf3nsoMOy7EDjR8NGUhguIfoO01d5aGJWYjN73qDtEKRbMKTB5pd14+w0I6+qWeaIXOmPuXz69EIXqUQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0HgJRCIl2SHj38vHtO0qjFWy+RDaOmJG6goz41drZMg=;
 b=L+7wFL1h3oG1zOvuqLbMs7zG0SfGexinEk/rGq0mPDft7Ktd7d2Yh8JK8Ji5A1p9QSUC/o3ttQ07jWPVq5DFvOeyEvihMrTT5ghd/yynxIFsFrg9DPeTYtW3PRTngFkpCSeyqgOVeK1jPgqeKe2cG0G7Es2h3LyYctwx36v61T3OIXKJxyLh/qyiKUwM+dVgBon64bRA44jecbtLM/og+XncnfpZ41lVw8/qsa/mjceob6vdbEp3n9AVjH/U2m56kxLRBKXamNVfHb2KaZbhN1KUIEtTx52MeXXdVExF30vv8OUUQp7nNNLCwOD4FAwGj82QYxj89AF8dfAY6nJR4Q==
Received: from BN9PR03CA0091.namprd03.prod.outlook.com (2603:10b6:408:fd::6)
 by IA3PR10MB8321.namprd10.prod.outlook.com (2603:10b6:208:575::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.6; Wed, 23 Sep
 2026 20:16:01 +0000
Received: from BN3PEPF00022BC7.namprd05.prod.outlook.com
 (2603:10b6:408:fd:cafe::4d) by BN9PR03CA0091.outlook.office365.com
 (2603:10b6:408:fd::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.451.14 via Frontend Transport; Wed,
 23 Sep 2026 20:16:01 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 BN3PEPF00022BC7.mail.protection.outlook.com (10.167.248.212) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.451.8 via Frontend Transport; Wed, 23 Sep 2026 20:16:00 +0000
Received: from DLEE203.ent.ti.com (157.170.170.78) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 23 Sep
 2026 15:15:38 -0500
Received: from DLEE213.ent.ti.com (157.170.170.116) by DLEE203.ent.ti.com
 (157.170.170.78) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 23 Sep
 2026 15:15:38 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE213.ent.ti.com
 (157.170.170.116) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Wed, 23 Sep 2026 15:15:38 -0500
Received: from fllvdckhpci031.itg.ti.com (fllvdckhpci031.itg.ti.com [10.64.72.41])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 68NKFc2L3601239;
	Wed, 23 Sep 2026 15:15:38 -0500
Received: by fllvdckhpci031.itg.ti.com (Postfix, from userid 60899)
	id 22AA79A9C3; Wed, 23 Sep 2026 15:15:38 -0500 (CDT)
From: PRC Automation <prc@list.ti.com>
To: Thorsten Lannynd <t-lannynd@ti.com>
CC: <meta-arago@lists.yoctoproject.org>, <reatmon@ti.com>, <detheridge@ti.com>,
        <b-brnich@ti.com>
Subject: Re: [PATCH v3] meta-arago-disto: chromium: split force-h264-youtube extension into its own package
Date: Wed, 23 Sep 2026 15:15:38 -0500
Message-ID: <20260923201538.3514930-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20260923201126.1084567-1-t-lannynd@ti.com>
References: <20260923201126.1084567-1-t-lannynd@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF00022BC7:EE_|IA3PR10MB8321:EE_
X-MS-Office365-Filtering-Correlation-Id: 1eb32b00-b316-471c-d70a-08df19af7c97
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|36860700016|1800799024|23010399003|376014|10067099003|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	p05OFg4mTygz2nNSwthnAX/KbAdzpZIzw0gRLWtM7A6JRkCursG8nRxIrNJxampcEz3EZ9HNZYG3Cte0DHe0ulBGLS7FxM7y+DDmIuLuKvH2r30380Pb7Cx5jmdu34xNhO4NqIPN6Dpc4SBGobBHqDZhvPkAyXzBTZe1RLFqmqgaVlIgdY21h9teooBi3xIxxGwg/kxRwZucB7/ocv4xxkmdA2CB0v+3+AoJY6M5rThxA2GDomT+QrjOPY6z71yEpM6RE8cDMBdrJhVRxWfn8JjHcplWN/3gMi08mL5sEHLpOYwtirWBS0c5GY+5FNxkrqdtVw5iw4cj9KXRmOpnZa9f3HnXQuKcUwpdABAyfAQAMG/O2YSWSBm0W3uQHvoddzPdjsdwVlfA+FjEdGRWb00BC5O1JmPRgoL9FGEYY3dLbguDBiYX61Ra7yflYCF+MY7P9js8P6D7TzQCrYqAVk3ORxqSmC+XF3GBLe6Df/YhJBBK9HI941uZcT1BR+n1248BbX+vPe2G+E+89nWG5nMn9bZmU/+hsOvlJf0BIgXbXUl7GaA/r0luIrBIaR5Fu+tVqZNsW8B2hUfByC2YoSq7VHmiic6i3kgsWpc1xwBrInCO1ebJQjhO8vlHp1MjP8cnKwrU8/i0g7ik+CC+lA==
X-Forefront-Antispam-Report: 
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(1800799024)(23010399003)(376014)(10067099003)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	Rw2Vu1XBa5syNDyclNHRXsjSKudo9DBqDBQFC9/mtl2v6cqcvAryW5VQd7xr04mpf8XiY4OYnSbcOPme+qKlwG6qC8KbOt9nR9Ft2XEISfj1yfLZItdfXD16ybXZCA2QQJCvVz7nFaJJw/YFUxUhxzunFKspzSXAzguDP4AjMrqh3/WwpCjaQ9fvk2k2FLYikyootD+4LNOmopML5YacO3G/snV/N6ppoTbHxEB+vcpdvY/wQaCgQhRZ8lB6wdITyuJ9BGcrrHCYfr29cFtfOIpqlC7aheH0yjbdhbOSQ0cQFFg53wfg8bIFyu3gsY/rQDiLuzRhvCXCvOkSmJ7UVTvSElLGsA1UDbMqd2WjPVBGiNPYWEnEVOp2j3TioAQfyvfRw8sLRm+asD5BmzROf4bedes1h2YpLgyI9r8tdi7f+S2qKNyeSfzX+Lp8WSwi
X-Exchange-RoutingPolicyChecked: 
	FUJg7PDsXKVLpnFo1NMSCWZBfCjcG97otbWgDZ2cLy93tVxlYVrEFx6wDh/G7rOSMsQIv3cKbZj2aerPYA/StUvgEON1FajUjuTZ5Zo2ZUianYsrwRos6QdNM3abAcOwYgkTnJ75HMEgT7iZy0KzMv85Su29EKOOb7CglSzihA/JVneFO5/bjoyTwL8dDus6VG6I9R0ZXllpJoqmGkjv0s1pzXSzH+E7cj0Ka2DS47rWDMlHgqmzSV2aodx9hyVd+8qwFQwafYItdJ0QI4znQhALhaQh705w3HsE1fu2DTwbOQnLc9pmSCEbX4df6PUPvuyotbfX5ZS7PwN8hnmpBA==
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2026 20:16:00.9048
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1eb32b00-b316-471c-d70a-08df19af7c97
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BN3PEPF00022BC7.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR10MB8321
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIzMDA4MCBTYWx0ZWRfX7Yz/33FwDryQ
 i+wz3iZLhxNyqNFsS28FoaJCIX2dndO7926jcAWvFxmwoVKGyMJDrTMer3DoA0/y9We/lYMcps3
 3oZYb9pBNscfwfaz5GdB119p6i5ZyOOIybcqMW2jR+prvwQYanuF01ac+Z3Ws7CVqYMST+5XhQG
 oZJrZDvViocD56uPWmG1RZ3ohFaYFBsfXo/gT4zucDI5do0cgOlt5NVMKO3HF6yP+IYQVEGUW14
 lpCkO/OYEYzmDBiifT7gsEg8P5OSbFXsfiBOqsK2gVZj81f2lwxdtA4PGNAY5dFZhu1/7MG54v0
 7fCRmk8iIYhF409V5Ipv+G7n2CSrqaqEbdKgRpACsdoIcCrgqlJ2iTgkrnBLOTS1tkS2Y3SEBPH
 XjkHAHHq5UDsuiCMrQP0FNvNJYUKBmMWrKHcF/U/f7ofAXq7ojgfgF7KU3KwfD0D05PVMMgusnv
 FHMovSv71uGk+8+2myA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIzMDA4MCBTYWx0ZWRfX51FDNwjsLaYg
 /6WC7r5WTmyMC1W0XYd5Bhmcg0otY4BzckM3+Z5b1WyPWaQAqoGFodgb63GQjJZsC2Zn24arHVX
 V4As8cvXP6l7dk2C66Wp+0/r0Wl0s3o=
X-Proofpoint-GUID: Zq-taqqb_tHlnj1KuBTe4kegynrwdYnt
X-Proofpoint-ORIG-GUID: Zq-taqqb_tHlnj1KuBTe4kegynrwdYnt
X-Authority-Analysis: v=2.4 cv=cPt1IVeN c=1 sm=1 tr=0 ts=6ab43388 cx=c_pps
 a=4Gx/Bq66bxzCWlClXrtOjA==:117 a=f+v6EHfkeJbVwR46tk4DMg==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=VdqzKS8jKosA:10 a=s63m1ICgrNkA:10
 a=Vs-ZokuVWRQA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=taLDd7a_hP9WKsMzeGRc:22 a=iGHA9ds3AAAA:8 a=ZZn8lsE6Dez81-DiRdcA:9
 a=nM-MV4yxpKKO9kiQg6Ot:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-23_07,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 lowpriorityscore=0 adultscore=0 priorityscore=1501
 impostorscore=0 phishscore=0 suspectscore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609230080
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Wed, 23 Sep 2026 20:16:16 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17702

meta-arago / na / 20260923201126.1084567-1-t-lannynd

PRC Results: FAIL

=========================================================
  check-yocto-patches: FAIL
=========================================================
Patches
----------------------------------------
FAIL - [PATCH v3] meta-arago-disto: chromium: split force-h264-youtube extension into its own package
    WARN: Missing branches specifier [master/scarthgap/XXXXX]. (META-2)
        patch:84
            Subject: [PATCH v3] meta-arago-disto: chromium: split force-h264-youtube extension into its own package
    
    ERROR: Commit message too long (> 80 chars): meta-arago-disto: chromium: split force-h264-youtube extension into its own package. (COMMIT-MESSAGE-1)
        patch:84
            Subject: [PATCH v3] meta-arago-disto: chromium: split force-h264-youtube extension into its own package
    
    For details on the above errors/warnings visit: https://lists.yoctoproject.org/g/meta-ti/wiki/40887




