Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D2FB2CCA476
	for <webhook@archiver.kernel.org>; Mon, 13 Oct 2025 11:26:38 +0000 (UTC)
Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
 by mx.groups.io with SMTP id smtpd.web11.41355.1760354796446215601
 for <meta-arago@lists.yoctoproject.org>;
 Mon, 13 Oct 2025 04:26:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=owZgTb8r;
 spf=pass (domain: ti.com, ip: 198.47.19.246, mailfrom: reatmon@ti.com)
Received: from fllvem-sh03.itg.ti.com ([10.64.41.86])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTP id 59DBQYG71248612;
	Mon, 13 Oct 2025 06:26:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1760354794;
	bh=mZzKgVLB3QFRc/Y7HkIzb3llF9ekpALoLqapsGpvdkI=;
	h=Date:Subject:To:References:From:In-Reply-To;
	b=owZgTb8rfbP2ii+Fky6AsuBw4NMueKVUgFV7U4nEKMk8m/miJBtfByNZ0jad1YDJF
	 b5Mkng4V8ndXh/dLySEQctsPIHo2/etGhEw/WOKpcpAd38YIn0HLJyzrL5qs4VO3Ef
	 //0fxC3A4JCJaaYwyvVlnZp1yg7Vjn+VoAziY+QM=
Received: from DFLE210.ent.ti.com (dfle210.ent.ti.com [10.64.6.68])
	by fllvem-sh03.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 59DBQYsn149543
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 13 Oct 2025 06:26:34 -0500
Received: from DFLE209.ent.ti.com (10.64.6.67) by DFLE210.ent.ti.com
 (10.64.6.68) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 13 Oct
 2025 06:26:34 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE209.ent.ti.com
 (10.64.6.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Mon, 13 Oct 2025 06:26:34 -0500
Received: from [10.249.37.202] ([10.249.37.202])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 59DBQYxr1972692;
	Mon, 13 Oct 2025 06:26:34 -0500
Message-ID: <90969746-3b16-4685-8895-a3ffdd51b397@ti.com>
Date: Mon, 13 Oct 2025 06:26:34 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-arago][scarthgap][PATCH v2 2/2] meta-arago-extras:
 hevc-arm-decoder: Remove this recipe
To: Andrew Davis <afd@ti.com>, Denys Dmytriyenko <denys@konsulko.com>,
        <meta-arago@lists.yoctoproject.org>
References: <20251002134224.1818376-1-afd@ti.com>
 <20251002134224.1818376-2-afd@ti.com>
Content-Language: en-US
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <20251002134224.1818376-2-afd@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Mon, 13 Oct 2025 11:26:38 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16683


This is listed as a dependency under:

meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-multimedia-sdk-target.bb

and

meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-multimedia.bb

So this does not build on am57xx-evm, am57xx-hs-evm, or beagle-x15.

Please send a v3.



On 10/2/2025 8:42 AM, Andrew Davis wrote:
> This was a proprietary HEVC/H.265 decoder for ARM A15 cores. This does
> not seem to function anymore and since it was delivered as a binary I
> am unable to fix it. Remove this recipe.
> 
> Signed-off-by: Andrew Davis <afd@ti.com>
> ---
>   .../hevc-arm-decoder/Testparams.cfg           | 23 --------
>   .../hevc-arm-decoder/hevc-arm-decoder_git.bb  | 53 -------------------
>   2 files changed, 76 deletions(-)
>   delete mode 100644 meta-arago-extras/recipes-multimedia/hevc-arm-decoder/hevc-arm-decoder/Testparams.cfg
>   delete mode 100644 meta-arago-extras/recipes-multimedia/hevc-arm-decoder/hevc-arm-decoder_git.bb
> 
> diff --git a/meta-arago-extras/recipes-multimedia/hevc-arm-decoder/hevc-arm-decoder/Testparams.cfg b/meta-arago-extras/recipes-multimedia/hevc-arm-decoder/hevc-arm-decoder/Testparams.cfg
> deleted file mode 100644
> index 5f018632..00000000
> --- a/meta-arago-extras/recipes-multimedia/hevc-arm-decoder/hevc-arm-decoder/Testparams.cfg
> +++ /dev/null
> @@ -1,23 +0,0 @@
> -# New Input File Format is as follows
> -# <ParameterName> = <ParameterValue> # Comment
> -################################################################################
> -# Parameters
> -################################################################################
> -#################################### No. of threads ############################
> -NumThreads = 2
> -################################### Files ######################################
> -InputFile   		= /usr/share/ti/video/TearOfSteel-Short-1280x720.265
> -OutputFile   		= /usr/share/ti/examples/h265vdec/TearOfSteel-Short-1280x720.yuv
> -ReferenceFile   	= /usr/share/ti/video/dummy
> -ImageWidth          = 1280  # Image width in Pels
> -ImageHeight         = 720   # Image height in Pels
> -FramesToDecode      = 50   # Number of frames to be coded
> -InputLowDelayMode   = 0     # 0->Entire frame, 1 -> Slice mode (Data sync mode)
> -OutputLowDelayMode  = 0     # 0->Entire frame, 1 -> Number of CTU rows (Data sync mode)
> -NumCTURows          = 0     # 0->Non-DataSync mode, Non-Zero positive when OutputLowDelayMode is set to Data sync mode
> -MetadataType        = 0     # 0->No Metadata, 1-SEI, 2-VUI 3-SEI and VUI
> -###################################################################
> -# Dynamic Parameters
> -###################################################################
> -DecodeHeader         = 0    # 0 -> Disable decode Header mode, 1 -> Enable decode Header mode
> -
> diff --git a/meta-arago-extras/recipes-multimedia/hevc-arm-decoder/hevc-arm-decoder_git.bb b/meta-arago-extras/recipes-multimedia/hevc-arm-decoder/hevc-arm-decoder_git.bb
> deleted file mode 100644
> index 3bcd6c7f..00000000
> --- a/meta-arago-extras/recipes-multimedia/hevc-arm-decoder/hevc-arm-decoder_git.bb
> +++ /dev/null
> @@ -1,53 +0,0 @@
> -SUMMARY = "ARM HEVC Decoder with Unit Test Application"
> -HOMEPAGE = "https://git.ti.com/processor-sdk/hevc_arm_decoder/"
> -LICENSE = "TI-TSPA"
> -LIC_FILES_CHKSUM = "file://Inc/exp_pp_h265decoder.h;beginline=1;endline=27;md5=51a0ae5cca603a21186bf6ff458f3be9"
> -PR = "r4"
> -
> -COMPATIBLE_MACHINE = "dra7xx"
> -
> -BRANCH = "master"
> -
> -SRC_URI = "git://git.ti.com/git/processor-sdk/hevc_arm_decode.git;protocol=https;branch=${BRANCH} \
> -           file://Testparams.cfg \
> -"
> -
> -SRCREV = "4004c553e672538d0c3b5fa2ea0490ec095d0060"
> -
> -PV = "01.00.00.01"
> -
> -S = "${WORKDIR}/git"
> -
> -do_configure() {
> -    sed "s/-lpthread/-pthread/g" -i ${S}/Client/Build/ARM/makefile
> -}
> -
> -do_compile() {
> -    cd ${S}/Client/Build/ARM
> -    oe_runmake CC="${CC}" LINKER="${CC}"
> -}
> -
> -do_install() {
> -    install -d ${D}${libdir}
> -    install -m 755 ${S}/Lib/h265vdec_pp_lib.a ${D}${libdir}
> -
> -    install -d ${D}${includedir}
> -    install -m 644 ${S}/Inc/exp_pp_h265decoder.h ${D}${includedir}
> -
> -    install -d ${D}${bindir}
> -    install -m 755 ${S}/Client/Build/ARM/Out/h265vdec_pp ${D}${bindir}
> -
> -    install -d ${D}${datadir}/ti/examples/h265vdec
> -    install -m 644 ${WORKDIR}/Testparams.cfg ${D}${datadir}/ti/examples/h265vdec
> -
> -    install -d ${D}${docdir}/${PN}
> -    for doc in ${S}/Docs/*; do
> -        install -m 664 ${doc} ${D}${docdir}/${PN}
> -    done
> -}
> -
> -FILES:${PN} += "\
> -    ${datadir}/ti/*  \
> -"
> -
> -INSANE_SKIP:${PN} += "ldflags"

-- 
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS

