Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 41EBBC27C52
	for <webhook@archiver.kernel.org>; Thu,  6 Jun 2024 20:15:05 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.25282.1717704901242296458
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 06 Jun 2024 13:15:02 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 80CE640C85;
	Thu,  6 Jun 2024 20:15:00 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id BYU57yNNyU2P; Thu,  6 Jun 2024 20:15:00 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-87-159.washdc.fios.verizon.net [100.15.87.159])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 19B1140C21;
	Thu,  6 Jun 2024 20:14:56 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 902CD163F8E; Thu,  6 Jun 2024 16:14:56 -0400 (EDT)
Date: Thu, 6 Jun 2024 16:14:56 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: c-shilwant@ti.com
Cc: meta-arago@lists.yoctoproject.org, Ryan Eatmon <reatmon@ti.com>,
	Gyan Gupta <g-gupta@ti.com>
Subject: Re: [meta-arago][master/scarthgap][PATCH] recipes-qt: qt5: Add
 xkbcommon to qtbase PACKAGECONFIG
Message-ID: <20240606201456.GQ21287@denix.org>
References: <20240603092255.2930095-1-c-shilwant@ti.com>
 <20240604160805.GN21287@denix.org>
 <8bcec881-5203-4b4f-b91f-cdd0ecadb269@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <8bcec881-5203-4b4f-b91f-cdd0ecadb269@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Thu, 06 Jun 2024 20:15:05 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15372

On Wed, Jun 05, 2024 at 12:39:12PM +0530, Chirag Shilwant via lists.yocto=
project.org wrote:
> Hi Denys & Ryan,
>=20
> On 04/06/24 21:38, Denys Dmytriyenko wrote:
> >On Mon, Jun 03, 2024 at 02:=E2=80=8A52:=E2=80=8A55PM +0530, Chirag Shi=
lwant via
> >lists.=E2=80=8Ayoctoproject.=E2=80=8Aorg wrote: > From: Sai Sree Karth=
eek Adivi
> ><s-adivi@=E2=80=8Ati.=E2=80=8Acom> > > - For QT apps to use physical k=
eyboard,
> >xkbcommon has to be added in > PACKAGECONFIG.=E2=80=8A
> >ZjQcmQRYFpfptBannerStart
> >This message was sent from outside of Texas Instruments.
> >Do not click links or open attachments unless you recognize the
> >source of this email and know the content is safe. If you wish to
> >report this message to IT Security, please forward the message as
> >an attachment to phishing@list.ti.com
> >ZjQcmQRYFpfptBannerEnd
> >On Mon, Jun 03, 2024 at 02:52:55PM +0530, Chirag Shilwant via lists.yo=
ctoproject.org wrote:
> >> From: Sai Sree Kartheek Adivi <s-adivi@ti.com>
> >> > - For QT apps to use physical keyboard, xkbcommon has to be
> >added in
> >> PACKAGECONFIG. This was supported until 09.01 using xkbcommon-evdev =
which at
> >> present is an invalid PACKAGECONFIG & hence was dropped from meta-ar=
ago [1].
> >> > - Hence, add xkbcommon to PACKAGECONFIG which will enable the
> >use of
> >> physical keyboard in QT apps.
> >> > [1]: https://git.ti.com/cgit/arago-project/meta-arago/commit/?h=3D=
scarthgap&id=3Dde16946741249265a38acb7bb503b39a0c2b4175
> >> > Signed-off-by: Chirag Shilwant <c-shilwant@ti.com>
> >> ---
> >>  meta-arago-distro/recipes-qt/qt5/qtbase_%.bbappend | 2 ++
> >>  1 file changed, 2 insertions(+)
> >> > diff --git
> >a/meta-arago-distro/recipes-qt/qt5/qtbase_%.bbappend
> >b/meta-arago-distro/recipes-qt/qt5/qtbase_%.bbappend
> >> index b1205b5a..6f94c574 100644
> >> --- a/meta-arago-distro/recipes-qt/qt5/qtbase_%.bbappend
> >> +++ b/meta-arago-distro/recipes-qt/qt5/qtbase_%.bbappend
> >> @@ -4,6 +4,8 @@ GLES_EXTRA_DEPS =3D "libdrm wayland"
> >>  >  PACKAGECONFIG[gles2] =3D "-opengl es2 -eglfs,,virtual/libgles2
> >virtual/egl ${GLES_EXTRA_DEPS}"
> >>  > +PACKAGECONFIG:append:k3 =3D " xkbcommon"
> >
> >This would make the package machine-specific - why is it only applicab=
le to k3?
>=20
>=20
> For non k3 based platforms, with the removal of Matrix GUI I don't see
> any QT Demos under meta-arago-demos which might need the keyboard
> functionality [Ryan correct me if we have any QT demo applicable for
> non k3 based platform which needs keyboard].
>=20
> For k3 platforms, we have TI Apps Launcher (a QT based OOB demo) for wh=
ich
> xkbcommon is needed & hence I made this change machine specific.

That is a wrong reason to make a large package that many other packages d=
epend=20
on (and build on top of) to be machine-specific! That will force qtbase t=
o be=20
rebuilt from scratch for each and every K3 platform, instead of re-using=20
common Aarch64 binaries. Moreover, that invalidates sstate cache for all =
other=20
packages that depend on qtbase, essentially making them machine-specific =
as=20
well... In other words - keyboard support does not sound even remotely as=
 a=20
machine-specific feature, so should rather be enabled or disabled globall=
y on=20
a per-distro basis. And thus, should be set in distro config file.


> Btw, Denys do you have any background on why does meta-qt5 just in
> case of Wayland doesn't
> support this keyboard enablement by default though I see for x11
> they add 'xkbcommon' in
> PACKAGECONFIG by default [1]
>=20
> [1]: https://github.com/meta-qt5/meta-qt5/blob/scarthgap/recipes-qt/qt5=
/qtbase_git.bb#L70

Wayland support in Qt5 is provided by its QtWayland module and it handles=
=20
xkbcommon. Are there some corner cases you are trying to enable with this=
?

--=20
Denys

