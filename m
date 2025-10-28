Return-Path: <y-hegde@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CDA56CCD1BF
	for <webhook@archiver.kernel.org>; Tue, 28 Oct 2025 11:24:47 +0000 (UTC)
Received: from SA9PR02CU001.outbound.protection.outlook.com (SA9PR02CU001.outbound.protection.outlook.com [40.93.196.36])
 by mx.groups.io with SMTP id smtpd.web11.5948.1761650682380560850
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 28 Oct 2025 04:24:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=selector1 header.b=e39/BKOW;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 40.93.196.36, mailfrom: y-hegde@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LjAM5kiLD+gOmjU2XGhkvnQV6X7/UEW2HcgiMUmX31LD6QjNV00JFGm047OTeur0jBYgwA1G6XTkR0T9JUwLpFM7DXXKAHq7YbvAwsC4PqjnJAKxJWYJrnKny2v9Xc/tTr/BFaL8EK0w+xcMkbhFGlkO69S7XDnOYPBUtZCOhR6V+BDEOVllYEBFtu4xVeiGq+1ZDZE/0hdJ6UIEYbaJ/JPQ51t9c1ufkBqU5m43XQ4+d10hU6HH5xVhO/L7XJGvXrwc/qqNcqxEn0AGd8b3KHpJsFDXLcuY6dGzF2VPpGzqw0mJ7GeCIQjWgyxVhHd/+24N3xZECM+po4oU6rwHsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oj9gHlxxaL8VhBcmYgq78XrXUkt1w/p1tqpyGfjf1Ag=;
 b=Lvxj7SHgS9jSopkspdiFFQIjBI6+7MOcWI5OQyxoUcBi62vNOQp+yXss6dFmXFcCr99rbFg6c0GH33ioFFOZpo4wloTHO/3SXSPYBxT3yMDSytmr9i8HRv/BCiHWLDl6jdQt4EgQHMvdfu9bB+r03BOvXDXwLfNOCQrkeNF69PLN7e2W9vaRqaGdQ8EzIIRmhmeB0bJVj1ghUaBZDlZaVy+tibFdK/ygxztZl90MC2nGQSh2hqSCRts1Gmi1/yrFpdkZRo+bQDYUatLTBJPU004M4o07JpoqE2K1ftrv++qAGsPMpIF/UX9V9BzKOBDiP0/vsqzaj6s86KnOZpmDhg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oj9gHlxxaL8VhBcmYgq78XrXUkt1w/p1tqpyGfjf1Ag=;
 b=e39/BKOWV5cNRY03MTLPy7y/ohWbomNIFzhrvmW1zWi97wGFOthme99IzvSSEIqoQeoip+gEqN6u2Wrk2W2a1cyqr7HS71hDWee/T8qSbWlAtYN9oBiLeLCGnmI1hQdgjT0qmHCpI60o2L3TReE6wbj2qXea1hGlgtXmlS9wq4c=
Received: from BL1PR13CA0093.namprd13.prod.outlook.com (2603:10b6:208:2b9::8)
 by SJ2PR10MB7706.namprd10.prod.outlook.com (2603:10b6:a03:56f::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.18; Tue, 28 Oct
 2025 11:24:39 +0000
Received: from BL6PEPF0001AB74.namprd02.prod.outlook.com
 (2603:10b6:208:2b9:cafe::4a) by BL1PR13CA0093.outlook.office365.com
 (2603:10b6:208:2b9::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9275.12 via Frontend Transport; Tue,
 28 Oct 2025 11:24:35 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 BL6PEPF0001AB74.mail.protection.outlook.com (10.167.242.167) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9275.10 via Frontend Transport; Tue, 28 Oct 2025 11:24:37 +0000
Received: from DFLE205.ent.ti.com (10.64.6.63) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 28 Oct
 2025 06:24:37 -0500
Received: from DFLE203.ent.ti.com (10.64.6.61) by DFLE205.ent.ti.com
 (10.64.6.63) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 28 Oct
 2025 06:24:36 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE203.ent.ti.com
 (10.64.6.61) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Tue, 28 Oct 2025 06:24:36 -0500
Received: from localhost (yogi-work-pc.dhcp.ti.com [172.24.233.158])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 59SBOZTO2252855;
	Tue, 28 Oct 2025 06:24:36 -0500
Date: Tue, 28 Oct 2025 16:54:35 +0530
From: Yogesh Hegde <y-hegde@ti.com>
To: <s-sadik@ti.com>
CC: <meta-arago@lists.yoctoproject.org>, Ryan Eatmon <reatmon@ti.com>,
	Veeramachaneni Prudhvi <prudhvi@ti.com>
Subject: Re: [meta-arago][scarthgap/master][PATCH] meta-arago-test: Add
 CoreMark CPU benchmark
Message-ID: <20251028112435.g4gy2qtbes22i7uk@yogi-work-pc>
References: <20251028092806.3840575-1-s-sadik@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20251028092806.3840575-1-s-sadik@ti.com>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB74:EE_|SJ2PR10MB7706:EE_
X-MS-Office365-Filtering-Correlation-Id: 979a7078-335b-4afb-6431-08de1614948c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|34070700014|36860700013|4022899009|376014|82310400026;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?IzwiMtiLSrNN+3T2DcUfmLsxCqfsThl44v+G1DRPdhcKSX7CALmOxzUNUeLn?=
 =?us-ascii?Q?kub9DNs3DeIySFDVYTR0M98sYNJOCIURvmafjKygKJtdVnt3L9/JvXZNzlwE?=
 =?us-ascii?Q?git/ehvFHiMLgBJz7HbjJkRUppbSmAzghTOe1/2w/5/naeVsnm6r+Fhh0iDN?=
 =?us-ascii?Q?EVd5npRsuHuoNjECgstVHEi4CTWzI08gFI6+xPPkK52dNNby48H6SLLFlqR+?=
 =?us-ascii?Q?NAtrByYcGtqcT9PP4Pt1qj+8d4udOogkNzQy8jFC097kW2Y/7Up1sIpEJa+0?=
 =?us-ascii?Q?spfBnZgS7/3BclrzR3paZhyjjv0KgG6ItuQIiBlddQgz3l95M42OXciCPAOv?=
 =?us-ascii?Q?0jM5+nDk3Fp2me5mqDiubu70YqhJ+XB8W8wTUglcREwH9cpOgrTI6ymxE2m9?=
 =?us-ascii?Q?lc11ljNeCx7ffLLM7cCHeKdRZoEDREnOQ3F88NriLTpC3ksP9hwusCurm2aP?=
 =?us-ascii?Q?LXr1x2KVfraxSc3HzCeK3nvHFrYH4xmouuY8H1Ov9xOFZllkd6HMsQpN1Fd4?=
 =?us-ascii?Q?a5IFJ5Wo3jkDLMj71+ENSN+tz02YHTBMCnwb7SkQCjo0/GN5cKBUhnw3c61j?=
 =?us-ascii?Q?amx+0R5gzjgPUwOlGy90ptFxssD8vpqke8AfTD2FO43ecjZNBj5odTZrwqd8?=
 =?us-ascii?Q?Uln0hPTMiQpQx8f9/07HlaWx7GC6KHmWvsWN4idLhyXpd+uzDgCeahfXlUa/?=
 =?us-ascii?Q?/Zg8oRdxnYmXRpUREjc3QbaMiMUjeWOxyR/FtSvB6vSL1mTCftL/2IqBDXc2?=
 =?us-ascii?Q?Sh1+3mE7w8emK5U12OK/XFKDN5vkYacX+DG6EmRZ2gVNtMhuAKzRDvdM0EsQ?=
 =?us-ascii?Q?DnJroB7I97J0JKQv5OzFfF13WbmRfsOYyTl78Syg+awNH3dpPNBIEhtoPmQr?=
 =?us-ascii?Q?z5o2tLPd8vUPp5ET5entcIrWuvFnrZeXHrtjFxaw4zBEnCr6riTX39MNZqa5?=
 =?us-ascii?Q?uxiCZ0vJxC7eed6SHsjMukBnj8mZsPblSkO3O4ifX0xOwdpjIj91wLECVZ3X?=
 =?us-ascii?Q?B1KzYgL+hA82Kgn4a/wHWpjjvtl2WgGqL3H9Z4TahJS9pM7SsJxtlFc360JT?=
 =?us-ascii?Q?7utnE8fuLEIWSvdiw4hWjf5asrLOVArDe71ktWrGJd/81yxbAE+cpIIf1d0g?=
 =?us-ascii?Q?KHuPXTBBy3YV31K311zLvpRgmRqQ5p2zVdClYK8yYF8jHKIlduDOvnI29Nd2?=
 =?us-ascii?Q?spzTrF0uzNOt0xLq0dpeqkhCTg8dRxr6fDsUBDpkQ5kNkOod8GyNhvGVPYkX?=
 =?us-ascii?Q?G2V+BiOrfBZevYABA0S/M+i/Ms5Uom5sJdMFGQhd79G28mFnJClxqcEJ7FP2?=
 =?us-ascii?Q?wgsx+dxwuY/RK8SQilBnu+VYXacdB0lkTEekHcW4aoNf6bqPAjhUSJftC/bZ?=
 =?us-ascii?Q?8lJGUhn/swlfJ0kqt32xG3Nb7xUQPLL6Y1gUN9JsxYmqn1eg+gIH1CqgV/8f?=
 =?us-ascii?Q?0eoXnHUBeFFt1/7qOJgmwXTEQFRXFKm8cdQ/YBU8Dc+IAVh4hDyqm53+xugR?=
 =?us-ascii?Q?U5/wog+scj2WvhA=3D?=
X-Forefront-Antispam-Report: 
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(1800799024)(34070700014)(36860700013)(4022899009)(376014)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Oct 2025 11:24:37.9273
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 979a7078-335b-4afb-6431-08de1614948c
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BL6PEPF0001AB74.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR10MB7706
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 28 Oct 2025 11:24:47 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16708

Hi Sadik, 
On 14:58-20251028, Sadik via lists.yoctoproject.org wrote:
> From: sadik <s-sadik@ti.com>
> 
> Add CoreMark benchmark recipe to measure CPU
> performance on TI platforms,Integrate CoreMark
> into ti-test package group alongside arm-benchmarks.
> 
> CoreMark is an industry-standard CPU benchmark from EEMBC
> (Embedded Microprocessor Benchmark Consortium) that provides 
> a standardized method to test the performance of processors.
> 
> Signed-off-by: sadik <s-sadik@ti.com>
> ---
>  .../recipes-benchmark/coremark/coremark.bb    | 24 +++++++++++++++++++
>  .../recipes-core/packagegroups/ti-test.bb     |  1 +
>  2 files changed, 25 insertions(+)
>  create mode 100644 meta-arago-test/recipes-benchmark/coremark/coremark.bb
> 
> diff --git a/meta-arago-test/recipes-benchmark/coremark/coremark.bb b/meta-arago-test/recipes-benchmark/coremark/coremark.bb
> new file mode 100644
> index 00000000..330adeda
> --- /dev/null
> +++ b/meta-arago-test/recipes-benchmark/coremark/coremark.bb
> @@ -0,0 +1,24 @@
> +SUMMARY = "The benchmark utility to measure the performance of CPU"
> +
> +LICENSE = "CLOSED"
> +LIC_FILES_CHKSUM = "file://LICENSE.md;md5=0a18b17ae63deaa8a595035f668aebe1"
> +

AFAIR CoreMark uses Apache 2.0 license. LICENSE = "CLOSED" contradicts the LIC_FILES_CHKSUM entry.

> +SRC_URI = "git://github.com/eembc/coremark.git;branch=main;protocol=https"
> +SRCREV = "d5fad6bd094899101a4e5fd53af7298160ced6ab"
> +
> +S = "${WORKDIR}/git"
> +TARGET_CC_ARCH += "${LDFLAGS}"

Above line incorrectly adds LDFLAGS to TARGET_CC_ARCH, using  oe_runmake
instead of `make compile` should handle the LDFLAGS. Best to remove it.

> +
> +do_compile() {
> +	make compile

`make compile` ignores Yocto's toolchain variables. Best to use oe_runmake 
instead. 

> +}
> +
> +do_install() {
> +	install -d ${D}${bindir}
> +	install -m 0755 coremark.exe ${D}${bindir}
> +	mv ${D}${bindir}/coremark.exe ${D}${bindir}/coremark

Here you are copying the coremark.exe and then renaming it, you can do
it all in one go using install. 

for eg: install -m 0755 coremark.exe ${D}${bindir}/coremark 

Additionally you are assuming that the coremark.exe will 
always be present in the current working dir, best practice is 
to mention the correct path using the Yocto variables.

for eg: install -m 0755 ${S}/coremark.exe ${D}${bindir}/coremark

> +}
> +
> +COMPATIBLE_HOST = '(i.86|x86_64|arm|aarch64).*-linux'
> +
> +SRC_URI[sha256sum] = "d003ed54134a0d365c0d5d8dc828432d610d1d1f77b8f58457cf1e599ad13f17"

SRC_URI[sha256sum] is for tarballs, not git fetchers. It would be best to remove it entirely.

> diff --git a/meta-arago-test/recipes-core/packagegroups/ti-test.bb b/meta-arago-test/recipes-core/packagegroups/ti-test.bb
> index c1166bc2..2c4b097e 100644
> --- a/meta-arago-test/recipes-core/packagegroups/ti-test.bb
> +++ b/meta-arago-test/recipes-core/packagegroups/ti-test.bb
> @@ -88,6 +88,7 @@ TI_TEST_BASE:append:armv7ve = " \
>  #    timestamping
>  TI_TEST_TI_TOOLS = " \
>      arm-benchmarks \
> +    coremark \
>      arm-ddr-bandwidth \
>      cpuloadgen \
>      input-utils \
> -- 
> 2.34.1
> 
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#16707): https://lists.yoctoproject.org/g/meta-arago/message/16707
> Mute This Topic: https://lists.yoctoproject.org/mt/115990643/9980049
> Group Owner: meta-arago+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-arago/unsub [y-hegde@ti.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 
>
- Yogesh

