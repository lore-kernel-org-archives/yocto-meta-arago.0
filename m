Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 576E8C7EE2E
	for <webhook@archiver.kernel.org>; Fri,  9 Jun 2023 20:40:35 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.5052.1686343230371630637
 for <meta-arago@lists.yoctoproject.org>;
 Fri, 09 Jun 2023 13:40:33 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 2E34740CAF;
	Fri,  9 Jun 2023 20:40:29 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nkH0SNs-QRM7; Fri,  9 Jun 2023 20:40:29 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-88-116.washdc.fios.verizon.net [100.15.88.116])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 09FA740C16;
	Fri,  9 Jun 2023 20:40:26 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 70793163A03; Fri,  9 Jun 2023 16:39:38 -0400 (EDT)
Date: Fri, 9 Jun 2023 16:39:38 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: rs@ti.com
Cc: Ryan Eatmon <reatmon@ti.com>, meta-arago@lists.yoctoproject.org
Subject: Re: [meta-arago][master/kirkstone][PATCH] arago.conf: make things
 more readable and fix the virtuals
Message-ID: <20230609203938.GJ9226@denix.org>
References: <20230606191019.702649-1-rs@ti.com>
 <20230606221554.GT9226@denix.org>
 <176634F5169028F6.23186@lists.yoctoproject.org>
 <9d92d007-57d1-d2fd-69ed-8aa260ef4590@ti.com>
 <d6359877-7adc-5151-1c4e-eab5229496f1@ti.com>
 <3ab22630-8dcc-29c1-1b32-1293de27d162@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
In-Reply-To: <3ab22630-8dcc-29c1-1b32-1293de27d162@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Fri, 09 Jun 2023 20:40:35 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14588

On Fri, Jun 09, 2023 at 02:13:23PM -0500, Randolph Sapp via lists.yoctopr=
oject.org wrote:
> On 6/9/23 13:32, Ryan Eatmon wrote:
> >
> >
> >On 6/6/2023 6:18 PM, Randolph Sapp via lists.yoctoproject.org wrote:
> >>On 6/6/23 18:15, Randolph Sapp via lists.yoctoproject.org wrote:
> >>>On 6/6/23 17:15, Denys Dmytriyenko wrote:
> >>>>On Tue, Jun 06, 2023 at 02:10:19PM -0500, rs@ti.com wrote:
> >>>>>From: Randolph Sapp <rs@ti.com>
> >>>>>
> >>>>>Make things more readable and reliable by useing the built in bool=
ean
> >>>>>check instead of python's type casting. Drop the array
> >>>>>indexing in favor
> >>>>>of a more direct if else statememnt.
> >>>>
> >>>>Heh, it's just a matter of personal preference :) Array
> >>>>indexing conditionals
> >>>>is how OE used to do things from the early days and I'm well
> >>>>used to that. But
> >>>>these days using Python if/else directly gained lots of
> >>>>traction, so why not?
> >>>>
> >>>>
> >>>>>Also fix the virtual provider for login manager. There
> >>>>>should only be 1
> >>>>>login provider and it should be shadow-base for systemd
> >>>>>*or* busybox for
> >>>>>sysVinit systemd.
> >>>>>
> >>>>>Also explicitly remove the sysvinit distro feature if ARAGO_SYSVIN=
IT
> >>>>>isn't set, because whatever arago inherits expects sysvinit for so=
me
> >>>>>reason. This should fix the duplicate init.d and systemd service f=
iles
> >>>>>we've been seeing.
> >>>>
> >>>>How much testing have you done with this change?
> >>>>
> >>>>The reason it was done this way is because many packages only provi=
ded
> >>>>sysvinit rc scripts and not systemd unit files and we were relying =
on
> >>>>systemd-sysv-generator to handle those, which has dependency
> >>>>on "sysvinit"
> >>>>PACKAGECONFIG and DISTRO_FEATURES. There were fixes to
> >>>>handle duplications
> >>>>when both sysvinit rc script and systemd unit file are
> >>>>provided by a package
> >>>>and install only one of them. It was better than not having
> >>>>any startup script
> >>>>for a package at all.
> >>>>
> >>>
> >>>Everything in the layers below us provides both from
> >>>everything I've seen. The only incompliant layers are
> >>>meta-arago and maybe something in meta-ti still expecting
> >>>sysVinit scripts.
> >>>
> >>>If you set both sysVinit and systemd as a distro feature it
> >>>actually *confuses* core packages and they end up shipping
> >>>both, which clash. Systemd typically just resolves this by
> >>>forcing everything with a sysvinit script into the sysvinit
> >>>compatibility stage leading to increased boot time because
> >>>that's all still serialized.
> >>>
> >>
> >>If there are any packages still not compliant that you can find,
> >>tell me and I will fix them myself. Seeing mix-matched sysVinit
> >>and systemd scripts in the same target makes me irrationally
> >>angry.
> >
> >Uh oh...=A0 This patch causes tisdk-tiny-image.bb and
> >tisdk-bootstrap-image.bb to fail:
> >
> >ERROR: Nothing RPROVIDES 'packagegroup-arago-sysvinit-boot'
> >
> >I think, if I remember correctly, sysvinit was chosen because of a
> >requirement on the size of the image.=A0 systemd made the rootfs too
> >big to fit within the constraints.

Ah, indeed, that was another reason systemd and sysvinit had to be both=20
enabled in the DISTRO_FEATURES...


> >Nishanth might have more details if you want to debate it.=A0 But
> >there is an internal Confluence page that lists all of the Ease of
> >Use requirement JIRAs.
> >
> >No one is opposed to moving away from sysvinit, but we need to
> >make sure that we are meeting that requirement.
> >
>=20
> That's fair. I assumed our sysvinit build images were setting the
> ARAGO_SYSVINIT variable as part of their base config (or at least
> something similar).

ARAGO_SYSVINIT flag controls init selection for the main images (default,=
=20
base, thinlinux...), but tiny and bootstrap images ignore it and directly=
=20
pull in SysVinit regardless of the selection.


> Got a proposal I need to submit about this anyway.

