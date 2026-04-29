Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 12C93FF887E
	for <webhook@archiver.kernel.org>; Wed, 29 Apr 2026 15:11:19 +0000 (UTC)
Received: from PH0PR06CU001.outbound.protection.outlook.com (PH0PR06CU001.outbound.protection.outlook.com [40.107.208.42])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.13833.1777475470860499265
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 29 Apr 2026 08:11:11 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@list.ti.com header.s=selector1 header.b=RlZ10kdA;
 spf=pass (domain: list.ti.com, ip: 40.107.208.42, mailfrom: prc@list.ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nkwxbGkue8cIcLiwdNK0ubzTHlh/IOGOSRvHDVzOpMjw8hvFyKzkxpAdfclmhkkXTCcN0I42y5a0q7ocRXdqGW5RCboIWEcoLTzNzZTDQPIOziqCwnQTnwIZA06+yfQb46Adha35u0HATagy6GrxlZdoSv0o4isYoxuNb8iN2EmtdoGS9gYR1owDPdWbqjnljp5IkTVQ1DIE95sm/dRCNyrGTQ3iMVdoICYRPRWu0R3i/+gI79W7f9mx21ONdMMSjOUQc3YAHgbQyDx6fYlXCrm55O5RBHc+XDc3rS+QlMc3dgSEgKUF9nWfFQnCeQB7gKAmTXM2teAskiC0CTIlTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=n539LRdj94kY9p+FruJlV9Lwsg+h7oAIjqkiU7oseEQ=;
 b=kOPk4YWw855PS3HEJ1Qh35cIR9HqwXH/o5qLXTR1OBbjRQMD/ThD+TSs02296Ew555Fev5gu8jaIbkOdF0BpNb/oP/HLuLOvJe+53orGQZKT4U+CsykrXXVX5WyUdIpXybnMG7ZqWsxRPlTYBw8HZjFclyhxV88XHM0/Rou+rexLUIGZ/ZG8hXMuCZwhhdoSPekRYyQ09P8eWO3ujxZbV3RWLQVDJX2KZDj4xv7gvgYdBm9QFLiTsG9nrpesONgI1uvAdGQ+CDUEBq4cdlCSX5IradJyQNg1lRi4vksXpRG3SPD1QuwdAKlyIEOk0kvGG/FaY+qUpoL8WegNAdBPsA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=n539LRdj94kY9p+FruJlV9Lwsg+h7oAIjqkiU7oseEQ=;
 b=RlZ10kdAgMU8trf4UgNak5lxpEqzqvUeKEQtKa5AzOXDwns24VAn39RM7kTyR9jU+fMO8BS/Rn7JGpr2yYGCm3ySBsohZ1naDuN9CvqlEuX2UsaC4Ae8mqWfA80DK9zHNV+avfLuOfAPQ7XpW20u3bEE3vGFX/SF6d3gt9njfVpMJPfumDqUlwC98GnFrdcEjKjyqs8PFatNmF+KzTzh8jR/wwFDR1Q8qOtveqfv+tkUtL6s4ZTW5zZEWlh3Eoo2efkrcM2DVKBcbfgoD8q/NuQcHBeHTeeXDbS7akCcvFor9n79jMEQbChqaUjV/w8Hu1em3Ip2ggaDf7H96KR5aA==
Received: from DM6PR08CA0052.namprd08.prod.outlook.com (2603:10b6:5:1e0::26)
 by PH7PR10MB5722.namprd10.prod.outlook.com (2603:10b6:510:126::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.26; Wed, 29 Apr
 2026 15:11:08 +0000
Received: from CH1PEPF0000A348.namprd04.prod.outlook.com
 (2603:10b6:5:1e0:cafe::2a) by DM6PR08CA0052.outlook.office365.com
 (2603:10b6:5:1e0::26) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9846.30 via Frontend Transport; Wed,
 29 Apr 2026 15:11:08 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 CH1PEPF0000A348.mail.protection.outlook.com (10.167.244.4) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9846.18 via Frontend Transport; Wed, 29 Apr 2026 15:11:06 +0000
Received: from DFLE209.ent.ti.com (10.64.6.67) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 29 Apr
 2026 10:11:06 -0500
Received: from DFLE215.ent.ti.com (10.64.6.73) by DFLE209.ent.ti.com
 (10.64.6.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 29 Apr
 2026 10:11:06 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE215.ent.ti.com
 (10.64.6.73) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Wed, 29 Apr 2026 10:11:06 -0500
Received: from fllvdckhpci031.itg.ti.com (fllvdckhpci031.itg.ti.com [10.64.72.41])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 63TFB6aY3568369;
	Wed, 29 Apr 2026 10:11:06 -0500
Received: by fllvdckhpci031.itg.ti.com (Postfix, from userid 60899)
	id 4B6DA9ACF4; Wed, 29 Apr 2026 10:11:06 -0500 (CDT)
From: PRC Automation <prc@list.ti.com>
To: Ryan Eatmon <reatmon@ti.com>
CC: Praneeth Bajjuri <praneeth@ti.com>, Denys Dmytriyenko
	<denys@konsulko.com>, <meta-arago@lists.yoctoproject.org>
Subject: Re: [meta-arago][master][PATCH 1/2] meta-arago-distro: Change from meta-arago-test to meta-ti-test
Date: Wed, 29 Apr 2026 10:11:06 -0500
Message-ID: <20260429151106.1019036-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20260429150918.978225-1-reatmon@ti.com>
References: <20260429150918.978225-1-reatmon@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000A348:EE_|PH7PR10MB5722:EE_
X-MS-Office365-Filtering-Correlation-Id: 35bb1ca3-c25a-4b6d-a9b2-08dea60189b8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700016|376014|1800799024|82310400026|22082099003|56012099003|18002099003|13003099007;
X-Microsoft-Antispam-Message-Info: 
	V7HmFKnljBtKU6iR5I1ze+PXNKuZ6JW/1g/Pd5xqarzi37zqu2xi07gZdvequ+ndShhifJZPTtsCipiBVy+ViV7X2cBxp+BskpTnhyxWHL5N9gh5bQLWjYsgC0UFhME04kRAbXG+CF2z9a6Llte4s4QpezbPQwSJGlhWkGrOWyRapVFesHwutGWmsVh19yEATXh4+zmDIHGhEHU39FR2Erh6sSO6Shn0DQ7Wm6hi1MOW62GtVAjvdZzqwfwISibJAP5ZgUjJrVscsvMyKEEDZWaivluaKg2WsuucUM5/9IIoroStYkYrmie8x8jEgQ/7N2dkUZWZocd2Sw51QvdsrBtuTP/K5IUYtGJXlG5QL/Su/P4b2WHqYPiYX3ehuCwjddHsrtfy1UxNxYeSXuWDLKOFRYDWIfa9v7H9HdOaH9Uzh0xURkIbnOkXdtA0RAcARhtb4OeJW58EO1Sf9zG2dPHBAwNayIfDSCfqOnfYOW4oXmvMAjvHUYQTaGFMqM76DlobDtfbUXK2cP1rK9MVmbEXHDoX5e9AKZVwrWDLspvxhpZFMUY+7rb09vRSzzQ56jNvyKWHO4N22cFqtVrh6RVrm7lN0DMwDtrR5Z+h2i27/+H+x588eDkWWT4I1kFjAVMa939ZtGNeAqKuBZYuF+uGTrSm7omz585FLxCxtsl3r24v0Kikn3+7OZf4orAcXX4QzIvFopHo/lqfZLFRXFvbJ/LYtQKLE8eoXumJt/0=
X-Forefront-Antispam-Report: 
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(36860700016)(376014)(1800799024)(82310400026)(22082099003)(56012099003)(18002099003)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	MEArDuPQPjFxZ71CUcDS60zYGRNoYrpsTZKXO0GDjUSqxz7UT5m1jYRHrEAJfog6ddLdoxp+BZ1cKFCU6D58N/fF9XmUPxnbIGnwUJhH3/TzTQnWZhBbZhwgazeLJ+p61xYcZZu3iFcisEfvJ/gWbLFJD5UhiXP5cCtFwnPQhrrNOICLl2haBnkf7U9KkzYKZdiFnEj9f4aqcksmdA51r3jVmR3677Xq93ecMcFliyztBGJ3hLeEgUNgCX4venN/922IcQymEA3Om254lVtc0Wg7/1i0atdqoHQTPHdBRUEmM4sDd6U7cFPnyElpbfolvk9pxL9nd/HMKtYLHY5Tc0RW2i7Uw84OGG5Y91og/XCygHHAC3jc7TpgAZEqsxKEYUteGUoLoTMMpcZxrR+oy3Djgm2+8CAYmiTTsiY3m//3IyezDkW0wEdpPaeBADXW
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Apr 2026 15:11:06.8038
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 35bb1ca3-c25a-4b6d-a9b2-08dea60189b8
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CH1PEPF0000A348.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR10MB5722
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Wed, 29 Apr 2026 15:11:19 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17510

meta-arago / na / 20260429150918.978225-1-reatmon

PRC Results: FAIL

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
  check-yocto-patches: PASS
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
Patches
----------------------------------------
WARN - [meta-arago][master][PATCH 1/2] meta-arago-distro: Change from meta-=
arago-test to meta-ti-test
    WARN: Commit message does not include file/recipe name: meta-arago-dist=
ro: Change from meta-arago-test to meta-ti-test. (COMMIT-MESSAGE-2)
        patch
   =20
    WARN: Commit message should not include directory path to recipe: meta-=
arago-distro: Change from meta-arago-test to meta-ti-test.
              meta-arago-distro (COMMIT-MESSAGE-3)
        patch
   =20
    For details on the above errors/warnings visit: https://lists.yoctoproj=
ect.org/g/meta-ti/wiki/40887
WARN - [meta-arago][master][PATCH 2/2] meta-arago-test: Moved to meta-ti/me=
ta-ti-test
    WARN: Commit message should not include directory path to recipe: meta-=
arago-test: Moved to meta-ti/meta-ti-test.
              meta-arago-test (COMMIT-MESSAGE-3)
        patch
   =20
    For details on the above errors/warnings visit: https://lists.yoctoproj=
ect.org/g/meta-ti/wiki/40887



=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
  apply-yocto-patch: FAIL
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
master
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Summary:
- Patch Series: [meta-arago][master][PATCH 1/2] meta-arago-distro: Change f=
rom meta-arago-test to meta-ti-test
- Submitter: From: Ryan Eatmon <reatmon@ti.com>
- Date: Date: Wed, 29 Apr 2026 10:09:17 -0500
- Num Patches: 2
- Mailing List (public inbox) Commit SHA: 62613c5213a10fc13ca29d3bad9d2b429=
d6f9a27

Applied to:
- Repository: lcpd-prc-meta-arago
- Base Branch: master
- Commit Author: LCPD Automation Script <lcpdbld@list.ti.com>
- Commit Subject: CI/CD Auto-Merger: cicd.master.202604281800
- Commit SHA: 64aaf466edb9fe81bece484481311127e4af2fc2

Patches
----------------------------------------
FAIL - [meta-arago][master][PATCH 2/2] meta-arago-test: Moved to meta-ti/me=
ta-ti-test
    error: meta-arago-test/recipes-devtools/ltp-ddt/ltp-ddt/0001-include-mk=
-Fix-installing-subdirs.patch: does not exist in index
    error: patch failed: meta-arago-test/recipes-devtools/ltp-ddt/ltp-ddt_2=
0260130.bb:1
    error: meta-arago-test/recipes-devtools/ltp-ddt/ltp-ddt_20260130.bb: pa=
tch does not apply
    error: patch failed: meta-arago-test/recipes-devtools/ltp-ddt/ltp_20260=
130.inc:1
    error: meta-arago-test/recipes-devtools/ltp-ddt/ltp_20260130.inc: patch=
 does not apply
    Applying: meta-arago-test: Moved to meta-ti/meta-ti-test
    Patch failed at 0001 meta-arago-test: Moved to meta-ti/meta-ti-test




