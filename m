Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3CF04C4345F
	for <webhook@archiver.kernel.org>; Wed, 24 Apr 2024 20:08:54 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web10.6698.1713989327955380656
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 24 Apr 2024 13:08:48 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 045F240C8A;
	Wed, 24 Apr 2024 20:08:47 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id O3h-m-Gk3_ee; Wed, 24 Apr 2024 20:08:46 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-87-159.washdc.fios.verizon.net [100.15.87.159])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 3EAAD40BE6;
	Wed, 24 Apr 2024 20:08:39 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id E46A9163F33; Wed, 24 Apr 2024 16:08:38 -0400 (EDT)
Date: Wed, 24 Apr 2024 16:08:38 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: Jon Cormier <jcormier@criticallink.com>
Cc: Chirag Shilwant <c-shilwant@ti.com>, Ryan Eatmon <reatmon@ti.com>,
	meta-arago@lists.yoctoproject.org, Gyan Gupta <g-gupta@ti.com>,
	dannenberg@ti.com
Subject: Re: [meta-arago][master/scarthgap][PATCH] meta-arago-distro:
 recipes-core: Add no-fstab-update option to WIC_CREATE_EXTRA_ARG
Message-ID: <20240424200838.GD28791@denix.org>
References: <20240420125318.397900-1-c-shilwant@ti.com>
 <20240421030736.GZ28791@denix.org>
 <1e3b95f7-e43f-44c9-92c5-15fdbc5ce8ab@ti.com>
 <20240422223206.GB28791@denix.org>
 <CADL8D3ZFq3M_iVN9=q7ecv2gaNPVLw-Mo6kxBaUbrAdJx39dvw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CADL8D3ZFq3M_iVN9=q7ecv2gaNPVLw-Mo6kxBaUbrAdJx39dvw@mail.gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Wed, 24 Apr 2024 20:08:54 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15308

On Mon, Apr 22, 2024 at 02:05:46PM -1000, Jon Cormier wrote:
> Looks good to me.
>=20
> Though i'm curious what the /boot -> boot part does. When we did it we
> deleted the /boot entirely.

wic --help says:

    * 'part' or 'partition'

       This command creates a partition on the system and uses the
       following syntax:

         part [<mountpoint>]

       The <mountpoint> is where the partition will be mounted and
       must take of one of the following forms:

         /<path>: For example: /, /usr, or /home

         swap: The partition will be used as swap space.

       If a <mountpoint> is not specified the partition will be created
       but will not be mounted.

       Partitions with a <mountpoint> specified will be automatically mou=
nted.

So, the <mountpoint> part is optional, you can definitely fully omit it. =
But,=20
I've seen many layers use it as a name, mostly in cases of --source=3Draw=
copy=20
or --source=3Dempty as those don't have a --label parameter. But it behav=
es the=20
same with --source=3Dbootimg-partition and won't treat it as actual mount=
point=20
when it doesn't start with a / character. It's rather undocumented, but i=
t=20
works. I guess we can also remove it to just follow the docs, since we ha=
ve=20
label as well to avoid confusion...


> Also while we are touching the file. Could add the M to "128" in the no=
n
> efi file so it matches and is more clear.

I guess I can send a v2 for that...

--=20
Denys


> On Mon, Apr 22, 2024, 12:32=E2=80=AFPM Denys Dmytriyenko via lists.yoct=
oproject.org
> <denis=3Ddenix.org@lists.yoctoproject.org> wrote:
>=20
> > On Sun, Apr 21, 2024 at 02:42:23PM +0530, Chirag Shilwant wrote:
> > > + Andreas
> > > On 21/04/24 08:37, Denys Dmytriyenko wrote:
> > > >On Sat, Apr 20, 2024 at 06:23:18PM +0530, Chirag Shilwant wrote:
> > > >>- Ideally running `ls /boot/` in filesystem should list contents =
from
> > /rootfs/boot partition
> > > >>but currently it lists the contents of /boot partition of the WIC
> > Image.
> > > >>
> > > >>Eg - Incase of AM64x,
> > > >>```
> > > >>     root@am64xx-evm:~# ls /boot/
> > > >>     EFI  Image  tiboot3-am64x-gp-evm.bin
> > tiboot3-am64x_sr2-hs-evm.bin  tiboot3-am64x_sr2-hs-fs-evm.bin  tiboot=
3.bin
> > tispl.bin  u-boot.img  uEnv.txt
> > > >Will this change affect EFI? As there's EFI directory in that part=
ition.
> > >
> > > The EFI partition under /rootfs/boot will still be present.
> > > Following is the output of `ls /boot` with this patch,
> > >
> > > ```
> > > root@am64xx-evm:~# ls /boot
> > > EFI  Image  Image-6.1.80-ti-g2e423244f8c0 dtb  fitImage
> > > fitImage-6.1.80-ti-g2e423244f8c0
> > >
> > > ```
> >
> > Thanks, I'll do some additional testing with EFI a bit later.
> >
> >
> > > >>- To fix this issue, add --no-fstab-update flag to
> > WIC_CREATE_EXTRA_ARG in arago-image.inc
> > > >>to prevent WIC image from adding an additional entry in /etc/fsta=
b.
> > > >This flag is global and will prevent all other partitions from
> > populating
> > > >/etc/fstab properly. Sure, meta-ti only has /boot and / defined, b=
ut
> > other
> > > >layers could have own wic files with e.g. /home or /data partition=
s.
> > Mounting
> > > >those will require a custom /etc/fstab instead of wic creating
> > corresponding
> > > >entries automatically.
> > > >
> > >
> > >
> > > Apparently, this change was being carried in processor sdk layer fr=
om
> > > quite a long time (from dunfell) to resolve a customer issue
> > > reported by Andreas.
> > > Diving into our internal JIRA system showed that this fix was
> > > suggested by Andreas
> > > & was resolved by the SDK team back then by keeping this change in
> > > processor sdk layer [1].
> > > Not sure why this was in processor sdk layer though. Maybe Andreas
> > > can provide additional details.
> >
> > I tested and submitted a different fix last night to adjust WIC templ=
ates
> > to
> > not mount boot partition under /boot directory[1]. I still believe do=
ing
> > it
> > just for that one partition is better than disabling fstab updates
> > globally.
> >
> > [1]
> > https://patchwork.yoctoproject.org/project/ti/patch/20240421191458.22=
21303-1-denis@denix.org/
> >
> > Can you please take a look and maybe test this option for your use ca=
se?
> > Thanks.

