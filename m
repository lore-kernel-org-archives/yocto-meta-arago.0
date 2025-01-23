Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 995EAC02182
	for <webhook@archiver.kernel.org>; Thu, 23 Jan 2025 21:11:53 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web10.22413.1737666711444356359
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 23 Jan 2025 13:11:52 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id B0C9840C86;
	Thu, 23 Jan 2025 21:11:50 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jVQCaytRSpwD; Thu, 23 Jan 2025 21:11:50 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-87-159.washdc.fios.verizon.net [100.15.87.159])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 6FEAB40ACD;
	Thu, 23 Jan 2025 21:11:46 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id D58D816418F; Thu, 23 Jan 2025 16:11:45 -0500 (EST)
Date: Thu, 23 Jan 2025 16:11:45 -0500
From: Denys Dmytriyenko <denis@denix.org>
To: Randolph Sapp <rs@ti.com>
Cc: afd@ti.com, reatmon@ti.com, c-shilwant@ti.com,
	meta-arago@lists.yoctoproject.org
Subject: Re: [meta-arago][master][PATCH] meta-arago: break dependency on
 meta-arago-demos
Message-ID: <20250123211145.GY21836@denix.org>
References: <20250116192950.3391293-2-rs@ti.com>
 <20250120211347.GK21836@denix.org>
 <e1fe1a7c-fa8d-422e-ae41-45c9a28e3a88@ti.com>
 <c674881a-737a-489d-95c8-175021597b77@ti.com>
 <20250121191714.GO21836@denix.org>
 <D781D6FY7AIX.2F49V6R0Y4UH8@ti.com>
 <20250122225154.GT21836@denix.org>
 <D78ZDLX93KGL.26D6TFGDWVBLY@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
In-Reply-To: <D78ZDLX93KGL.26D6TFGDWVBLY@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Thu, 23 Jan 2025 21:11:53 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15748

On Wed, Jan 22, 2025 at 05:12:23PM -0600, Randolph Sapp wrote:
> On Wed Jan 22, 2025 at 4:51 PM CST, Denys Dmytriyenko wrote:
> > On Tue, Jan 21, 2025 at 02:33:12PM -0600, Randolph Sapp wrote:
> > > On Tue Jan 21, 2025 at 1:17 PM CST, Denys Dmytriyenko wrote:
> > > > On Tue, Jan 21, 2025 at 12:54:39PM -0600, Andrew Davis via lists.=
yoctoproject.org wrote:
> > > > > On 1/21/25 9:16 AM, Ryan Eatmon via lists.yoctoproject.org wrot=
e:
> > > > > >
> > > > > >
> > > > > >On 1/20/2025 3:13 PM, Denys Dmytriyenko wrote:
> > > > > >>On Thu, Jan 16, 2025 at 01:29:51PM -0600, Randolph Sapp via l=
ists.yoctoproject.org wrote:
> > > > > >>>From: Randolph Sapp <rs@ti.com>
> > > > > >>>
> > > > > >>>Remove any explicit dependencies on meta-arago-demos. These =
were the
> > > > > >>>last of the "demos" in this layer and they were only being b=
uilt for
> > > > > >>>legacy devices. Demos should primarily be in layers above th=
is unless
> > > > > >>>they are used for functionality testing.
> > > > > >>
> > > > > >>Why not move those pieces to meta-arago-demos then?
> > > > > >>
> > > > > >>E.g. move the packagegroups there and add bbappends for the d=
efault image and
> > > > > >>world recipes, etc.
> > > > > >
> > > > > >Basically make meta-arago-demos an island unto itself.=A0 If y=
ou include it,=20
> > > > > >then you get it, if you don't then no harm.=A0 Make sense.
> > > > > >
> > > > >=20
> > > > > Will we test with and without this layer? If not then we will e=
nd up breaking
> > > > > things and missing dependencies between layers.
> > > > >=20
> > > > > Seems like a lot of maintenence for a layer with just a couple =
demos. Demos
> > > > > that should probably all go up into focus SDK layers anyway.
> > > >
> > > > Should meta-arago-demos be deprecated and removed in its entirety=
 then? Or=20
> > > > does it only apply to a few select that are still in meta-arago-d=
istro?
> > >=20
> > > Yeah, current plan is to drop this layer entirely, just wanted to d=
o it in a
> > > sane order. I put a note of that in the tear-off section. Still wai=
ting on these
> > > patches to be merged before continuing though. Still got a few more=
 patches for
> > > reworking Qt dependencies and enabling Qt6.
> >
> > I would like to request better commit messages for both of these patc=
hes -=20
> > this one and the one Andrew linked for the config change.
>=20
> Noted.
>=20
> > I do appreciate the difficulty with cross-dependency of thses changes=
 - first=20
> > you update meta-arago-distro to not depend on meta-arago-demos, then =
you need=20
> > to remove meta-arago-demos references from the layer setup configs, a=
nd only=20
> > then you can finally remove meta-arago-demos layer itself, if that's =
the plan.
>=20
> Funny thing about that, meta-arago-demos was created without properly c=
reating a
> dependency in the meta-arago-distro to track it.

Ah, yeah, that was my oversight - I take full responsibility fot that. At=
 the=20
time we were cleaning meta-arago-extras and all the demos were extracted =
from=20
that layer, but I totally missed updating meta-arago-distro:
https://git.yoctoproject.org/meta-arago/commit/?id=3Dff0d17778adbccda2d97=
b206976b45fe199c970e


> > But the first 2 patches do not paint a bigger picture, specifically n=
ot=20
> > explaining the actual reason behind these very invasive changes.
>=20
> This was discussed in the Webex Yocto channel and 2 other email threads=
. I could
> have sent out a message on the mailing list but it would have arrived 5=
 minutes
> before this patch because I was already testing things back in December=
.
>=20
> > I do know about the Qt6 plans and you briefly mention it here later i=
n the=20
> > discussion. But for anyone outside the internal discussions it is not=
 clear=20
> > what is going on and why. Moreover, is the plan to have any Qt6 demos=
 and=20
> > re-use the meta-arago-demos layer? Or is the plan to not have any dem=
os and=20
> > relegate that to downstream SDK layers, if nedded?
> >
> > Thanks.
>=20
> The plan is to not have any demos that are not strictly used for testin=
g in this
> repo. Downstream SDK layers will be reworking their existing demos for =
Qt6,
> picking these up if they are applicable (but nobody seemed to care abou=
t these
> demos in particular).
>=20
> The Qt6 stuff is somewhat new. First week of December was when a decisi=
on was
> made and an email was sent out shortly after announcing that. I seem to=
 have
> incorrectly assumed you guys were in the loop, my bad.

I believe there was a slight misunderstanding here. I do have some intern=
al=20
insight, but what I was looking for and asking for here, is to have a com=
mit=20
message that would clearly explain for any outsider what are the high lev=
el=20
plans for these changes and why they are being made. A concise version of=
 the=20
above 2 paragraphs w/o referring to any internal communications... :)

Both of the patches mostly say "breaking the dependency", which is a bit =
odd=20
reason for completely removing the entire layer and all the demos.

--=20
Denys

