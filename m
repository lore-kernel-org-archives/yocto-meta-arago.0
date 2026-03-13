Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E4A0A107BCD7
	for <webhook@archiver.kernel.org>; Fri, 13 Mar 2026 18:32:20 +0000 (UTC)
Received: from BN1PR04CU002.outbound.protection.outlook.com (BN1PR04CU002.outbound.protection.outlook.com [52.101.56.17])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.22916.1773426731598324821
 for <meta-arago@lists.yoctoproject.org>;
 Fri, 13 Mar 2026 11:32:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=selector1 header.b=O5lxIbaY;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 52.101.56.17, mailfrom: reatmon@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QwByigPewGJ2Oql178Ai6bZ+qDAMWMOjn/+7S6MadWomf0lMk7KR2W4tOC3YU6lkSwnpQxrT3xdzGkgaQKJX3lTjWxduG2/nXLEeKBTV3djUjV95dbZgE5mMS1wn2IppR5Cc9hTcSpBK+LcyRJmticA8Ai7S4cr8JU05y6IPx7l1+D4W6gGc5ZFtmMKikMyYPKa3cYmoVAgArQ+L6f+y/xd57ozba2H9ZEUJK4fZADcMkYhBmQo8QC5JpWTwQSxq0SWn+qMOZZLIlmGljhtliM4PognLm/TgoGldjrYfABrlrbB1u5XLeDOifME7s5spuoHEMIjCALxE9CDX/mvWzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kaDjK4FYfaXqVEDupw9YxmynMH71dM3yGNvQnwa2zgg=;
 b=flkuxJXOatLhtEIdZ/rlLZsDMEyIutSkVbrIGZtwKKmF6IocCbm08Kk8kDVF64WKJ17fJJTTTenLqsml/g/zRIp2V/IZk3CmTv1Kk0/YjJtmz/7cJb2my3v6hyzxz1brkVRhBNtY8Q2s46HTmQkQbC5IaY0g5pX3EDhR6mi2SL9zKD+bjciSYPPgIsXUJBp262EEdlfsJQhcnb2BNBeOIlrR/fGRK/uOPo0j16ATensus8mXuLyCs77ZGOA1Ibv0Ry9jZKZ7hCQZ4UIJMp+lYOm3bv3mXHmV+GGxCrOoRGqqeGeq+jMN+DDRLoMQVKq6I8cu5r1N3VTbOkPKPvbs1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kaDjK4FYfaXqVEDupw9YxmynMH71dM3yGNvQnwa2zgg=;
 b=O5lxIbaY+4j1o0EWQWuumsvFkXCQRHlCtDJOT2/yM6lcgKoqX3wnnepm3rJUXsrQizs1RLNufyyFhFppJQMemFqwWuCHhANcOPK95k+uRnJHbXRQUTmy+lSJVEmz4iDOfmJV3IvBTUNAh4xzztDxOCUgZy/oc3puA/7pjuU+Mng=
Received: from BN0PR04CA0045.namprd04.prod.outlook.com (2603:10b6:408:e8::20)
 by PH3PPF553978BD2.namprd10.prod.outlook.com (2603:10b6:518:1::7a1) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.17; Fri, 13 Mar
 2026 18:32:09 +0000
Received: from BL6PEPF00020E66.namprd04.prod.outlook.com
 (2603:10b6:408:e8:cafe::99) by BN0PR04CA0045.outlook.office365.com
 (2603:10b6:408:e8::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9700.16 via Frontend Transport; Fri,
 13 Mar 2026 18:32:08 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 BL6PEPF00020E66.mail.protection.outlook.com (10.167.249.27) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9700.17 via Frontend Transport; Fri, 13 Mar 2026 18:32:08 +0000
Received: from DLEE207.ent.ti.com (157.170.170.95) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 13 Mar
 2026 13:32:03 -0500
Received: from DLEE205.ent.ti.com (157.170.170.85) by DLEE207.ent.ti.com
 (157.170.170.95) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 13 Mar
 2026 13:32:03 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE205.ent.ti.com
 (157.170.170.85) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Fri, 13 Mar 2026 13:32:03 -0500
Received: from [10.249.65.90] ([10.249.65.90])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 62DIW3tF1012677;
	Fri, 13 Mar 2026 13:32:03 -0500
Message-ID: <4cb30196-5f26-4370-82d0-c84e0a3186a2@ti.com>
Date: Fri, 13 Mar 2026 13:32:03 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-arago][master][PATCH] flutter-wayland-client: patch build
 to include cstdint header file
