Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 74A84FF8868
	for <webhook@archiver.kernel.org>; Tue, 28 Apr 2026 15:06:35 +0000 (UTC)
Received: from SJ2PR03CU001.outbound.protection.outlook.com (SJ2PR03CU001.outbound.protection.outlook.com [52.101.43.32])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.15311.1777388784042200325
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 28 Apr 2026 08:06:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=selector1 header.b=IhWB86OT;
 spf=pass (domain: ti.com, ip: 52.101.43.32, mailfrom: reatmon@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ujrwJ8bjVMwNwbPyI0ofEREhFvqq2yxvKv4u1UF2s/fH0nxCnzhtdSv7g+OxnKHTHz5FW8AQ5ydvf2RcKUsHx1vL0xJKw695CYPU3bA7OkuurRLLrmQrGfNsMIvcnzEycAjI3ESqMvqjGy/prdYXUlOgqQNQd0Wv5fs8OIlSrba4NUXFmWbCaA5G3AiJWEeS2DMtb6PZr6AZofdn5d8FJbSbqFVP/nvKLyo1A1itITiqW5QGO0NiMeGACKuuo6tK7B9blpkNEgCEkY8WeHpps1PIs/H2228WjePb5hjpCcD5Sx5LT6TCaWjkN+IhC78UHS4SKRht/8WnsxhWqYuDlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kP2NYc89AgXV27DZnicwuwJfB9lodqR69dFKrfmxZ6A=;
 b=dZ1yKNVaOeA7FLwDumPTMeIK3sW+/VpMKm3qHFVinwPfrSZlgrXlt7HiVpxJTPfSLQI96z8wlTnIQyl3DI9DiL/0o6xFzLiD+P5f+0xuM3lpZkP1tsMHQE4B8eBlgwAq0lRHEuXNVkj3CTWc8/Z+Ufe3CmckWVD5rvXNuXiJkUqe6c7qGw0lryBbL2bj+TMkdmEHVBkv8qDsjWLgwPHLx2AjhsvgR5IP4nTNJG7XVDpYP/ux3xdlv7gjMe+3DxOWUsNmri4om9ubLfvs04Tig0H6L8E55gGTl/CV0bPsmOoD6Z3oE80WkBOiS6yshPOiGw8fS0NMOVrK/gjgajlkFA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kP2NYc89AgXV27DZnicwuwJfB9lodqR69dFKrfmxZ6A=;
 b=IhWB86OTc8V5aI/aHHvGVX6AxBoIWNYTHiNUonnaLcC7rwHBsh/iDSbuHUVCKNXzzZrgZd/LRn8Pas49oYoxeegBcsytABShJbbQ7AaRNEoKkTKjNFdHmYsn0gpsTQ8Aw3bvXcVyU94mnAR+DKE3wE3y7OO2iV4D3pdznOJkH6Y=
Received: from SJ0PR13CA0092.namprd13.prod.outlook.com (2603:10b6:a03:2c5::7)
 by SJ2PR10MB7825.namprd10.prod.outlook.com (2603:10b6:a03:56e::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.26; Tue, 28 Apr
 2026 15:06:18 +0000
Received: from SJ5PEPF000001F4.namprd05.prod.outlook.com
 (2603:10b6:a03:2c5:cafe::51) by SJ0PR13CA0092.outlook.office365.com
 (2603:10b6:a03:2c5::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9846.26 via Frontend Transport; Tue,
 28 Apr 2026 15:06:18 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 SJ5PEPF000001F4.mail.protection.outlook.com (10.167.242.72) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9846.18 via Frontend Transport; Tue, 28 Apr 2026 15:06:18 +0000
Received: from DLEE208.ent.ti.com (157.170.170.97) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 28 Apr
 2026 10:06:12 -0500
Received: from DLEE204.ent.ti.com (157.170.170.84) by DLEE208.ent.ti.com
 (157.170.170.97) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 28 Apr
 2026 10:06:12 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE204.ent.ti.com
 (157.170.170.84) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Tue, 28 Apr 2026 10:06:12 -0500
Received: from [10.249.32.167] ([10.249.32.167])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 63SF6CqE1187772;
	Tue, 28 Apr 2026 10:06:12 -0500
Message-ID: <ee33c3f3-3780-4190-aab1-47ea89d14471@ti.com>
Date: Tue, 28 Apr 2026 10:06:12 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-arago][master][PATCH] ltp-ddt: Fix install error
To: Denys Dmytriyenko <denis@denix.org>
CC: Praneeth Bajjuri <praneeth@ti.com>, Denys Dmytriyenko
	<denys@konsulko.com>, <meta-arago@lists.yoctoproject.org>
References: <20260428144042.849713-1-reatmon@ti.com>
 <20260428144811.GI4186@denix.org>
Content-Language: en-US
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <20260428144811.GI4186@denix.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001F4:EE_|SJ2PR10MB7825:EE_
X-MS-Office365-Filtering-Correlation-Id: c27b698c-8405-49c8-b725-08dea537b35d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|82310400026|36860700016|376014|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info: 
	J6tv8hI+R9hDpZsrhpRnXSGzkf0edEc1CwB57WRdyThnKRhzMHA0bZMfgvJ/9XrpSNYA6XS1l+owaV6YlmkaFJ+tqTWUc8FXStFaG5mPNvyQoGVCgt58QGa060AIx9R5CEgqM0N7TKPQkDgSO5gRDnkm7qirSi7jrYzQchwM6eYVcMPc3/cgsW0MWlS12n+ko4xjYN6RLigbxiCBfO8uHWBD2441rTPgu9Gps77oXLmKR/mDyG99ujH/Mg46U2CwC0rri8vftM0Jxf4nAIIoEeh1ymLgJSWjnULLgSV8TDUkKvwH5W3eACw3lFBksmv6bZAMBKZRKmfoT+uOsXLldTz2BDpEigiH45qeK5toyWshVtOpKtNzT8tTgXelj67INtgKBgMEtL2iB9Y166XpgGLV+cARrK0EF1Oa3iZgak4btG+qnKncyuMGTNCiy+cJVpVi/zi2qPIX9ysJUC3TgAqe3YaKDNnrzY2VqZb2Keny52EoCRRXh40lU1BhD5w1sYeepHYLeMISwjkj4muWOrEDFtFCZ6tCops3se5M6UAgHqbGySbo2Houd8eo9PUZzUa1hmcoAzpF+tT0JZnDgC1m2oCdeLP7IsXQG2gab/zJxBqK55PTJDvxGgGfvY83XVdI3YDcT/VcmfIAtg0ZPZYmQBbLZ0P46PzKZlqoykoBJiSTCn9aXVK2+5yDF7pRL4dUd1i0OWBx0DFhkQanefoHYk/5FQU32YI39bCUdWXA2HUK/Z/j6pNqKMByBAo8mXVbtzV87QTYPkgqm2PPFQ==
X-Forefront-Antispam-Report: 
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(36860700016)(376014)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	IAtpX+g30Lghfb3CytBvIPccNxplmmfCMQtybw3x8ORFlIkhI0FaF2SVt0c1ATcJqeLCdEhu8uSsdMiUNdtL17JQR6eVmWuGHJkgwpY1H63jiNVZfKPADyjyIWwj7eOLUTBFNWOREDPa8ESGj2Gs4Iga3W6Snrsen8AeaJiIJGd6mZoOz9L7oFq6jzZMYi0ZegDQq1bzESUYW0qrhCGvUbrcgrLMnXNbzNJwqfCESs0G18D1LUNYe44uXN97sV8fWKSkxtDKQKGuDgSDIaL1GO2a3XALYct4MKNvQFjiT/rZHKu6gRdRODCpECTIBR4fXmL/1ck87FfbtawKQ9e6a6Kk2rovdXRw51/ijpzXEIYQZz1IQfF48inIwbGis6Z8TVRoR7j1uR9unwRCVDJBFzJYNfRa9vztj680h2xuZL0XGkWiQUhBSisNtVasVRlI
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Apr 2026 15:06:18.2935
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c27b698c-8405-49c8-b725-08dea537b35d
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SJ5PEPF000001F4.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR10MB7825
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 28 Apr 2026 15:06:35 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17500



On 4/28/2026 9:48 AM, Denys Dmytriyenko wrote:
> On Tue, Apr 28, 2026 at 09:40:42AM -0500, Ryan Eatmon via lists.yoctoproject.org wrote:
>> Something in the oe-core commit [1] is exposing an existing issue with
>> the ltp-ddt install flow.  The runtest/ddt sub directory was being
>> chmodded to 644 which stripped the execute bit make the directory, not a
>> directory.
>>
>> Attached patch fixes the issue in ltp-ddt.  We are waiting for testing
>> of this patch to make sure this works before accepting the patch change
>> in ltp-ddt itself.
>>
>> [1] https://git.openembedded.org/openembedded-core/commit/?h=master&id=8ea63d320aba32d3894cace9e71e850bdff1d6b2
>>
>> Signed-off-by: Ryan Eatmon <reatmon@ti.com>
>> ---
>>   ...01-include-mk-Fix-installing-subdirs.patch | 49 +++++++++++++++++++
>>   .../recipes-devtools/ltp-ddt/ltp_20260130.inc |  1 +
>>   2 files changed, 50 insertions(+)
>>   create mode 100644 meta-arago-test/recipes-devtools/ltp-ddt/ltp-ddt/0001-include-mk-Fix-installing-subdirs.patch
>>
>> diff --git a/meta-arago-test/recipes-devtools/ltp-ddt/ltp-ddt/0001-include-mk-Fix-installing-subdirs.patch b/meta-arago-test/recipes-devtools/ltp-ddt/ltp-ddt/0001-include-mk-Fix-installing-subdirs.patch
>> new file mode 100644
>> index 00000000..5f970a12
>> --- /dev/null
>> +++ b/meta-arago-test/recipes-devtools/ltp-ddt/ltp-ddt/0001-include-mk-Fix-installing-subdirs.patch
>> @@ -0,0 +1,49 @@
>> +From 5907227ad86a93b084a52a7ff8dd8cb791c228a5 Mon Sep 17 00:00:00 2001
>> +From: Ryan Eatmon <reatmon@ti.com>
>> +Date: Mon, 27 Apr 2026 11:02:32 -0500
>> +Subject: [PATCH] include/mk: Fix installing subdirs
>> +
>> +When installing sub directories, the INSTALL_MODE was being used for the
>> +dirs as well.  But in runtest/Makefile the INSTALL_MODE is being set to
>> +00644.  This causes the ddt dir to lose the execute bits and stop acting
>> +like a directory.
>> +
>> +Simple fix is create INSTALL_MODE_DIR and use it when installing
>> +directories.
>> +
>> +Upstream-Status: Pending
>> +
>> +Signed-off-by: Ryan Eatmon <reatmon@ti.com>
>> +---
>> + include/mk/env_post.mk  | 1 +
>> + include/mk/functions.mk | 2 +-
>> + 2 files changed, 2 insertions(+), 1 deletion(-)
>> +
>> +diff --git a/include/mk/env_post.mk b/include/mk/env_post.mk
>> +index ab31da73a..c2e85439a 100644
>> +--- a/include/mk/env_post.mk
>> ++++ b/include/mk/env_post.mk
>> +@@ -58,6 +58,7 @@ INSTALL_TARGETS			:= $(patsubst $(abs_srcdir)/%,%,$(INSTALL_TARGETS))
>> + # The large majority of the files that we install are going to be apps and
>> + # scripts, so let's chmod them like that.
>> + INSTALL_MODE			?= 00775
>> ++INSTALL_MODE_DIR		?= 00775
>> +
>> + $(abspath $(addprefix $(DESTDIR)/$(INSTALL_DIR)/,$(sort $(dir $(INSTALL_TARGETS) $(MAKE_TARGETS))))):
>> + 	mkdir -p "$@"
>> +diff --git a/include/mk/functions.mk b/include/mk/functions.mk
>> +index 60dbed395..8e4bc973c 100644
>> +--- a/include/mk/functions.mk
>> ++++ b/include/mk/functions.mk
>> +@@ -18,7 +18,7 @@ INSTALL_FILES		+= $$(abspath $$(DESTDIR)/$(3)/$(1))
>> +
>> + $$(abspath $$(DESTDIR)/$(3)/$(1)): \
>> +     $$(abspath $$(dir $$(DESTDIR)/$(3)/$(1)))
>> +-	install -m $$(INSTALL_MODE) $(shell test -d "$(2)/$(1)" && echo "-d") $(PARAM) "$(2)/$(1)" $$@
>> ++	install $(shell test -d "$(2)/$(1)" || echo "-m $(INSTALL_MODE)") $(shell test -d "$(2)/$(1)" && echo "-m $(INSTALL_MODE_DIR) -d") $(PARAM) "$(2)/$(1)" $$@
>> + 	$(shell test -d "$(2)/$(1)" && echo "install -m "'$$(INSTALL_MODE) $(PARAM)' "$(2)/$(1)/*" -t '$$@')
>> + endef
>> +
>> +--
>> +2.43.0
>> +
>> diff --git a/meta-arago-test/recipes-devtools/ltp-ddt/ltp_20260130.inc b/meta-arago-test/recipes-devtools/ltp-ddt/ltp_20260130.inc
>> index 4c19d870..560e9b4e 100644
>> --- a/meta-arago-test/recipes-devtools/ltp-ddt/ltp_20260130.inc
>> +++ b/meta-arago-test/recipes-devtools/ltp-ddt/ltp_20260130.inc
>> @@ -31,6 +31,7 @@ SRC_URI = "git://github.com/linux-test-project/ltp.git;branch=master;protocol=ht
>>              file://0001-Add-__clear_cache-declaration-for-clang.patch \
>>              file://0001-syscalls-semctl08-Skip-semctl08-when-__USE_TIME64_RE.patch \
>>              file://0001-ltp-fix-build-failure-with-glibc-2.43.patch \
>> +           file://0001-include-mk-Fix-installing-subdirs.patch \
> 
> If this is fixing ltp-ddt, then the patch should go to ltp-ddt recipe, not
> upstream ltp.
> 
> It could be applicable to upstream ltp, but I believe "ddt" is the only
> directory under runtest, so seems to be specific to ltp-ddt.

Agreed.  I'll send a v2.  but this will likely be a very short lived 
patch as we are patching the ltp-ddt repo itself too.


> 
>>             "
>>   
>>   inherit autotools-brokensep pkgconfig
>> -- 
>> 2.43.0

-- 
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS

