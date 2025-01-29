Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 906ACC0218D
	for <webhook@archiver.kernel.org>; Wed, 29 Jan 2025 19:10:28 +0000 (UTC)
Received: from fllvem-ot03.ext.ti.com (fllvem-ot03.ext.ti.com [198.47.19.245])
 by mx.groups.io with SMTP id smtpd.web10.21041.1738177824310225359
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 29 Jan 2025 11:10:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=pL7SLbZ6;
 spf=pass (domain: ti.com, ip: 198.47.19.245, mailfrom: reatmon@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 50TJALmr2179990
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 29 Jan 2025 13:10:21 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1738177821;
	bh=1YGGeGwzXeIXo8DqpMj80nQf9GezN7HjTpRzlLTaGUw=;
	h=Date:Subject:To:References:From:In-Reply-To;
	b=pL7SLbZ6VZ5jfY7eGZ4mzWC2ag3Y88PpqwSAN/5SpSaOFYnlBqEqAgqkQ/OPZE93m
	 59pjzqh/mSVhvupVUoDdrACZJfnOjoLJfx1Y8eHGC+XmMOq2RpkGHPI89LJGprxd+l
	 nn85XukDZ8TyRnzDWjXepATHOZUcJMOC20GW7VcQ=
Received: from DLEE114.ent.ti.com (dlee114.ent.ti.com [157.170.170.25])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 50TJAL3e022004
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 29 Jan 2025 13:10:21 -0600
Received: from DLEE104.ent.ti.com (157.170.170.34) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 29
 Jan 2025 13:10:21 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 29 Jan 2025 13:10:21 -0600
Received: from [10.249.32.48] ([10.249.32.48])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 50TJALFd122348;
	Wed, 29 Jan 2025 13:10:21 -0600
Message-ID: <dc794822-0979-4e4e-ae94-cdbbbc75de34@ti.com>
Date: Wed, 29 Jan 2025 13:10:21 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-arago][scarthgap/master][PATCH] amsdk-av-files: Remove this
 recipe
To: Andrew Davis <afd@ti.com>, Denys Dmytriyenko <denys@konsulko.com>,
        <meta-arago@lists.yoctoproject.org>
References: <20250117190402.686979-1-afd@ti.com>
Content-Language: en-US
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <20250117190402.686979-1-afd@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Wed, 29 Jan 2025 19:10:28 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15778


For some reason this patch breaks two of our builds on master...

am69-sk - rt
j784s4-evm - rt

It gives the error during tisdk-default-image do_rootfs:

ERROR: Unable to install packages. Command 
'/scratch/jenkins_builds/arago-master-next/build/build/arago-tmp-default/work/am69_sk-oe-linux/tisdk-default-image/1.0/recipe-sysroot-native/usr/bin/opkg 
--volatile-cache -f 
/scratch/jenkins_builds/arago-master-next/build/build/arago-tmp-default/work/am69_sk-oe-linux/tisdk-default-image/1.0/opkg.conf 
-t 
/scratch/jenkins_builds/arago-master-next/build/build/arago-tmp-default/work/am69_sk-oe-linux/tisdk-default-image/1.0/temp/ipktemp/ 
-o 
/scratch/jenkins_builds/arago-master-next/build/build/arago-tmp-default/work/am69_sk-oe-linux/tisdk-default-image/1.0/rootfs 
  --force_postinstall    --add-ignore-recommends busybox-syslog 
--add-ignore-recommends coreutils --add-ignore-recommends coreutils-dev 
--add-ignore-recommends gdbserver-c6x-dev --add-ignore-recommends 
libulm-dev install build-essential docker dtc git linux-libc-headers-dev 
opkg packagegroup-arago-base packagegroup-arago-console 
packagegroup-arago-tisdk-addons packagegroup-arago-tisdk-addons-extra 
packagegroup-arago-tisdk-connectivity packagegroup-arago-tisdk-crypto 
packagegroup-arago-tisdk-graphics packagegroup-arago-tisdk-gtk 
packagegroup-arago-tisdk-hmi packagegroup-arago-tisdk-multimedia 
packagegroup-arago-tisdk-qte packagegroup-arago-tisdk-sysrepo 
packagegroup-core-boot packagegroup-core-tools-debug 
pdm-anomaly-detection psplash run-postinsts ti-test ti-test-extras' 
returned -11:

DEBUG: Python function do_rootfs finished


Which is annoying because it doesn't say why it failed, just that it 
failed...

I bisected it down to this patch.

All other platform/variant combinations work, and scarthgap works...



On 1/17/2025 1:04 PM, Andrew Davis wrote:
> These video files were used in a couple demos for multimedia decoders.
> They add +50MB at minimum to images that include them and ~200MB of
> git download to build. They are unused now so remove this recipe.
> 
> Signed-off-by: Andrew Davis <afd@ti.com>
> ---
>   .../packagegroup-arago-tisdk-multimedia.bb    |  1 -
>   .../amsdk-av-files/amsdk-av-files_1.4.bb      | 42 -------------------
>   2 files changed, 43 deletions(-)
>   delete mode 100644 meta-arago-extras/recipes-multimedia/amsdk-av-files/amsdk-av-files_1.4.bb
> 
> diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-multimedia.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-multimedia.bb
> index c6e39aa1..6a1b25b6 100644
> --- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-multimedia.bb
> +++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-multimedia.bb
> @@ -7,7 +7,6 @@ PACKAGE_ARCH = "${MACHINE_ARCH}"
>   inherit packagegroup
>   
>   MULTIMEDIA = " \
> -    amsdk-av-files \
>       ffmpeg \
>       libcamera \
>       libcamera-gst \
> diff --git a/meta-arago-extras/recipes-multimedia/amsdk-av-files/amsdk-av-files_1.4.bb b/meta-arago-extras/recipes-multimedia/amsdk-av-files/amsdk-av-files_1.4.bb
> deleted file mode 100644
> index 7267668b..00000000
> --- a/meta-arago-extras/recipes-multimedia/amsdk-av-files/amsdk-av-files_1.4.bb
> +++ /dev/null
> @@ -1,42 +0,0 @@
> -DESCRIPTION = "AMSDK multimedia support files"
> -HOMEPAGE = "https://git.ti.com/processor-sdk/amsdk-av-files/"
> -LICENSE = "CC-BY-NC-ND-3.0 & CC-BY-3.0"
> -SECTION = "multimedia"
> -LIC_FILES_CHKSUM = "file://Multimedia_Data_Files_Manifest.doc;md5=fe154d291c69c51495a5bb4a456403b5"
> -PR = "r2"
> -
> -PACKAGE_ARCH = "${MACHINE_ARCH}"
> -
> -VIDEO_FILES = "video_480p "
> -
> -VIDEO_FILES:append:ti33x       = "video_wvga \
> -                                  video_wqvga"
> -VIDEO_FILES:append:ti43x       = "video_wqvga"
> -VIDEO_FILES:append:dra7xx      = "video_wvga \
> -                                  video_1080p \
> -                                  video_720p \
> -                                  video_yuv"
> -VIDEO_FILES:append:k3          = "video_720p"
> -
> -BRANCH = "master"
> -
> -SRC_URI = "git://git.ti.com/git/processor-sdk/amsdk-av-files.git;protocol=https;branch=${BRANCH}"
> -SRCREV = "1b73009090265328ebaf1b6c880dfeccae5a8f19"
> -
> -S = "${WORKDIR}/git"
> -
> -do_compile() {
> -    :
> -}
> -
> -do_install() {
> -    install -d ${D}${datadir}/ti \
> -       ${D}${datadir}/ti/audio \
> -       ${D}${datadir}/ti/video
> -    install -m 0644 ${S}/audio/* ${D}${datadir}/ti/audio/
> -    for file in ${VIDEO_FILES}; do
> -	install -m 0644 ${S}/${file}/* ${D}${datadir}/ti/video/
> -    done
> -}
> -
> -FILES:${PN} += "${datadir}/ti/*"

-- 
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS

