Return-Path: <c-shilwant@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 35C25C282EC
	for <webhook@archiver.kernel.org>; Tue, 11 Mar 2025 15:58:52 +0000 (UTC)
Received: from fllvem-ot03.ext.ti.com (fllvem-ot03.ext.ti.com [198.47.19.245])
 by mx.groups.io with SMTP id smtpd.web10.12989.1741708729196780756
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 11 Mar 2025 08:58:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=p33Giy/E;
 spf=pass (domain: ti.com, ip: 198.47.19.245, mailfrom: c-shilwant@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 52BFwl7N758826
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 11 Mar 2025 10:58:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1741708727;
	bh=th1xVaPmDdBfaY+sSd3GAhHVK1rGJTK7w/sXBjW6xVc=;
	h=Date:Subject:To:References:From:CC:In-Reply-To;
	b=p33Giy/Ef23WvTwuWXzXkfw3lGe3FaDxYho7e53PUZdMIaPQ+Bz11WrDQyolv/GMU
	 bZbnyxTM1g3xNtVJ5BWTIoXIlizrenul1d6J/HhPywZKTauiNUGQx0S5YtXfIQA0bt
	 G+9Hzt7mYCJ2kdc/ejlEj+Hwna8KT7lqdzHy04ns=
Received: from DLEE112.ent.ti.com (dlee112.ent.ti.com [157.170.170.23])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 52BFwl1U011109
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 11 Mar 2025 10:58:47 -0500
Received: from DLEE102.ent.ti.com (157.170.170.32) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 11
 Mar 2025 10:58:47 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 11 Mar 2025 10:58:46 -0500
Received: from [172.24.227.238] (chirag-hp-z2-tower-g5-workstation.dhcp.ti.com [172.24.227.238])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 52BFwj15112682;
	Tue, 11 Mar 2025 10:58:45 -0500
Message-ID: <9a646c15-22bd-4a12-a1c8-6a0e86e77f13@ti.com>
Date: Tue, 11 Mar 2025 21:28:44 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-arago][master/scarthgap][PATCH] meta-arago-extras: Add
 recipe for NNShark
To: <meta-arago@lists.yoctoproject.org>
References: <20250311143744.102671-1-afd@ti.com>
Content-Language: en-US
From: Chirag Shilwant <c-shilwant@ti.com>
CC: Denys Dmytriyenko <denys@konsulko.com>, Ryan Eatmon <reatmon@ti.com>,
        <afd@ti.com>
In-Reply-To: <20250311143744.102671-1-afd@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 11 Mar 2025 15:58:52 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15970

Hello Andrew,

On 11/03/25 20:07, Andrew Davis via lists.yoctoproject.org wrote:
> Signed-off-by: Andrew Davis <afd@ti.com>
> ---
>   .../recipes-multimedia/nnshark/nnshark_git.bb | 38 +++++++++++++++++++
>   1 file changed, 38 insertions(+)
>   create mode 100644 meta-arago-extras/recipes-multimedia/nnshark/nnshark_git.bb
>
> diff --git a/meta-arago-extras/recipes-multimedia/nnshark/nnshark_git.bb b/meta-arago-extras/recipes-multimedia/nnshark/nnshark_git.bb
> new file mode 100644
> index 00000000..1a3d8ad5
> --- /dev/null
> +++ b/meta-arago-extras/recipes-multimedia/nnshark/nnshark_git.bb
> @@ -0,0 +1,38 @@
> +SUMMARY = "A GStreamer NNstreamer pipelines real-time profiling plugin"


nitpick, the below sounds much better?

SUMMARY = "A GStreamer plugin to support real-time performance profiling 
of NNStreamer pipelines."


> +HOMEPAGE = "https://github.com/nnstreamer/nnshark"
> +
> +LICENSE = "GPL-2.0-only & LGPL-2.1-only"
> +LIC_FILES_CHKSUM = "file://COPYING;md5=e1caa368743492879002ad032445fa97 \
> +                    file://COPYING.LESSER;md5=66c40c88533cd228b5b85936709801c8"
> +
> +SRC_URI = "git://github.com/nnstreamer/nnshark.git;protocol=https;branch=master;name=nnshark \
> +           git://github.com/GStreamer/common.git;protocol=https;branch=master;name=common;subdir=${S}/common \
> +"



any specific reasons to not go with something like below,

SRC_URI = 
"gitsm://github.com/nnstreamer/nnshark.git;protocol=https;branch=master \
"

SRCREV = "bcee91b23a98c981b87051fe1b2ad545991c4aa2"



> +
> +SRCREV_FORMAT="default"
> +SRCREV_nnshark="bcee91b23a98c981b87051fe1b2ad545991c4aa2"
> +SRCREV_common="b64f03f6090245624608beb5d2fff335e23a01c0"
> +
> +S = "${WORKDIR}/git"



probably master might need a separate patch for UNPACKDIR stuff?


--
Chirag


> +
> +DEPENDS = "\
> +    gtk-doc-native \
> +    gstreamer1.0 \
> +    gstreamer1.0-plugins-base \
> +"
> +
> +inherit pkgconfig autotools-brokensep
> +
> +EXTRA_OECONF = " \
> +        --disable-graphviz \
> +        --disable-gtk-doc \
> +"
> +
> +do_configure:prepend() {
> +    sh autogen.sh --noconfigure
> +}
> +
> +FILES:${PN} += "\
> +       ${libdir}/gstreamer-1.0/libgstsharktracers.so \
> +       ${libdir}/gstreamer-1.0/libgstsharktracers.la \
> +"

