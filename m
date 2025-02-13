Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 14119C0219D
	for <webhook@archiver.kernel.org>; Thu, 13 Feb 2025 15:02:22 +0000 (UTC)
Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
 by mx.groups.io with SMTP id smtpd.web11.12896.1739458932394444941
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 13 Feb 2025 07:02:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=d2QLFvn5;
 spf=pass (domain: ti.com, ip: 198.47.19.246, mailfrom: reatmon@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 51DF290c4025500
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Thu, 13 Feb 2025 09:02:09 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1739458929;
	bh=XAw5nRwvJdGfzAQMjxieYT4u6GFsczzwABvODdpXCik=;
	h=Date:Subject:To:References:From:In-Reply-To;
	b=d2QLFvn5q3iR02VjKjjHGzwY5siGI8QE8UVvYopMzUTY/3X+ULiJ2k5niPiiPatcd
	 HuqYHXGfqK5WrKnNrSkVvhFW3wEOyZ9TDehSbLIQMthlBBzP82fNGWGFytiJyUYf2a
	 xsxcdg0bIV+kHps9dhlRq8PPmKjbw0FrZ0oCd1kU=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTP id 51DF29lR123786;
	Thu, 13 Feb 2025 09:02:09 -0600
Received: from DFLE106.ent.ti.com (10.64.6.27) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 13
 Feb 2025 09:02:08 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE106.ent.ti.com
 (10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 13 Feb 2025 09:02:08 -0600
Received: from [128.247.81.69] (dtmxl9433pnr.dhcp.ti.com [128.247.81.69])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 51DF284V124169;
	Thu, 13 Feb 2025 09:02:08 -0600
Message-ID: <0ada3051-5e84-4a3b-a682-632475f852b0@ti.com>
Date: Thu, 13 Feb 2025 09:02:08 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-arago][master/scarthgap][PATCH] meta-arago-test: ltp-ddt:
 Update to 20250130
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-arago@lists.yoctoproject.org>
References: <1823CC71DFCF2BC3.31116@lists.yoctoproject.org>
Content-Language: en-US
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <1823CC71DFCF2BC3.31116@lists.yoctoproject.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Thu, 13 Feb 2025 15:02:22 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15844


There are errors with this patch...  I'll need to send a v2.

On 2/13/2025 8:57 AM, Ryan Eatmon via lists.yoctoproject.org wrote:
> Update the version of ltp-ddt to 2025.10.
> 
> In order to work towards Yocto compliance for this repository we need to
> address the manner in which ltp-ddt was setup.  Copying in the ltp
> recipe can create a situation where we are providing an alternative and
> maybe newer version of ltp that would violate the compliance checks.  We
> also do not want to copy all of the settings from the ltp recipe.  So we
> can change it from a .bb to a .inc file which we can still require and
> maintain the ltp-ddt recipe as an overlay on top the ltp settings.
> 
> Additionally, remove the PROVIDES for ltp since technically we are not
> ltp proper.
> 
> Signed-off-by: Ryan Eatmon <reatmon@ti.com>
> ---
>   .../{ltp-ddt_20240129.bb => ltp-ddt_20250130.bb}  |  6 ++----
>   .../{ltp_20240129.inc => ltp_20250130.inc}        | 15 ++++++---------
>   2 files changed, 8 insertions(+), 13 deletions(-)
>   copy meta-arago-test/recipes-devtools/ltp-ddt/{ltp-ddt_20240129.bb => ltp-ddt_20250130.bb} (89%)
>   copy meta-arago-test/recipes-devtools/ltp-ddt/{ltp_20240129.inc => ltp_20250130.inc} (88%)
> 
> diff --git a/meta-arago-test/recipes-devtools/ltp-ddt/ltp-ddt_20240129.bb b/meta-arago-test/recipes-devtools/ltp-ddt/ltp-ddt_20250130.bb
> similarity index 89%
> copy from meta-arago-test/recipes-devtools/ltp-ddt/ltp-ddt_20240129.bb
> copy to meta-arago-test/recipes-devtools/ltp-ddt/ltp-ddt_20250130.bb
> index 2567d820..6ddbfbe4 100644
> --- a/meta-arago-test/recipes-devtools/ltp-ddt/ltp-ddt_20240129.bb
> +++ b/meta-arago-test/recipes-devtools/ltp-ddt/ltp-ddt_20250130.bb
> @@ -12,14 +12,12 @@ PE = "1"
>   PR = "r1"
>   PV:append = "+git"
>   
> -SRCREV = "34602e4308a8c276bddfc0b4984b387037574f5c"
> -BRANCH ?= "master"
> +SRCREV = "551467bce4c38af24c9c98843770fdfe45e1e253"
> +BRANCH ?= "cicd"
>   
>   SRC_URI:remove = "git://github.com/linux-test-project/ltp.git;branch=master;protocol=https"
>   SRC_URI:prepend = "git://git.ti.com/git/test-automation/ltp-ddt.git;protocol=https;branch=${BRANCH} "
>   
> -SRC_URI += " file://0001-reatmon-test.patch"
> -
>   export prefix = "/opt/ltp"
>   export exec_prefix = "/opt/ltp"
>   
> diff --git a/meta-arago-test/recipes-devtools/ltp-ddt/ltp_20240129.inc b/meta-arago-test/recipes-devtools/ltp-ddt/ltp_20250130.inc
> similarity index 88%
> copy from meta-arago-test/recipes-devtools/ltp-ddt/ltp_20240129.inc
> copy to meta-arago-test/recipes-devtools/ltp-ddt/ltp_20250130.inc
> index f8e6d398..1a353a19 100644
> --- a/meta-arago-test/recipes-devtools/ltp-ddt/ltp_20240129.inc
> +++ b/meta-arago-test/recipes-devtools/ltp-ddt/ltp_20250130.inc
> @@ -24,31 +24,28 @@ TUNE_CCARGS:remove:x86-64 = "-mfpmath=sse"
>   
>   CFLAGS:append:powerpc64 = " -D__SANE_USERSPACE_TYPES__"
>   CFLAGS:append:mipsarchn64 = " -D__SANE_USERSPACE_TYPES__"
> -SRCREV = "68737d20556d37364c95776044b1119c0912a36a"
> +SRCREV = "a7c31dff7edc089a32e990765e12952cc4d7666a"
>   
>   SRC_URI = "git://github.com/linux-test-project/ltp.git;branch=master;protocol=https \
>              file://0001-Remove-OOM-tests-from-runtest-mm.patch \
> -           file://0001-scenario_groups-default-remove-connectors.patch \
> -           file://0001-sched_stress-Use-time_t-instead-of-long-for-type.patch \
>              "
>   
>   S = "${WORKDIR}/git"
>   
>   inherit autotools-brokensep pkgconfig
>   
> -# Version 20220527 added KVM test infrastructure which currently fails to build with gold due to
> +# Version 20220527 added KVM test infrastructure which currently fails to build with lld due to
>   # SORT_NONE in linker script which isn't supported by gold:
>   # https://sourceware.org/bugzilla/show_bug.cgi?id=18097
>   # https://github.com/linux-test-project/ltp/commit/3fce2064b54843218d085aae326c8f7ecf3a8c41#diff-39268f0855c634ca48c8993fcd2c95b12a65b79e8d9fa5ccd6b0f5a8785c0dd6R36
> -LDFLAGS:append = "${@bb.utils.contains('DISTRO_FEATURES', 'ld-is-gold', ' -fuse-ld=bfd', '', d)}"
> -LDFLAGS:append = "${@bb.utils.contains('DISTRO_FEATURES', 'ld-is-lld', ' -fuse-ld=bfd', '', d)}"
> +LDFLAGS += "${@bb.utils.contains('DISTRO_FEATURES', 'ld-is-lld', '-fuse-ld=bfd', '', d)}"
>   
>   # After 0002-kvm-use-LD-instead-of-hardcoding-ld.patch
>   # https://github.com/linux-test-project/ltp/commit/f94e0ef3b7280f886384703ef9019aaf2f2dfebb
> -# it fails with gold also a bit later when trying to use *-payload.bin
> +# it fails with lld also a bit later when trying to use *-payload.bin
>   # http://errors.yoctoproject.org/Errors/Details/663094/
> -# work around this by forcing .bfd linked in LD when ld-is-gold is in DISTRO_FEATURES
> -KVM_LD = "${@bb.utils.contains_any('DISTRO_FEATURES', 'ld-is-gold ld-is-lld', '${HOST_PREFIX}ld.bfd${TOOLCHAIN_OPTIONS} ${HOST_LD_ARCH}', '${LD}', d)}"
> +# work around this by forcing .bfd linked in LD when ld-is-lld is in DISTRO_FEATURES
> +KVM_LD = "${@bb.utils.contains_any('DISTRO_FEATURES', 'ld-is-lld', '${HOST_PREFIX}ld.bfd${TOOLCHAIN_OPTIONS} ${HOST_LD_ARCH}', '${LD}', d)}"
>   
>   TARGET_CC_ARCH += "${LDFLAGS}"
>   

-- 
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS

