Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 38139C4345F
	for <webhook@archiver.kernel.org>; Wed, 24 Apr 2024 20:10:34 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web10.6731.1713989429170499248
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 24 Apr 2024 13:10:29 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 8978540C8A;
	Wed, 24 Apr 2024 20:10:28 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id j4gHLFqH_qzV; Wed, 24 Apr 2024 20:10:28 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-87-159.washdc.fios.verizon.net [100.15.87.159])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 266B440BE6;
	Wed, 24 Apr 2024 20:10:23 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 11761163F33; Wed, 24 Apr 2024 16:10:23 -0400 (EDT)
Date: Wed, 24 Apr 2024 16:10:23 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: Ryan Eatmon <reatmon@ti.com>
Cc: Chirag Shilwant <c-shilwant@ti.com>, meta-arago@lists.yoctoproject.org,
	Gyan Gupta <g-gupta@ti.com>, dannenberg@ti.com
Subject: Re: [meta-arago][master/scarthgap][PATCH] meta-arago-distro:
 recipes-core: Add no-fstab-update option to WIC_CREATE_EXTRA_ARG
Message-ID: <20240424201023.GE28791@denix.org>
References: <20240420125318.397900-1-c-shilwant@ti.com>
 <20240421030736.GZ28791@denix.org>
 <1e3b95f7-e43f-44c9-92c5-15fdbc5ce8ab@ti.com>
 <20240422223206.GB28791@denix.org>
 <f42a8731-8dfc-4459-b440-824ce0285c20@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
In-Reply-To: <f42a8731-8dfc-4459-b440-824ce0285c20@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Wed, 24 Apr 2024 20:10:34 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15309

On Wed, Apr 24, 2024 at 08:32:52AM -0500, Ryan Eatmon wrote:
>=20
>=20
> On 4/22/2024 5:32 PM, Denys Dmytriyenko wrote:
> >On Sun, Apr 21, 2024 at 02:42:23PM +0530, Chirag Shilwant wrote:
> >>+ Andreas
> >>On 21/04/24 08:37, Denys Dmytriyenko wrote:
> >>>On Sat, Apr 20, 2024 at 06:23:18PM +0530, Chirag Shilwant wrote:
> >>>>- Ideally running `ls /boot/` in filesystem should list contents fr=
om /rootfs/boot partition
> >>>>but currently it lists the contents of /boot partition of the WIC I=
mage.
> >>>>
> >>>>Eg - Incase of AM64x,
> >>>>```
> >>>>     root@am64xx-evm:~# ls /boot/
> >>>>     EFI  Image  tiboot3-am64x-gp-evm.bin  tiboot3-am64x_sr2-hs-evm=
.bin  tiboot3-am64x_sr2-hs-fs-evm.bin  tiboot3.bin  tispl.bin  u-boot.img=
  uEnv.txt
> >>>Will this change affect EFI? As there's EFI directory in that partit=
ion.
> >>
> >>The EFI partition under /rootfs/boot will still be present.
> >>Following is the output of `ls /boot` with this patch,
> >>
> >>```
> >>root@am64xx-evm:~# ls /boot
> >>EFI=A0 Image=A0 Image-6.1.80-ti-g2e423244f8c0 dtb=A0 fitImage
> >>fitImage-6.1.80-ti-g2e423244f8c0
> >>
> >>```
> >
> >Thanks, I'll do some additional testing with EFI a bit later.
> >
> >
> >>>>- To fix this issue, add --no-fstab-update flag to WIC_CREATE_EXTRA=
_ARG in arago-image.inc
> >>>>to prevent WIC image from adding an additional entry in /etc/fstab.
> >>>This flag is global and will prevent all other partitions from popul=
ating
> >>>/etc/fstab properly. Sure, meta-ti only has /boot and / defined, but=
 other
> >>>layers could have own wic files with e.g. /home or /data partitions.=
 Mounting
> >>>those will require a custom /etc/fstab instead of wic creating corre=
sponding
> >>>entries automatically.
> >>>
> >>
> >>
> >>Apparently, this change was being carried in processor sdk layer from
> >>quite a long time (from dunfell) to resolve a customer issue
> >>reported by Andreas.
> >>Diving into our internal JIRA system showed that this fix was
> >>suggested by Andreas
> >>& was resolved by the SDK team back then by keeping this change in
> >>processor sdk layer [1].
> >>Not sure why this was in processor sdk layer though. Maybe Andreas
> >>can provide additional details.
> >
> >I tested and submitted a different fix last night to adjust WIC templa=
tes to
> >not mount boot partition under /boot directory[1]. I still believe doi=
ng it
> >just for that one partition is better than disabling fstab updates glo=
bally.
> >
> >[1] https://patchwork.yoctoproject.org/project/ti/patch/20240421191458=
.2221303-1-denis@denix.org/
>=20
> So with the above referenced patch in meta-ti, I'm assuming we do
> not need this patch in meta-arago?

That's my pitch here.

Chirag,

Will that work for you and others?


> >Can you please take a look and maybe test this option for your use cas=
e?
> >Thanks.

--=20
Denys

