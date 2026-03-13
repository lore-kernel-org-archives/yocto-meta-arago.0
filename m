Return-Path: <a-christidis@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9DBAB107BCE5
	for <webhook@archiver.kernel.org>; Fri, 13 Mar 2026 20:32:31 +0000 (UTC)
Received: from CY3PR05CU001.outbound.protection.outlook.com (CY3PR05CU001.outbound.protection.outlook.com [40.93.201.63])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.25759.1773433945125656710
 for <meta-arago@lists.yoctoproject.org>;
 Fri, 13 Mar 2026 13:32:25 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=mThN2eB8;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 40.93.201.63, mailfrom: a-christidis@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ICpLCCsk7CA9u4689U8Ib8Y8tAKl9KMfQfpIE41Z7/1NVuj+iAs8WKzwnVAA/PuP22rtuwNuyiJi6Y1CdJj0xZNyD0lPIUF+eKpel1b6KgRFn025tXVURAHwu9+9ibGyPbUYi959SmaaqYdZ/J9Nuo1fKFsxr1d1MSEe5Dd3SxA3aw7S1QbtP4XPiEfz+hizO9Vait902fXZsxour3exz1/VW6lcTGFdufjWW2n/V+FJYlx0kPu+DMQ6vJBFUb2KGPrPQimXCaGagDI1TRphmd0Mkpq0uaSD7P0yftePa7z1F6NpjiUwDcNmvOdl6nt9QFSNYFt/2Fav3jhYoJB0uQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oaDwqNoeYmzMdGy2WSoPDJt7QtJHri/vzNdV4rouPPs=;
 b=kQnZ4tZZkdn4Y60ZEJ3MU84RNbWJyYmaHRweaZaAnf3i9RlwWqgbUhs1TVmrkXjiBHvlyR16gFuJ7PVvHcP+B5rpEymxXr8Qbna08GaZJMywuQQmIsswQjAFQBK2h7mm28fip69i3YUKWK9TvJCyTaamvKIsLFl0EQSp9UXUYemZA1uT3WfL4WRg3lOcPRQXNuetjwfbjnw5hZl3vbeGbXlf4tqayAQ9y6yULSWVMlGSFZyUTqgZ8R6J83r0iDT4nC1QtQBMNvTsZTom1imIZrCIx3X9wrqqQE0TnNkk+piwwwjsHJExF+XU4fulCV0oNokFD/l2CR5jDwiyYG2UWA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oaDwqNoeYmzMdGy2WSoPDJt7QtJHri/vzNdV4rouPPs=;
 b=mThN2eB8jT7qsm2WHYXSpypY+5dwjoIwqiUFBQ8L9siCeE/PSFbNdQNeL/iY9PdntYLcINjxq3DqOcqCi+MrOoiMjLHVJB4YrtSY3vy7hBT3GLbRqydXfcyjBwa96xKHgc20sNctwR+pFZBjVMK5a2u3BQV3EjwibIAorfQ6+/Q=
Received: from CH3P221CA0002.NAMP221.PROD.OUTLOOK.COM (2603:10b6:610:1e7::25)
 by CO1PR10MB4612.namprd10.prod.outlook.com (2603:10b6:303:9b::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.15; Fri, 13 Mar
 2026 20:32:21 +0000
Received: from CH1PEPF0000AD81.namprd04.prod.outlook.com
 (2603:10b6:610:1e7:cafe::ea) by CH3P221CA0002.outlook.office365.com
 (2603:10b6:610:1e7::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9700.17 via Frontend Transport; Fri,
 13 Mar 2026 20:32:21 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 CH1PEPF0000AD81.mail.protection.outlook.com (10.167.244.89) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9700.17 via Frontend Transport; Fri, 13 Mar 2026 20:32:19 +0000
Received: from DFLE214.ent.ti.com (10.64.6.72) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 13 Mar
 2026 15:32:18 -0500
Received: from DFLE212.ent.ti.com (10.64.6.70) by DFLE214.ent.ti.com
 (10.64.6.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 13 Mar
 2026 15:32:18 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE212.ent.ti.com
 (10.64.6.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Fri, 13 Mar 2026 15:32:18 -0500
Received: from [128.247.81.112] (antonios-thinkstation-p3-tower.dhcp.ti.com [128.247.81.112])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 62DKWIBo659036;
	Fri, 13 Mar 2026 15:32:18 -0500
Message-ID: <bbce0c56-7ed2-4e0a-93e5-09b494afcb4a@ti.com>
Date: Fri, 13 Mar 2026 15:32:18 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-arago][master][PATCH] flutter-wayland-client: patch build
 to include cstdint header file
To: Ryan Eatmon <reatmon@ti.com>, <denys@konsulko.com>
CC: <meta-arago@lists.yoctoproject.org>
References: <20260313013519.1055960-1-a-christidis@ti.com>
 <4cb30196-5f26-4370-82d0-c84e0a3186a2@ti.com>
Content-Language: en-US
From: Antonios Christidis <a-christidis@ti.com>
In-Reply-To: <4cb30196-5f26-4370-82d0-c84e0a3186a2@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000AD81:EE_|CO1PR10MB4612:EE_
X-MS-Office365-Filtering-Correlation-Id: ec9f5d91-a766-4456-c418-08de813f9fb7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|376014|36860700016|1800799024|20052099010|18002099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info: 
	abFKyDhRm3C64pz5PaGgvFg6wf9y91hOYdwpQdHEKEwAFfHkSCERnZHX2R4S7qynjFlUdaP522Fr0tO+323xPObiv+DGBD4p70HNBMuXCWWjrgzSKT5+ao+OgO3WFwnV4fbYc1tpjGPE00zKM3odfFaIDKRi/MANCC1ezU/6GGqr1DvjggtW6BpxkfROdpXi02DTy1gOkTuY59afz94y1snFUrBUF2ONo46hfnSPQaeFSjl25I0R9gxg9bZu+7WDEPKB1PerFnymDKK2GMCPCKOYMy7caqCH4IwBWkvhyufuJv9azv6iDFAJ8Ny8pnPYt1tntbEJm6swXpV32d+4P1DiyL+K8dhpGcWQCrazurRZzy5eU7QsSoQUS5VnKya2INkZFAa6TmPcygjRw9+DkwjeqNCWq6BWRRLqay+R2sETiea1uZO1TNkIkzy9CTFzUt0IuSPCDyf3tOJ4NtAnyzmJ9Hb7Mf793Zp1D5rQg+zhgzJK1Ok5gYFKtmXLKmyKO+nZlh5rvOOM8mrO8kbHNXYT3jYE+x4ah1JFuum5nrSvsVoy2CccH3os6mdCPQCDQgJAxln6Kzywj0/DEe8GOxTrzkPTesZXqkLfUFxbud2jzSLOBFv4j+Pj2mvjszZ8+NWG5QuzxPxqOnwy7MBtaplqooUlxuJE3WuGTmWtCw1P59qwMS+TRDb5yl4cvDYsC2mq4r238o0Bn7QcqsYbfQFqOX/HGeh5cpJ9rdxz/1yVE//z4AAnPIbfTEl4c3TWIjZipj9p1KDr5b3R9T/F9A==
X-Forefront-Antispam-Report: 
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(82310400026)(376014)(36860700016)(1800799024)(20052099010)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	/eHWzeIxPdR9sQa8xgRGuGbaasftF6DlapOaQodwlim4fYP7K5h5QT3n9nf6Gc26+uIAHse3AP7ryU2Jz9EkZqOv+hbL5wkkwfwPHPZpG/+vbf+mjrDNLSUAlg3be+imtRfbi2fxTrinOcWPK9Uze6WNshR+hnOzvCMNMEfz/IXWtYx94pG/g6kBiI1sNJDgw8ErqinsGEkNo1OiWRoRXxjf6VlbSTxELjzXa6Xfxxk4ASjvxQoggxie0HDYPMDLNjMU8y3rore88XQtslkELPLIhvz0Ft9N50Nt8XruD0ABuoGjET+Z7X5486NS++yI1z3TXeFfNV9kabP7eK6lLBz5DaVVPwfFh2T0Yzm9osnZAzDaB8lz0bxV8XoZXh951Wlje1gfEC4Xywj8CK22QyoJzxbBIdWyxKGeOyCfBJSau9B0y+0bp2HJyQrAg9dY
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Mar 2026 20:32:19.4792
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ec9f5d91-a766-4456-c418-08de813f9fb7
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CH1PEPF0000AD81.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR10MB4612
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Fri, 13 Mar 2026 20:32:31 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17341

Dear Ryan,


You're right, it should be. Just sent a v2 fixing this.


Kind Regards,
Antonios


On 3/13/26 1:32 PM, Ryan Eatmon wrote:
>
>
> This is failing to build.=C2=A0 Should this be in a dynamic layer?
>
>
>
> On 3/12/2026 8:35 PM, a-christidis@ti.com wrote:
>> From: Antonios Christidis <a-christidis@ti.com>
>>
>> Add a patch as part of the SRC. Patch includes the missing header
>> file cstdint.
>>
>> The patch is labeled as Inactive-Upstream, as Sony has stopped
>> support for the embedded client. On the meta-flutter github,
>> there are discussions on creating and maintaining a fork.
>> Nothing is concrete yet.
>>
>> Signed-off-by: Antonios Christidis <a-christidis@ti.com>
>> ---
>> =C2=A0 .../flutter/flutter-wayland-client-arago.inc=C2=A0 |=C2=A0 3 +
>> =C2=A0 .../flutter/flutter-wayland-client_%.bbappend |=C2=A0 5 +
>> =C2=A0 ...-message_codec.h-Include-cstdint-lib.patch | 94 ++++++++++++++=
+++++
>> =C2=A0 3 files changed, 102 insertions(+)
>> =C2=A0 create mode 100644=20
>> meta-arago-test/recipes-graphics/flutter/flutter-wayland-client-arago.in=
c
>> =C2=A0 create mode 100644=20
>> meta-arago-test/recipes-graphics/flutter/flutter-wayland-client_%.bbappe=
nd
>> =C2=A0 create mode 100644=20
>> meta-arago-test/recipes-graphics/flutter/flutter/0001-message_codec.h-In=
clude-cstdint-lib.patch
>>
>> diff --git=20
>> a/meta-arago-test/recipes-graphics/flutter/flutter-wayland-client-arago.=
inc=20
>> b/meta-arago-test/recipes-graphics/flutter/flutter-wayland-client-arago.=
inc=20
>>
>> new file mode 100644
>> index 00000000..ed7bd5df
>> --- /dev/null
>> +++=20
>> b/meta-arago-test/recipes-graphics/flutter/flutter-wayland-client-arago.=
inc
>> @@ -0,0 +1,3 @@
>> +FILESEXTRAPATHS:prepend :=3D "${THISDIR}/flutter:"
>> +
>> +SRC_URI:append =3D "=20
>> file://0001-message_codec.h-Include-cstdint-lib.patch"
>> diff --git=20
>> a/meta-arago-test/recipes-graphics/flutter/flutter-wayland-client_%.bbap=
pend=20
>> b/meta-arago-test/recipes-graphics/flutter/flutter-wayland-client_%.bbap=
pend=20
>>
>> new file mode 100644
>> index 00000000..58fb5497
>> --- /dev/null
>> +++=20
>> b/meta-arago-test/recipes-graphics/flutter/flutter-wayland-client_%.bbap=
pend
>> @@ -0,0 +1,5 @@
>> +FLUTTER_ARAGO =3D ""
>> +FLUTTER_ARAGO:arago =3D "flutter-wayland-client-arago.inc"
>> +
>> +require ${FLUTTER_ARAGO}
>> +
>> diff --git=20
>> a/meta-arago-test/recipes-graphics/flutter/flutter/0001-message_codec.h-=
Include-cstdint-lib.patch=20
>> b/meta-arago-test/recipes-graphics/flutter/flutter/0001-message_codec.h-=
Include-cstdint-lib.patch=20
>>
>> new file mode 100644
>> index 00000000..33edda42
>> --- /dev/null
>> +++=20
>> b/meta-arago-test/recipes-graphics/flutter/flutter/0001-message_codec.h-=
Include-cstdint-lib.patch
>> @@ -0,0 +1,94 @@
>> +From dcfcb92c7f42cd6bd92b1048b5e4ea6f01d40e21 Mon Sep 17 00:00:00 2001
>> +From: Antonios Christidis <a-christidis@ti.com>
>> +Date: Tue, 10 Mar 2026 11:01:28 -0500
>> +Subject: [PATCH] message_codec.h: Include cstdint lib
>> +
>> +Include cstdint lib within message_codec.h.
>> +
>> +Upstream-Status: Inactive-Upstream
>> +
>> +Signed-off-by: Antonios Christidis <a-christidis@ti.com>
>> +---
>> + .../client_wrapper/include/flutter/basic_message_channel.h | 1 +
>> + .../common/client_wrapper/include/flutter/binary_messenger.h | 1 +
>> + .../common/client_wrapper/include/flutter/engine_method_result.h | 1 +
>> + .../common/client_wrapper/include/flutter/message_codec.h | 1 +
>> + .../common/client_wrapper/include/flutter/method_channel.h | 1 +
>> + .../common/client_wrapper/include/flutter/method_codec.h | 1 +
>> + 6 files changed, 6 insertions(+)
>> +
>> +diff --git=20
>> a/src/flutter/shell/platform/common/client_wrapper/include/flutter/basic=
_message_channel.h=20
>> b/src/flutter/shell/platform/common/client_wrapper/include/flutter/basic=
_message_channel.h=20
>>
>> +index c081946..fcc6b23 100644
>> +---=20
>> a/src/flutter/shell/platform/common/client_wrapper/include/flutter/basic=
_message_channel.h
>> ++++=20
>> b/src/flutter/shell/platform/common/client_wrapper/include/flutter/basic=
_message_channel.h
>> +@@ -7,6 +7,7 @@
>> +
>> + #include <iostream>
>> + #include <string>
>> ++#include <cstdint>
>> +
>> + #include "binary_messenger.h"
>> + #include "message_codec.h"
>> +diff --git=20
>> a/src/flutter/shell/platform/common/client_wrapper/include/flutter/binar=
y_messenger.h=20
>> b/src/flutter/shell/platform/common/client_wrapper/include/flutter/binar=
y_messenger.h=20
>>
>> +index d552b49..82e47da 100644
>> +---=20
>> a/src/flutter/shell/platform/common/client_wrapper/include/flutter/binar=
y_messenger.h
>> ++++=20
>> b/src/flutter/shell/platform/common/client_wrapper/include/flutter/binar=
y_messenger.h
>> +@@ -7,6 +7,7 @@
>> +
>> + #include <functional>
>> + #include <string>
>> ++#include <cstdint>
>> +
>> + namespace flutter {
>> +
>> +diff --git=20
>> a/src/flutter/shell/platform/common/client_wrapper/include/flutter/engin=
e_method_result.h=20
>> b/src/flutter/shell/platform/common/client_wrapper/include/flutter/engin=
e_method_result.h=20
>>
>> +index 3cc8b6a..9634ead 100644
>> +---=20
>> a/src/flutter/shell/platform/common/client_wrapper/include/flutter/engin=
e_method_result.h
>> ++++=20
>> b/src/flutter/shell/platform/common/client_wrapper/include/flutter/engin=
e_method_result.h
>> +@@ -8,6 +8,7 @@
>> + #include <memory>
>> + #include <string>
>> + #include <vector>
>> ++#include <cstdint>
>> +
>> + #include "binary_messenger.h"
>> + #include "method_codec.h"
>> +diff --git=20
>> a/src/flutter/shell/platform/common/client_wrapper/include/flutter/messa=
ge_codec.h=20
>> b/src/flutter/shell/platform/common/client_wrapper/include/flutter/messa=
ge_codec.h=20
>>
>> +index c84d25f..c007b1e 100644
>> +---=20
>> a/src/flutter/shell/platform/common/client_wrapper/include/flutter/messa=
ge_codec.h
>> ++++=20
>> b/src/flutter/shell/platform/common/client_wrapper/include/flutter/messa=
ge_codec.h
>> +@@ -8,6 +8,7 @@
>> + #include <memory>
>> + #include <string>
>> + #include <vector>
>> ++#include <cstdint>
>> +
>> + namespace flutter {
>> +
>> +diff --git=20
>> a/src/flutter/shell/platform/common/client_wrapper/include/flutter/metho=
d_channel.h=20
>> b/src/flutter/shell/platform/common/client_wrapper/include/flutter/metho=
d_channel.h=20
>>
>> +index 6e39a64..34687a6 100644
>> +---=20
>> a/src/flutter/shell/platform/common/client_wrapper/include/flutter/metho=
d_channel.h
>> ++++=20
>> b/src/flutter/shell/platform/common/client_wrapper/include/flutter/metho=
d_channel.h
>> +@@ -7,6 +7,7 @@
>> +
>> + #include <iostream>
>> + #include <string>
>> ++#include <cstdint>
>> +
>> + #include "binary_messenger.h"
>> + #include "engine_method_result.h"
>> +diff --git=20
>> a/src/flutter/shell/platform/common/client_wrapper/include/flutter/metho=
d_codec.h=20
>> b/src/flutter/shell/platform/common/client_wrapper/include/flutter/metho=
d_codec.h=20
>>
>> +index b40fa64..edd14d6 100644
>> +---=20
>> a/src/flutter/shell/platform/common/client_wrapper/include/flutter/metho=
d_codec.h
>> ++++=20
>> b/src/flutter/shell/platform/common/client_wrapper/include/flutter/metho=
d_codec.h
>> +@@ -8,6 +8,7 @@
>> + #include <memory>
>> + #include <string>
>> + #include <vector>
>> ++#include <cstdint>
>> +
>> + #include "method_call.h"
>> + #include "method_result.h"
>> +--
>> +2.34.1
>> +
>

