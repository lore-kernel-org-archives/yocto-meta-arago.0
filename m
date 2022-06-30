Return-Path: <sinthu.raja@mistralsolutions.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7023FC433EF
	for <webhook@archiver.kernel.org>; Thu, 30 Jun 2022 17:00:22 +0000 (UTC)
Received: from egress-ip4b.ess.de.barracuda.com
 (egress-ip4b.ess.de.barracuda.com [18.185.115.208])
 by mx.groups.io with SMTP id smtpd.web08.27710.1656608418249512553
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 30 Jun 2022 10:00:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mistralsolutions.com header.s=google header.b=M+gAhAUp;
 spf=pass (domain: mistralsolutions.com, ip: 18.185.115.208,
 mailfrom: sinthu.raja@mistralsolutions.com)
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by mx-outbound16-241.eu-central-1b.ess.aws.cudaops.com
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
 Thu, 30 Jun 2022 17:00:15 +0000
Received: by mail-wm1-f70.google.com with SMTP id
 p6-20020a05600c358600b003a0483b3c2eso1755147wmq.3
        for <meta-arago@lists.yoctoproject.org>;
 Thu, 30 Jun 2022 10:00:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mistralsolutions.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=m97benkYm6QsK58FxTHqDsAyT0i5L8ylf3IKunpTFXo=;
        b=M+gAhAUphVpNM15a0muWDU4tiGlQuPTdcfzdJaInv2US0IbF8I2ikZHOkQNBxthSKG
         K7mAl+UxXqOBbaNKBFNVU5L71hRyGDPv4ujgiGf8BgEL7fokveNmafYlHHMpaD0KsA9w
         ouxjPAhjimzz5mQjuf+xBwDqHqThhNMbawpHQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=m97benkYm6QsK58FxTHqDsAyT0i5L8ylf3IKunpTFXo=;
        b=HYVciFP6R8HpBeCRheN1EbwKMqBv/ZBnUFxFAc800vTtw4VyJpt6H3qHvylwQzY5oR
         RJcaySR5tgrazeBV3/ObqOSYi3dHcMcQX1Rb86iiUbdbbe04QxBju4qPNSK7r5u7Hxe9
         8vNcBhZURyTwoMLcAxl4FJTvsmIEpsbk/4rMdPmfBEkMsUP5XE4jojPlgllZkrQiDOGZ
         yvXMv9h/++lBByn+7I7mWFj+Pbt4RNhhqJhQZ8liNRm3dufeRY089Md7wzMohPIhEaWx
         dSppDDEZH2woD224fFbzYP40ZE8L6af+V5ZxScFhlE//uHUifrCvnTCKePH1nDL3R09C
         P/fw==
X-Gm-Message-State: AJIora8jId6mI0xhq/U6NrBy8nIEjVOP020eS9Xj974oNj3ON7RTqqeg
	vN5hdh9PaxGGFxOt4aOgEtEFwj/IcqeFqZ8SGxLJ67i3XcZN0MNdKxnk4RL0+6riRBggO1GQtZd
	2KEeLO2Ie5mfqnML39OXo5hM2X5LzKlDrCSBQ06zG66vNkCqgzKFGABrfy+CPSTMCZRXOEDX7ku
	3BYKhajZc=
X-Received: by 2002:a5d:4382:0:b0:21b:8c03:639f with SMTP id
 i2-20020a5d4382000000b0021b8c03639fmr9471074wrq.406.1656608415151;
        Thu, 30 Jun 2022 10:00:15 -0700 (PDT)
X-Google-Smtp-Source: 
 AGRyM1vaIbaRsWXAPgpyjP1QP8I/ERvSadyKVGviPppxLPy9gIZ/F9icmJ/ogGTbgBmjuwcN9dPBM/H4NM+ZCXAbWxk=
X-Received: by 2002:a5d:4382:0:b0:21b:8c03:639f with SMTP id
 i2-20020a5d4382000000b0021b8c03639fmr9471038wrq.406.1656608414811; Thu, 30
 Jun 2022 10:00:14 -0700 (PDT)
MIME-Version: 1.0
References: <20220628160413.22705-1-a-limaye@ti.com>
 <CAEd-yTQPQRD59dVtPOF26yjXsDuce92=R+015wK+c1=V4oDatA@mail.gmail.com>
 <e3e9fca1-0647-c99b-9c8f-0b2421c7f0d5@ti.com>
In-Reply-To: <e3e9fca1-0647-c99b-9c8f-0b2421c7f0d5@ti.com>
From: Sinthu Raja M <sinthu.raja@mistralsolutions.com>
Date: Thu, 30 Jun 2022 22:30:03 +0530
Message-ID: 
 <CAEd-yTSM5Gh920d2q=fz0Xhd4_hDNRbxpzZK0qFaPkqvFVGSUA@mail.gmail.com>
Subject: Re: [meta-arago][oe-layersetup][PATCH] processor-sdk-linux: Add
 08.02.01.00 release config
To: "Bajjuri, Praneeth" <praneeth@ti.com>
Cc: "Limaye, Aniket" <a-limaye@ti.com>, meta-arago@lists.yoctoproject.org,
	Lucas Weaver <l-weaver@ti.com>, Yogesh Siraswar <yogeshs@ti.com>,
 reatmon@ti.com,
	Sinthu Raja <sinthu.raja@ti.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-BESS-ID: 1656608415-304337-5403-25720-1
X-BESS-VER: 2019.1_20220627.1822
X-BESS-Apparent-Source-IP: 209.85.128.70
X-BESS-Outbound-Spam-Score: 0.00
X-BESS-Outbound-Spam-Report: Code version 3.2,
 rules version 3.2.2.241047 [from
	cloudscan18-94.eu-central-1b.ess.aws.cudaops.com]
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
 <meta-arago@lists.yoctoproject.org>; Thu, 30 Jun 2022 17:00:22 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/13927

On Thu, Jun 30, 2022 at 10:15 PM Bajjuri, Praneeth <praneeth@ti.com> wrote:
>
>
>
> On 6/30/2022 9:12 PM, Sinthu Raja M wrote:
> > Hi Praneeth/Yogesh,
> > Please review this patch and provide your feedback.
>
> Maintainer for this repository is Ryan Eatmon. FYI.
>
>
> >
> >
> > On Tue, Jun 28, 2022 at 9:34 PM a-limaye via lists.yoctoproject.org
> > <a-limaye=3Dti.com@lists.yoctoproject.org> wrote:
> >>
> >> From: Sinthu Raja <sinthu.raja@ti.com>
> >>
> >> Add config file for processor-sdk-linux 08.02.01.00 release
> >>
> >> Signed-off-by: Sinthu Raja <sinthu.raja@ti.com>
> >> ---
> >>   .../processor-sdk-linux-08_02_01_00.txt          | 16 ++++++++++++++=
++
> >>   1 file changed, 16 insertions(+)
> >>   create mode 100644 configs/processor-sdk-linux/processor-sdk-linux-0=
8_02_01_00.txt
> >>
> >> diff --git a/configs/processor-sdk-linux/processor-sdk-linux-08_02_01_=
00.txt b/configs/processor-sdk-linux/processor-sdk-linux-08_02_01_00.txt
> >> new file mode 100644
> >> index 0000000..806181a
> >> --- /dev/null
> >> +++ b/configs/processor-sdk-linux/processor-sdk-linux-08_02_01_00.txt
> >> @@ -0,0 +1,16 @@
> >> +# This file takes repo entries in the format
> >> +# repo name,repo uri,repo branch,repo commit[,layers=3Dlayer1:layer2.=
..:layern]
> >> +
> >> +bitbake,https://linkprotect.cudasvc.com/url?a=3Dhttps%3a%2f%2fgit%3a%=
2f%2fgit.openembedded.org%2fbitbake%2c1.46%2cd22cc1e587c650fd5f90cda32f5720=
f8a3105aac&c=3DE,1,CJPqQp9cz9VRPISa2BpJOS7CDeYD3Q31ngK3Rom8LyYfOFenL_da1e0a=
9Ir499-SPau-X-7JiELoWBxHfVMYaGLuJKvjKFM8r1h-8_GP134mod4,&typo=3D1
> >> +meta-arago,https://linkprotect.cudasvc.com/url?a=3Dhttps%3a%2f%2fgit%=
3a%2f%2fgit.yoctoproject.org%2fmeta-arago%2cdunfell%2c08.02.00.006%2clayers=
%3dmeta-arago-distro%3ameta-arago-extras&c=3DE,1,ViGQuIK_xgcYaT5ii8ZqIrPmK9=
26-PV7NXMBmxsE9NtQ9oaSOoWUEzoKxF3ergRPwQ2jUMuc5FoMs05Q5ACj0IrDMLXFnnDnNnjJT=
6IlfJ_dlqb1&typo=3D1
>
> This urls are wrong. Have you actually tested this configuration.

Yes, We have tested this and it is working fine. However, I am pushing
the updated V2 version.
I guess you are mentioning the git: =3D> https:

>
> Please check similar patch in configs/processor-sdk-linux and resubmit
> it correctly.
>
>
> same issues with urls below .
>
Regards,
Sinthu Raja.
>
> >> +#meta-browser,git://github.com/OSSystems/meta-browser.git,master,5f36=
5ef0f842ba4651efe88787cf9c63bc8b6cb3,layers=3D
> >> +meta-qt5,https://github.com/meta-qt5/meta-qt5.git,dunfell,6bfe29d9e8f=
dd5c2fd17c736814b6df859b3af50,layers=3D
> >> +meta-virtualization,https://linkprotect.cudasvc.com/url?a=3Dhttps%3a%=
2f%2fgit%3a%2f%2fgit.yoctoproject.org%2fmeta-virtualization%2cdunfell%2cc5f=
61e547b90aa8058cf816f00902afed9c96f72%2clayers%3d&c=3DE,1,UM6T3tFuP8jlzJo1N=
BFxNNGbGD1xEnZTtK1CEdsWu5bj2t__kYHSMZ7ohBse0HwgfpuXcS_YWm54jxrrrGZyTHeaRNo4=
5eYWhIH6_Fi_XbCb&typo=3D1
> >> +meta-openembedded,https://linkprotect.cudasvc.com/url?a=3Dhttps%3a%2f=
%2fgit%3a%2f%2fgit.openembedded.org%2fmeta-openembedded%2cdunfell%2c0722ff6=
f021df91542b5efa1ff5b5f6269f66add%2clayers%3dmeta-networking%3ameta-python%=
3ameta-oe%3ameta-gnome%3ameta-filesystems&c=3DE,1,-9as3qwbla2lLyeO4D2tcSDd5=
TCtdQcNnAViHHZ-vSOufXT6CtItfvmGs8zHAcsxxyrx_p34Mhy7pnZeTUaVCdmS8Dwm9g3xsY3j=
w9wGsYI2&typo=3D1
> >> +meta-ti,https://linkprotect.cudasvc.com/url?a=3Dhttps%3a%2f%2fgit%3a%=
2f%2fgit.yoctoproject.org%2fmeta-ti%2cdunfell%2c08.02.00.006%2clayers%3d&c=
=3DE,1,c7DDPy_qIawYP4wKM2lEtyQQrsRLncwy1HxL4nYwdS9CtlL8DYEmSkLyd1mH39b119yh=
ZAlovdW8Glc5TK688P-OpgvKAfpWLbEL0ZVmUymrQQayUhPy0w,,&typo=3D1
> >> +meta-arm,https://linkprotect.cudasvc.com/url?a=3Dhttps%3a%2f%2fgit%3a=
%2f%2fgit.yoctoproject.org%2fmeta-arm%2cHEAD%2cc4f04f3fb66f8f4365b08b553af8=
206372e90a63%2clayers%3dmeta-arm%3ameta-arm-toolchain&c=3DE,1,FAdWN5EBmyGUI=
knnuKG13MEuFRNp1V5UVBzZNA3IjfBb8WaQBNX3bvPaMXD-b8ZouN3xUfQjaEgebO5w586IvhWx=
mlvRzgh5DbE9-xcCow0fEVMj7swB&typo=3D1
> >> +oe-core,https://linkprotect.cudasvc.com/url?a=3Dhttps%3a%2f%2fgit%3a%=
2f%2fgit.openembedded.org%2fopenembedded-core%2cdunfell%2c51844f2d60d77fb8c=
b46ffe460402f76ae216ca5%2clayers%3dmeta&c=3DE,1,wl6vIv0IhcxHZif-eK1JOtEXpHx=
kztPr3czaq2eOW_cpsoeNv5bqyDxMhQZTc3YhUn_fXLJiDc0JkScseJ0YCthZyaPV1AHF956CFE=
vFaPU0DVBE5TBn7Q,,&typo=3D1
> >> +meta-psdkla,https://git.ti.com/git/jacinto-linux/meta-psdkla.git,am57=
xx_8.x,PSDKLA-AM57XX-08_02_01_00,layers=3D
> >> +OECORELAYERCONF=3D./sample-files/bblayers.conf.sample
> >> +OECORELOCALCONF=3D./sample-files/local-arago64.conf.sample
> >> +
> >> --
> >> 2.17.1
> >>
> >>
> >>
> >> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >> Links: You receive all messages sent to this group.
> >> View/Reply Online (#13920): https://linkprotect.cudasvc.com/url?a=3Dht=
tps%3a%2f%2flists.yoctoproject.org%2fg%2fmeta-arago%2fmessage%2f13920&c=3DE=
,1,3t8YhtFMHdQ5ETFZSsvBnS5t1I86yh5fXkOlD8kJi6Y3TcE5pQrI64C7CK7lUhhsdSdZ7Jhy=
kpSDDvfiff5wHn-yi9wtqOOWQUIToQ4hBQvyLELxSf7PbcX28zhC&typo=3D1
> >> Mute This Topic: https://linkprotect.cudasvc.com/url?a=3Dhttps%3a%2f%2=
flists.yoctoproject.org%2fmt%2f92047026%2f6034914&c=3DE,1,P_zXeLOTVWou7dtD8=
gm7ItgGAi3Ky2GQiorA6h9bGiCIJW5pONYk4vf3TvwpFQftIRmgb9CAq2l3jy9d0iJKIjAO6zhc=
S0_pHc_K_XayrKHgvQbRktMWSfqu&typo=3D1
> >> Group Owner: meta-arago+owner@lists.yoctoproject.org
> >> Unsubscribe: https://linkprotect.cudasvc.com/url?a=3Dhttps%3a%2f%2flis=
ts.yoctoproject.org%2fg%2fmeta-arago%2funsub&c=3DE,1,MsOv63smjRpXf9RGZ20pGp=
YlC4KPBLmuW-zAIdE6dIlnQhyQIjFyYy1D8zWCLrJmu-pWuyGAWNV7t77_eNPX1arik_3CPhods=
q8DA3Q_bDHv&typo=3D1 [sinthu.raja@mistralsolutions.com]
> >> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >>
> >>
> >
> >



--=20
With Regards
Sinthu Raja