To: <a-christidis@ti.com>, <denys@konsulko.com>
CC: <meta-arago@lists.yoctoproject.org>
References: <20260313013519.1055960-1-a-christidis@ti.com>
Content-Language: en-US
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <20260313013519.1055960-1-a-christidis@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF00020E66:EE_|PH3PPF553978BD2:EE_
X-MS-Office365-Filtering-Correlation-Id: eae6594e-a96b-45d6-cf71-08de812ed5cb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|36860700016|376014|1800799024|20052099010|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	NyBAWabWO5zoUAuHG4roh3ZRJXhVezUIyIOvAxfIseLsl1Sqyf7Fq5WYuCBYXwhFpwBZtnshF27XX4QHLh14712ZLChAl4pwz+rbjUdxCZXliVn8xLDsA7fuA0kllSnpDdqvuQNxLFjx4WhOaDCvxYuWOYS5oNkoRlLGbS7eheXLqcZK9OZ0k/y08onsD/6rZtO8Piy2eR2azctW+OjnAMeDVRqcSVcoClWRjuZ8do12GjKhBfx8940JXH3JXwdjC83aQJ6xE7G9Ua84OSxxDDwYvqx5hZ8bmIouYw/P6MznSSBOT7EZ+q7nmgG+J53w1DCl2tO/M5TaBRI9FPZoRcXAovWbXZgwekIdxx+HDmHUUTiEVXUSo58zZt9OZueoWmP9Yi75h4ffxXQZZV9pJ93Qv1dGcOEOeM0GtNIMVMp+515ubbujzJlzPb/hzB3ziTncFBahRegU2jQalw2jZcZ2z6tK+99Z597CDDkMRq6B0C1n9S925XHS87+vWp5CWFLw2daYef98K/gcuwN4rupSe9mYImUAHXTNFf8ZLZJNegX5ozYVvvZIDVGH3hat4ylSD39vusloKSfaQM+N9UqWsKMgfMqvVeyTotaaZHURa0oRO1D+Ps7iiI9Yk05+lGK38kVh56iLTYPAGrljLDjzyFotMPFxc7XInlZ+Mo+mudgltddoejmqltA4eb9qsqpAFyJQgidN6Kh41eYmSVe/C0qjbgdLxARUgk7W4Hd1qdgCSD8xHMeuaiLa7LJJK1nv3+iV8W1VTUvwhNuq9Q==
X-Forefront-Antispam-Report: 
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(376014)(1800799024)(20052099010)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	UphRpF/Aqjf8HKMCf/Lvjml9XZ1BbzumWbcDnDklkN2TgK72zy1lUAfW97+S+wLPQ1KgkfNjYB0+6BaO39C1sevZEdKO2qYfHj6/QriqPWymUal3JSuhUTQwQkLMaxb341ryom1WCwfotKuIvx+67ie4RoTLaI0N69ynFnmDNopbMH1NOOYKWLGyaQol0/G679/e3NiGbbKByS+6noHpP/BRVoUxQdhEJcX6uvC2HKwOOOT2pvo4POTojtBnoGSFTget/h7T5i2BkUhIpSQqP2Nj5Z0X7ek42jeyHQQgHhaStjcU/cXi8wQYEDTFBGQmKiIfkvPUVgksUrLiyVtBBnOxOrS6fOJNIQyMTp0GnSJ3HbNPAsHYbBeU83+UIwVfPJN50bKpzfz+mCuHUieR8guh/dNDpKUkGqvV5w4GS9ctMAtCNtQjg4IhGkH3aIM/
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Mar 2026 18:32:08.7392
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: eae6594e-a96b-45d6-cf71-08de812ed5cb
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BL6PEPF00020E66.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH3PPF553978BD2
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Fri, 13 Mar 2026 18:32:20 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17337



