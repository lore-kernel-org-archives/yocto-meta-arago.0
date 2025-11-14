Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5A5A0CDB463
	for <webhook@archiver.kernel.org>; Fri, 14 Nov 2025 00:53:45 +0000 (UTC)
Received: from SA9PR02CU001.outbound.protection.outlook.com (SA9PR02CU001.outbound.protection.outlook.com [40.93.196.61])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7982.1763081621973891648
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 13 Nov 2025 16:53:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=selector1 header.b=roZVp9gb;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 40.93.196.61, mailfrom: reatmon@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Mqt6f7smbSzOHLMVw05y0it0c6Q+U8LEwLXVSuefFMtijlixP7uV+LPo9K6txX92yZGESxW0YOJZYVLPL3o84YVVRIuty+zKskpm3Qp+bU6DBxyi6ni0Yf5BoGfPpeekMY0XoKD4VEWTQMMgd6tkLwRdDm2Y+VwBSyIZMipwVZckfbVrRXPT6IjLEOlLkeKPJPqSVV9MFJbjFiURCH9lpZFELKMt5w2LFw3/GKMKCquuflWLantnke5A8yrLCiw2lKzBh2Yia3a6DRrSCydvNfgm2qqHKicfNHafrc2gVkdQ0KJnITi5NvFuJ+TVTFZ/ZG1wcVunBjCqAfBXH+jBQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=C7ucqpKw49t4uJKTnxMFadNnuZbphRMTn25Upa7qXdQ=;
 b=c/8pKfvyN1wIDJbRNOdc1rutL3W+nAMcB9ssujqGOVZMwlOwCiKiGgMcJq+McBE0IZW80glq7lDh2xo40XnKXJ57nn+QJb5jkXXBWyctcM8Ju2hoCRUITfUAW6ztUZJZkaOVCIInWJbiSoS8xvTahz01IV8iUyRIpKey6R1XZCl2nZSt2iFNiDst0pHZHafFDc+zQlrIWJYylwkp47iFO1AM7F+aCU0BMNnCq4jZx479rYn50zi5QlR9tGxBCBOmrpsLj46hkr/dWNUVStsNE0+kWateh42avo/wEzgQqAxj13O9vPcGgGUxiRD9IPzvIumR2xZHNqKFnDj1Sflh1Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=C7ucqpKw49t4uJKTnxMFadNnuZbphRMTn25Upa7qXdQ=;
 b=roZVp9gbqayE2bCJeLXRKEI3mJdzukjFzkNfpuXHKhDChv+WFH46x6plijpDH3jb6X0bV2WVU4ay5nEhZkAbTN0ylOpGnk4fz4VnxrgxpnOzb1A+Epb3WnaiC5u3rraG+QEut1C30sN1DiioavzhoyuRXFax/85yn4IS93JB0Mc=
Received: from PH7P223CA0007.NAMP223.PROD.OUTLOOK.COM (2603:10b6:510:338::8)
 by DS0PR10MB7362.namprd10.prod.outlook.com (2603:10b6:8:f9::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.15; Fri, 14 Nov
 2025 00:53:37 +0000
Received: from CY4PEPF0000EE35.namprd05.prod.outlook.com
 (2603:10b6:510:338:cafe::f1) by PH7P223CA0007.outlook.office365.com
 (2603:10b6:510:338::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9320.17 via Frontend Transport; Fri,
 14 Nov 2025 00:53:34 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 CY4PEPF0000EE35.mail.protection.outlook.com (10.167.242.41) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9320.13 via Frontend Transport; Fri, 14 Nov 2025 00:53:34 +0000
Received: from DLEE215.ent.ti.com (157.170.170.118) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 13 Nov
 2025 18:53:31 -0600
Received: from DLEE201.ent.ti.com (157.170.170.76) by DLEE215.ent.ti.com
 (157.170.170.118) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 13 Nov
 2025 18:53:31 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE201.ent.ti.com
 (157.170.170.76) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Thu, 13 Nov 2025 18:53:31 -0600
Received: from [10.249.34.12] ([10.249.34.12])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5AE0rVWg1157905;
	Thu, 13 Nov 2025 18:53:31 -0600
Message-ID: <04ce31ba-239c-4179-acd7-87e501730b79@ti.com>
Date: Thu, 13 Nov 2025 18:53:31 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-arago][scarthgap][PATCH 09/10] libyang: Do the version bump
 in a yocto-check-layer compliant manner
To: Denys Dmytriyenko <denis@denix.org>
CC: Praneeth Bajjuri <praneeth@ti.com>, Denys Dmytriyenko
	<denys@konsulko.com>, <meta-arago@lists.yoctoproject.org>
References: <20251113225017.22994-1-reatmon@ti.com>
 <20251113225017.22994-9-reatmon@ti.com> <20251113230957.GZ3125@denix.org>
Content-Language: en-US
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <20251113230957.GZ3125@denix.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EE35:EE_|DS0PR10MB7362:EE_
X-MS-Office365-Filtering-Correlation-Id: 07e1f60a-2259-4919-60da-08de23183d1d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700013|376014|82310400026|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?VTVPY05IcmtIUEtKME8xZDlTcHNoaFRCa21CbTlrTEZvU3pKdlYxMW42WVlW?=
 =?utf-8?B?OHo1dU8zK3NQcEJYNWdsR0tXTlRCWllhQnkxMVU5RmV1SGg2d1NueWVuVUNN?=
 =?utf-8?B?ajU3MXRacXM4R1B2YkI3aEdqSnFpZ3dUZ21oWHVGM1FDaVlNYlRIU2ZXMXBt?=
 =?utf-8?B?UTc5NGVyRS85STZYcm1qcEIxcWpHZ0Vkdm1iMVlsRnFTcklXckdKOUtCNXg3?=
 =?utf-8?B?Y3MwVVpCNzNLZ0dwL2hQOGtmNklrSmZpS284OElDWm5ROHRQU0NqTHVROXJY?=
 =?utf-8?B?UTg5R1dFU0tXQ0NJWnhLT2dhTnZubksxK2VUdmhpS0tZTTR4TjQ4OTM1Tk9S?=
 =?utf-8?B?VlVDNG9IVERMVkJvODl3b3U3NGxzSy9EbjdCRjc4aWpPTURBa1ErUjRtTHFN?=
 =?utf-8?B?dUszaGFXcTdsMHpKM2ppTUJLL2NIYW8vbzFJbU02MTZqV2lVNmlJY1Fnb0I2?=
 =?utf-8?B?OHJQS0Z2eWprS2pSampVa1p6b0p3WklrdzBWUGpSTGRWZjdxd3ZKZEoxZ2RE?=
 =?utf-8?B?RHNFdW1icWNKZDhGL3V5SXhlQU5Od1RNSmJtMUVUSldRcElaUFpOb0R1dm5X?=
 =?utf-8?B?S25xckIzM08vUW1Sdi9QRVlhRDNyYXZoOXliVGExajNoWjZjWk9yNzRCWjZz?=
 =?utf-8?B?WklqTUNCVlJWUGt5cFNUd09TZkxkeGtjdTAvQlF2ZnFvVm9jMnhJc1UzaDUv?=
 =?utf-8?B?VXVSd056YlIrc01kZjYxQjh3MW9FZEh5cVFucC9zYXlualF5dVppajExeHlD?=
 =?utf-8?B?K2ZxSUhucEZnREdDL29QcGNEUlJ0R2dLOTFVMElZZkZDbTVicGNNM2FzZmpa?=
 =?utf-8?B?K2k0Z0hNVlp3UGVoQkNKY1BueUVnSyszdm8yRkdQV0I2c2pFWSs5T0ZCa0hM?=
 =?utf-8?B?WExvcW5Pb2dJbVdma0l3V0laOXNvNXVGbjRvc0ZCRWw1WEhHNk9LZUgvMXFO?=
 =?utf-8?B?ZzViSlBhUXpZL3hNWVpBS2VYWGk5KzhZcU4waTRpNC9vbXVKYk5UcWJrdVhn?=
 =?utf-8?B?YllYdU9ISjgyZmlWLzVsRUV4SzhvV01sUmIyRUNtT3QvcnpqYjFHSEt5VWZC?=
 =?utf-8?B?a3ZNVVJEZ01yRkJ0S3NYWHFDUEkxTG1aUXdsVUNpNFdsYWlvTXFpVjBKTjEy?=
 =?utf-8?B?a1VKakhxTGNZL1pEbE5KVW52d0FScFBpYnNvV3UyZHZSRXNKUjc3RDJsRVJs?=
 =?utf-8?B?Mi9IZ25zZ1pGaUw4Rm9nT1VONFZKcEhhblRWY3YwZHg4TmNEem9LSk1JdVNu?=
 =?utf-8?B?anVZay9zOXBLYWlESmw5bGZJMDlHZURDVDZPTmtIc1QvcWN3MStDYUJvVmVN?=
 =?utf-8?B?dVNJL3pVd0NENmZvaGlBMGgwWXFDZXRsMW9wZ2FLK0dBUGRRM24xaG54bWUr?=
 =?utf-8?B?VTgwcjlORVBKT2NJYVpINkxGRDBCUFdURVRBam1xR3BJMmZrYWQ0Sm1VL1lv?=
 =?utf-8?B?b0I2OGU3bzFSbllwd3B4Q3YrNCtUZkxXc3Nta25jS3o4UndUUHpPQndyV0pp?=
 =?utf-8?B?d0FLTzRrSXBnajRCeEpuUlJjMFdHK0NERk9Ld3liVVhKc0tqQUtxdW5Bc3NI?=
 =?utf-8?B?eEJTVWFDNE82d2NueENjeTZGbEFlS2RVZEVnV0VTK3hlU2lXaDBCcm5uMHMx?=
 =?utf-8?B?Z2owc01LYUt1Vng1Wnc2QjR5SU5QSFBiNFQ4bHRXZjJVd1JZdU9JWG5sZ3hH?=
 =?utf-8?B?aGFVOXRuV1ErQ2RxRi9WUnZpcEtoYTdaR0pWeXI3RldtWWpCSFU2L2ZDRnMr?=
 =?utf-8?B?RFdVY1BTQldiUHErcnBvQXpSZ0pCbXdTSGZJNGRZRjE3bktpZFl5QVZIZnJx?=
 =?utf-8?B?T2RmSXJJMVZuRmluTVkxeGlIdFhRaElvYTgxUmJWZWE2elVEZU40aER1MGtv?=
 =?utf-8?B?UkFKdTFsdHRENHVxUHFTS2JSaFBhRnVXYTA3ZldVd3VsRytCc09lQWFpMHVm?=
 =?utf-8?B?S2JLWVdjK1pxNkJOSVJMcGlReUhsZ2tKVytoVGdGSjdBZEZ5K0pMbnJmVzBC?=
 =?utf-8?B?Q01RWHdjd2NXY09qOFZLZ2trcWIraDcyL2dmRitLQnZtSXVsbFo4T2ZjVG9M?=
 =?utf-8?B?b01IRHEwVUN1YnZvUFcyS2VKcHY5bFZCMGtCVi9WMUJsMVc0T3RkUlczcDU0?=
 =?utf-8?Q?d2bk=3D?=
X-Forefront-Antispam-Report: 
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(376014)(82310400026)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Nov 2025 00:53:34.4052
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 07e1f60a-2259-4919-60da-08de23183d1d
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CY4PEPF0000EE35.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR10MB7362
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Fri, 14 Nov 2025 00:53:45 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16767



On 11/13/2025 5:09 PM, Denys Dmytriyenko wrote:
> On Thu, Nov 13, 2025 at 04:50:16PM -0600, Ryan Eatmon via lists.yoctoproject.org wrote:
>> Yocto Project Compatibility requires that including a layer in a build
>> not change recipes in other layers.  In this case, we were providing a
>> newer version of a recipe that another layer provides.
>>
>> The proper way of doing this is to create a bbappend and only change the
>> minimal things needed to perform your changes.  Additionally, to pass
>> the yocto-check-layer the bbappend needs to be wrapped in a manner that
>> only applies your changes in the event that you are making use of your
>> layer.  For Arago, that means only if we are building Arago.
> 
> Thanks for this descriptive commit message - it captures reasoning and a
> proper solution! It is a great example we can refer to in the future.
> 
> 
>> Signed-off-by: Ryan Eatmon <reatmon@ti.com>
>> ---
>>   .../sysrepo/libyang-arago.inc                 |  9 ++++
>>   .../sysrepo/libyang_%.bbappend                |  5 +++
>>   .../recipes-extended/sysrepo/libyang_3.7.8.bb | 45 -------------------
>>   3 files changed, 14 insertions(+), 45 deletions(-)
>>   create mode 100644 meta-arago-extras/recipes-extended/sysrepo/libyang-arago.inc
>>   delete mode 100644 meta-arago-extras/recipes-extended/sysrepo/libyang_3.7.8.bb
>>
>> diff --git a/meta-arago-extras/recipes-extended/sysrepo/libyang-arago.inc b/meta-arago-extras/recipes-extended/sysrepo/libyang-arago.inc
>> new file mode 100644
>> index 00000000..b76701a8
>> --- /dev/null
>> +++ b/meta-arago-extras/recipes-extended/sysrepo/libyang-arago.inc
>> @@ -0,0 +1,9 @@
>> +PV = "3.7.8"
>> +
>> +LIC_FILES_CHKSUM = "file://LICENSE;md5=9bb3d334294e8719f41c531e28a9a697"
> 
> May want to explicitly mention why the checksum is different vs. upstream.

Since this was just a repackaging of the existing recipe, I didn't think 
it was needed to list all that out.

> 
>> +SRCREV = "03e294d83b610f89e8ba7b2156a80dc0ad534443"
>> +
>> +do_install:append () {
>> +    oe_multilib_header  libyang/ly_config.h
>> +}
>> diff --git a/meta-arago-extras/recipes-extended/sysrepo/libyang_%.bbappend b/meta-arago-extras/recipes-extended/sysrepo/libyang_%.bbappend
>> index 608377e3..60d1258e 100644
>> --- a/meta-arago-extras/recipes-extended/sysrepo/libyang_%.bbappend
>> +++ b/meta-arago-extras/recipes-extended/sysrepo/libyang_%.bbappend
>> @@ -1 +1,6 @@
>> +LIBYANG_ARAGO = ""
>> +LIBYANG_ARAGO:arago = "libyang-arago.inc"
>> +
>> +require ${LIBYANG_ARAGO}
>> +
>>   BBCLASSEXTEND = "native nativesdk"
>> diff --git a/meta-arago-extras/recipes-extended/sysrepo/libyang_3.7.8.bb b/meta-arago-extras/recipes-extended/sysrepo/libyang_3.7.8.bb
>> deleted file mode 100644
>> index 3bea9bc2..00000000
>> --- a/meta-arago-extras/recipes-extended/sysrepo/libyang_3.7.8.bb
>> +++ /dev/null
>> @@ -1,45 +0,0 @@
>> -SUMMARY = "YANG data modeling language library"
>> -DESCRIPTION = "libyang is a YANG data modelling language parser and toolkit written (and providing API) in C."
>> -HOMEPAGE = "https://github.com/CESNET/libyang"
>> -SECTION = "libs"
>> -LICENSE = "BSD-3-Clause"
>> -
>> -LIC_FILES_CHKSUM = "file://LICENSE;md5=9bb3d334294e8719f41c531e28a9a697"
>> -
>> -SRCREV = "03e294d83b610f89e8ba7b2156a80dc0ad534443"
>> -
>> -SRC_URI = "git://github.com/CESNET/libyang.git;branch=master;protocol=https \
>> -           file://0001-test_context-skip-test-case-test_searchdirs.patch \
>> -           file://run-ptest \
>> -           "
>> -
>> -S = "${WORKDIR}/git"
>> -
>> -# Main dependencies
>> -inherit cmake pkgconfig lib_package ptest multilib_header
>> -DEPENDS = "libpcre2"
>> -DEPENDS += "${@bb.utils.contains('PTEST_ENABLED', '1', 'cmocka', '', d)}"
>> -
>> -EXTRA_OECMAKE = "-DCMAKE_BUILD_TYPE=Release"
>> -EXTRA_OECMAKE += " ${@bb.utils.contains('PTEST_ENABLED', '1', '-DENABLE_TESTS=ON -DENABLE_VALGRIND_TESTS=OFF', '', d)}"
>> -
>> -do_compile:prepend () {
>> -    if [ ${PTEST_ENABLED} = "1" ]; then
>> -        sed -i -e 's|${S}|${PTEST_PATH}|g' ${B}/tests/tests_config.h
>> -        sed -i -e 's|${B}|${PTEST_PATH}|g' ${B}/tests/tests_config.h
>> -    fi
>> -}
>> -
>> -do_install:append () {
>> -        oe_multilib_header  libyang/ly_config.h
>> -}
>> -
>> -do_install_ptest () {
>> -    install -d ${D}${PTEST_PATH}/tests
>> -    cp -f ${B}/tests/utest_* ${D}${PTEST_PATH}/tests/
>> -    cp -fR ${S}/tests/modules ${D}${PTEST_PATH}/tests/
>> -    install -d ${D}${PTEST_PATH}/tests/plugins
>> -    cp -f ${B}/tests/plugins/plugin_*.so ${D}${PTEST_PATH}/tests/plugins/
>> -}
>> -
>> -FILES:${PN} += "${datadir}/yang/*"
>> -- 
>> 2.17.1

-- 
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS

