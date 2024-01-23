Return-Path: <devarsht@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2978C47258
	for <webhook@archiver.kernel.org>; Tue, 23 Jan 2024 14:26:48 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web11.13747.1706020008124718675
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 23 Jan 2024 06:26:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=QEuf0+EY;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: devarsht@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 40NEQlZ4048731
	for <meta-arago@lists.yoctoproject.org>; Tue, 23 Jan 2024 08:26:47 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1706020007;
	bh=w7BwntP8dZQQU9lOKeHF5DIE+DmLvxeS525QZxKCCJI=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=QEuf0+EYuiTse+kTWzU+ig4NN3r0TS3qcKwjzk/M9j0Q3WeyxukXvSjly10WOicz1
	 x0ZbVDTCxNNgkyH5q8XMLeMzByk5tXnGMF1zckrMe47scHznkffVo7oxogi1T9PqLm
	 bUaKG9n1HwAKISXW9kE6i4rCScShzIk1oVPbNg2A=
Received: from DFLE106.ent.ti.com (dfle106.ent.ti.com [10.64.6.27])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 40NEQlIv114848
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@lists.yoctoproject.org>; Tue, 23 Jan 2024 08:26:47 -0600
Received: from DFLE112.ent.ti.com (10.64.6.33) by DFLE106.ent.ti.com
 (10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 23
 Jan 2024 08:26:46 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 23 Jan 2024 08:26:46 -0600
Received: from [172.24.227.193] (devarsht.dhcp.ti.com [172.24.227.193])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 40NEQiUA061664;
	Tue, 23 Jan 2024 08:26:44 -0600
Message-ID: <999601af-cb60-0808-0cd5-a6b6cddba6a9@ti.com>
Date: Tue, 23 Jan 2024 19:56:43 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [meta-arago][master/kirkstone][PATCH 1/2]
 gstreamer1.0-plugins-good: Maintain same set of patches for all machines
Content-Language: en-US
To: Rahul T R <r-ravikumar@ti.com>, <meta-arago@lists.yoctoproject.org>
CC: <reatmon@ti.com>, <j-luthra@ti.com>, <denys@ti.com>, <b-brnich@ti.com>,
        <p-mantena@ti.com>
References: <20240122162917.822825-1-r-ravikumar@ti.com>
 <20240122162917.822825-2-r-ravikumar@ti.com>
From: Devarsh Thakkar <devarsht@ti.com>
In-Reply-To: <20240122162917.822825-2-r-ravikumar@ti.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 23 Jan 2024 14:26:48 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15080

Hi Rahul,

Thanks for the patch.

On 22/01/24 21:59, Rahul T R wrote:
> This will make it easier to maintain and it will be easier if we decide
> to have TI fork for gstreamer.
> > Signed-off-by: Rahul T R <r-ravikumar@ti.com>
> ---
>  .../gstreamer1.0-plugins-good_1.20.%.bbappend | 19 +------------------
>  1 file changed, 1 insertion(+), 18 deletions(-)
> 
> diff --git a/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.20.%.bbappend b/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.20.%.bbappend
> index e14a3c93..7ad943f6 100644
> --- a/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.20.%.bbappend
> +++ b/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.20.%.bbappend
> @@ -3,25 +3,8 @@ FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}:"
>  SRC_URI:append = " \
>      file://0001-Adding-support-for-raw10-raw12-and-raw16-bayer-formats.patch \
>      file://0002-Adding-support-for-bayer-formats-with-IR-component.patch \
> -"
> -
> -SRC_URI:append:j721s2 = " \
>      file://0001-v4l2-Changes-for-DMA-Buf-import-j721s2.patch \

As you are already cleaning it up, could you please also update the indexing
of the patches,

SRC_URI:append = " \
    file://0001-Adding-support-for-raw10-raw12-and-raw16-bayer-formats.patch \
    file://0002-Adding-support-for-bayer-formats-with-IR-component.patch \
    file://0003-v4l2-Changes-for-DMA-Buf-import-j721s2.patch \
    file://0004-v4l2-Give-preference-to-contiguous-format-if-support.patch \
    file://0005-gstv4l2object-Increase-min-buffers.patch \
?

Regards
Devarsh

>      file://0002-v4l2-Give-preference-to-contiguous-format-if-support.patch \
>  "
>  
> -SRC_URI:append:j784s4 = " \
> -    file://0001-v4l2-Changes-for-DMA-Buf-import-j721s2.patch \
> -    file://0002-v4l2-Give-preference-to-contiguous-format-if-support.patch \
> -"
> -
> -SRC_URI:append:am62axx = " \
> -    file://0001-v4l2-Changes-for-DMA-Buf-import-j721s2.patch \
> -    file://0002-v4l2-Give-preference-to-contiguous-format-if-support.patch \
> -"
> -
> -SRC_URI:append:am62pxx = " \
> -    file://0001-v4l2-Changes-for-DMA-Buf-import-j721s2.patch \
> -    file://0002-v4l2-Give-preference-to-contiguous-format-if-support.patch \
> -"
> -PR:append = ".arago0"
> +PR:append = ".arago1"

