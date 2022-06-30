Return-Path: <sinthu.raja@mistralsolutions.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1205AC43334
	for <webhook@archiver.kernel.org>; Thu, 30 Jun 2022 15:43:52 +0000 (UTC)
Received: from egress-ip4a.ess.de.barracuda.com
 (egress-ip4a.ess.de.barracuda.com [18.184.203.227])
 by mx.groups.io with SMTP id smtpd.web09.26995.1656603784117162216
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 30 Jun 2022 08:43:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mistralsolutions.com header.s=google header.b=G5bxqwdk;
 spf=pass (domain: mistralsolutions.com, ip: 18.184.203.227,
 mailfrom: sinthu.raja@mistralsolutions.com)
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by mx-outbound10-247.eu-central-1a.ess.aws.cudaops.com
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
 Thu, 30 Jun 2022 15:43:01 +0000
Received: by mail-wm1-f70.google.com with SMTP id
 187-20020a1c02c4000000b003a18127d11aso1028763wmc.6
        for <meta-arago@lists.yoctoproject.org>;
 Thu, 30 Jun 2022 08:43:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mistralsolutions.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=LprQVNzqWAZSz6lAk56L57vK5RgFs+5VQ4FUz/piczw=;
        b=G5bxqwdkBOT2+EGVfvmO+2aV/BnMIseyqIx4Dt/enCAoBLA7G0Ypldn5jBRH6io6N2
         PJfoqJgC0MOWjMiHRzsDHwaF9AUoh1s/dBZcEn9XIQuShr9VYGLl6/FqIr+QScNjtDgc
         4O9eEAtttL1okV8k9Z4W8fjhMjZFOQ2a+tMLQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=LprQVNzqWAZSz6lAk56L57vK5RgFs+5VQ4FUz/piczw=;
        b=EZgUm8v9EIZkdZesA1Fapkh+HnHXYSfds8PJtTS8yQoZ1CjQPxieGQLpgsw/QkyPTq
         CQxuqKh6GmIZzzIdIh5m/aehvHGg42umD92sIOLCad+Qgmw1yZKg/IM25eLxm65i4uhC
         mDSAzx4QCOLNGWBt7nprE6JZ0LUVXp6fDBD8IQkjILxoHDwqsrPuwe1kGPHGXZ79+8vh
         wRY79pGPKFfaUoDJc9QPVGNiYW26X4syyFeUh93Ly3pYr/1pmdhc1hmF5afJRgPM0FEH
         4Obghxy22cAFK7WFX9v4LeI+Ehg2cWSJ5k71p8y0YRe8CL8hJgtveAYbwHevqW2LMhO9
         sydg==
X-Gm-Message-State: AJIora8GRkLJpzIc+qGSPpyswPBh4jUTcBHvl4Z5cqIFeVzvIVxw8061
	y1e7eRI3fPcEYzs7vVR6Cp7H1ccEna+Hey3kb1Xf0BMLggBV4ppNXVkNjlEY3OqKP3ET9GiPcWy
	oxoUEugIJcPw2iWl2qJCbVsciN0VxSwGXTD/L9BdSnJXj/qKDvpULU0z4U+Pudq3LUTSCiijfQj
	MHxJvCXP0=
X-Received: by 2002:a05:6000:156b:b0:21b:cc89:f792 with SMTP id
 11-20020a056000156b00b0021bcc89f792mr8563219wrz.421.1656603780901;
        Thu, 30 Jun 2022 08:43:00 -0700 (PDT)
X-Google-Smtp-Source: 
 AGRyM1tH33N6SL0vlL1nWSFY46NE1qyZymf7UboEbyvNEpgNTthtY3b4XkrAbHpwoBmLTfUKWcKeLyyuwrxOWaGi//8=
X-Received: by 2002:a05:6000:156b:b0:21b:cc89:f792 with SMTP id
 11-20020a056000156b00b0021bcc89f792mr8563193wrz.421.1656603780668; Thu, 30
 Jun 2022 08:43:00 -0700 (PDT)
MIME-Version: 1.0
References: <20220628160413.22705-1-a-limaye@ti.com>
In-Reply-To: <20220628160413.22705-1-a-limaye@ti.com>
From: Sinthu Raja M <sinthu.raja@mistralsolutions.com>
Date: Thu, 30 Jun 2022 21:12:49 +0530
Message-ID: 
 <CAEd-yTQPQRD59dVtPOF26yjXsDuce92=R+015wK+c1=V4oDatA@mail.gmail.com>
Subject: Re: [meta-arago][oe-layersetup][PATCH] processor-sdk-linux: Add
 08.02.01.00 release config
To: "Limaye, Aniket" <a-limaye@ti.com>
Cc: meta-arago@lists.yoctoproject.org, Lucas Weaver <l-weaver@ti.com>,
	Yogesh Siraswar <yogeshs@ti.com>, "Bajjuri, Praneeth" <praneeth@ti.com>,
 reatmon@ti.com,
	Sinthu Raja <sinthu.raja@ti.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-BESS-ID: 1656603781-302807-5603-22067-1
X-BESS-VER: 2019.1_20220627.1822
X-BESS-Apparent-Source-IP: 209.85.128.70
X-BESS-Outbound-Spam-Score: 0.00
X-BESS-Outbound-Spam-Report: Code version 3.2,
 rules version 3.2.2.241046 [from
	cloudscan10-227.eu-central-1a.ess.aws.cudaops.com]
	Rule breakdown below
	 pts rule name              description
	---- ---------------------- --------------------------------
	0.00 BSF_SC0_MISMATCH_TO    META: Envelope rcpt doesn't match header
	0.00 BSF_BESS_OUTBOUND      META: BESS Outbound
X-BESS-Outbound-Spam-Status: SCORE=0.00 using account:ESS91090 scores of
 KILL_LEVEL=7.0 tests=BSF_SC0_MISMATCH_TO, BSF_BESS_OUTBOUND
X-BESS-BRTS-Status: 1
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Thu, 30 Jun 2022 15:43:52 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/13925

Hi Praneeth/Yogesh,
Please review this patch and provide your feedback.


On Tue, Jun 28, 2022 at 9:34 PM a-limaye via lists.yoctoproject.org
<a-limaye=3Dti.com@lists.yoctoproject.org> wrote:
>
> From: Sinthu Raja <sinthu.raja@ti.com>
>
> Add config file for processor-sdk-linux 08.02.01.00 release
>
> Signed-off-by: Sinthu Raja <sinthu.raja@ti.com>
> ---
>  .../processor-sdk-linux-08_02_01_00.txt          | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
>  create mode 100644 configs/processor-sdk-linux/processor-sdk-linux-08_02=
_01_00.txt
>
> diff --git a/configs/processor-sdk-linux/processor-sdk-linux-08_02_01_00.=
txt b/configs/processor-sdk-linux/processor-sdk-linux-08_02_01_00.txt
> new file mode 100644
> index 0000000..806181a
> --- /dev/null
> +++ b/configs/processor-sdk-linux/processor-sdk-linux-08_02_01_00.txt
> @@ -0,0 +1,16 @@
> +# This file takes repo entries in the format
> +# repo name,repo uri,repo branch,repo commit[,layers=3Dlayer1:layer2...:=
layern]
> +
> +bitbake,https://linkprotect.cudasvc.com/url?a=3Dhttps%3a%2f%2fgit%3a%2f%=
2fgit.openembedded.org%2fbitbake%2c1.46%2cd22cc1e587c650fd5f90cda32f5720f8a=
3105aac&c=3DE,1,CJPqQp9cz9VRPISa2BpJOS7CDeYD3Q31ngK3Rom8LyYfOFenL_da1e0a9Ir=
499-SPau-X-7JiELoWBxHfVMYaGLuJKvjKFM8r1h-8_GP134mod4,&typo=3D1
> +meta-arago,https://linkprotect.cudasvc.com/url?a=3Dhttps%3a%2f%2fgit%3a%=
2f%2fgit.yoctoproject.org%2fmeta-arago%2cdunfell%2c08.02.00.006%2clayers%3d=
meta-arago-distro%3ameta-arago-extras&c=3DE,1,ViGQuIK_xgcYaT5ii8ZqIrPmK926-=
PV7NXMBmxsE9NtQ9oaSOoWUEzoKxF3ergRPwQ2jUMuc5FoMs05Q5ACj0IrDMLXFnnDnNnjJT6Il=
fJ_dlqb1&typo=3D1
> +#meta-browser,git://github.com/OSSystems/meta-browser.git,master,5f365ef=
0f842ba4651efe88787cf9c63bc8b6cb3,layers=3D
> +meta-qt5,https://github.com/meta-qt5/meta-qt5.git,dunfell,6bfe29d9e8fdd5=
c2fd17c736814b6df859b3af50,layers=3D
> +meta-virtualization,https://linkprotect.cudasvc.com/url?a=3Dhttps%3a%2f%=
2fgit%3a%2f%2fgit.yoctoproject.org%2fmeta-virtualization%2cdunfell%2cc5f61e=
547b90aa8058cf816f00902afed9c96f72%2clayers%3d&c=3DE,1,UM6T3tFuP8jlzJo1NBFx=
NNGbGD1xEnZTtK1CEdsWu5bj2t__kYHSMZ7ohBse0HwgfpuXcS_YWm54jxrrrGZyTHeaRNo45eY=
WhIH6_Fi_XbCb&typo=3D1
> +meta-openembedded,https://linkprotect.cudasvc.com/url?a=3Dhttps%3a%2f%2f=
git%3a%2f%2fgit.openembedded.org%2fmeta-openembedded%2cdunfell%2c0722ff6f02=
1df91542b5efa1ff5b5f6269f66add%2clayers%3dmeta-networking%3ameta-python%3am=
eta-oe%3ameta-gnome%3ameta-filesystems&c=3DE,1,-9as3qwbla2lLyeO4D2tcSDd5TCt=
dQcNnAViHHZ-vSOufXT6CtItfvmGs8zHAcsxxyrx_p34Mhy7pnZeTUaVCdmS8Dwm9g3xsY3jw9w=
GsYI2&typo=3D1
> +meta-ti,https://linkprotect.cudasvc.com/url?a=3Dhttps%3a%2f%2fgit%3a%2f%=
2fgit.yoctoproject.org%2fmeta-ti%2cdunfell%2c08.02.00.006%2clayers%3d&c=3DE=
,1,c7DDPy_qIawYP4wKM2lEtyQQrsRLncwy1HxL4nYwdS9CtlL8DYEmSkLyd1mH39b119yhZAlo=
vdW8Glc5TK688P-OpgvKAfpWLbEL0ZVmUymrQQayUhPy0w,,&typo=3D1
> +meta-arm,https://linkprotect.cudasvc.com/url?a=3Dhttps%3a%2f%2fgit%3a%2f=
%2fgit.yoctoproject.org%2fmeta-arm%2cHEAD%2cc4f04f3fb66f8f4365b08b553af8206=
372e90a63%2clayers%3dmeta-arm%3ameta-arm-toolchain&c=3DE,1,FAdWN5EBmyGUIknn=
uKG13MEuFRNp1V5UVBzZNA3IjfBb8WaQBNX3bvPaMXD-b8ZouN3xUfQjaEgebO5w586IvhWxmlv=
Rzgh5DbE9-xcCow0fEVMj7swB&typo=3D1
> +oe-core,https://linkprotect.cudasvc.com/url?a=3Dhttps%3a%2f%2fgit%3a%2f%=
2fgit.openembedded.org%2fopenembedded-core%2cdunfell%2c51844f2d60d77fb8cb46=
ffe460402f76ae216ca5%2clayers%3dmeta&c=3DE,1,wl6vIv0IhcxHZif-eK1JOtEXpHxkzt=
Pr3czaq2eOW_cpsoeNv5bqyDxMhQZTc3YhUn_fXLJiDc0JkScseJ0YCthZyaPV1AHF956CFEvFa=
PU0DVBE5TBn7Q,,&typo=3D1
> +meta-psdkla,https://git.ti.com/git/jacinto-linux/meta-psdkla.git,am57xx_=
8.x,PSDKLA-AM57XX-08_02_01_00,layers=3D
> +OECORELAYERCONF=3D./sample-files/bblayers.conf.sample
> +OECORELOCALCONF=3D./sample-files/local-arago64.conf.sample
> +
> --
> 2.17.1
>
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#13920): https://linkprotect.cudasvc.com/url?a=3Dhttps=
%3a%2f%2flists.yoctoproject.org%2fg%2fmeta-arago%2fmessage%2f13920&c=3DE,1,=
3t8YhtFMHdQ5ETFZSsvBnS5t1I86yh5fXkOlD8kJi6Y3TcE5pQrI64C7CK7lUhhsdSdZ7JhykpS=
DDvfiff5wHn-yi9wtqOOWQUIToQ4hBQvyLELxSf7PbcX28zhC&typo=3D1
> Mute This Topic: https://linkprotect.cudasvc.com/url?a=3Dhttps%3a%2f%2fli=
sts.yoctoproject.org%2fmt%2f92047026%2f6034914&c=3DE,1,P_zXeLOTVWou7dtD8gm7=
ItgGAi3Ky2GQiorA6h9bGiCIJW5pONYk4vf3TvwpFQftIRmgb9CAq2l3jy9d0iJKIjAO6zhcS0_=
pHc_K_XayrKHgvQbRktMWSfqu&typo=3D1
> Group Owner: meta-arago+owner@lists.yoctoproject.org
> Unsubscribe: https://linkprotect.cudasvc.com/url?a=3Dhttps%3a%2f%2flists.=
yoctoproject.org%2fg%2fmeta-arago%2funsub&c=3DE,1,MsOv63smjRpXf9RGZ20pGpYlC=
4KPBLmuW-zAIdE6dIlnQhyQIjFyYy1D8zWCLrJmu-pWuyGAWNV7t77_eNPX1arik_3CPhodsq8D=
A3Q_bDHv&typo=3D1 [sinthu.raja@mistralsolutions.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>


--=20
With Regards
Sinthu Raja

