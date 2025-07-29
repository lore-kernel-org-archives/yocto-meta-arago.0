Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 511BCC87FCA
	for <webhook@archiver.kernel.org>; Tue, 29 Jul 2025 19:16:44 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.17002.1753816595341793278
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 29 Jul 2025 12:16:36 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 92F6840C2C;
	Tue, 29 Jul 2025 19:16:33 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0lpWl7zDXhWE; Tue, 29 Jul 2025 19:16:33 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-87-159.washdc.fios.verizon.net [100.15.87.159])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 4751040ACD;
	Tue, 29 Jul 2025 19:16:29 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 6FFFA16D33C; Tue, 29 Jul 2025 15:16:28 -0400 (EDT)
Date: Tue, 29 Jul 2025 15:16:28 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: afd@ti.com
Cc: Jon Cormier <jcormier@criticallink.com>,
	Denys Dmytriyenko <denys@konsulko.com>,
	Ryan Eatmon <reatmon@ti.com>, meta-arago@lists.yoctoproject.org
Subject: Re: [meta-arago][scarthgap/master][PATCH 2/2]
 packagegroup-arago-tisdk-amsdk-sdk-host: Remove this recipe
Message-ID: <20250729191628.GP24899@denix.org>
References: <20250728183922.580652-1-afd@ti.com>
 <20250728183922.580652-2-afd@ti.com>
 <1856C8B7ECE2833E.21808@lists.yoctoproject.org>
 <CADL8D3bcdi28+yXCfnz1_Z_ExtAJjCpOHQSdyK9-vyhyhYdEYg@mail.gmail.com>
 <efcd584f-a46e-41bf-bf08-b705dc492fc6@ti.com>
 <CADL8D3agM=aCyzOZNC8MGn5_-Gc7e38-BmW2BnCsvA1tDtnymQ@mail.gmail.com>
 <2e329593-55e5-40b8-9158-c73f8827f91e@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <2e329593-55e5-40b8-9158-c73f8827f91e@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 29 Jul 2025 19:16:44 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16341

On Tue, Jul 29, 2025 at 01:12:25PM -0500, Andrew Davis via lists.yoctopro=
ject.org wrote:
> On 7/29/25 12:57 PM, Jon Cormier wrote:
> >On Tue, Jul 29, 2025 at 1:47=E2=80=AFPM Andrew Davis <afd@ti.com> wrot=
e:
> >>
> >>
> >>
> >>On 7/29/25 12:26 PM, Jon Cormier wrote:
> >>>On Tue, Jul 29, 2025 at 1:23=E2=80=AFPM Jon Cormier via lists.yoctop=
roject.org
> >>><jcormier=3Dcriticallink.com@lists.yoctoproject.org> wrote:
> >>>>
> >>>>On Mon, Jul 28, 2025 at 2:39=E2=80=AFPM Andrew Davis via
> >>>>lists.yoctoproject.org <afd=3Dti.com@lists.yoctoproject.org> wrote:
> >>>>>
> >>>>>This recipe only now exists to add "tisdk-uenv" to tisdk-core-bund=
le
> >>>>>images so uEnv.txt can be packaged into prebuilt-images. We only n=
eed
> >>>>>to package the uEnv.txt as a "prebuilt-image" if some bundled imag=
e
> >>>>>includes it, no need to manually add this for all images.
> >>>>Does this mean the tisdk-base/default images will no longer include
> >>>>the example empty uEnv.txt file?
> >>>Specifically the wic images.  The other image formats don't include
> >>>the boot files.
> >>
> >>For most images, adding that example uEnv.txt file is done with this
> >>code here in arago.conf[0]. So the wic images will still have this
> >>file added even after this patchset, for now..
> >>
> >>I say "for now" as I'm not a fan of how these get added to the images
> >>unconditionally in a .conf file, vs added explicitly in the image's .=
bb
> >>files.
> >This is fair. It does make it tricky to remove the uEnv if a customer
> >doesn't want it. Or if they want to replace it with their own recipe.
> >Currently are forced to bbappend the ti recipe.
> >>Even longer term, U-Boot is moving more towards boot script
> >>files (boot.scr), which are more flexible and standard (uEnv.txt is
> >>rather TI specific).
> >Hmm at least for development, having the config file being text is
> >pretty desirable.
>=20
> boot.scr files are text, you might be getting that confused with the
> binary environment files produced by "env save", usually called
> <board_name>.env or similar.

Usually, the source boot.cmd script is a text, which you need to feed to=20
mkimage with "-T script" parameter to process it into boot.scr, which is=20
not exactly a text file any more...


> The difference between uEnv.txt and boot.scr is that the latter is
> run as a series of commands instead of environment variable definitions
> like uEnv.txt. The commands can also set env vars just like uEnv.txt
> by using 'env set xxx` commands, but also allows much more like
> variable evaluation and conditional logic.

