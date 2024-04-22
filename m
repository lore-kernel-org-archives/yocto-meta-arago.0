Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 41C9DC4345F
	for <webhook@archiver.kernel.org>; Mon, 22 Apr 2024 22:32:18 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web10.5587.1713825134068925957
 for <meta-arago@lists.yoctoproject.org>;
 Mon, 22 Apr 2024 15:32:14 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id EB87E40C88;
	Mon, 22 Apr 2024 22:32:12 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Dl5oF2_50iy0; Mon, 22 Apr 2024 22:32:12 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-87-159.washdc.fios.verizon.net [100.15.87.159])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 94BC440C2A;
	Mon, 22 Apr 2024 22:32:07 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 98DCE163F33; Mon, 22 Apr 2024 18:32:06 -0400 (EDT)
Date: Mon, 22 Apr 2024 18:32:06 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: Chirag Shilwant <c-shilwant@ti.com>
Cc: Ryan Eatmon <reatmon@ti.com>, meta-arago@lists.yoctoproject.org,
	Gyan Gupta <g-gupta@ti.com>, dannenberg@ti.com
Subject: Re: [meta-arago][master/scarthgap][PATCH] meta-arago-distro:
 recipes-core: Add no-fstab-update option to WIC_CREATE_EXTRA_ARG
Message-ID: <20240422223206.GB28791@denix.org>
References: <20240420125318.397900-1-c-shilwant@ti.com>
 <20240421030736.GZ28791@denix.org>
 <1e3b95f7-e43f-44c9-92c5-15fdbc5ce8ab@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
In-Reply-To: <1e3b95f7-e43f-44c9-92c5-15fdbc5ce8ab@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Mon, 22 Apr 2024 22:32:18 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15302

On Sun, Apr 21, 2024 at 02:42:23PM +0530, Chirag Shilwant wrote:
> + Andreas
> On 21/04/24 08:37, Denys Dmytriyenko wrote:
> >On Sat, Apr 20, 2024 at 06:23:18PM +0530, Chirag Shilwant wrote:
> >>- Ideally running `ls /boot/` in filesystem should list contents from=
 /rootfs/boot partition
> >>but currently it lists the contents of /boot partition of the WIC Ima=
ge.
> >>
> >>Eg - Incase of AM64x,
> >>```
> >>     root@am64xx-evm:~# ls /boot/
> >>     EFI  Image  tiboot3-am64x-gp-evm.bin  tiboot3-am64x_sr2-hs-evm.b=
in  tiboot3-am64x_sr2-hs-fs-evm.bin  tiboot3.bin  tispl.bin  u-boot.img  =
uEnv.txt
> >Will this change affect EFI? As there's EFI directory in that partitio=
n.
>=20
> The EFI partition under /rootfs/boot will still be present.
> Following is the output of `ls /boot` with this patch,
>=20
> ```
> root@am64xx-evm:~# ls /boot
> EFI=A0 Image=A0 Image-6.1.80-ti-g2e423244f8c0 dtb=A0 fitImage=A0
> fitImage-6.1.80-ti-g2e423244f8c0
>=20
> ```

Thanks, I'll do some additional testing with EFI a bit later.


> >>- To fix this issue, add --no-fstab-update flag to WIC_CREATE_EXTRA_A=
RG in arago-image.inc
> >>to prevent WIC image from adding an additional entry in /etc/fstab.
> >This flag is global and will prevent all other partitions from populat=
ing
> >/etc/fstab properly. Sure, meta-ti only has /boot and / defined, but o=
ther
> >layers could have own wic files with e.g. /home or /data partitions. M=
ounting
> >those will require a custom /etc/fstab instead of wic creating corresp=
onding
> >entries automatically.
> >
>=20
>=20
> Apparently, this change was being carried in processor sdk layer from
> quite a long time (from dunfell) to resolve a customer issue
> reported by Andreas.
> Diving into our internal JIRA system showed that this fix was
> suggested by Andreas
> & was resolved by the SDK team back then by keeping this change in
> processor sdk layer [1].
> Not sure why this was in processor sdk layer though. Maybe Andreas
> can provide additional details.

I tested and submitted a different fix last night to adjust WIC templates=
 to=20
not mount boot partition under /boot directory[1]. I still believe doing =
it=20
just for that one partition is better than disabling fstab updates global=
ly.

[1] https://patchwork.yoctoproject.org/project/ti/patch/20240421191458.22=
21303-1-denis@denix.org/

Can you please take a look and maybe test this option for your use case?=20
Thanks.

--=20
Denys

