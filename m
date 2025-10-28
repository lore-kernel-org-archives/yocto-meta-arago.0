Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6333FCCD1BF
	for <webhook@archiver.kernel.org>; Tue, 28 Oct 2025 14:33:39 +0000 (UTC)
Received: from PH0PR06CU001.outbound.protection.outlook.com (PH0PR06CU001.outbound.protection.outlook.com [40.107.208.30])
 by mx.groups.io with SMTP id smtpd.web10.13359.1761662012867947047
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 28 Oct 2025 07:33:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=selector1 header.b=AEPsfJV2;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 40.107.208.30, mailfrom: reatmon@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WKY5AolATzuHkJIoVEJ5LILm8rZb0k2La0ghsB4LpmuqZKoKHAYiMY58ovDjZrXmU/cnGXkLN9T/HdbBH99XFeXKO6M9me9VbuA4fOjJmjwEKvrdrvpwePbxJ4YVbuWQVyB8VP9V7KGp5TJqUJ9cVih2X363K7ndpQMeBToKaQGg8tbACvFJNeZfBY3u7U5gm2A5DPJYdh2NSH4da/eM3XLwGFctzufBWdEw8WaL/WZlWNsRdY52o/zYlTFHFLvGZ8rGUwLqv9BH5z7FOm6pASmaIv9jXBJRegAZX8cCFL8CdeMuQCwykOKcOA/wYaEt5YV+XJ7XXteXWe7MenVlNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IWT3YAk7C4hjv9wC/GGqYzT6CL4d3MjTO/r7VltTrlY=;
 b=IIkZbU0jbEoV6B1M6Se86esc9w8YNERaRCG0ywVPilgTwmI1EjQMvW1t8ElgTXL0ISESF07677M90/034TmJRHF/82KhkL06XksWR+CLJQQqjgGgZNBhL1me7e8gLaek6DaayKv13q87qZRKDU74o9cg0IVhxg5y3dmNzDIvLmVcpfN0vVoUc0zSR70fcwcnCivhS8lPnB1JH/VeIqZ8gx3TTMtg/2GQK87rtbg81MKRgmcqfxIo989ldJmk1lUWDPSCKiOXCBcE2+azNEmOwoxrFvK4K0Ny1BeoYEQ5HtIlrgJKd9Pc6xxTWD2uQfv98QHvt+lX7MiuKJDBh9q+lA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IWT3YAk7C4hjv9wC/GGqYzT6CL4d3MjTO/r7VltTrlY=;
 b=AEPsfJV2ZLrklVQ+rnh/NDVjpNMp6yQgaGH85HpRqoekZgiG1lzjtc0adRdO6fcAgk1ZNrwm2dHZN+kAMgGGWHwkP4Ikj0qH5BIlPhslm+xxM/6bRxU2a3TlYxrrMkWA0TlLJDHEwOCdw8hAylkMQQh9ddiRXazgPrleEQeLLCQ=
Received: from BN0PR04CA0115.namprd04.prod.outlook.com (2603:10b6:408:ec::30)
 by BLAPR10MB5089.namprd10.prod.outlook.com (2603:10b6:208:330::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.17; Tue, 28 Oct
 2025 14:33:30 +0000
Received: from BN1PEPF00004682.namprd03.prod.outlook.com
 (2603:10b6:408:ec:cafe::b9) by BN0PR04CA0115.outlook.office365.com
 (2603:10b6:408:ec::30) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9253.18 via Frontend Transport; Tue,
 28 Oct 2025 14:33:29 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 BN1PEPF00004682.mail.protection.outlook.com (10.167.243.88) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9275.10 via Frontend Transport; Tue, 28 Oct 2025 14:33:29 +0000
Received: from DLEE203.ent.ti.com (157.170.170.78) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 28 Oct
 2025 09:33:28 -0500
Received: from DLEE212.ent.ti.com (157.170.170.114) by DLEE203.ent.ti.com
 (157.170.170.78) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 28 Oct
 2025 09:33:28 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE212.ent.ti.com
 (157.170.170.114) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Tue, 28 Oct 2025 09:33:28 -0500
Received: from [128.247.81.40] (dtmz023nlvx.dhcp.ti.com [128.247.81.40])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 59SEXSm02454375;
	Tue, 28 Oct 2025 09:33:28 -0500
Message-ID: <b691d7b5-2db9-417e-b448-701c09b0cc3a@ti.com>
Date: Tue, 28 Oct 2025 09:33:28 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-arago][scarthgap/master][PATCH] meta-arago-test: Add
 CoreMark CPU benchmark
To: Yogesh Hegde <y-hegde@ti.com>, <s-sadik@ti.com>
CC: <meta-arago@lists.yoctoproject.org>, Veeramachaneni Prudhvi
	<prudhvi@ti.com>
References: <20251028092806.3840575-1-s-sadik@ti.com>
 <20251028112435.g4gy2qtbes22i7uk@yogi-work-pc>
Content-Language: en-US
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <20251028112435.g4gy2qtbes22i7uk@yogi-work-pc>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF00004682:EE_|BLAPR10MB5089:EE_
X-MS-Office365-Filtering-Correlation-Id: ac10e4c3-0b4e-4449-d124-08de162ef686
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|4022899009|376014|1800799024|82310400026|36860700013|34070700014|34020700016;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?bmpzR1NTNHd3V0Y1eUdEYzQyc2pPNGkrcndGY3ZPcGhOQTIxdksrcjViUFRK?=
 =?utf-8?B?M2UwdHFMQzh2anN3Q0tLczVRMmxVS0wxaWNiQTQreE5oWGJoeVZFZGJoSkt4?=
 =?utf-8?B?ay9PUDBHZ3A3Y0hic2VObUFZWkRxdkN1UWlEdkhERHhxT3RpYTRVQXNRK1lK?=
 =?utf-8?B?WEJJM1g0Y0NOYkp1OTl1dkRjUHpaVHlPNW5qQ3NTYUh3Rm1OczFYd29pR0hD?=
 =?utf-8?B?aDZPbENhYXVidnNBTStuVVBCaHJwMDdEMHBVOTRIZkJ5ZGhaUDZQK2hzSWhj?=
 =?utf-8?B?SlpIbDlDcTdoZnIwUVkvRzBkcEFMcURobThQZm9nNkNheXFoakNoK3MyRE9M?=
 =?utf-8?B?VXZUTFBtUHA4ZnBFSVN6NU1wd05VdUw4amdYSXR3ODUvMGNmaktqdEhQaGxr?=
 =?utf-8?B?a3JLSWMycFpHWldtUGh2TzB4Ty8xNEJzbXp1UnRGRGFjdUJvekFFQmRrU2lq?=
 =?utf-8?B?b1JYVTR3RHdFS3BMWEZSdk5aQ0g3eE9DaEwwa1BnQnhONCtpQllrTWczNG42?=
 =?utf-8?B?czdOWHk4Q0NQVjY1eWZPMTlCUUdKem5xWmZ0OW8wTVpkYVAwZVozeHBDQjhq?=
 =?utf-8?B?ZkdCWEh5aEJXZnBIYW54TVIydGRVTXd2Umdqc3JLTmFHMFNNY3VsUkJsUzlO?=
 =?utf-8?B?VFNzVFEzU2pqWk5JUlRIRW1ZV29FaWhzcVdhL2t5ZjBQL3JIMXZzSkdyWGpr?=
 =?utf-8?B?TU51QmNsUFYwRUtKUGx6YUIzQmZ3d3luT3hPc3J6cTlOYit3WDlGM3dISktt?=
 =?utf-8?B?Nnc5bHRoM3RtZHhsR0t5ejVjTmgzTkNEbThuSlFEc0FQUFFFbEJ6UEQ5eEZB?=
 =?utf-8?B?MVNkbmpCN0pQQkdIeDB5TFQyRk44cC9nc0l3T2c0SERNUThJczlZdFZFN3dJ?=
 =?utf-8?B?engzaGJWNWN6eTgzZk1kMTlxc0FYT3BXU3JKYXB6dW5QeVFQY0VFeTVHVXFT?=
 =?utf-8?B?VUxkdnFQcktSVkQvTVlIWmJ3L0NNYXFoTVAzWlNFUmowSDZERE9iVStFVXVz?=
 =?utf-8?B?UnlPVjhxaGhMNlBtMlU3M1A0a09kSnR6RDR1UTQ1VUNSOVQrdXR0ckpiRVM4?=
 =?utf-8?B?VU8yTm80S29mZEF2cVdDWUc1MEpMbHhuRzg0YXhTaFRwTW95YmhROGlUaE9n?=
 =?utf-8?B?K2hQSHlSUGF2VmNMdW0rVG1penNUaElnUHptTGUxdmhod2t2VVJXYkFRTW1M?=
 =?utf-8?B?WndwaEZxUnNaaVFoRlV3VVBWTmQ5OUhPaDd6ZGpzZmJMejNORnh4Q1FFdEpP?=
 =?utf-8?B?b2w0TzdFcUtSV3FESitobkl2S1BtQVNlVXpSbUhvTDNDbnRpcCs5eDAzWXEy?=
 =?utf-8?B?a0VQTlRTcGNBMEVQTmYyYmtMczR3YkZ4MEpUaDRrT25mNnBQYURQTzNFaE8r?=
 =?utf-8?B?UER6K20xNFBkYVFONVBkd2dNeCs2dlFTYXJnb3VuejFMb05nK0Q4NWRQZUgx?=
 =?utf-8?B?VDVYWmFtNGcvNll3c2RpUjdPL2NDMmVBcklWajlvTkgzM2l4UVpTTUwweVN5?=
 =?utf-8?B?SEpVOU9QdU9wSFNEME9sWkd0VnlKZHQ1OXd5VEZlVVNSLzNwNm8yUktoNkJi?=
 =?utf-8?B?WE5HQnlnSXNnS2ZQVHhhUXQya1FBa2FrR2pmaGN1S01FMWQyKzFZUVFGOEc1?=
 =?utf-8?B?VElCSmc4YVNmdC96QjBtWnF1UGdlc09MTWpsb0tPRjB0eC9odVVTV0ZJRkxm?=
 =?utf-8?B?bjh4THdPQUxJY0dXS0FIcEU1Wjh6RlA2WENOSDFXRkUyWk1HNzB6YjBsZlZr?=
 =?utf-8?B?OTFYOUU5M3NWS3dlTnZtUHphYWhWWUxxeklTTXVsWTN5UWhOd1k4eE5JK012?=
 =?utf-8?B?L3QwQzJqVld2eHM0ZFlrcjQ3T0xkeW1qWHl2UzVFY21TWDVvdERmUko5dVFT?=
 =?utf-8?B?NFJkeUlMekxzamNKMUtpM0VWaEliRk12YnE1Qko5cG1oM2g3aGxNNy9GeUlh?=
 =?utf-8?B?aE9DU3ZFcHhpNXFYbmcxRW44dHloTVFVUzJXdzJmWTBPSXlPNEJzeTdPTi96?=
 =?utf-8?Q?azUJ57zkY4IFVXiPddQrZmk+zfiG7Q=3D?=
X-Forefront-Antispam-Report: 
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(4022899009)(376014)(1800799024)(82310400026)(36860700013)(34070700014)(34020700016);DIR:OUT;SFP:1101;
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Oct 2025 14:33:29.2298
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ac10e4c3-0b4e-4449-d124-08de162ef686
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BN1PEPF00004682.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLAPR10MB5089
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 28 Oct 2025 14:33:39 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16709



On 10/28/2025 6:24 AM, Yogesh Hegde wrote:
> Hi Sadik,
> On 14:58-20251028, Sadik via lists.yoctoproject.org wrote:
>> From: sadik <s-sadik@ti.com>
>>
>> Add CoreMark benchmark recipe to measure CPU
>> performance on TI platforms,Integrate CoreMark
>> into ti-test package group alongside arm-benchmarks.
>>
>> CoreMark is an industry-standard CPU benchmark from EEMBC
>> (Embedded Microprocessor Benchmark Consortium) that provides
>> a standardized method to test the performance of processors.
>>
>> Signed-off-by: sadik <s-sadik@ti.com>
>> ---
>>   .../recipes-benchmark/coremark/coremark.bb    | 24 +++++++++++++++++++
>>   .../recipes-core/packagegroups/ti-test.bb     |  1 +
>>   2 files changed, 25 insertions(+)
>>   create mode 100644 meta-arago-test/recipes-benchmark/coremark/coremark.bb
>>
>> diff --git a/meta-arago-test/recipes-benchmark/coremark/coremark.bb b/meta-arago-test/recipes-benchmark/coremark/coremark.bb
>> new file mode 100644
>> index 00000000..330adeda
>> --- /dev/null
>> +++ b/meta-arago-test/recipes-benchmark/coremark/coremark.bb
>> @@ -0,0 +1,24 @@
>> +SUMMARY = "The benchmark utility to measure the performance of CPU"
>> +
>> +LICENSE = "CLOSED"
>> +LIC_FILES_CHKSUM = "file://LICENSE.md;md5=0a18b17ae63deaa8a595035f668aebe1"
>> +
> 
> AFAIR CoreMark uses Apache 2.0 license. LICENSE = "CLOSED" contradicts the LIC_FILES_CHKSUM entry.

Given that the actual License file is the Apache license plus a blurb at 
the top from Coremark, we should probably follow the model that the 
stream recipe is doing.

Copy the LICENSE.md file to meta-arago-test/licenses/Coremark and then say:
LICENSE = "Coremark"


>> +SRC_URI = "git://github.com/eembc/coremark.git;branch=main;protocol=https"
>> +SRCREV = "d5fad6bd094899101a4e5fd53af7298160ced6ab"
>> +
>> +S = "${WORKDIR}/git"

This patch was written for and against scarthgap.  master has made big 
changes to the structure of the workdir and this recipe is not correct 
for master.

You will need to submit two patches using the two different sets of 
variables.  You should not set S on the master patch.


>> +TARGET_CC_ARCH += "${LDFLAGS}"
> 
> Above line incorrectly adds LDFLAGS to TARGET_CC_ARCH, using  oe_runmake
> instead of `make compile` should handle the LDFLAGS. Best to remove it.

Actually, in testing this and looking at some other recipes, I think 
this is the best way of doing it.  I tried using oe_runmake and removing 
this variable and got failures since the LDFLAGS were missing from the 
build.

Denys?  Any comments?


>> +
>> +do_compile() {
>> +	make compile
> 
> `make compile` ignores Yocto's toolchain variables. Best to use oe_runmake
> instead.
> 
>> +}

In this case: oe_runmake compile

>> +
>> +do_install() {
>> +	install -d ${D}${bindir}
>> +	install -m 0755 coremark.exe ${D}${bindir}
>> +	mv ${D}${bindir}/coremark.exe ${D}${bindir}/coremark
> 
> Here you are copying the coremark.exe and then renaming it, you can do
> it all in one go using install.
> 
> for eg: install -m 0755 coremark.exe ${D}${bindir}/coremark
> 
> Additionally you are assuming that the coremark.exe will
> always be present in the current working dir, best practice is
> to mention the correct path using the Yocto variables.
> 
> for eg: install -m 0755 ${S}/coremark.exe ${D}${bindir}/coremark

Agreed.

> 
>> +}
>> +
>> + COMPATIBLE_HOST = '(i.86|x86_64|arm|aarch64).*-linux'

Why do we need COMPATIBLE_HOST?  Is coremark only truly compatible with 
those architectures?

>> +
>> +SRC_URI[sha256sum] = "d003ed54134a0d365c0d5d8dc828432d610d1d1f77b8f58457cf1e599ad13f17"
> 
> SRC_URI[sha256sum] is for tarballs, not git fetchers. It would be best to remove it entirely.

Agreed.


>> diff --git a/meta-arago-test/recipes-core/packagegroups/ti-test.bb b/meta-arago-test/recipes-core/packagegroups/ti-test.bb
>> index c1166bc2..2c4b097e 100644
>> --- a/meta-arago-test/recipes-core/packagegroups/ti-test.bb
>> +++ b/meta-arago-test/recipes-core/packagegroups/ti-test.bb
>> @@ -88,6 +88,7 @@ TI_TEST_BASE:append:armv7ve = " \
>>   #    timestamping
>>   TI_TEST_TI_TOOLS = " \
>>       arm-benchmarks \
>> +    coremark \
>>       arm-ddr-bandwidth \

This is not alphabetical, please move the coremark down.

>>       cpuloadgen \
>>       input-utils \
>> -- 
>> 2.34.1
>>
>>
>>
>> -=-=-=-=-=-=-=-=-=-=-=-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#16707): https://lists.yoctoproject.org/g/meta-arago/message/16707
>> Mute This Topic: https://lists.yoctoproject.org/mt/115990643/9980049
>> Group Owner: meta-arago+owner@lists.yoctoproject.org
>> Unsubscribe: https://lists.yoctoproject.org/g/meta-arago/unsub [y-hegde@ti.com]
>> -=-=-=-=-=-=-=-=-=-=-=-
>>
>>
> - Yogesh

-- 
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS


