Return-Path: <sinthu.raja@mistralsolutions.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9D2C9C43334
	for <webhook@archiver.kernel.org>; Thu, 30 Jun 2022 17:42:32 +0000 (UTC)
Received: from egress-ip4b.ess.de.barracuda.com
 (egress-ip4b.ess.de.barracuda.com [18.185.115.208])
 by mx.groups.io with SMTP id smtpd.web10.28232.1656610942920528553
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 30 Jun 2022 10:42:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mistralsolutions.com header.s=google header.b=kCEgOC66;
 spf=pass (domain: mistralsolutions.com, ip: 18.185.115.208,
 mailfrom: sinthu.raja@mistralsolutions.com)
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by mx-outbound16-241.eu-central-1b.ess.aws.cudaops.com
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
 Thu, 30 Jun 2022 17:42:17 +0000
Received: by mail-wm1-f71.google.com with SMTP id
 c185-20020a1c35c2000000b0039db3e56c39so1714362wma.5
        for <meta-arago@lists.yoctoproject.org>;
 Thu, 30 Jun 2022 10:42:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mistralsolutions.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=LoVK5OuSzaEVzNedfw6OSHt17/jJ6CXarSQdrF7nGYs=;
        b=kCEgOC66vA0DwAGjOsDOsuwCw32HhOdyWyVAzJ3pVlBBP2hM2s9KjV4mUxNu4mioBw
         ksBWlVeLvWjk2G29xeDUGMGcFrAglTMiqjC67pyr/uuQTa2MwZ0FSp8Y5ff+eUlZ2xZX
         A18GuSexAGPxM/2ss5ZY8FZhn0GC2NSPtPZGU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=LoVK5OuSzaEVzNedfw6OSHt17/jJ6CXarSQdrF7nGYs=;
        b=P6Qm+oJ0e5A3gDMLRQlnV0yZ1IV+PEUDA7kKbiB0+5XgypSQrMq0wPxVa4Voa68/xQ
         3SM2pJ/m1yfJynCGZtmvSJrMiDHE792M+la9gV6e2rMSdTqCOXbopHDFRk8hSyE1v2HV
         xDiVquHoOsSK2UPGA5vS8NGSjNBCBkl5b1+vLMGfxC/J2jGC2UVHQ04UjRHcwPH7auV/
         WUOVkxMzPyMUxHpEgA0qpp64wIfc/mt0fPOOcNT4ou/AlDVicf7awXD8bzh7Ey2bc+D9
         dZGhSmynAgm+/aq9vyklpu6gQc2Jx//JT5TAo/xGqtYWq87ywJhKpcEixZJsRVQKNm5B
         3YtA==
X-Gm-Message-State: AJIora/yjJF1F7AEWWNjqcxd9OTC+vuq5vK+yiC81S8ndRWBmUjet0jl
	jsiACIBJ3ckf6YcTKZO/UUsqzY3Mac+TggjQGRC/FlWzNuvVLR6dI1JoK8Xw+5IOga/lU2++8DD
	mdQ17hIxxmfZ8cPLMHUuqfuZu/ypre4+7/9ShzMNlqoIbkJsRFV6ctkWAES73xKJ2ATbQ2G+98f
	588NlJ/dk=
X-Received: by 2002:a5d:4891:0:b0:21b:88c9:69ae with SMTP id
 g17-20020a5d4891000000b0021b88c969aemr9717996wrq.84.1656610936929;
        Thu, 30 Jun 2022 10:42:16 -0700 (PDT)
X-Google-Smtp-Source: 
 AGRyM1sw9LueqJXiGYh9vTZRm/vXbhn6V7fx4QOYPiOwyxToa0ohTzY1DxjM+EBFPMSCoTmBt1FK+7eOwMNshYmfaCI=
X-Received: by 2002:a5d:4891:0:b0:21b:88c9:69ae with SMTP id
 g17-20020a5d4891000000b0021b88c969aemr9717973wrq.84.1656610936674; Thu, 30
 Jun 2022 10:42:16 -0700 (PDT)
MIME-Version: 1.0
References: <20220630173642.4084-1-sinthu.raja@ti.com>
In-Reply-To: <20220630173642.4084-1-sinthu.raja@ti.com>
From: Sinthu Raja M <sinthu.raja@mistralsolutions.com>
Date: Thu, 30 Jun 2022 23:12:05 +0530
Message-ID: 
 <CAEd-yTRDYA9EtJg=VfE9mvL1Lo70qn_gEnm-mCQkF4jfhCfcgQ@mail.gmail.com>
Subject: Re: [meta-arago][oe-layersetup][PATCH V2] processor-sdk-linux: Add
 08.02.01.00 release config
To: meta-arago@lists.yoctoproject.org
Cc: Lucas Weaver <l-weaver@ti.com>, Yogesh Siraswar <yogeshs@ti.com>,
	"Bajjuri, Praneeth" <praneeth@ti.com>, "Limaye, Aniket" <a-limaye@ti.com>,
 reatmon@ti.com,
	Sinthu Raja <sinthu.raja@ti.com>
Content-Type: text/plain; charset="UTF-8"
X-BESS-ID: 1656610937-304337-5409-27176-1
X-BESS-VER: 2019.1_20220627.1822
X-BESS-Apparent-Source-IP: 209.85.128.71
X-BESS-Outbound-Spam-Score: 0.50
X-BESS-Outbound-Spam-Report: Code version 3.2,
 rules version 3.2.2.241048 [from
	cloudscan20-180.eu-central-1b.ess.aws.cudaops.com]
	Rule breakdown below
	 pts rule name              description
	---- ---------------------- --------------------------------
	0.50 BSF_RULE7568M          META: Custom Rule 7568M
	0.00 BSF_BESS_OUTBOUND      META: BESS Outbound
X-BESS-Outbound-Spam-Status: SCORE=0.50 using account:ESS91090 scores of
 KILL_LEVEL=7.0 tests=BSF_RULE7568M, BSF_BESS_OUTBOUND
X-BESS-BRTS-Status: 1
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Thu, 30 Jun 2022 17:42:32 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/13930

On Thu, Jun 30, 2022 at 11:07 PM Sinthu Raja
<sinthu.raja@mistralsolutions.com> wrote:
>
> From: Sinthu Raja <sinthu.raja@ti.com>
>
> Add config file for processor-sdk-linux 08.02.01.00 release
>
> Signed-off-by: Sinthu Raja <sinthu.raja@ti.com>
> ---
> Change in V2:
> ------------
> 1.Addressed the following review comments
>   Updated url from git:// to https://

Adding Patch V1 path
Patch V1: https://lists.yoctoproject.org/g/meta-arago/message/13920
>
>  .../processor-sdk-linux-08_02_01_00.txt          | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
>  create mode 100644 configs/processor-sdk-linux/processor-sdk-linux-08_02_01_00.txt
>
> diff --git a/configs/processor-sdk-linux/processor-sdk-linux-08_02_01_00.txt b/configs/processor-sdk-linux/processor-sdk-linux-08_02_01_00.txt
> new file mode 100644
> index 0000000..b42f802
> --- /dev/null
> +++ b/configs/processor-sdk-linux/processor-sdk-linux-08_02_01_00.txt
> @@ -0,0 +1,16 @@
> +# This file takes repo entries in the format
> +# repo name,repo uri,repo branch,repo commit[,layers=layer1:layer2...:layern]
> +
> +bitbake,https://git.openembedded.org/bitbake,1.46,d22cc1e587c650fd5f90cda32f5720f8a3105aac
> +meta-arago,git://git.yoctoproject.org/meta-arago,dunfell,08.02.00.006,layers=meta-arago-distro:meta-arago-extras
> +#meta-browser,git://github.com/OSSystems/meta-browser.git,master,5f365ef0f842ba4651efe88787cf9c63bc8b6cb3,layers=
> +meta-qt5,https://github.com/meta-qt5/meta-qt5.git,dunfell,6bfe29d9e8fdd5c2fd17c736814b6df859b3af50,layers=
> +meta-virtualization,https://git.yoctoproject.org/meta-virtualization,dunfell,c5f61e547b90aa8058cf816f00902afed9c96f72,layers=
> +meta-openembedded,https://git.openembedded.org/meta-openembedded,dunfell,0722ff6f021df91542b5efa1ff5b5f6269f66add,layers=meta-networking:meta-python:meta-oe:meta-gnome:meta-filesystems
> +meta-ti,git://git.yoctoproject.org/meta-ti,dunfell,08.02.00.006,layers=
> +meta-arm,https://git.yoctoproject.org/meta-arm,HEAD,c4f04f3fb66f8f4365b08b553af8206372e90a63,layers=meta-arm:meta-arm-toolchain
> +oe-core,https://git.openembedded.org/openembedded-core,dunfell,51844f2d60d77fb8cb46ffe460402f76ae216ca5,layers=meta
> +meta-psdkla,https://git.ti.com/git/jacinto-linux/meta-psdkla.git,am57xx_8.x,PSDKLA-AM57XX-08_02_01_00,layers=
> +OECORELAYERCONF=./sample-files/bblayers.conf.sample
> +OECORELOCALCONF=./sample-files/local-arago64.conf.sample
> +
> --
> 2.36.1
>


-- 
With Regards
Sinthu Raja

