Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 44A56C7618E
	for <webhook@archiver.kernel.org>; Wed, 26 Apr 2023 23:22:29 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web10.7945.1682551345989573344
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 26 Apr 2023 16:22:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=IvAf/xva;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: afd@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 33QNMMFK097186;
	Wed, 26 Apr 2023 18:22:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1682551342;
	bh=D39i4RNI7bQaNHjWfZ8vfbRpju4GpBOf17Hw0NQkRTk=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=IvAf/xvasatIWOYZv6rcKn7+dnia/wcV5G0gxXEBhCISTaakyh+WdlaElW8v3BXY8
	 pq7z820YHSCGxZ766XtAOrXi4GF9nIu60mILApfUB/mD1G/nnicBmbPyohj6ieOytS
	 a5Y9YvbYdngNpAa6DcJ3gIIRgdLN2eiFaUPXbQo4=
Received: from DFLE110.ent.ti.com (dfle110.ent.ti.com [10.64.6.31])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 33QNMMn9011915
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 26 Apr 2023 18:22:22 -0500
Received: from DFLE112.ent.ti.com (10.64.6.33) by DFLE110.ent.ti.com
 (10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 26
 Apr 2023 18:22:22 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 26 Apr 2023 18:22:21 -0500
Received: from [10.250.35.77] (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 33QNMLIW035398;
	Wed, 26 Apr 2023 18:22:21 -0500
Message-ID: <b206ccc2-b046-932e-4d74-41ce5c5bd16e@ti.com>
Date: Wed, 26 Apr 2023 18:22:21 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [meta-arago][master/kirkstone][PATCH 5/6] qtwayland: add comment
 about why this append exists
Content-Language: en-US
To: <rs@ti.com>, <denis@denix.org>, <reatmon@ti.com>, <detheridge@ti.com>
CC: <meta-arago@lists.yoctoproject.org>
References: <20230426213214.3501230-1-rs@ti.com>
 <20230426213214.3501230-6-rs@ti.com>
From: Andrew Davis <afd@ti.com>
In-Reply-To: <20230426213214.3501230-6-rs@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Wed, 26 Apr 2023 23:22:29 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14359

On 4/26/23 4:32 PM, rs@ti.com wrote:
> From: Randolph Sapp <rs@ti.com>
> 
> Add some info about why this bbappend still exists. It's to prefer
> wayland over x11 and remove some unoptimized components.
> 
> Signed-off-by: Randolph Sapp <rs@ti.com>
> ---
>   meta-arago-distro/recipes-qt/qt5/qtwayland_git.bbappend | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/meta-arago-distro/recipes-qt/qt5/qtwayland_git.bbappend b/meta-arago-distro/recipes-qt/qt5/qtwayland_git.bbappend
> index e7560d02..82cb657a 100644
> --- a/meta-arago-distro/recipes-qt/qt5/qtwayland_git.bbappend
> +++ b/meta-arago-distro/recipes-qt/qt5/qtwayland_git.bbappend
> @@ -1,4 +1,4 @@
> -FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}:"

This above line can be removed when you removed the last carried
patch, squash into the last patch.

> -PR:append = ".arago2"

Since you are changing this package from the default, it is usually
a good idea to keep this line, so it is clear this is a "Arago"
version of this package.

And since this package was changed in your last patch (probably not
in a noticeable way but still..) you should bump the version .arago3

Andrew

> +# This append exists to modify the PACKAGECONFIG such that the wayland backend
> +# is preferred over x11 and unoptimized components are removed.
>   
>   PACKAGECONFIG:remove = "xcomposite-egl xcomposite-glx"