This is failing to build.  Should this be in a dynamic layer?



On 3/12/2026 8:35 PM, a-christidis@ti.com wrote:
> From: Antonios Christidis <a-christidis@ti.com>
> 
> Add a patch as part of the SRC. Patch includes the missing header
> file cstdint.
> 
> The patch is labeled as Inactive-Upstream, as Sony has stopped
> support for the embedded client. On the meta-flutter github,
> there are discussions on creating and maintaining a fork.
> Nothing is concrete yet.
> 
> Signed-off-by: Antonios Christidis <a-christidis@ti.com>
> ---
>   .../flutter/flutter-wayland-client-arago.inc  |  3 +
>   .../flutter/flutter-wayland-client_%.bbappend |  5 +
>   ...-message_codec.h-Include-cstdint-lib.patch | 94 +++++++++++++++++++
>   3 files changed, 102 insertions(+)
>   create mode 100644 meta-arago-test/recipes-graphics/flutter/flutter-wayland-client-arago.inc
>   create mode 100644 meta-arago-test/recipes-graphics/flutter/flutter-wayland-client_%.bbappend
>   create mode 100644 meta-arago-test/recipes-graphics/flutter/flutter/0001-message_codec.h-Include-cstdint-lib.patch
> 
> diff --git a/meta-arago-test/recipes-graphics/flutter/flutter-wayland-client-arago.inc b/meta-arago-test/recipes-graphics/flutter/flutter-wayland-client-arago.inc
> new file mode 100644
> index 00000000..ed7bd5df
> --- /dev/null
> +++ b/meta-arago-test/recipes-graphics/flutter/flutter-wayland-client-arago.inc
> @@ -0,0 +1,3 @@
> +FILESEXTRAPATHS:prepend := "${THISDIR}/flutter:"
> +
> +SRC_URI:append = " file://0001-message_codec.h-Include-cstdint-lib.patch"
> diff --git a/meta-arago-test/recipes-graphics/flutter/flutter-wayland-client_%.bbappend b/meta-arago-test/recipes-graphics/flutter/flutter-wayland-client_%.bbappend
> new file mode 100644
> index 00000000..58fb5497
> --- /dev/null
> +++ b/meta-arago-test/recipes-graphics/flutter/flutter-wayland-client_%.bbappend
> @@ -0,0 +1,5 @@
> +FLUTTER_ARAGO = ""
> +FLUTTER_ARAGO:arago = "flutter-wayland-client-arago.inc"
> +
> +require ${FLUTTER_ARAGO}
> +
> diff --git a/meta-arago-test/recipes-graphics/flutter/flutter/0001-message_codec.h-Include-cstdint-lib.patch b/meta-arago-test/recipes-graphics/flutter/flutter/0001-message_codec.h-Include-cstdint-lib.patch
> new file mode 100644
> index 00000000..33edda42
> --- /dev/null
> +++ b/meta-arago-test/recipes-graphics/flutter/flutter/0001-message_codec.h-Include-cstdint-lib.patch
> @@ -0,0 +1,94 @@
> +From dcfcb92c7f42cd6bd92b1048b5e4ea6f01d40e21 Mon Sep 17 00:00:00 2001
> +From: Antonios Christidis <a-christidis@ti.com>
> +Date: Tue, 10 Mar 2026 11:01:28 -0500
> +Subject: [PATCH] message_codec.h: Include cstdint lib
> +
> +Include cstdint lib within message_codec.h.
> +
> +Upstream-Status: Inactive-Upstream
> +
> +Signed-off-by: Antonios Christidis <a-christidis@ti.com>
> +---
> + .../client_wrapper/include/flutter/basic_message_channel.h       | 1 +
> + .../common/client_wrapper/include/flutter/binary_messenger.h     | 1 +
> + .../common/client_wrapper/include/flutter/engine_method_result.h | 1 +
> + .../common/client_wrapper/include/flutter/message_codec.h        | 1 +
> + .../common/client_wrapper/include/flutter/method_channel.h       | 1 +
> + .../common/client_wrapper/include/flutter/method_codec.h         | 1 +
> + 6 files changed, 6 insertions(+)
> +
> +diff --git a/src/flutter/shell/platform/common/client_wrapper/include/flutter/basic_message_channel.h b/src/flutter/shell/platform/common/client_wrapper/include/flutter/basic_message_channel.h
> +index c081946..fcc6b23 100644
> +--- a/src/flutter/shell/platform/common/client_wrapper/include/flutter/basic_message_channel.h
> ++++ b/src/flutter/shell/platform/common/client_wrapper/include/flutter/basic_message_channel.h
> +@@ -7,6 +7,7 @@
> +
> + #include <iostream>
> + #include <string>
> ++#include <cstdint>
> +
> + #include "binary_messenger.h"
> + #include "message_codec.h"
> +diff --git a/src/flutter/shell/platform/common/client_wrapper/include/flutter/binary_messenger.h b/src/flutter/shell/platform/common/client_wrapper/include/flutter/binary_messenger.h
> +index d552b49..82e47da 100644
> +--- a/src/flutter/shell/platform/common/client_wrapper/include/flutter/binary_messenger.h
> ++++ b/src/flutter/shell/platform/common/client_wrapper/include/flutter/binary_messenger.h
> +@@ -7,6 +7,7 @@
> +
> + #include <functional>
> + #include <string>
> ++#include <cstdint>
> +
> + namespace flutter {
> +
> +diff --git a/src/flutter/shell/platform/common/client_wrapper/include/flutter/engine_method_result.h b/src/flutter/shell/platform/common/client_wrapper/include/flutter/engine_method_result.h
> +index 3cc8b6a..9634ead 100644
> +--- a/src/flutter/shell/platform/common/client_wrapper/include/flutter/engine_method_result.h
> ++++ b/src/flutter/shell/platform/common/client_wrapper/include/flutter/engine_method_result.h
> +@@ -8,6 +8,7 @@
> + #include <memory>
> + #include <string>
> + #include <vector>
> ++#include <cstdint>
> +
> + #include "binary_messenger.h"
> + #include "method_codec.h"
> +diff --git a/src/flutter/shell/platform/common/client_wrapper/include/flutter/message_codec.h b/src/flutter/shell/platform/common/client_wrapper/include/flutter/message_codec.h
> +index c84d25f..c007b1e 100644
> +--- a/src/flutter/shell/platform/common/client_wrapper/include/flutter/message_codec.h
> ++++ b/src/flutter/shell/platform/common/client_wrapper/include/flutter/message_codec.h
> +@@ -8,6 +8,7 @@
> + #include <memory>
> + #include <string>
> + #include <vector>
> ++#include <cstdint>
> +
> + namespace flutter {
> +
> +diff --git a/src/flutter/shell/platform/common/client_wrapper/include/flutter/method_channel.h b/src/flutter/shell/platform/common/client_wrapper/include/flutter/method_channel.h
> +index 6e39a64..34687a6 100644
> +--- a/src/flutter/shell/platform/common/client_wrapper/include/flutter/method_channel.h
> ++++ b/src/flutter/shell/platform/common/client_wrapper/include/flutter/method_channel.h
> +@@ -7,6 +7,7 @@
> +
> + #include <iostream>
> + #include <string>
> ++#include <cstdint>
> +
> + #include "binary_messenger.h"
> + #include "engine_method_result.h"
> +diff --git a/src/flutter/shell/platform/common/client_wrapper/include/flutter/method_codec.h b/src/flutter/shell/platform/common/client_wrapper/include/flutter/method_codec.h
> +index b40fa64..edd14d6 100644
> +--- a/src/flutter/shell/platform/common/client_wrapper/include/flutter/method_codec.h
> ++++ b/src/flutter/shell/platform/common/client_wrapper/include/flutter/method_codec.h
> +@@ -8,6 +8,7 @@
> + #include <memory>
> + #include <string>
> + #include <vector>
> ++#include <cstdint>
> +
> + #include "method_call.h"
> + #include "method_result.h"
> +--
> +2.34.1
> +

-- 
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS

