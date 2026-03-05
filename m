Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A90C3F513E7
	for <webhook@archiver.kernel.org>; Thu,  5 Mar 2026 22:40:53 +0000 (UTC)
Received: from CH5PR02CU005.outbound.protection.outlook.com (CH5PR02CU005.outbound.protection.outlook.com [40.107.200.63])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.56858.1772750445803043819
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 05 Mar 2026 14:40:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=selector1 header.b=aL34tv0l;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 40.107.200.63, mailfrom: reatmon@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sg6YxwB/ZVFOce9PdjBBDe6IutlYGf3lfrZ/a9fxjUVd6n8SB8Oq9bOd0n08aOQ9RBS0WhihAx+GKwOssZWdKIoVMHbhIOFC8aDyDZqUq+6Sd5+yIDoSXA9THNBLbjsa/jJhrSPUCXuRYK3OQNWwkZo4ui9vUZnwEKADr3XN2kSedVbg9NeBgQj0cLxtX3bOBzDsf20GfF9byJE0nsnF8ipaROU22uwKleBeGBysMELWgfLmdY9ldfjY0bNYjalQwPws55NJdjrAzj1tsm2lf9jDDRPhbXwG7roIKm8GWW7Ln35D5MWyjr/3XbBoOHg5Ls8fzU3SxqUMdPzXlTP/mg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nZZgNjlr/YyegikgJozs2E06CF73PqnpxfWSxmuf7f8=;
 b=HfgWie76zC9PVX+BqZAKMyJ3tsKycY7kg1HSqhvBYb1XO7EOJSibS2HhbUsNRLg+6dL+27WxWJVbJ3Dubr+2/UhoP74MZsuWHSrsdPKhk2136UuKQ3cGKso9c8fmS9rLqsA9t8BpyjSiVGKIkTB0lpJVgUQCwrOe0AhirOy8tNdYcF+I5Lwbya/oukUMPg4v8YAp2hb2jzrBYJbyhf4U2L2WyHMwkVVjrw42Qjm2kpgMbzbqiM24uvRAE4elL/OPRZV9IL6ePo/SjB0NyRo4AUeCSejKUTRF5Fqlv04TMkMT6ngfqlXzGJHgpWcHp6bSDq3T0NN0qC2GdlR9pQxZ8A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nZZgNjlr/YyegikgJozs2E06CF73PqnpxfWSxmuf7f8=;
 b=aL34tv0lkOOonzYkzgjQ0QHyVlVe7V8/PlCWOW99YI228tDBSmjPkrx1ygfW1C+4mzbV9v0LdNi0cZstrHbbHWkgsArVx7AbC/PRhZF7QDicJh3nGetzkkU/PXx0aZaDbB9dvCO9ApRPeyfjn9lKqVEPYE2AAJS0cyEaa0UIwuQ=
Received: from PH8P222CA0012.NAMP222.PROD.OUTLOOK.COM (2603:10b6:510:2d7::25)
 by DS7PR10MB7346.namprd10.prod.outlook.com (2603:10b6:8:eb::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.17; Thu, 5 Mar
 2026 22:40:39 +0000
Received: from CY4PEPF0000E9D8.namprd05.prod.outlook.com
 (2603:10b6:510:2d7:cafe::bf) by PH8P222CA0012.outlook.office365.com
 (2603:10b6:510:2d7::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9654.22 via Frontend Transport; Thu,
 5 Mar 2026 22:40:39 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 CY4PEPF0000E9D8.mail.protection.outlook.com (10.167.241.71) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9678.18 via Frontend Transport; Thu, 5 Mar 2026 22:40:38 +0000
Received: from DLEE201.ent.ti.com (157.170.170.76) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 5 Mar
 2026 16:40:38 -0600
Received: from DLEE207.ent.ti.com (157.170.170.95) by DLEE201.ent.ti.com
 (157.170.170.76) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 5 Mar
 2026 16:40:38 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE207.ent.ti.com
 (157.170.170.95) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Thu, 5 Mar 2026 16:40:38 -0600
Received: from [10.249.65.90] ([10.249.65.90])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 625MecIL3154191;
	Thu, 5 Mar 2026 16:40:38 -0600
Message-ID: <27c4440c-1ead-41ba-9a44-bde221ef1848@ti.com>
Date: Thu, 5 Mar 2026 16:40:38 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-arago][master][PATCH] emptty: add version 0.15.0
To: Denys Dmytriyenko <denis@denix.org>, <a-christidis@ti.com>
CC: <denys@konsulko.com>, <meta-arago@lists.yoctoproject.org>
References: <20260305205455.267385-1-a-christidis@ti.com>
 <20260305211438.GN11121@denix.org>
Content-Language: en-US
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <20260305211438.GN11121@denix.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000E9D8:EE_|DS7PR10MB7346:EE_
X-MS-Office365-Filtering-Correlation-Id: fd8171df-03ed-443e-e2db-08de7b0839ad
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|34020700016|36860700016|82310400026|376014|13003099007|7142099003;
X-Microsoft-Antispam-Message-Info: 
	AMoWRM27YywsiI3WO+6FdG1JjSv+Nr9dXNr5g1vd4wZxS+C5b299fEhX/uiDLnXlBNw0Q6M6Fz0dxbdDfv+yPEOMPIRAeUgrKkj+h99BjURm6l5Z/6nBNhUJTc9DBU5cei4v3+cZnU4vsR3dhLp+KuJTqkFNrKVfCoCNq5x8sRAoBE0t9ulE8+FFMDi04bGI4rer9RT0jbZLjDc278yyh7PQ4wOZBrC0v0REeg1SpujeRSoYiFiF3X0YsPztVQ6ms6U359oWeqYO1Q7Uf60vUyzFmPdWj+3qrNGW5Xeb//qcCGl0g6iHMAH78V5xyflOfE/JZxMFAJdSYrmZ44rS4LCnkxQ9w21PkLJrUcpgOJBNmC/r9r1NPeQKWXJWe9wUSknH+QSXEXDMtl46p3XUAP1tRuCjDT/iNI/7+x/BzzQAkblh9TfcatiwyZkoB6/Wq6wESBtu3TQSL/cjDSyGRaBpb8jlRp/csLIP5cpCKAptcXFZO0XM4VXX7uROCaTbtDQyiqet5l8rUmlhg87v6sD9BBoLI7mvAnZvaw1ro1fDv63KXhFMXWXOOnmZGamEYI/bbl27G3+DcgLMrUwoobRRXQxY93hr9mxHnCIMcxrTJft7kl4mCN0fmj2aTZNV8SDdlwTd+0o97+7KNaMOiDH9x6chGDoDWZdgocx93iw3ellkIPh/+qEjGP273T3hrXWpmJB9Je9mfEfZSLDKF2WUlxL3wtMCBHExgM9bkC4=
X-Forefront-Antispam-Report: 
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(34020700016)(36860700016)(82310400026)(376014)(13003099007)(7142099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	nDwlQoyhaDSk4Mj7aMTcVWKQrWzu+JJCO5jE4KQm+QgksSxF+RcWzrsreC61LCz6NjZuU4m8hYueVfxJAwkEilOOdliQxzEoVcJQ/wpXXrnSlDxARN/xGyh2PJwLWqawkOtL50MRMls0xiKoagSy7JFfROvHPCvFkst4UJhvJ9X53e3qZtLtGq3e58ILr9AOiP6jFyzslZMysncTLVDJp9IVdet6GrXfBrZKV0QlUwcAKSP7ZcJjJ3bFsui7DbucFZzUE3AtS6SocDiyEQTngiexCpIlDpyTmZV/Vn6bXo8ZuY8NoEGmo+au4wywBqQbMw5T0Hw9PHdj8tAtxc1c7ihsv67F+Kcz8k9BwbiR0+4QVAi4fmmomMKX2BuDR949ZQjLewlzLkk0w9VXEGnvJM3jZO8KLKc9z4+ql50UkjyYOMVDiCzsCxztFVaIKRxj
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Mar 2026 22:40:38.9968
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fd8171df-03ed-443e-e2db-08de7b0839ad
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CY4PEPF0000E9D8.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR10MB7346
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Thu, 05 Mar 2026 22:40:53 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17272



On 3/5/2026 3:14 PM, Denys Dmytriyenko wrote:
> How is it different from Randolph's continued efforts to push it to OE-Core
> for many months?
> 

It's not.  We just need it for our testing and they are still reviewing 
it in the patch review meetings.  So this is hopefully temporary.


> On Thu, Mar 05, 2026 at 02:54:55PM -0600, Antonios Christidis via lists.yoctoproject.org wrote:
>> From: Antonios Christidis <a-christidis@ti.com>
>>
>> Add emptty, a "Dead simple CLI Display Manager on TTY". This is a
>> relatively lightweight display manager that supports x11 as well as
>> wayland through both a CLI and an automatic login mechanism.
>>
>> This can effectively replace the custom init scripts for both x11
>> (xserver-nodm-init) and wayland (weston-init) with a single tool with
>> more verbose logging capabilities.
>>
>> This is split into two recipes. The emptty package provides the binary
>> and various agnostic configs while the emptty-conf package provides the
>> default configuration for the application itself. This RPROVIDES
>> virtual-emptty-conf, allowing other recipes to provide their own
>> configurations to override the default behavior.
>>
>> Signed-off-by: Antonios Christidis <a-christidis@ti.com>
>> ---
>>   0001-emptty-add-version-0.15.0.patch          | 522 ++++++++++++++++++
>>   .../classes/tisdk-bundle.bbclass              |  14 +-
>>   meta-arago-distro/conf/distro/arago.conf      |   2 +
>>   .../recipes-graphics/emptty/emptty-conf.bb    |  14 +
>>   .../recipes-graphics/emptty/emptty.inc        |  27 +
>>   .../recipes-graphics/emptty/emptty/pamconf    |  11 +
>>   .../recipes-graphics/emptty/emptty_0.15.0.bb  |  57 ++
>>   .../wayland/weston-init-arago.bb              |  72 +++
>>   .../weston-init-arago/beaglebone/weston.ini   |  85 +++
>>   .../wayland/weston-init-arago/emptty.conf     |  77 +++
>>   .../weston-launch-calibrator.sh               |  13 +
>>   .../wayland/weston-init-arago/weston.ini      |  21 +
>>   12 files changed, 914 insertions(+), 1 deletion(-)
>>   create mode 100644 0001-emptty-add-version-0.15.0.patch
>>   create mode 100644 meta-arago-distro/recipes-graphics/emptty/emptty-conf.bb
>>   create mode 100644 meta-arago-distro/recipes-graphics/emptty/emptty.inc
>>   create mode 100644 meta-arago-distro/recipes-graphics/emptty/emptty/pamconf
>>   create mode 100644 meta-arago-distro/recipes-graphics/emptty/emptty_0.15.0.bb
>>   create mode 100644 meta-arago-distro/recipes-graphics/wayland/weston-init-arago.bb
>>   create mode 100644 meta-arago-distro/recipes-graphics/wayland/weston-init-arago/beaglebone/weston.ini
>>   create mode 100644 meta-arago-distro/recipes-graphics/wayland/weston-init-arago/emptty.conf
>>   create mode 100644 meta-arago-distro/recipes-graphics/wayland/weston-init-arago/weston-launch-calibrator.sh
>>   create mode 100644 meta-arago-distro/recipes-graphics/wayland/weston-init-arago/weston.ini
>>
>> diff --git a/0001-emptty-add-version-0.15.0.patch b/0001-emptty-add-version-0.15.0.patch
>> new file mode 100644
>> index 00000000..dba3013d
>> --- /dev/null
>> +++ b/0001-emptty-add-version-0.15.0.patch
>> @@ -0,0 +1,522 @@
>> +From d41ec048882b955124d7dbeee1c2bf1351a0aba4 Mon Sep 17 00:00:00 2001
>> +From: Antonios Christidis <a-christidis@ti.com>
>> +Date: Thu, 5 Mar 2026 13:12:08 -0600
>> +Subject: [PATCH] emptty: add version 0.15.0
>> +
>> +Add emptty, a "Dead simple CLI Display Manager on TTY". This is a
>> +relatively lightweight display manager that supports x11 as well as
>> +wayland through both a CLI and an automatic login mechanism.
>> +
>> +This can effectively replace the custom init scripts for both x11
>> +(xserver-nodm-init) and wayland (weston-init) with a single tool with
>> +more verbose logging capabilities.
>> +
>> +This is split into two recipes. The emptty package provides the binary
>> +and various agnostic configs while the emptty-conf package provides the
>> +default configuration for the application itself. This RPROVIDES
>> +virtual-emptty-conf, allowing other recipes to provide their own
>> +configurations to override the default behavior.
>> +
>> +Signed-off-by: Antonios Christidis <a-christidis@ti.com>
>> +---
>> + .../classes/tisdk-bundle.bbclass              | 14 ++-
>> + meta-arago-distro/conf/distro/arago.conf      |  2 +
>> + .../recipes-graphics/emptty/emptty-conf.bb    | 14 +++
>> + .../recipes-graphics/emptty/emptty.inc        | 27 ++++++
>> + .../recipes-graphics/emptty/emptty/pamconf    | 11 +++
>> + .../recipes-graphics/emptty/emptty_0.15.0.bb  | 57 +++++++++++++
>> + .../wayland/weston-init-arago.bb              | 72 ++++++++++++++++
>> + .../weston-init-arago/beaglebone/weston.ini   | 85 +++++++++++++++++++
>> + .../wayland/weston-init-arago/emptty.conf     | 77 +++++++++++++++++
>> + .../weston-launch-calibrator.sh               | 13 +++
>> + .../wayland/weston-init-arago/weston.ini      | 21 +++++
>> + 11 files changed, 392 insertions(+), 1 deletion(-)
>> + create mode 100644 meta-arago-distro/recipes-graphics/emptty/emptty-conf.bb
>> + create mode 100644 meta-arago-distro/recipes-graphics/emptty/emptty.inc
>> + create mode 100644 meta-arago-distro/recipes-graphics/emptty/emptty/pamconf
>> + create mode 100644 meta-arago-distro/recipes-graphics/emptty/emptty_0.15.0.bb
>> + create mode 100644 meta-arago-distro/recipes-graphics/wayland/weston-init-arago.bb
>> + create mode 100644 meta-arago-distro/recipes-graphics/wayland/weston-init-arago/beaglebone/weston.ini
>> + create mode 100644 meta-arago-distro/recipes-graphics/wayland/weston-init-arago/emptty.conf
>> + create mode 100644 meta-arago-distro/recipes-graphics/wayland/weston-init-arago/weston-launch-calibrator.sh
>> + create mode 100644 meta-arago-distro/recipes-graphics/wayland/weston-init-arago/weston.ini
>> +
>> +diff --git a/meta-arago-distro/classes/tisdk-bundle.bbclass b/meta-arago-distro/classes/tisdk-bundle.bbclass
>> +index cc5d1481..24146529 100644
>> +--- a/meta-arago-distro/classes/tisdk-bundle.bbclass
>> ++++ b/meta-arago-distro/classes/tisdk-bundle.bbclass
>> +@@ -106,7 +106,7 @@ cleanup_host_packages() {
>> + }
>> +
>> + ROOTFS_PREPROCESS_COMMAND += "tisdk_image_setup; "
>> +-ROOTFS_POSTPROCESS_COMMAND += "tisdk_image_build; "
>> ++ROOTFS_POSTPROCESS_COMMAND += "tisdk_image_build; add_emptty_inittab; "
>> + IMAGE_PREPROCESS_COMMAND:append = "tisdk_image_cleanup; "
>> +
>> + # Create the SDK image.  We will re-use the rootfs_ipk_do_rootfs functionality
>> +@@ -304,6 +304,18 @@ tisdk_image_build () {
>> +     cp ${WORKDIR}/opkg.conf ${IMAGE_ROOTFS}/etc/
>> + }
>> +
>> ++
>> ++add_emptty_inittab() {
>> ++    [ -f ${IMAGE_ROOTFS}${sysconfdir}/inittab ] || return 0
>> ++
>> ++    if ${@bb.utils.contains_any("IMAGE_FEATURES", [ "x11-base", "weston" ], "true", "false", d)}
>> ++    then
>> ++	echo "7:5:respawn:${bindir}/emptty -t 7 -d" >> ${IMAGE_ROOTFS}${sysconfdir}/inittab
>> ++    fi
>> ++}
>> ++
>> ++
>> ++
>> + TISDK_IMAGE_CLEANUP_DIRS ?= "var etc lib boot dev home media mnt proc run sbin sys tmp usr"
>> + TISDK_IMAGE_CLEANUP_FILES ?= "bin/bash bin/bash.bash bin/sh"
>> +
>> +diff --git a/meta-arago-distro/conf/distro/arago.conf b/meta-arago-distro/conf/distro/arago.conf
>> +index fb5c703f..43d4db53 100644
>> +--- a/meta-arago-distro/conf/distro/arago.conf
>> ++++ b/meta-arago-distro/conf/distro/arago.conf
>> +@@ -68,6 +68,8 @@ PACKAGECONFIG:pn-glmark2 = "drm-gles2 wayland-gles2"
>> +
>> + # Set this to empty string to prevent xwayland config from being added
>> + PACKAGECONFIG:pn-weston-init = ""
>> ++PREFERRED_RPROVIDER_virtual-emptty-conf = "weston-init-arago"
>> ++PREFERRED_RPROVIDER_weston-init = "weston-init-arago"
>> +
>> + # Enable testing for opencl and vulkan with piglit
>> + PACKAGECONFIG:append:pn-piglit = " \
>> +diff --git a/meta-arago-distro/recipes-graphics/emptty/emptty-conf.bb b/meta-arago-distro/recipes-graphics/emptty/emptty-conf.bb
>> +new file mode 100644
>> +index 00000000..0b98e2e1
>> +--- /dev/null
>> ++++ b/meta-arago-distro/recipes-graphics/emptty/emptty-conf.bb
>> +@@ -0,0 +1,14 @@
>> ++require emptty.inc
>> ++
>> ++SUMMARY += " (Default config)"
>> ++
>> ++do_configure[noexec] = "1"
>> ++do_compile[noexec] = "1"
>> ++
>> ++do_install () {
>> ++    oe_runmake -C ${S}/src/${GO_IMPORT} DESTDIR=${D} install-config
>> ++}
>> ++
>> ++FILES:${PN} = "${sysconfdir}/emptty/conf"
>> ++CONFFILES:${PN} = "${sysconfdir}/emptty/conf"
>> ++RPROVIDES:${PN} += "virtual-emptty-conf"
>> +diff --git a/meta-arago-distro/recipes-graphics/emptty/emptty.inc b/meta-arago-distro/recipes-graphics/emptty/emptty.inc
>> +new file mode 100644
>> +index 00000000..d99c4d8c
>> +--- /dev/null
>> ++++ b/meta-arago-distro/recipes-graphics/emptty/emptty.inc
>> +@@ -0,0 +1,27 @@
>> ++SUMMARY = "Dead simple CLI Display Manager on TTY"
>> ++DESCRIPTION = "Emptty is a simple display manager with a command line greeter \
>> ++It supports both X11 and Wayland sessions, exporting required variables and \
>> ++creating user paths as necessary."
>> ++
>> ++HOMEPAGE = "https://github.com/tvrzna/emptty"
>> ++BUGTRACKER = "https://github.com/tvrzna/emptty/issues"
>> ++LICENSE = "MIT"
>> ++LIC_FILES_CHKSUM = "file://src/${GO_IMPORT}/LICENSE;md5=d1e4d12c7d1d17367ba5668706a405ba"
>> ++
>> ++S = "${UNPACKDIR}"
>> ++
>> ++FILESEXTRAPATHS:append = ":${THISDIR}/emptty"
>> ++
>> ++GO_IMPORT = "github.com/tvrzna/emptty"
>> ++GO_IMPORT_pam = "github.com/msteinert/pam"
>> ++SRC_URI = "\
>> ++    git://${GO_IMPORT}.git;protocol=https;branch=master;destsuffix=src/${GO_IMPORT} \
>> ++    git://${GO_IMPORT_pam}.git;protocol=https;branch=master;name=pam;destsuffix=src/${GO_IMPORT_pam} \
>> ++    file://pamconf \
>> ++    "
>> ++SRCREV = "bb203ad0a224731a7a2ff50deeb342ab79c4af09"
>> ++SRCREV_pam = "50ded1b0e7864b9bf75005eb945a8ec826bcf69d"
>> ++
>> ++SRCREV_FORMAT .= "_pam"
>> ++
>> ++PR = "r1"
>> +diff --git a/meta-arago-distro/recipes-graphics/emptty/emptty/pamconf b/meta-arago-distro/recipes-graphics/emptty/emptty/pamconf
>> +new file mode 100644
>> +index 00000000..5c82d46b
>> +--- /dev/null
>> ++++ b/meta-arago-distro/recipes-graphics/emptty/emptty/pamconf
>> +@@ -0,0 +1,11 @@
>> ++#%PAM-1.0
>> ++auth            sufficient      pam_succeed_if.so user ingroup nopasswdlogin
>> ++auth            include         common-auth
>> ++-auth           optional        pam_gnome_keyring.so
>> ++-auth           optional        pam_kwallet5.so
>> ++account         include         common-account
>> ++session         include         common-session
>> ++-session        optional        pam_gnome_keyring.so auto_start
>> ++-session        optional        pam_kwallet5.so auto_start force_run
>> ++password        include         common-password
>> ++
>> +diff --git a/meta-arago-distro/recipes-graphics/emptty/emptty_0.15.0.bb b/meta-arago-distro/recipes-graphics/emptty/emptty_0.15.0.bb
>> +new file mode 100644
>> +index 00000000..415c5ea5
>> +--- /dev/null
>> ++++ b/meta-arago-distro/recipes-graphics/emptty/emptty_0.15.0.bb
>> +@@ -0,0 +1,57 @@
>> ++require emptty.inc
>> ++
>> ++PACKAGECONFIG ?= "${@bb.utils.filter('DISTRO_FEATURES', 'pam x11', d)}"
>> ++PACKAGECONFIG[pam] = ",,libpam,pam-plugin-succeed-if"
>> ++PACKAGECONFIG[x11] = ",,virtual/libx11,util-linux-mcookie"
>> ++
>> ++DEPENDS += "${@bb.utils.contains('PACKAGECONFIG', 'pam', '', 'virtual/crypt', d)}"
>> ++
>> ++GO_TAGS = ""
>> ++GO_TAGS:append = "${@bb.utils.contains('PACKAGECONFIG', 'pam', '', ',nopam', d)}"
>> ++GO_TAGS:append = "${@bb.utils.contains('PACKAGECONFIG', 'x11', '', ',noxlib', d)}"
>> ++
>> ++GOBUILDFLAGS:append = " -tags=${GO_TAGS}"
>> ++
>> ++export GO111MODULE = "off"
>> ++
>> ++inherit go
>> ++
>> ++DEPENDS += "gzip"
>> ++
>> ++do_install () {
>> ++    # general collateral
>> ++    install -Dm755 ${B}/${GO_BUILD_BINDIR}/emptty ${D}${bindir}/emptty
>> ++    install -d ${D}${mandir}/man1
>> ++    gzip -cn ${S}/src/${GO_IMPORT}/res/emptty.1 > ${D}${mandir}/man1/emptty.1.gz
>> ++
>> ++    # pam config
>> ++    if "${@bb.utils.contains('PACKAGECONFIG','pam','true','false',d)}"
>> ++    then
>> ++        install -Dm644 ${S}/pamconf ${D}${sysconfdir}/pam.d/emptty
>> ++    fi
>> ++
>> ++    # systemd init service
>> ++    if ${@bb.utils.contains('DISTRO_FEATURES','systemd','true','false',d)}
>> ++    then
>> ++        oe_runmake -C ${S}/src/${GO_IMPORT} DESTDIR=${D} install-systemd
>> ++    fi
>> ++}
>> ++
>> ++FILES:${PN} = "\
>> ++    ${systemd_system_unitdir}/emptty.service \
>> ++    ${bindir}/emptty \
>> ++    ${mandir}/man1/emptty.1.gz \
>> ++    ${sysconfdir}/pam.d/emptty \
>> ++"
>> ++
>> ++RDEPENDS:${PN} += "virtual-emptty-conf"
>> ++SYSTEMD_SERVICE:${PN} = "emptty.service"
>> ++
>> ++inherit systemd
>> ++
>> ++USERADD_PACKAGES = "${PN}"
>> ++GROUPADD_PARAM:${PN} = "-r nopasswdlogin"
>> ++
>> ++inherit useradd
>> ++
>> ++
>> +diff --git a/meta-arago-distro/recipes-graphics/wayland/weston-init-arago.bb b/meta-arago-distro/recipes-graphics/wayland/weston-init-arago.bb
>> +new file mode 100644
>> +index 00000000..484d25e1
>> +--- /dev/null
>> ++++ b/meta-arago-distro/recipes-graphics/wayland/weston-init-arago.bb
>> +@@ -0,0 +1,72 @@
>> ++SUMMARY = "Configuration files for the Weston Wayland compositor"
>> ++LICENSE = "MIT"
>> ++LIC_FILES_CHKSUM = "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
>> ++
>> ++PACKAGE_ARCH = "${MACHINE_ARCH}"
>> ++
>> ++SRC_URI:append = " \
>> ++    file://weston.ini \
>> ++    file://weston-launch-calibrator.sh \
>> ++    file://emptty.conf \
>> ++"
>> ++
>> ++S = "${UNPACKDIR}"
>> ++
>> ++PACKAGECONFIG ??= "${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'xwayland', '', d)}"
>> ++PACKAGECONFIG:append:qemuriscv64 = " use-pixman"
>> ++PACKAGECONFIG:append:qemuppc64 = " use-pixman"
>> ++
>> ++PACKAGECONFIG[xwayland] = ",,"
>> ++PACKAGECONFIG[no-idle-timeout] = ",,"
>> ++PACKAGECONFIG[use-pixman] = ",,"
>> ++
>> ++DEFAULTBACKEND ??= ""
>> ++DEFAULTBACKEND:qemuall ?= "drm"
>> ++
>> ++do_install() {
>> ++	install -D -p -m0644 weston.ini ${D}${sysconfdir}/xdg/weston/weston.ini
>> ++	install -D -p -m0644 emptty.conf ${D}${sysconfdir}/emptty/conf
>> ++
>> ++	if [ -n "${DEFAULTBACKEND}" ]; then
>> ++		sed -i -e "/^\[core\]/a backend=${DEFAULTBACKEND}-backend.so" ${D}${sysconfdir}/xdg/weston/weston.ini
>> ++	fi
>> ++
>> ++	if [ "${@bb.utils.contains('PACKAGECONFIG', 'xwayland', 'yes', 'no', d)}" = "yes" ]; then
>> ++		sed -i -e "/^\[core\]/a xwayland=true" ${D}${sysconfdir}/xdg/weston/weston.ini
>> ++	fi
>> ++
>> ++	if [ "${@bb.utils.contains('PACKAGECONFIG', 'no-idle-timeout', 'yes', 'no', d)}" = "yes" ]; then
>> ++		sed -i -e "/^\[core\]/a idle-time=0" ${D}${sysconfdir}/xdg/weston/weston.ini
>> ++	fi
>> ++
>> ++	if [ "${@bb.utils.contains('PACKAGECONFIG', 'use-pixman', 'yes', 'no', d)}" = "yes" ]; then
>> ++		sed -i -e "/^\[core\]/a use-pixman=true" ${D}${sysconfdir}/xdg/weston/weston.ini
>> ++	fi
>> ++
>> ++	install -dm 755 -o weston -g weston ${D}/home/weston
>> ++	install -Dm755 weston-launch-calibrator.sh ${D}/${bindir}/weston-launch-calibrator
>> ++}
>> ++
>> ++inherit useradd
>> ++
>> ++USERADD_PACKAGES = "${PN}"
>> ++
>> ++# rdepends on weston which depends on virtual/egl
>> ++#
>> ++require ${COREBASE}/meta/recipes-graphics/wayland/required-distro-features.inc
>> ++
>> ++RDEPENDS:${PN} = "weston kbd ${@bb.utils.contains('PACKAGECONFIG', 'xwayland', 'weston-xwayland', '', d)} emptty"
>> ++
>> ++FILES:${PN} += "\
>> ++    ${sysconfdir}/xdg/weston/weston.ini \
>> ++    ${sysconfdir}/emptty/conf \
>> ++    /home/weston \
>> ++    ${bindir}/weston-launch-calibrator \
>> ++    "
>> ++
>> ++CONFFILES:${PN} += "${sysconfdir}/xdg/weston/weston.ini ${sysconfdir}/emptty/conf"
>> ++RPROVIDES:${PN}:append = " virtual-emptty-conf weston-init"
>> ++RCONFLICTS:${PN} += "weston-init"
>> ++
>> ++USERADD_PARAM:${PN} = "--home /home/weston --shell /bin/sh --user-group -G video,input,render,nopasswdlogin weston"
>> ++GROUPADD_PARAM:${PN} = "-r wayland; -r render; -r nopasswdlogin"
>> +diff --git a/meta-arago-distro/recipes-graphics/wayland/weston-init-arago/beaglebone/weston.ini b/meta-arago-distro/recipes-graphics/wayland/weston-init-arago/beaglebone/weston.ini
>> +new file mode 100644
>> +index 00000000..9fd9851d
>> +--- /dev/null
>> ++++ b/meta-arago-distro/recipes-graphics/wayland/weston-init-arago/beaglebone/weston.ini
>> +@@ -0,0 +1,85 @@
>> ++# configuration file for Weston
>> ++
>> ++[core]
>> ++idle-time=0
>> ++#modules=xwayland.so,cms-colord.so
>> ++#shell=desktop-shell.so
>> ++gbm-format=rgb565
>> ++require-input=false
>> ++
>> ++[shell]
>> ++locking=false
>> ++animation=zoom
>> ++panel-position=top
>> ++startup-animation=fade
>> ++#background-image=/usr/share/backgrounds/gnome/Aqua.jpg
>> ++#background-color=0xff002244
>> ++#background-type=tile
>> ++#clock-format=minutes
>> ++#panel-color=0x90ff0000
>> ++#locking=true
>> ++#animation=zoom
>> ++#startup-animation=fade
>> ++#binding-modifier=ctrl
>> ++#num-workspaces=6
>> ++#cursor-theme=whiteglass
>> ++#cursor-size=24
>> ++
>> ++#lockscreen-icon=/usr/share/icons/gnome/256x256/actions/lock.png
>> ++#lockscreen=/usr/share/backgrounds/gnome/Garden.jpg
>> ++#homescreen=/usr/share/backgrounds/gnome/Blinds.jpg
>> ++#animation=fade
>> ++
>> ++#[launcher]
>> ++#icon=/usr/share/icons/gnome/24x24/apps/utilities-terminal.png
>> ++#path=/usr/bin/gnome-terminal
>> ++
>> ++#[launcher]
>> ++#icon=/usr/share/icons/gnome/24x24/apps/utilities-terminal.png
>> ++#path=/usr/bin/weston-terminal
>> ++
>> ++#[launcher]
>> ++#icon=/usr/share/icons/hicolor/24x24/apps/google-chrome.png
>> ++#path=/usr/bin/google-chrome
>> ++
>> ++#[launcher]
>> ++#icon=/usr/share/icons/gnome/24x24/apps/arts.png
>> ++#path=/build/weston-0lEgCh/weston-1.11.0/weston-flower
>> ++
>> ++#[input-method]
>> ++#path=/usr/libexec/weston-keyboard
>> ++
>> ++[output]
>> ++name=HDMI-A-1
>> ++#mode=1680x1050
>> ++#transform=90
>> ++#icc_profile=/usr/share/color/icc/colord/Bluish.icc
>> ++
>> ++#[output]
>> ++#name=VGA1
>> ++#mode=173.00  1920 2048 2248 2576  1080 1083 1088 1120 -hsync +vsync
>> ++#transform=flipped
>> ++
>> ++#[output]
>> ++#name=X1
>> ++#mode=1024x768
>> ++#transform=flipped-90
>> ++
>> ++[libinput]
>> ++touchscreen_calibrator=true
>> ++#enable_tap=true
>> ++
>> ++#[touchpad]
>> ++#constant_accel_factor = 50
>> ++#min_accel_factor = 0.16
>> ++#max_accel_factor = 1.0
>> ++
>> ++[screen-share]
>> ++command=/usr/bin/weston --backend=rdp-backend.so --shell=fullscreen-shell.so --no-clients-resize
>> ++
>> ++#[xwayland]
>> ++#path=/usr/bin/Xwayland
>> ++
>> ++[autolaunch]
>> ++# launch the calibrator on startup if a touchscreen is detected
>> ++path=/usr/bin/weston-launch-calibrator
>> +diff --git a/meta-arago-distro/recipes-graphics/wayland/weston-init-arago/emptty.conf b/meta-arago-distro/recipes-graphics/wayland/weston-init-arago/emptty.conf
>> +new file mode 100644
>> +index 00000000..ffe1a3c2
>> +--- /dev/null
>> ++++ b/meta-arago-distro/recipes-graphics/wayland/weston-init-arago/emptty.conf
>> +@@ -0,0 +1,77 @@
>> ++# TTY, where emptty will start.
>> ++TTY_NUMBER=7
>> ++
>> ++# Enables switching to defined TTY number.
>> ++SWITCH_TTY=true
>> ++
>> ++# Enables printing of /etc/issue in daemon mode.
>> ++PRINT_ISSUE=true
>> ++
>> ++# Enables printing of default motd, /etc/emptty/motd or /etc/emptty/motd-gen.sh.
>> ++PRINT_MOTD=true
>> ++
>> ++# Preselected user, if AUTOLOGIN is enabled, this user is logged in.
>> ++DEFAULT_USER=weston
>> ++
>> ++# Enables Autologin, if DEFAULT_USER is defined and part of nopasswdlogin group. Possible values are "true" or "false".
>> ++AUTOLOGIN=true
>> ++
>> ++# The default session used, if Autologin is enabled. If session is not found in list of session, it proceeds to manual selection.
>> ++AUTOLOGIN_SESSION=Weston
>> ++
>> ++# If Autologin is enabled and session does not start correctly, the number of retries in short period is kept to eventually stop the infinite loop of restarts. -1 is for infinite retries, 0 is for no retry.
>> ++AUTOLOGIN_MAX_RETRY=-1
>> ++
>> ++# Default LANG, if user does not have set own in init script.
>> ++#LANG=en_US.UTF-8
>> ++
>> ++# Starts desktop with calling "dbus-launch".
>> ++DBUS_LAUNCH=true
>> ++
>> ++# Starts Xorg desktop with calling "~/.xinitrc" script, if is true, file exists and selected WM/DE is Xorg session, it overrides DBUS_LAUNCH.
>> ++XINITRC_LAUNCH=false
>> ++
>> ++# Prints available WM/DE each on new line instead of printing on single line.
>> ++VERTICAL_SELECTION=false
>> ++
>> ++# Defines the way, how is logging handled. Possible values are "rotate", "appending" or "disabled".
>> ++#LOGGING=rotate
>> ++
>> ++# Overrides path of log file
>> ++#LOGGING_FILE=/var/log/emptty/[TTY_NUMBER].log
>> ++
>> ++# Arguments passed to Xorg server.
>> ++#XORG_ARGS=
>> ++
>> ++# Allows to use dynamic motd script to generate custom MOTD.
>> ++#DYNAMIC_MOTD=false
>> ++
>> ++# Allows to override default path to dynamic motd.
>> ++#DYNAMIC_MOTD_PATH=/etc/emptty/motd-gen.sh
>> ++
>> ++# Allows to override default path to static motd.
>> ++#MOTD_PATH=/etc/emptty/motd
>> ++
>> ++# Foreground color, available only in daemon mode.
>> ++#FG_COLOR=LIGHT_BLACK
>> ++
>> ++# Background color, available only in daemon mode.
>> ++#BG_COLOR=BLACK
>> ++
>> ++# Enables numlock in daemon mode. Possible values are "true" or "false".
>> ++#ENABLE_NUMLOCK=false
>> ++
>> ++# Defines the way, how is logging of session errors handled. Possible values are "rotate", "appending" or "disabled".
>> ++SESSION_ERROR_LOGGING=rotate
>> ++
>> ++# Overrides path of session errors log file
>> ++#SESSION_ERROR_LOGGING_FILE=/var/log/emptty/session-errors.[TTY_NUMBER].log
>> ++
>> ++# If set true, it will not use `.emptty-xauth` file, but the standard `~/.Xauthority` file. This allows to handle xauth issues.
>> ++#DEFAULT_XAUTHORITY=false
>> ++
>> ++#If set true, Xorg will be started as rootless, if system allows and emptty is running in daemon mode.
>> ++#ROOTLESS_XORG=false
>> ++
>> ++#If set true, environmental groups are printed to differ Xorg/Wayland/Custom/UserCustom desktops.
>> ++IDENTIFY_ENVS=false
>> +diff --git a/meta-arago-distro/recipes-graphics/wayland/weston-init-arago/weston-launch-calibrator.sh b/meta-arago-distro/recipes-graphics/wayland/weston-init-arago/weston-launch-calibrator.sh
>> +new file mode 100644
>> +index 00000000..45863ecd
>> +--- /dev/null
>> ++++ b/meta-arago-distro/recipes-graphics/wayland/weston-init-arago/weston-launch-calibrator.sh
>> +@@ -0,0 +1,13 @@
>> ++#!/bin/sh
>> ++
>> ++if [ -e /dev/input/touchscreen0 ]; then
>> ++	echo "Touch screen detected..."
>> ++	if [ -n "$LIBINPUT_CALIBRATION_MATRIX" ]; then
>> ++		echo "Calibration matrix already present, skipping calibration..."
>> ++	else
>> ++		echo "Calibrating touchscreen..."
>> ++		exec weston-calibrator
>> ++	fi
>> ++else
>> ++	echo "Touch screen not detected, skipping calibration..."
>> ++fi
>> +diff --git a/meta-arago-distro/recipes-graphics/wayland/weston-init-arago/weston.ini b/meta-arago-distro/recipes-graphics/wayland/weston-init-arago/weston.ini
>> +new file mode 100644
>> +index 00000000..1bc7a010
>> +--- /dev/null
>> ++++ b/meta-arago-distro/recipes-graphics/wayland/weston-init-arago/weston.ini
>> +@@ -0,0 +1,21 @@
>> ++[core]
>> ++idle-time=0
>> ++require-input=false
>> ++require-outputs=none
>> ++
>> ++[shell]
>> ++locking=false
>> ++animation=zoom
>> ++panel-position=top
>> ++startup-animation=fade
>> ++
>> ++[libinput]
>> ++touchscreen_calibrator=true
>> ++
>> ++[autolaunch]
>> ++# launch the calibrator on startup if a touchscreen is detected
>> ++path=/usr/bin/weston-launch-calibrator
>> ++
>> ++[screensaver]
>> ++# Uncomment path to disable screensaver
>> ++#path=@libexecdir@/weston-screensaver
>> +--
>> +2.34.1
>> +
>> diff --git a/meta-arago-distro/classes/tisdk-bundle.bbclass b/meta-arago-distro/classes/tisdk-bundle.bbclass
>> index cc5d1481..24146529 100644
>> --- a/meta-arago-distro/classes/tisdk-bundle.bbclass
>> +++ b/meta-arago-distro/classes/tisdk-bundle.bbclass
>> @@ -106,7 +106,7 @@ cleanup_host_packages() {
>>   }
>>   
>>   ROOTFS_PREPROCESS_COMMAND += "tisdk_image_setup; "
>> -ROOTFS_POSTPROCESS_COMMAND += "tisdk_image_build; "
>> +ROOTFS_POSTPROCESS_COMMAND += "tisdk_image_build; add_emptty_inittab; "
>>   IMAGE_PREPROCESS_COMMAND:append = "tisdk_image_cleanup; "
>>   
>>   # Create the SDK image.  We will re-use the rootfs_ipk_do_rootfs functionality
>> @@ -304,6 +304,18 @@ tisdk_image_build () {
>>       cp ${WORKDIR}/opkg.conf ${IMAGE_ROOTFS}/etc/
>>   }
>>   
>> +
>> +add_emptty_inittab() {
>> +    [ -f ${IMAGE_ROOTFS}${sysconfdir}/inittab ] || return 0
>> +
>> +    if ${@bb.utils.contains_any("IMAGE_FEATURES", [ "x11-base", "weston" ], "true", "false", d)}
>> +    then
>> +	echo "7:5:respawn:${bindir}/emptty -t 7 -d" >> ${IMAGE_ROOTFS}${sysconfdir}/inittab
>> +    fi
>> +}
>> +
>> +
>> +
>>   TISDK_IMAGE_CLEANUP_DIRS ?= "var etc lib boot dev home media mnt proc run sbin sys tmp usr"
>>   TISDK_IMAGE_CLEANUP_FILES ?= "bin/bash bin/bash.bash bin/sh"
>>   
>> diff --git a/meta-arago-distro/conf/distro/arago.conf b/meta-arago-distro/conf/distro/arago.conf
>> index fb5c703f..43d4db53 100644
>> --- a/meta-arago-distro/conf/distro/arago.conf
>> +++ b/meta-arago-distro/conf/distro/arago.conf
>> @@ -68,6 +68,8 @@ PACKAGECONFIG:pn-glmark2 = "drm-gles2 wayland-gles2"
>>   
>>   # Set this to empty string to prevent xwayland config from being added
>>   PACKAGECONFIG:pn-weston-init = ""
>> +PREFERRED_RPROVIDER_virtual-emptty-conf = "weston-init-arago"
>> +PREFERRED_RPROVIDER_weston-init = "weston-init-arago"
>>   
>>   # Enable testing for opencl and vulkan with piglit
>>   PACKAGECONFIG:append:pn-piglit = " \
>> diff --git a/meta-arago-distro/recipes-graphics/emptty/emptty-conf.bb b/meta-arago-distro/recipes-graphics/emptty/emptty-conf.bb
>> new file mode 100644
>> index 00000000..0b98e2e1
>> --- /dev/null
>> +++ b/meta-arago-distro/recipes-graphics/emptty/emptty-conf.bb
>> @@ -0,0 +1,14 @@
>> +require emptty.inc
>> +
>> +SUMMARY += " (Default config)"
>> +
>> +do_configure[noexec] = "1"
>> +do_compile[noexec] = "1"
>> +
>> +do_install () {
>> +    oe_runmake -C ${S}/src/${GO_IMPORT} DESTDIR=${D} install-config
>> +}
>> +
>> +FILES:${PN} = "${sysconfdir}/emptty/conf"
>> +CONFFILES:${PN} = "${sysconfdir}/emptty/conf"
>> +RPROVIDES:${PN} += "virtual-emptty-conf"
>> diff --git a/meta-arago-distro/recipes-graphics/emptty/emptty.inc b/meta-arago-distro/recipes-graphics/emptty/emptty.inc
>> new file mode 100644
>> index 00000000..d99c4d8c
>> --- /dev/null
>> +++ b/meta-arago-distro/recipes-graphics/emptty/emptty.inc
>> @@ -0,0 +1,27 @@
>> +SUMMARY = "Dead simple CLI Display Manager on TTY"
>> +DESCRIPTION = "Emptty is a simple display manager with a command line greeter \
>> +It supports both X11 and Wayland sessions, exporting required variables and \
>> +creating user paths as necessary."
>> +
>> +HOMEPAGE = "https://github.com/tvrzna/emptty"
>> +BUGTRACKER = "https://github.com/tvrzna/emptty/issues"
>> +LICENSE = "MIT"
>> +LIC_FILES_CHKSUM = "file://src/${GO_IMPORT}/LICENSE;md5=d1e4d12c7d1d17367ba5668706a405ba"
>> +
>> +S = "${UNPACKDIR}"
>> +
>> +FILESEXTRAPATHS:append = ":${THISDIR}/emptty"
>> +
>> +GO_IMPORT = "github.com/tvrzna/emptty"
>> +GO_IMPORT_pam = "github.com/msteinert/pam"
>> +SRC_URI = "\
>> +    git://${GO_IMPORT}.git;protocol=https;branch=master;destsuffix=src/${GO_IMPORT} \
>> +    git://${GO_IMPORT_pam}.git;protocol=https;branch=master;name=pam;destsuffix=src/${GO_IMPORT_pam} \
>> +    file://pamconf \
>> +    "
>> +SRCREV = "bb203ad0a224731a7a2ff50deeb342ab79c4af09"
>> +SRCREV_pam = "50ded1b0e7864b9bf75005eb945a8ec826bcf69d"
>> +
>> +SRCREV_FORMAT .= "_pam"
>> +
>> +PR = "r1"
>> diff --git a/meta-arago-distro/recipes-graphics/emptty/emptty/pamconf b/meta-arago-distro/recipes-graphics/emptty/emptty/pamconf
>> new file mode 100644
>> index 00000000..5c82d46b
>> --- /dev/null
>> +++ b/meta-arago-distro/recipes-graphics/emptty/emptty/pamconf
>> @@ -0,0 +1,11 @@
>> +#%PAM-1.0
>> +auth            sufficient      pam_succeed_if.so user ingroup nopasswdlogin
>> +auth            include         common-auth
>> +-auth           optional        pam_gnome_keyring.so
>> +-auth           optional        pam_kwallet5.so
>> +account         include         common-account
>> +session         include         common-session
>> +-session        optional        pam_gnome_keyring.so auto_start
>> +-session        optional        pam_kwallet5.so auto_start force_run
>> +password        include         common-password
>> +
>> diff --git a/meta-arago-distro/recipes-graphics/emptty/emptty_0.15.0.bb b/meta-arago-distro/recipes-graphics/emptty/emptty_0.15.0.bb
>> new file mode 100644
>> index 00000000..415c5ea5
>> --- /dev/null
>> +++ b/meta-arago-distro/recipes-graphics/emptty/emptty_0.15.0.bb
>> @@ -0,0 +1,57 @@
>> +require emptty.inc
>> +
>> +PACKAGECONFIG ?= "${@bb.utils.filter('DISTRO_FEATURES', 'pam x11', d)}"
>> +PACKAGECONFIG[pam] = ",,libpam,pam-plugin-succeed-if"
>> +PACKAGECONFIG[x11] = ",,virtual/libx11,util-linux-mcookie"
>> +
>> +DEPENDS += "${@bb.utils.contains('PACKAGECONFIG', 'pam', '', 'virtual/crypt', d)}"
>> +
>> +GO_TAGS = ""
>> +GO_TAGS:append = "${@bb.utils.contains('PACKAGECONFIG', 'pam', '', ',nopam', d)}"
>> +GO_TAGS:append = "${@bb.utils.contains('PACKAGECONFIG', 'x11', '', ',noxlib', d)}"
>> +
>> +GOBUILDFLAGS:append = " -tags=${GO_TAGS}"
>> +
>> +export GO111MODULE = "off"
>> +
>> +inherit go
>> +
>> +DEPENDS += "gzip"
>> +
>> +do_install () {
>> +    # general collateral
>> +    install -Dm755 ${B}/${GO_BUILD_BINDIR}/emptty ${D}${bindir}/emptty
>> +    install -d ${D}${mandir}/man1
>> +    gzip -cn ${S}/src/${GO_IMPORT}/res/emptty.1 > ${D}${mandir}/man1/emptty.1.gz
>> +
>> +    # pam config
>> +    if "${@bb.utils.contains('PACKAGECONFIG','pam','true','false',d)}"
>> +    then
>> +        install -Dm644 ${S}/pamconf ${D}${sysconfdir}/pam.d/emptty
>> +    fi
>> +
>> +    # systemd init service
>> +    if ${@bb.utils.contains('DISTRO_FEATURES','systemd','true','false',d)}
>> +    then
>> +        oe_runmake -C ${S}/src/${GO_IMPORT} DESTDIR=${D} install-systemd
>> +    fi
>> +}
>> +
>> +FILES:${PN} = "\
>> +    ${systemd_system_unitdir}/emptty.service \
>> +    ${bindir}/emptty \
>> +    ${mandir}/man1/emptty.1.gz \
>> +    ${sysconfdir}/pam.d/emptty \
>> +"
>> +
>> +RDEPENDS:${PN} += "virtual-emptty-conf"
>> +SYSTEMD_SERVICE:${PN} = "emptty.service"
>> +
>> +inherit systemd
>> +
>> +USERADD_PACKAGES = "${PN}"
>> +GROUPADD_PARAM:${PN} = "-r nopasswdlogin"
>> +
>> +inherit useradd
>> +
>> +
>> diff --git a/meta-arago-distro/recipes-graphics/wayland/weston-init-arago.bb b/meta-arago-distro/recipes-graphics/wayland/weston-init-arago.bb
>> new file mode 100644
>> index 00000000..484d25e1
>> --- /dev/null
>> +++ b/meta-arago-distro/recipes-graphics/wayland/weston-init-arago.bb
>> @@ -0,0 +1,72 @@
>> +SUMMARY = "Configuration files for the Weston Wayland compositor"
>> +LICENSE = "MIT"
>> +LIC_FILES_CHKSUM = "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
>> +
>> +PACKAGE_ARCH = "${MACHINE_ARCH}"
>> +
>> +SRC_URI:append = " \
>> +    file://weston.ini \
>> +    file://weston-launch-calibrator.sh \
>> +    file://emptty.conf \
>> +"
>> +
>> +S = "${UNPACKDIR}"
>> +
>> +PACKAGECONFIG ??= "${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'xwayland', '', d)}"
>> +PACKAGECONFIG:append:qemuriscv64 = " use-pixman"
>> +PACKAGECONFIG:append:qemuppc64 = " use-pixman"
>> +
>> +PACKAGECONFIG[xwayland] = ",,"
>> +PACKAGECONFIG[no-idle-timeout] = ",,"
>> +PACKAGECONFIG[use-pixman] = ",,"
>> +
>> +DEFAULTBACKEND ??= ""
>> +DEFAULTBACKEND:qemuall ?= "drm"
>> +
>> +do_install() {
>> +	install -D -p -m0644 weston.ini ${D}${sysconfdir}/xdg/weston/weston.ini
>> +	install -D -p -m0644 emptty.conf ${D}${sysconfdir}/emptty/conf
>> +
>> +	if [ -n "${DEFAULTBACKEND}" ]; then
>> +		sed -i -e "/^\[core\]/a backend=${DEFAULTBACKEND}-backend.so" ${D}${sysconfdir}/xdg/weston/weston.ini
>> +	fi
>> +
>> +	if [ "${@bb.utils.contains('PACKAGECONFIG', 'xwayland', 'yes', 'no', d)}" = "yes" ]; then
>> +		sed -i -e "/^\[core\]/a xwayland=true" ${D}${sysconfdir}/xdg/weston/weston.ini
>> +	fi
>> +
>> +	if [ "${@bb.utils.contains('PACKAGECONFIG', 'no-idle-timeout', 'yes', 'no', d)}" = "yes" ]; then
>> +		sed -i -e "/^\[core\]/a idle-time=0" ${D}${sysconfdir}/xdg/weston/weston.ini
>> +	fi
>> +
>> +	if [ "${@bb.utils.contains('PACKAGECONFIG', 'use-pixman', 'yes', 'no', d)}" = "yes" ]; then
>> +		sed -i -e "/^\[core\]/a use-pixman=true" ${D}${sysconfdir}/xdg/weston/weston.ini
>> +	fi
>> +
>> +	install -dm 755 -o weston -g weston ${D}/home/weston
>> +	install -Dm755 weston-launch-calibrator.sh ${D}/${bindir}/weston-launch-calibrator
>> +}
>> +
>> +inherit useradd
>> +
>> +USERADD_PACKAGES = "${PN}"
>> +
>> +# rdepends on weston which depends on virtual/egl
>> +#
>> +require ${COREBASE}/meta/recipes-graphics/wayland/required-distro-features.inc
>> +
>> +RDEPENDS:${PN} = "weston kbd ${@bb.utils.contains('PACKAGECONFIG', 'xwayland', 'weston-xwayland', '', d)} emptty"
>> +
>> +FILES:${PN} += "\
>> +    ${sysconfdir}/xdg/weston/weston.ini \
>> +    ${sysconfdir}/emptty/conf \
>> +    /home/weston \
>> +    ${bindir}/weston-launch-calibrator \
>> +    "
>> +
>> +CONFFILES:${PN} += "${sysconfdir}/xdg/weston/weston.ini ${sysconfdir}/emptty/conf"
>> +RPROVIDES:${PN}:append = " virtual-emptty-conf weston-init"
>> +RCONFLICTS:${PN} += "weston-init"
>> +
>> +USERADD_PARAM:${PN} = "--home /home/weston --shell /bin/sh --user-group -G video,input,render,nopasswdlogin weston"
>> +GROUPADD_PARAM:${PN} = "-r wayland; -r render; -r nopasswdlogin"
>> diff --git a/meta-arago-distro/recipes-graphics/wayland/weston-init-arago/beaglebone/weston.ini b/meta-arago-distro/recipes-graphics/wayland/weston-init-arago/beaglebone/weston.ini
>> new file mode 100644
>> index 00000000..9fd9851d
>> --- /dev/null
>> +++ b/meta-arago-distro/recipes-graphics/wayland/weston-init-arago/beaglebone/weston.ini
>> @@ -0,0 +1,85 @@
>> +# configuration file for Weston
>> +
>> +[core]
>> +idle-time=0
>> +#modules=xwayland.so,cms-colord.so
>> +#shell=desktop-shell.so
>> +gbm-format=rgb565
>> +require-input=false
>> +
>> +[shell]
>> +locking=false
>> +animation=zoom
>> +panel-position=top
>> +startup-animation=fade
>> +#background-image=/usr/share/backgrounds/gnome/Aqua.jpg
>> +#background-color=0xff002244
>> +#background-type=tile
>> +#clock-format=minutes
>> +#panel-color=0x90ff0000
>> +#locking=true
>> +#animation=zoom
>> +#startup-animation=fade
>> +#binding-modifier=ctrl
>> +#num-workspaces=6
>> +#cursor-theme=whiteglass
>> +#cursor-size=24
>> +
>> +#lockscreen-icon=/usr/share/icons/gnome/256x256/actions/lock.png
>> +#lockscreen=/usr/share/backgrounds/gnome/Garden.jpg
>> +#homescreen=/usr/share/backgrounds/gnome/Blinds.jpg
>> +#animation=fade
>> +
>> +#[launcher]
>> +#icon=/usr/share/icons/gnome/24x24/apps/utilities-terminal.png
>> +#path=/usr/bin/gnome-terminal
>> +
>> +#[launcher]
>> +#icon=/usr/share/icons/gnome/24x24/apps/utilities-terminal.png
>> +#path=/usr/bin/weston-terminal
>> +
>> +#[launcher]
>> +#icon=/usr/share/icons/hicolor/24x24/apps/google-chrome.png
>> +#path=/usr/bin/google-chrome
>> +
>> +#[launcher]
>> +#icon=/usr/share/icons/gnome/24x24/apps/arts.png
>> +#path=/build/weston-0lEgCh/weston-1.11.0/weston-flower
>> +
>> +#[input-method]
>> +#path=/usr/libexec/weston-keyboard
>> +
>> +[output]
>> +name=HDMI-A-1
>> +#mode=1680x1050
>> +#transform=90
>> +#icc_profile=/usr/share/color/icc/colord/Bluish.icc
>> +
>> +#[output]
>> +#name=VGA1
>> +#mode=173.00  1920 2048 2248 2576  1080 1083 1088 1120 -hsync +vsync
>> +#transform=flipped
>> +
>> +#[output]
>> +#name=X1
>> +#mode=1024x768
>> +#transform=flipped-90
>> +
>> +[libinput]
>> +touchscreen_calibrator=true
>> +#enable_tap=true
>> +
>> +#[touchpad]
>> +#constant_accel_factor = 50
>> +#min_accel_factor = 0.16
>> +#max_accel_factor = 1.0
>> +
>> +[screen-share]
>> +command=/usr/bin/weston --backend=rdp-backend.so --shell=fullscreen-shell.so --no-clients-resize
>> +
>> +#[xwayland]
>> +#path=/usr/bin/Xwayland
>> +
>> +[autolaunch]
>> +# launch the calibrator on startup if a touchscreen is detected
>> +path=/usr/bin/weston-launch-calibrator
>> diff --git a/meta-arago-distro/recipes-graphics/wayland/weston-init-arago/emptty.conf b/meta-arago-distro/recipes-graphics/wayland/weston-init-arago/emptty.conf
>> new file mode 100644
>> index 00000000..ffe1a3c2
>> --- /dev/null
>> +++ b/meta-arago-distro/recipes-graphics/wayland/weston-init-arago/emptty.conf
>> @@ -0,0 +1,77 @@
>> +# TTY, where emptty will start.
>> +TTY_NUMBER=7
>> +
>> +# Enables switching to defined TTY number.
>> +SWITCH_TTY=true
>> +
>> +# Enables printing of /etc/issue in daemon mode.
>> +PRINT_ISSUE=true
>> +
>> +# Enables printing of default motd, /etc/emptty/motd or /etc/emptty/motd-gen.sh.
>> +PRINT_MOTD=true
>> +
>> +# Preselected user, if AUTOLOGIN is enabled, this user is logged in.
>> +DEFAULT_USER=weston
>> +
>> +# Enables Autologin, if DEFAULT_USER is defined and part of nopasswdlogin group. Possible values are "true" or "false".
>> +AUTOLOGIN=true
>> +
>> +# The default session used, if Autologin is enabled. If session is not found in list of session, it proceeds to manual selection.
>> +AUTOLOGIN_SESSION=Weston
>> +
>> +# If Autologin is enabled and session does not start correctly, the number of retries in short period is kept to eventually stop the infinite loop of restarts. -1 is for infinite retries, 0 is for no retry.
>> +AUTOLOGIN_MAX_RETRY=-1
>> +
>> +# Default LANG, if user does not have set own in init script.
>> +#LANG=en_US.UTF-8
>> +
>> +# Starts desktop with calling "dbus-launch".
>> +DBUS_LAUNCH=true
>> +
>> +# Starts Xorg desktop with calling "~/.xinitrc" script, if is true, file exists and selected WM/DE is Xorg session, it overrides DBUS_LAUNCH.
>> +XINITRC_LAUNCH=false
>> +
>> +# Prints available WM/DE each on new line instead of printing on single line.
>> +VERTICAL_SELECTION=false
>> +
>> +# Defines the way, how is logging handled. Possible values are "rotate", "appending" or "disabled".
>> +#LOGGING=rotate
>> +
>> +# Overrides path of log file
>> +#LOGGING_FILE=/var/log/emptty/[TTY_NUMBER].log
>> +
>> +# Arguments passed to Xorg server.
>> +#XORG_ARGS=
>> +
>> +# Allows to use dynamic motd script to generate custom MOTD.
>> +#DYNAMIC_MOTD=false
>> +
>> +# Allows to override default path to dynamic motd.
>> +#DYNAMIC_MOTD_PATH=/etc/emptty/motd-gen.sh
>> +
>> +# Allows to override default path to static motd.
>> +#MOTD_PATH=/etc/emptty/motd
>> +
>> +# Foreground color, available only in daemon mode.
>> +#FG_COLOR=LIGHT_BLACK
>> +
>> +# Background color, available only in daemon mode.
>> +#BG_COLOR=BLACK
>> +
>> +# Enables numlock in daemon mode. Possible values are "true" or "false".
>> +#ENABLE_NUMLOCK=false
>> +
>> +# Defines the way, how is logging of session errors handled. Possible values are "rotate", "appending" or "disabled".
>> +SESSION_ERROR_LOGGING=rotate
>> +
>> +# Overrides path of session errors log file
>> +#SESSION_ERROR_LOGGING_FILE=/var/log/emptty/session-errors.[TTY_NUMBER].log
>> +
>> +# If set true, it will not use `.emptty-xauth` file, but the standard `~/.Xauthority` file. This allows to handle xauth issues.
>> +#DEFAULT_XAUTHORITY=false
>> +
>> +#If set true, Xorg will be started as rootless, if system allows and emptty is running in daemon mode.
>> +#ROOTLESS_XORG=false
>> +
>> +#If set true, environmental groups are printed to differ Xorg/Wayland/Custom/UserCustom desktops.
>> +IDENTIFY_ENVS=false
>> diff --git a/meta-arago-distro/recipes-graphics/wayland/weston-init-arago/weston-launch-calibrator.sh b/meta-arago-distro/recipes-graphics/wayland/weston-init-arago/weston-launch-calibrator.sh
>> new file mode 100644
>> index 00000000..45863ecd
>> --- /dev/null
>> +++ b/meta-arago-distro/recipes-graphics/wayland/weston-init-arago/weston-launch-calibrator.sh
>> @@ -0,0 +1,13 @@
>> +#!/bin/sh
>> +
>> +if [ -e /dev/input/touchscreen0 ]; then
>> +	echo "Touch screen detected..."
>> +	if [ -n "$LIBINPUT_CALIBRATION_MATRIX" ]; then
>> +		echo "Calibration matrix already present, skipping calibration..."
>> +	else
>> +		echo "Calibrating touchscreen..."
>> +		exec weston-calibrator
>> +	fi
>> +else
>> +	echo "Touch screen not detected, skipping calibration..."
>> +fi
>> diff --git a/meta-arago-distro/recipes-graphics/wayland/weston-init-arago/weston.ini b/meta-arago-distro/recipes-graphics/wayland/weston-init-arago/weston.ini
>> new file mode 100644
>> index 00000000..1bc7a010
>> --- /dev/null
>> +++ b/meta-arago-distro/recipes-graphics/wayland/weston-init-arago/weston.ini
>> @@ -0,0 +1,21 @@
>> +[core]
>> +idle-time=0
>> +require-input=false
>> +require-outputs=none
>> +
>> +[shell]
>> +locking=false
>> +animation=zoom
>> +panel-position=top
>> +startup-animation=fade
>> +
>> +[libinput]
>> +touchscreen_calibrator=true
>> +
>> +[autolaunch]
>> +# launch the calibrator on startup if a touchscreen is detected
>> +path=/usr/bin/weston-launch-calibrator
>> +
>> +[screensaver]
>> +# Uncomment path to disable screensaver
>> +#path=@libexecdir@/weston-screensaver
>> -- 
>> 2.34.1
> 

-- 
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS

