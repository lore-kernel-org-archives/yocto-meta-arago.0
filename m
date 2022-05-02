Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 96DB9C433F5
	for <webhook@archiver.kernel.org>; Mon,  2 May 2022 13:46:59 +0000 (UTC)
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web12.10647.1651499215224638473
 for <meta-arago@lists.yoctoproject.org>;
 Mon, 02 May 2022 06:46:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=be01k3rl;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: reatmon@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 242Dkruw038433;
	Mon, 2 May 2022 08:46:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1651499213;
	bh=tH1NjT6GzAlFyG8jEUxD4++fcSB0kTx34IKxJzo7qvE=;
	h=Date:Subject:To:References:From:In-Reply-To;
	b=be01k3rlxxUcozdnTej2MBoe4anAUpeb4J3XKNZmldspMzSEOilzFP6TWUZmNOz7V
	 aX2NUTuifd8ZmSEEZMR5zp5Wx80Yzo0wQzFBZbT+3l30PjLVTMauB+Sf1soTitAPBM
	 fDgpiZFCO4EayEwjF9ceagFtLwS17WUEnegCftaQ=
Received: from DFLE108.ent.ti.com (dfle108.ent.ti.com [10.64.6.29])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 242DkrdR029916
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 2 May 2022 08:46:53 -0500
Received: from DFLE101.ent.ti.com (10.64.6.22) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Mon, 2
 May 2022 08:46:52 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE101.ent.ti.com
 (10.64.6.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Mon, 2 May 2022 08:46:52 -0500
Received: from [10.249.39.108] (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 242Dkq15102879;
	Mon, 2 May 2022 08:46:52 -0500
Message-ID: <c7960913-ae3d-f694-e872-387c34995d2d@ti.com>
Date: Mon, 2 May 2022 08:48:17 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [meta-arago][oe-layersetup PATCH v2 1/5] Remove unused
 sample-file bblayers-zeus-browser.conf.sample
Content-Language: en-US
To: Andrew Davis <afd@ti.com>, Denys Dmytriyenko <denys@konsulko.com>,
        <meta-arago@lists.yoctoproject.org>
References: <20220428171851.19270-1-afd@ti.com>
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <20220428171851.19270-1-afd@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Mon, 02 May 2022 13:46:59 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/13829


Series applied to master.



On 4/28/2022 12:18, Andrew Davis wrote:
> Signed-off-by: Andrew Davis <afd@ti.com>
> ---
>   sample-files/bblayers-zeus-browser.conf.sample | 12 ------------
>   1 file changed, 12 deletions(-)
>   delete mode 100644 sample-files/bblayers-zeus-browser.conf.sample
> 
> diff --git a/sample-files/bblayers-zeus-browser.conf.sample b/sample-files/bblayers-zeus-browser.conf.sample
> deleted file mode 100644
> index bb83fac..0000000
> --- a/sample-files/bblayers-zeus-browser.conf.sample
> +++ /dev/null
> @@ -1,12 +0,0 @@
> -# This template file was created by taking the oe-core/meta/conf/bblayers.conf
> -# file and removing the BBLAYERS section at the end.
> -
> -# LAYER_CONF_VERSION is increased each time build/conf/bblayers.conf
> -# changes incompatibly
> -LCONF_VERSION = "6"
> -
> -BBPATH = "${TOPDIR}"
> -BBFILES ?= ""
> -
> -OVERRIDES = "forcevariable"
> -LAYERSERIES_COMPAT_browser-layer_forcevariable = "zeus"

-- 
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS

