Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 779EEC4332F
	for <webhook@archiver.kernel.org>; Wed,  4 Jan 2023 16:12:54 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web10.16218.1672848764955918175
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 04 Jan 2023 08:12:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=Cm3nD52h;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: afd@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 304GChKw113725
	for <meta-arago@lists.yoctoproject.org>; Wed, 4 Jan 2023 10:12:43 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1672848763;
	bh=zrfTU9RpFW6Of2S1dnMCs49BbC3yJMtWT/wSvIzgriI=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=Cm3nD52hI48Ic0fBBVWdoBN/UwZDXaTuyYt1NySrLCc8qCzNTo1eEa0IG/WaUe6H4
	 b/84uPNumn6VBhPowOGqYlsfnRKlSC7OC7mfPlPZ3BvOtvrPfU+eb8jONKJZU5I18R
	 qN8k7JvcN8cmWX6uv4lMKBXnSeas9wmCNxRxhRac=
Received: from DFLE104.ent.ti.com (dfle104.ent.ti.com [10.64.6.25])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 304GChOR013924
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@lists.yoctoproject.org>; Wed, 4 Jan 2023 10:12:43 -0600
Received: from DFLE107.ent.ti.com (10.64.6.28) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16; Wed, 4
 Jan 2023 10:12:43 -0600
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE107.ent.ti.com
 (10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16 via
 Frontend Transport; Wed, 4 Jan 2023 10:12:43 -0600
Received: from [10.250.33.81] (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 304GCgAR087104;
	Wed, 4 Jan 2023 10:12:43 -0600
Message-ID: <4e1c65ab-2028-a556-a539-a6ead6cab8ab@ti.com>
Date: Wed, 4 Jan 2023 10:12:42 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [meta-arago][master/dunfell][PATCH 1/2] systemd: fix the local
 rule to load modules when new hardware is added
Content-Language: en-US
To: <j-choudhary@ti.com>, <meta-arago@lists.yoctoproject.org>
CC: <reatmon@ti.com>, <praneeth@ti.com>
References: <20230104141150.186773-1-j-choudhary@ti.com>
 <20230104141150.186773-2-j-choudhary@ti.com>
From: Andrew Davis <afd@ti.com>
In-Reply-To: <20230104141150.186773-2-j-choudhary@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Wed, 04 Jan 2023 16:12:54 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14150

On 1/4/23 8:11 AM, Jayesh Choudhary via lists.yoctoproject.org wrote:
> Using modprobe causes the rule to fail when the module is builtin in kernel
> and it is logged in journalctl. So use the builtin command 'kmod' instead.
> This makes the journalctl logs clean and significantly easier to read.
> 
> Signed-off-by: Jayesh Choudhary <j-choudhary@ti.com>
> ---
>   meta-arago-distro/recipes-core/systemd/systemd/local.rules | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/meta-arago-distro/recipes-core/systemd/systemd/local.rules b/meta-arago-distro/recipes-core/systemd/systemd/local.rules
> index b0e9f84f..4829ca14 100644
> --- a/meta-arago-distro/recipes-core/systemd/systemd/local.rules
> +++ b/meta-arago-distro/recipes-core/systemd/systemd/local.rules
> @@ -14,7 +14,7 @@
>   #
>   
>   # Try and modprobe for drivers for new hardware
> -ACTION=="add", DEVPATH=="/devices/*", ENV{MODALIAS}=="?*", RUN+="/sbin/modprobe $env{MODALIAS}"
> +ACTION=="add", DEVPATH=="/devices/*", ENV{MODALIAS}=="?*", RUN{builtin}+="kmod load $env{MODALIAS}"
>   

Is the builtin version as full featured? Does this work in non-systemd systems? Is this just
masking all errors or do real errors still get logged somewhere? If this is just a way
to mask errors then --quiet might be more portable.

(BTW I ran into this same issue of having no good way to know if a module was builtin or just
missing when adding dynamic kernel module support for Android [0])

Andrew

[0] https://android.googlesource.com/platform/system/core/+/9963847419f41c76ca008cf0c09e986c79f04e4c

>   # Create a symlink to any touchscreen input device
>   SUBSYSTEM=="input", KERNEL=="event[0-9]*", ENV{ID_INPUT_TOUCHSCREEN}=="1", SYMLINK+="input/touchscreen0"

