Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.6020.1793911675840907022
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 05 Nov 2026 12:47:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=proofpoint-05-2026 header.b=WMoexjZS;
 dkim=pass header.i=@ticloud.onmicrosoft.com header.s=selector1-ticloud-onmicrosoft-com header.b=IN6UluC+;
 spf=pass (domain: ti.com, ip: 148.163.150.75, mailfrom: afd@ti.com)
Received: from pps.filterd (m0384305.ppops.net [127.0.0.1])
	by m0384305.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 6A5Hgmpm3092969;
	Thu, 5 Nov 2026 14:47:54 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=proofpoint-05-2026; bh=+gDbUxY34iPSz
	egJA+Lh6eTBCdheKB2eQhuwEFGlXhk=; b=WMoexjZSzi9651TBKjs0mvLRyE0i9
	ehhY/1u8lnjn9j4FB5Gq5FJaJLh8ra56o1IU98mHKH3QmA14OZ4qSwwmJNWnGjL1
	1g8OX0YAG+c8OBOnEm0ESQAuO94/JuaeLyCzGGUoh1PpKljYOr65TRo/ztIyI/Ro
	YPKg4vrAgOS4FxJkCkOQ7Y8AtDpOFQaTK+4KrtbuNUQmUYvdYUr+fU/4iq8vBAK6
	UTp8q400/oo5fgMOqTQPo7YtDfCXvcC3kwtSpYLv2sIvJDylzeFHdasDc3XnFiqZ
	8ljIshyyNADrbkLmQbPqLWlbx6rCzzwo/MCi3wjn40+bVlQAiRT+NJqzQ==
Received: from bl0pr03cu003.outbound.protection.outlook.com (mail-eastusazon11012013.outbound.protection.outlook.com [52.101.53.13])
	by m0384305.ppops.net (PPS) with ESMTPS id 4hrgp9pnb6-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 05 Nov 2026 14:47:54 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=E6Lwdsz1CC9gnzXtl74MSl0Ale+jNZqXr0BEkcxfI8Sp2U8T9L1Hv4NLKM7/QBtk9QPxWxFhYGea3GOV6WiyzleWChlzWhWgW621aGWz2qj5n1+RaktDJzpVO0w8aM0SRRYgAmys+ZaoST5SAvQNr5qTQPAWuEf+RuuYhOpbU3QziANrHXR5UXpkk8f7DQGKDQ45rgB6nsn0k9Bg9ZdkLS6M3Ov4v754xshBqF7LjSY2rZiGAmbpdd2q7gsMgPE3uR7QM7CxD8XDciHqvVO2UBCBNAw8IOLHup473VPnJKtiG8cJF+K9PywQMYKwZcko1JuFe67w3rMMQjCniLaJMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+gDbUxY34iPSzegJA+Lh6eTBCdheKB2eQhuwEFGlXhk=;
 b=diWEKaQdnw8yUzjTmvb1QdrnZcr2U7EXV5IvqnB8eaws/ITLtbriPGLO8uqyeCupZcNQHcka8apISJf5DDIIja5Zv6Wq5FK1rk5WkTnVZ84mDC7IqeJUnuHtF+ZtBmXd9z00uSbx5buA1p+pJCavvh+n1/D75AsXNhk9P0QmeskjTBdgNcpRDxXhgum8uJ6hHpxKtoxgNvJxffAWTmnul3hh7Bph+VBpvXRzESscilmtPEE4QZ4mawJJ8bTkwsWafOO05JPO5I5JrWJFwDl4cAwzimmjdtX4uSCP/JMDsw1YPxYTB1bFROsxsxSARxDp7Es2R+H1GtZ+IajCAXzz0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ticloud.onmicrosoft.com; s=selector1-ticloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+gDbUxY34iPSzegJA+Lh6eTBCdheKB2eQhuwEFGlXhk=;
 b=IN6UluC+yr6JKENKKZoxkScxvskD/B3F3eMOZLJRGqE8ml3kVKql4TtgfUHAs0oDmdNPtwLq8FQxCtAwzL1EWLWpnWRBAzGSpL2UpXAA9HoJR75H8EY4QcquDZJGQhcFK7fBNpgxkHaS8BM3wjCCLm9HS8ZvCiYQcQ1PEC2wos0=
Received: from BN9PR03CA0074.namprd03.prod.outlook.com (2603:10b6:408:fc::19)
 by PH0PR10MB4648.namprd10.prod.outlook.com (2603:10b6:510:30::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.9; Thu, 5 Nov 2026
 20:47:52 +0000
Received: from BN2PEPF000044A8.namprd04.prod.outlook.com
 (2603:10b6:408:fc:cafe::6c) by BN9PR03CA0074.outlook.office365.com
 (2603:10b6:408:fc::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.592.10 via Frontend Transport; Thu, 5
 Nov 2026 20:47:48 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 198.47.21.195) smtp.mailfrom=ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 BN2PEPF000044A8.mail.protection.outlook.com (10.167.243.102) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Thu, 5 Nov 2026 20:47:46 +0000
Received: from DFLE209.ent.ti.com (10.64.6.67) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 5 Nov
 2026 14:47:09 -0600
Received: from DFLE207.ent.ti.com (10.64.6.65) by DFLE209.ent.ti.com
 (10.64.6.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 5 Nov
 2026 14:47:09 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE207.ent.ti.com
 (10.64.6.65) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Thu, 5 Nov 2026 14:47:09 -0600
Received: from ula0226330.lan ([10.249.37.218])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 6A5Kl8Qg4039675;
	Thu, 5 Nov 2026 14:47:08 -0600
From: Andrew Davis <afd@ti.com>
To: Denys Dmytriyenko <denys@konsulko.com>, Ryan Eatmon <reatmon@ti.com>,
        <meta-arago@lists.yoctoproject.org>
CC: Andrew Davis <afd@ti.com>
Subject: [meta-arago][master][PATCH] check_yocto_rules: Remove telnet daemon scripts
Date: Thu, 5 Nov 2026 14:47:08 -0600
Message-ID: <20261105204708.1308999-1-afd@ti.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF000044A8:EE_|PH0PR10MB4648:EE_
X-MS-Office365-Filtering-Correlation-Id: 828aebf2-d33e-4d35-8fa5-08df3b7e0c78
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|376014|1800799024|36860700016|82310400026|10067099003|261022105027099003|261028144727099003|261026140227099003|56012099006|261021123027099003|261009223027099003|18002099003;
X-Microsoft-Antispam-Message-Info: 4HbDG8yI/K3CcHoA0GIqg8G+QJXqPm1SGQsWT5KpIfU93OEGk2fn32zwxgsjrajzZR15miZXPtyvlQ539B7F6clfYPTrA7/oZi6xmvMVK1YZXEqg/YPb2mlVabQ1oxSLONMG7itciNi7ZtQbQ8BcDN3jScCld+GSnckCmnjA12Fe5VPIy0Vy6ybZeVBntAVPHykaT8zQm6Rtc32L3uOYBUei2W8ZnYSau+u4UkIqoBDryuDKHBjJHcxlJSCehbNqhKTtv2rXDncNv77QQzxdDAMCmNqGbgguhrrnkgZPBiiQGyNaqQ2+jIkD3r7ZHPFviWie2B3A7NaT9Pk4f/EzWNxOXr3JjGtqaVBLK/EDytbK+J14Wdk/96gG92S6MWSMVG/WDLJgpXmh3aZxnwjxUdi9IymfyjQQJ6TnTus1i4ddSzqbfALZb1mR1JI9tV8Bg9FlRtfRd7dL4EhtGXSf8u1jPDCXDEByCbxPwjnlnkH5POZb7z1FtjsIii/Bu/FgPIMSrJDetFQa9NDaOH2NO5l3k+0wQ7GPIhWLUlpkiknp98zs/fLHxjZGdTnWBefuS+/o9Op6YydY1arAGNQzog3GHi7RFtDRJRgnss5UiS253UlwDB1XS/o3mfuOPbPJfGkDciIwoc3bUIWiL3Re3RD8+sSBpwWW1aCdQAjLHlrAkNl7gSDo1PvxQmqvvv9HXc2yYN+NLeSlpOIGwqLtVQ==
X-Forefront-Antispam-Report: CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(23010399003)(376014)(1800799024)(36860700016)(82310400026)(10067099003)(261022105027099003)(261028144727099003)(261026140227099003)(56012099006)(261021123027099003)(261009223027099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: mh/khncZzidAGamaidcuVyEWFuj03sE1ytqvJySJ8r2V8Chx9A6A/nIt5GlF/uPU/XqQbkpAszWJkBgaNnLixfMQJ5EL2uvuvvQGuErnaliqJ9/A5jU/6+LJ3oahKrWk99+pNnrWRsMTavNf8lZ0xfNKNXlnXEZc50L7/vxuF8Oo++HTzjAsTdarI+OZiTnhOrckQnPlWT9aF7kb7VdwXwNvKZM9DSEVoIgAyHEZ6cvVnsUxMk67dSb1Jhhlbdiu/pI/iJ6apggCozhtcHjfFebtwoeS3+fHgvgLZT3FPEsDFT28gBl0OBea+jNTUqKg8Ob4T3uk3yqknDURdIUt86OlXtqo3BOs1iTTb0csDFafkE3SmW5xXHnhox9c8VjVKT+q5Q/AFGUOOTCsezWaWdNKyJ/htLW2DA5OP1TzBtBFW7D/fghz4SkC8Ck6NCzs
X-Exchange-RoutingPolicyChecked: VJsLhSCpOIA7Ljrw5OY6YerUN+rw5CZ9P4fj6+5itoVVcoDkPMM5YPkowGInDmhL8OobfwmFMJ0fLxBoCz1UYlGzhmlF/ts0o92AZloMEO/hifx0iNvQlXGKTKA6Oy2d6ijFYrd9EdFpsMm2Wb2oI3ALlxHgGz2KK2fx0bXOGV5dif7nFXCmDj1zJCgJ9bBRra2afygH1AgE1HssDhuJeyNNSEDDki2J+xK1UsHCTXvKe0A2zYD3xvT4wcBqBHxABz3PJ9QSCfpLThLMsjHRKOSjIsOevIhrOF7QCb7mNZzQEhnGSXcIDGmv5E6LTwl6ETTajI3EXJz+XFyaQfZSDg==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2026 20:47:46.9947
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 828aebf2-d33e-4d35-8fa5-08df3b7e0c78
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: BN2PEPF000044A8.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR10MB4648
X-Proofpoint-ORIG-GUID: 8djvVhvvawTTDc4u-8GQX1t3gbRr9Kh9
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA1MDA4MiBTYWx0ZWRfX24s7uHSBjrko
 MiseuD9MiqxGDQ1C9gna6FghuajyrD0KsQB5Subo9P9nEijuqodzsVxbA4g3u889SyohLI7LvSf
 ElrV6ADeOckkYkC3XQx1KjmXJ3nQnzQ=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA1MDA4MiBTYWx0ZWRfXzVB34Vyk4QUl
 X5Hat5gH6fAlzgITM6+wCKolersOpftCUQUMn+E7+s+4kcpSW2D7oGnJkQffEbp0V/F9q5s9xaI
 mTXsqRMzSTMcermBQGx4gjqfSZe7Za8Bz2exjezXYzns1Co4IoUiFa0Dc/CISpjvmzsB9AeQrN1
 QIyYkDOaVUAuQojrENhIZc/2WI5zLy9xNJ699ZR0TGLKjtIDw49MyJhE+vHMZw8YenIJPXfBL3E
 MtZc7nC1Dq1LjplvnPU+MwbM4K283U19sUKnYPG7SIOzckD2mhrgVz17ixVT2QUbuPNWqlRwr64
 DIZacybeuU9+ySETF2NaGtcMTJHbLRwSYLJu1y89NM8KEoYKHVdwPSwFHt+3EVNsMfhQ6DSpc66
 x2qiCUG2d7x9PVXkfAQMgjxdPUovpSt9mp44JRFDzd+ksQyakYwW5E/2siXGgDR4rAKn435Cg6W
 k4QJ6HKs4tMPes+dmPQ==
X-Authority-Analysis: v=2.4 cv=D+jSufRj c=1 sm=1 tr=0 ts=6aeceb7a cx=c_pps
 a=UidE1AiM3qFEYM2TBOftzg==:117 a=tJyPKKxUohctrY4NYmUjkA==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=zJRp6_cAMcgA:10 a=AlMIdn_sM9wA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22 a=taLDd7a_hP9WKsMzeGRc:22
 a=sozttTNsAAAA:8 a=iHrufiF1jiOQFJ-Tf60A:9
X-Proofpoint-GUID: 8djvVhvvawTTDc4u-8GQX1t3gbRr9Kh9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-05_05,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 clxscore=1015 impostorscore=0 phishscore=0
 malwarescore=0 adultscore=0 bulkscore=0 priorityscore=1501 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611050082
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <meta-arago@lists.yoctoproject.org>; Thu, 05 Nov 2026 20:47:59 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17767
Content-Type: text/plain; charset="utf-8"

These are gone, remove them from rule check skip list.

Signed-off-by: Andrew Davis <afd@ti.com>
---
 check_yocto_rules.json | 2 --
 1 file changed, 2 deletions(-)

diff --git a/check_yocto_rules.json b/check_yocto_rules.json
index d3add97d..a36c7b00 100644
--- a/check_yocto_rules.json
+++ b/check_yocto_rules.json
@@ -34,8 +34,6 @@
     "PV-1" :{
         "skip_files" : [
             "meta-arago-distro/recipes-connectivity/bt-enable/bt-enable.bb",
-            "meta-arago-distro/recipes-connectivity/initscript-telnetd/initscript-telnetd.bb",
-            "meta-arago-distro/recipes-connectivity/systemd-telnetd/systemd-telnetd.bb",
             "meta-arago-distro/recipes-core/arago-gpl-notice/arago-gpl-notice.bb",
             "meta-arago-distro/recipes-core/meta/meta-toolchain-arago-tisdk-server.bb",
             "meta-arago-distro/recipes-core/meta/meta-toolchain-arago-tisdk.bb",
-- 
2.43.0

