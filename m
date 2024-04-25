Return-Path: <c-shilwant@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3BDF4C4345F
	for <webhook@archiver.kernel.org>; Thu, 25 Apr 2024 09:13:19 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web11.12549.1714036393794519457
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 25 Apr 2024 02:13:14 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=ti-com-17Q1 header.b=JWaOL7Lm;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: c-shilwant@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 43P9DAKZ000311;
	Thu, 25 Apr 2024 04:13:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1714036391;
	bh=1yF2KlWNXwGur4V+BO+jo7KpPera9stunW4O9UJXWrE=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=JWaOL7LmRS0gSj4/8rga0IO/FdQMh1DCs3i2elB7/d7Mux4qglr8m+oXeS2Io2Ipo
	 vbf/Fd6X+u+2eHlYzJm/PuadLbaY8O2mjSgSIAOtO4gpM33BKeyZd1BvAXC/Erdiav
	 4xctc1mYP0SE3i4NZjxhH/oAPQuJrSJCVvkaDMQc=
Received: from DFLE107.ent.ti.com (dfle107.ent.ti.com [10.64.6.28])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 43P9DARB035973
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 25 Apr 2024 04:13:10 -0500
Received: from DFLE109.ent.ti.com (10.64.6.30) by DFLE107.ent.ti.com
 (10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 25
 Apr 2024 04:13:10 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 25 Apr 2024 04:13:10 -0500
Received: from [172.24.227.238] (chirag-hp-z2-tower-g5-workstation.dhcp.ti.com [172.24.227.238])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 43P9D8rL009846;
	Thu, 25 Apr 2024 04:13:09 -0500
Message-ID: <38109364-e047-4772-9df2-bb2df4c9933d@ti.com>
Date: Thu, 25 Apr 2024 14:43:07 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [EXTERNAL] Re: [meta-arago][master/scarthgap][PATCH]
 meta-arago-distro: recipes-core: Add no-fstab-update option to
 WIC_CREATE_EXTRA_ARG
To: Denys Dmytriyenko <denis@denix.org>, Ryan Eatmon <reatmon@ti.com>
CC: <meta-arago@lists.yoctoproject.org>, Gyan Gupta <g-gupta@ti.com>,
        <dannenberg@ti.com>
References: <20240420125318.397900-1-c-shilwant@ti.com>
 <20240421030736.GZ28791@denix.org>
 <1e3b95f7-e43f-44c9-92c5-15fdbc5ce8ab@ti.com>
 <20240422223206.GB28791@denix.org>
 <f42a8731-8dfc-4459-b440-824ce0285c20@ti.com>
 <20240424201023.GE28791@denix.org>
 <17C96D5BC5250FE5.19690@lists.yoctoproject.org>
Content-Language: en-US
From: Chirag Shilwant <c-shilwant@ti.com>
In-Reply-To: <17C96D5BC5250FE5.19690@lists.yoctoproject.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by fllv0016.ext.ti.com id 43P9DAKZ000311
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Thu, 25 Apr 2024 09:13:19 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15311

Hi,
On 25/04/24 10:32, Chirag Shilwant via lists.yoctoproject.org wrote:
> Hi Denys, On 25/04/24 01:=E2=80=8A40, Denys Dmytriyenko wrote: > On Wed=
, Apr=20
> 24, 2024 at 08:=E2=80=8A32:=E2=80=8A52AM -0500, Ryan Eatmon wrote: >> >=
> On 4/22/2024=20
> 5:=E2=80=8A32 PM, Denys Dmytriyenko wrote: >>> On Sun, Apr 21, 2024 at=20
> 02:=E2=80=8A42:=E2=80=8A23PM +0530,
> ZjQcmQRYFpfptBannerStart
> This message was sent from outside of Texas Instruments.
> Do not click links or open attachments unless you recognize the source=20
> of this email and know the content is safe. If you wish to report this=20
> message to IT Security, please forward the message as an attachment to=20
> phishing@list.ti.com
> ZjQcmQRYFpfptBannerEnd
> Hi Denys,
> On 25/04/24 01:40, Denys Dmytriyenko wrote:
> > On Wed, Apr 24, 2024 at 08:32:52AM -0500, Ryan Eatmon wrote:
> >>
> >> On 4/22/2024 5:32 PM, Denys Dmytriyenko wrote:
> >>> On Sun, Apr 21, 2024 at 02:42:23PM +0530, Chirag Shilwant wrote:
> >>>> + Andreas
> >>>> On 21/04/24 08:37, Denys Dmytriyenko wrote:
> >>>>> On Sat, Apr 20, 2024 at 06:23:18PM +0530, Chirag Shilwant wrote:
> >>>>>> - Ideally running `ls /boot/` in filesystem should list contents=
 from /rootfs/boot partition
> >>>>>> but currently it lists the contents of /boot partition of the WI=
C Image.
> >>>>>>
> >>>>>> Eg - Incase of AM64x,
> >>>>>> ```
> >>>>>>      root@am64xx-evm:~# ls /boot/
> >>>>>>      EFI  Image  tiboot3-am64x-gp-evm.bin  tiboot3-am64x_sr2-hs-=
evm.bin  tiboot3-am64x_sr2-hs-fs-evm.bin  tiboot3.bin  tispl.bin  u-boot.=
img  uEnv.txt
> >>>>> Will this change affect EFI? As there's EFI directory in that par=
tition.
> >>>> The EFI partition under /rootfs/boot will still be present.
> >>>> Following is the output of `ls /boot` with this patch,
> >>>>
> >>>> ```
> >>>> root@am64xx-evm:~# ls /boot
> >>>> EFI=C2=A0 Image=C2=A0 Image-6.1.80-ti-g2e423244f8c0 dtb=C2=A0 fitI=
mage
> >>>> fitImage-6.1.80-ti-g2e423244f8c0
> >>>>
> >>>> ```
> >>> Thanks, I'll do some additional testing with EFI a bit later.
> >>>
> >>>
> >>>>>> - To fix this issue, add --no-fstab-update flag to WIC_CREATE_EX=
TRA_ARG in arago-image.inc
> >>>>>> to prevent WIC image from adding an additional entry in /etc/fst=
ab.
> >>>>> This flag is global and will prevent all other partitions from po=
pulating
> >>>>> /etc/fstab properly. Sure, meta-ti only has /boot and / defined, =
but other
> >>>>> layers could have own wic files with e.g. /home or /data partitio=
ns. Mounting
> >>>>> those will require a custom /etc/fstab instead of wic creating co=
rresponding
> >>>>> entries automatically.
> >>>>>
> >>>>
> >>>> Apparently, this change was being carried in processor sdk layer f=
rom
> >>>> quite a long time (from dunfell) to resolve a customer issue
> >>>> reported by Andreas.
> >>>> Diving into our internal JIRA system showed that this fix was
> >>>> suggested by Andreas
> >>>> & was resolved by the SDK team back then by keeping this change in
> >>>> processor sdk layer [1].
> >>>> Not sure why this was in processor sdk layer though. Maybe Andreas
> >>>> can provide additional details.
> >>> I tested and submitted a different fix last night to adjust WIC tem=
plates to
> >>> not mount boot partition under /boot directory[1]. I still believe =
doing it
> >>> just for that one partition is better than disabling fstab updates =
globally.
> >>>
> >>> [1] https://urldefense.com/v3/__https://patchwork.yoctoproject.org/=
project/ti/patch/20240421191458.2221303-1-denis@denix.org/__;!!G3vK!Qwf1x=
-GVI8r-vE0PXQX0UPdf9Wvl5Dp5bgpXJk3tcBfm8Dae64HW2APer6EWUrW4uAhOK3m7xVvsOm=
_KrFX_7d-6nDuRMT8M2qlU$
> >> So with the above referenced patch in meta-ti, I'm assuming we do
> >> not need this patch in meta-arago?

Ryan, We can ignore this patch.
Since we have integrated Denys patch in meta-ti, I will go ahead
and remove WIC_CREATE_EXTRA_ARG from meta-tisdk as well [1]

[1]:=20
https://git.ti.com/cgit/ti-sdk-linux/meta-tisdk/tree/recipes-core/images?=
h=3Dscarthgap



> > That's my pitch here.
> >
> > Chirag,
> >
> > Will that work for you and others?
>
>
> Let me kickoff a build with your meta-ti patch [1] & see if that works
> for us as well.

Denys,

As you pitched, it works for us as well.
I don't see the boot binaries under /rootfs/boot with your meta-ti patch =
[1]
Running `ls /boot/` in filesystem now lists the following,

```

root@am64xx-evm:~# ls /boot/
EFI=C2=A0 Image=C2=A0 Image-6.1.80-ti-g2e423244f8c0 dtb=C2=A0 fitImage=C2=
=A0=20
fitImage-6.1.80-ti-g2e423244f8c0

```

[1]:=20
https://patchwork.yoctoproject.org/project/ti/patch/20240421191458.222130=
3-1-denis@denix.org/


> Will get back in a day or two.
>
> [1]:
> https://urldefense.com/v3/__https://patchwork.yoctoproject.org/project/=
ti/patch/20240421191458.2221303-1-denis@denix.org/__;!!G3vK!Qwf1x-GVI8r-v=
E0PXQX0UPdf9Wvl5Dp5bgpXJk3tcBfm8Dae64HW2APer6EWUrW4uAhOK3m7xVvsOm_KrFX_7d=
-6nDuRMT8M2qlU$ =20
>
>
> >
> >
> >>> Can you please take a look and maybe test this option for your use =
case?
> >>> Thanks.
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#15310):https://urldefense.com/v3/__https://lists.yo=
ctoproject.org/g/meta-arago/message/15310__;!!G3vK!Qwf1x-GVI8r-vE0PXQX0UP=
df9Wvl5Dp5bgpXJk3tcBfm8Dae64HW2APer6EWUrW4uAhOK3m7xVvsOm_KrFX_7d-6nDuRMaD=
JiVhR$
> Mute This Topic:https://urldefense.com/v3/__https://lists.yoctoproject.=
org/mt/105635090/7030289__;!!G3vK!Qwf1x-GVI8r-vE0PXQX0UPdf9Wvl5Dp5bgpXJk3=
tcBfm8Dae64HW2APer6EWUrW4uAhOK3m7xVvsOm_KrFX_7d-6nDuRMfG91eNy$
> Group Owner: meta-arago+owner@lists.yoctoproject.org
> Unsubscribe:https://urldefense.com/v3/__https://lists.yoctoproject.org/=
g/meta-arago/unsub__;!!G3vK!Qwf1x-GVI8r-vE0PXQX0UPdf9Wvl5Dp5bgpXJk3tcBfm8=
Dae64HW2APer6EWUrW4uAhOK3m7xVvsOm_KrFX_7d-6nDuRMT03j9XI$  [c-shilwant@ti.=
com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

