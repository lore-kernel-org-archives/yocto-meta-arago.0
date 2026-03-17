Return-Path: <a-christidis@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5070EFD707A
	for <webhook@archiver.kernel.org>; Tue, 17 Mar 2026 20:02:03 +0000 (UTC)
Received: from BYAPR05CU005.outbound.protection.outlook.com (BYAPR05CU005.outbound.protection.outlook.com [52.101.85.43])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.85751.1773777715763411190
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 17 Mar 2026 13:01:56 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=OR8Rytnx;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 52.101.85.43, mailfrom: a-christidis@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OY6wAP0G1JRi18IiGcoIvQHrhhO72bQr6QgTW4OghoWOTvuaaMgjrmMza17Kwdk2/DTSNxdGk3op7Yy5hpQ9h9OqKrkio9cvIBWv/2UdYZU0QAxfz15hII3vhhuJrnNUTcNZqHkP1x1TbRJGqGYAtXHKeQOajvK1vu2IXTHubOWKLgmT9TmsF/IRwvQuyCWqfKwd4ClqR1h6VZA0DX8zCRqDGjcyIGtZuLo7iTqhhiwMPc3LuFUAWVzGRgJbUfxQxay3LU2mFqwwzdMLessZYO98zK24yZgP88SdjolZku1pJjemQN/Z95ye+1j2KD+TIqueg0aTKp2F+wSXbSxjVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ivEBPxOcgk2iB1vLOlBLleGId9FsMlMuC78RVsSz5nY=;
 b=hZeEZZ37DHAPfPXvNYUTcFfemsJz0WaO6RiRzN73qXqp/FVSSW+F/OuAVmm20UgpPL7nTud/opQXgZwhEzmHZ6Z20FZ0yKweco+Ub+Dj+ulxbijnEnEHIhpY2Yf401/N+BHgNuWTz5vuP9boKBeuTtqyaupZ1d4losOq/zixp2W9syzpkkkdqPyVDqXt++ae8zCvu7NkpCDUBFZ7Tfq8MZYpjWFlYChKO7hmPbXQ8ZxvMSsbze4fZlb+iNmpXAkpVc6Gi61OqUGkDgB17hB1tjQHSh9MMVuth5je9xtrNllsLJwyRoG1sK8dKEQRqauZRlW94qiaKU/7lsWPzAJHMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ivEBPxOcgk2iB1vLOlBLleGId9FsMlMuC78RVsSz5nY=;
 b=OR8Rytnx9LioEA0JaXaCEbcUhBG/Pzn2rowg7+wgct5RE4X1XYELcs+VRutbkfqH3aB6EyoVtJodkZEvYbNUUzIqMyC4QQcNksrtYINLteHQoj5uTP0xcv1GkCda2wMPmJuSWFWPF2LGEvgp9rAEzgj9ti52jLnDmLeYFMEL3+A=
Received: from SJ0PR05CA0027.namprd05.prod.outlook.com (2603:10b6:a03:33b::32)
 by LV3PR10MB7747.namprd10.prod.outlook.com (2603:10b6:408:1b0::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.27; Tue, 17 Mar
 2026 20:01:52 +0000
Received: from SJ1PEPF00002313.namprd03.prod.outlook.com
 (2603:10b6:a03:33b:cafe::4f) by SJ0PR05CA0027.outlook.office365.com
 (2603:10b6:a03:33b::32) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9723.19 via Frontend Transport; Tue,
 17 Mar 2026 20:01:52 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 SJ1PEPF00002313.mail.protection.outlook.com (10.167.242.167) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9700.17 via Frontend Transport; Tue, 17 Mar 2026 20:01:51 +0000
Received: from DLEE211.ent.ti.com (157.170.170.113) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 17 Mar
 2026 15:01:23 -0500
Received: from DLEE203.ent.ti.com (157.170.170.78) by DLEE211.ent.ti.com
 (157.170.170.113) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 17 Mar
 2026 15:01:23 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE203.ent.ti.com
 (157.170.170.78) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Tue, 17 Mar 2026 15:01:23 -0500
Received: from [128.247.81.216] (antonios-thinkstation-p3-tower.dhcp.ti.com [128.247.81.216])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 62HK1Mtm3762128;
	Tue, 17 Mar 2026 15:01:22 -0500
Message-ID: <d3cb5d89-1668-4d7b-bb4a-b662152a7fb8@ti.com>
Date: Tue, 17 Mar 2026 15:01:22 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-arago][master][PATCH] chromium: Add a patch to fix build
 against GLIBC 2.43
To: Ryan Eatmon <reatmon@ti.com>, <t-lannynd@ti.com>,
	<meta-arago@lists.yoctoproject.org>
CC: <detheridge@ti.com>, <b-brnich@ti.com>
References: <20260317193808.343457-1-t-lannynd@ti.com>
 <3b8eb759-eeb0-4113-9873-504ecbca0db1@ti.com>
Content-Language: en-US
From: Antonios Christidis <a-christidis@ti.com>
In-Reply-To: <3b8eb759-eeb0-4113-9873-504ecbca0db1@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00002313:EE_|LV3PR10MB7747:EE_
X-MS-Office365-Filtering-Correlation-Id: 7057bb8c-124e-45a3-0e46-08de846007d2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|1800799024|82310400026|4022899009|36860700016|13003099007|18002099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info: 
	5OeTxZmvY7YB0bTxtiQWryi+WKqx6Yu12204vBwg7KU14difx6KHoahO0pufYgE34MhPDOUMeD2VkQ9+btq4DFbQMfnCwxrHQ5WDeu/kTvfsqZFVGFNpcq6GEuo/XSUvPhlyd6jciXftuIp3fhX86hb9ZDcLS9OnHVS4AxnH28RwpV1zTDfbmXyqx8UDdoSnEzBdbqZqpW/iBjwfuQfSYZeJiX08KwAXBd5AHABqvRsbsmMi9p8inxGvs8y0NeV4K9CdKiA6Qg0IWdRMsJTDeHIn1q2+zg5ZbuwkaMdeaoWXHg8sOXjl90YUz0zXHOGXfWJODpKnHnq6zyOb8xMO9CiA/qbkZ21SS7rUk6711EMY6JLfRV1F7tL1/lFA+k00oqbXw/KZvelUG02IUcXMglmzklcJevj2Jsel1cvCS8U8Eq5Mvpu6ltBHaBvWqfme9oqf4bWHK+MnpVp6vOXKZDE/zsEzavW5bzxeoWv569fhINrZggle0dc2nb/qN42inWlPDyBYYPLES9sri09nENKglRhlbKM/UiMrhASssMt98G0QqY2aLU390CzrxeXRo+j2wC20H3AZCexiUx2MUJBg8THOiqtF5kAwHfCzWB1b5mKbesKF3xbvPEgGrFsvpHoFFnuvtUwFL1lAbFyDSTpTnkWA3Wreu7FdFOzzbsP9TLrrfFcB1QhR4Wrkix0uOo0/K+1/IAzzjVr+3KjlnlrRkOKRsIklkKxaZ3IRyGs=
X-Forefront-Antispam-Report: 
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(82310400026)(4022899009)(36860700016)(13003099007)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	m6Xce4R9MF7lGYmb0Nr+d9C+UvbzxlXvV5fnbCyIe6cfw2CExKgMglGGYLa3P0NYx0JpL/UjrbP989a59sV3Fqo5jv14xycs0QWvD4fW+YJvQkSglg1s8YQCpH5LTzBbDJA5PWxpJ+V0XZ91MCn9KGL98B40/R0TQhcmabzD2bbIpefgvPhnxRbJQA4Owb16+xWYrKRGX1X7RrEJ8qs7gONEhFY4wUA/54kv31ti8lQbXvI7Jaj9Hfam9pAYwVTlQSnyKGXZYbyXhQe6eK4EuF0+AMv8ZhWbl1Dq3KRTNUYCxbbmHb4PAtowvKmWTpWjglfx/Iru3QmaH5H+dv6MmECIlbhEHPFcA9YAVDaW/bsiORVbHaIlfBqYF5YyLDJpJH4mK+TT+ku1rulF+2jmlT1kb95y3EArMgd7FUVWJEFc4IJSGW+uZWKWuVS4KdRr
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Mar 2026 20:01:51.4899
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7057bb8c-124e-45a3-0e46-08de846007d2
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SJ1PEPF00002313.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR10MB7747
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 17 Mar 2026 20:02:03 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17378


On 3/17/26 2:56 PM, Ryan Eatmon wrote:
>
>
> On 3/17/2026 2:38 PM, Thorsten Lannynd via lists.yoctoproject.org wrote:
>> An update to oe-core leads to build failures with Chromium v142. This=20
>> fix
>> is currently pending in meta-browser but is needed to get Chromium to=20
>> build
>> succesfully.
>>
>> https://github.com/OSSystems/meta-browser/pull/962/changes/4e450497be557=
fc4b5ff1397f78fa0f8381e281d=20
>>
>>
>> Signed-off-by: Thorsten Lannynd <t-lannynd@ti.com>
>> ---
>> =C2=A0 .../fix-SYS_SECCOMP-redefinition.patch=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 16 ++++++++++++++++
>> =C2=A0 .../chromium/chromium-ozone-wayland-arago.inc=C2=A0=C2=A0=C2=A0 |=
=C2=A0 1 +
>> =C2=A0 2 files changed, 17 insertions(+)
>> =C2=A0 create mode 100644=20
>> meta-arago-distro/dynamic-layers/chromium-browser-layer/recipes-browser/=
chromium/chromium-ozone-wayland-142.0.7444.175/fix-SYS_SECCOMP-redefinition=
.patch
>>
>> diff --git=20
>> a/meta-arago-distro/dynamic-layers/chromium-browser-layer/recipes-browse=
r/chromium/chromium-ozone-wayland-142.0.7444.175/fix-SYS_SECCOMP-redefiniti=
on.patch=20
>> b/meta-arago-distro/dynamic-layers/chromium-browser-layer/recipes-browse=
r/chromium/chromium-ozone-wayland-142.0.7444.175/fix-SYS_SECCOMP-redefiniti=
on.patch=20
>>
>> new file mode 100644
>> index 00000000..594729b3
>> --- /dev/null
>> +++=20
>> b/meta-arago-distro/dynamic-layers/chromium-browser-layer/recipes-browse=
r/chromium/chromium-ozone-wayland-142.0.7444.175/fix-SYS_SECCOMP-redefiniti=
on.patch
>> @@ -0,0 +1,16 @@
>> +Taken from:
>> +https://aur.archlinux.org/cgit/aur.git/tree/0007-qt5-webengine-glibc-2.=
43-SYS_SECCOMP-as-enum@chromium.patch?h=3Dqt5-webengine=20
>>
>> +
>> +Upstream-Status: Inappropriate [glibc 2.43 fix]
>
> I would argue that this is not "Inappropriate" as this is not an OE=20
> specific kind of change.=C2=A0 This should either be a Backport of a patc=
h=20
> that is pending on meta-browser, or Pending if you have submitted this=20
> patch to the chromium project itself.
>
Could this be "Submitted [link]", link pointing to=20
https://github.com/OSSystems/meta-browser/pull/962/changes/4e450497be557fc4=
b5ff1397f78fa0f8381e281d=20
?

>
>> +diff --git a/sandbox/linux/system_headers/linux_seccomp.h=20
>> b/sandbox/linux/system_headers/linux_seccomp.h
>> +index 8690a96eb0..8988836508 100644
>> +--- a/sandbox/linux/system_headers/linux_seccomp.h
>> ++++ b/sandbox/linux/system_headers/linux_seccomp.h
>> +@@ -6,6 +6,7 @@
>> + #define SANDBOX_LINUX_SYSTEM_HEADERS_LINUX_SECCOMP_H_
>> +
>> + #include <stdint.h>
>> ++#include <signal.h>
>> + #include <sys/ioctl.h>
>> +
>> + #include "build/build_config.h"
>> diff --git=20
>> a/meta-arago-distro/dynamic-layers/chromium-browser-layer/recipes-browse=
r/chromium/chromium-ozone-wayland-arago.inc=20
>> b/meta-arago-distro/dynamic-layers/chromium-browser-layer/recipes-browse=
r/chromium/chromium-ozone-wayland-arago.inc=20
>>
>> index 5b0f2703..3ec0610a 100644
>> ---=20
>> a/meta-arago-distro/dynamic-layers/chromium-browser-layer/recipes-browse=
r/chromium/chromium-ozone-wayland-arago.inc
>> +++=20
>> b/meta-arago-distro/dynamic-layers/chromium-browser-layer/recipes-browse=
r/chromium/chromium-ozone-wayland-arago.inc
>> @@ -9,6 +9,7 @@ SRC_URI:append =3D " \
>> file://0002-chromium-gpu-sandbox-Allow-GPU-sandbox-access-to-V4L.patch \
>> file://0003-chromium-gpu-v4l2-Fix-OUTPUT-queue-streaming-in-V4L2.patch \
>> file://0004-media-gpu-v4l2-Avoid-placing-incomplete-H264-access-.patch \
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 file://fix-SYS_SECCOMP-redefinition.patch=
 \
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "
>> =C2=A0 =C2=A0 # Override do_copy_clang_library to handle both target and=
 host=20
>> architectures
>>
>>
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#17372):=20
>> https://lists.yoctoproject.org/g/meta-arago/message/17372
>> Mute This Topic: https://lists.yoctoproject.org/mt/118371153/6551054
>> Group Owner: meta-arago+owner@lists.yoctoproject.org
>> Unsubscribe: https://lists.yoctoproject.org/g/meta-arago/unsub=20
>> [reatmon@ti.com]
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>
>>
>

