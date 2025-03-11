Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ACE51C282EC
	for <webhook@archiver.kernel.org>; Tue, 11 Mar 2025 17:33:12 +0000 (UTC)
Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
 by mx.groups.io with SMTP id smtpd.web10.15972.1741714382821696830
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 11 Mar 2025 10:33:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=Kssy/yzh;
 spf=pass (domain: ti.com, ip: 198.47.19.246, mailfrom: afd@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 52BHWxXi1255440
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Tue, 11 Mar 2025 12:32:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1741714379;
	bh=7womCckSkuLZpYN14uBdj1QPvaP1tazazaVu64rMr3M=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=Kssy/yzhTlfhlnK8LwMh5xATFty3v2kpVhnL76aKFSCkwfX3AYfa/OQE4TnBOlG1k
	 KmZI4xPiQvQ5TisHNCndxxjeRR+peAypNvHs/eMMK5s9PIRNLSHL2kUE/pSO33/qGf
	 9azoGPq6F++5rptA10im6aOPUx/fQVKxIKlxdEoM=
Received: from DLEE111.ent.ti.com (dlee111.ent.ti.com [157.170.170.22])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTP id 52BHWxxf079227;
	Tue, 11 Mar 2025 12:32:59 -0500
Received: from DLEE113.ent.ti.com (157.170.170.24) by DLEE111.ent.ti.com
 (157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 11
 Mar 2025 12:32:59 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 11 Mar 2025 12:32:59 -0500
Received: from [10.249.42.149] ([10.249.42.149])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 52BHWxdX022574;
	Tue, 11 Mar 2025 12:32:59 -0500
Message-ID: <71a9042c-7963-40e6-afae-83247c5a452a@ti.com>
Date: Tue, 11 Mar 2025 12:32:59 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-arago][master/scarthgap][PATCH] meta-arago-extras: Add
 recipe for NNShark
To: Denys Dmytriyenko <denis@denix.org>, <c-shilwant@ti.com>
CC: <meta-arago@lists.yoctoproject.org>,
        Denys Dmytriyenko
	<denys@konsulko.com>, Ryan Eatmon <reatmon@ti.com>
References: <20250311143744.102671-1-afd@ti.com>
 <9a646c15-22bd-4a12-a1c8-6a0e86e77f13@ti.com>
 <20250311162613.GB23729@denix.org>
Content-Language: en-US
From: Andrew Davis <afd@ti.com>
In-Reply-To: <20250311162613.GB23729@denix.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 11 Mar 2025 17:33:12 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15977

On 3/11/25 11:26 AM, Denys Dmytriyenko wrote:
> On Tue, Mar 11, 2025 at 09:28:44PM +0530, Chirag Shilwant via lists.yoctoproject.org wrote:
>> Hello Andrew,
>>
>> On 11/03/25 20:07, Andrew Davis via lists.yoctoproject.org wrote:
>>> Signed-off-by: Andrew Davis <afd@ti.com>
>>> ---
>>>   .../recipes-multimedia/nnshark/nnshark_git.bb | 38 +++++++++++++++++++
>>>   1 file changed, 38 insertions(+)
>>>   create mode 100644 meta-arago-extras/recipes-multimedia/nnshark/nnshark_git.bb
>>>
>>> diff --git a/meta-arago-extras/recipes-multimedia/nnshark/nnshark_git.bb b/meta-arago-extras/recipes-multimedia/nnshark/nnshark_git.bb
>>> new file mode 100644
>>> index 00000000..1a3d8ad5
>>> --- /dev/null
>>> +++ b/meta-arago-extras/recipes-multimedia/nnshark/nnshark_git.bb
>>> @@ -0,0 +1,38 @@
>>> +SUMMARY = "A GStreamer NNstreamer pipelines real-time profiling plugin"
>>
>>
>> nitpick, the below sounds much better?
>>
>> SUMMARY = "A GStreamer plugin to support real-time performance
>> profiling of NNStreamer pipelines."
> 
> This is 86+ characters long, which is too long for the SUMMARY (72 max). Also,
> no dots at the end of the SUMMARY, only in the DESCRIPTION, which happens
> automatically if not set explicitly.
> 
> 
>>> +HOMEPAGE = "https://github.com/nnstreamer/nnshark"
>>> +
>>> +LICENSE = "GPL-2.0-only & LGPL-2.1-only"
>>> +LIC_FILES_CHKSUM = "file://COPYING;md5=e1caa368743492879002ad032445fa97 \
>>> +                    file://COPYING.LESSER;md5=66c40c88533cd228b5b85936709801c8"
>>> +
>>> +SRC_URI = "git://github.com/nnstreamer/nnshark.git;protocol=https;branch=master;name=nnshark \
>>> +           git://github.com/GStreamer/common.git;protocol=https;branch=master;name=common;subdir=${S}/common \
>>> +"
>>
>> any specific reasons to not go with something like below,
>>
>> SRC_URI = "gitsm://github.com/nnstreamer/nnshark.git;protocol=https;branch=master
>> \
>> "
>>
>> SRCREV = "bcee91b23a98c981b87051fe1b2ad545991c4aa2"
> 
> Unless you want to control each SRCREV separately.
> 

Right, that is the reason I do this, the version of "common" when
pulled as a submodule is not available, we have the exact same issue
for TI GST plugins and we patch around[0]. This way of pulling "common"
manually with SRC_URI seemed better.

Andrew

[0] https://git.yoctoproject.org/meta-arago/tree/meta-arago-extras/recipes-multimedia/gst-plugins-ti/gstreamer1.0-plugins-vpe/0001-Switch-submodule-common-to-github.patch

> 
>>> +SRCREV_FORMAT="default"
>>> +SRCREV_nnshark="bcee91b23a98c981b87051fe1b2ad545991c4aa2"
>>> +SRCREV_common="b64f03f6090245624608beb5d2fff335e23a01c0"
>>> +
>>> +S = "${WORKDIR}/git"
>>
>> probably master might need a separate patch for UNPACKDIR stuff?
> 
> No changes for git based recipes needed.
> 
> 
>>> +
>>> +DEPENDS = "\
>>> +    gtk-doc-native \
>>> +    gstreamer1.0 \
>>> +    gstreamer1.0-plugins-base \
>>> +"
>>> +
>>> +inherit pkgconfig autotools-brokensep
>>> +
>>> +EXTRA_OECONF = " \
>>> +        --disable-graphviz \
>>> +        --disable-gtk-doc \
>>> +"
>>> +
>>> +do_configure:prepend() {
>>> +    sh autogen.sh --noconfigure
>>> +}
>>> +
>>> +FILES:${PN} += "\
>>> +       ${libdir}/gstreamer-1.0/libgstsharktracers.so \
>>> +       ${libdir}/gstreamer-1.0/libgstsharktracers.la \
>>> +"

