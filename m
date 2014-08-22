Return-Path: <fcooper@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id 9E09F52A3B
	for <meta-arago@arago-project.org>;
	Fri, 22 Aug 2014 14:04:54 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id s7ME4riA014838
	for <meta-arago@arago-project.org>; Fri, 22 Aug 2014 09:04:53 -0500
Received: from DLEE70.ent.ti.com (dlee70.ent.ti.com [157.170.170.113])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id s7ME4rwC025477
	for <meta-arago@arago-project.org>; Fri, 22 Aug 2014 09:04:53 -0500
Received: from DFLE08.ent.ti.com ([fe80::187f:8c86:2b7:ef9f]) by
	DLEE70.ent.ti.com ([fe80::c4c6:f618:54e7:ad11%28]) with mapi id
	14.03.0174.001; Fri, 22 Aug 2014 09:04:53 -0500
From: "Cooper Jr., Franklin" <fcooper@ti.com>
To: "R, Karthik" <karthik.ramanan@ti.com>, "meta-arago@arago-project.org"
	<meta-arago@arago-project.org>
Thread-Topic: [meta-arago] [PATCH 0/2] Adding support for Wayland for DRM
	backends
Thread-Index: AQHPvgz8fbpOPycfTU6KzRU6D9cdkJvcnoowgABXYAD//67ksA==
Date: Fri, 22 Aug 2014 14:04:52 +0000
Message-ID: <8F29D6B095ED194EA1980491A5E029710C702056@DFLE08.ent.ti.com>
References: <1408713923-25284-1-git-send-email-a0393906@ti.com>
	<8F29D6B095ED194EA1980491A5E029710C702016@DFLE08.ent.ti.com>
	<24B88602B5904F49971CAF899152529B7EAB1F@DBDE04.ent.ti.com>
In-Reply-To: <24B88602B5904F49971CAF899152529B7EAB1F@DBDE04.ent.ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.247.5.50]
MIME-Version: 1.0
Cc: "Devshatwar, Nikhil" <nikhil.nd@ti.com>
Subject: Re: [PATCH 0/2] Adding support for Wayland for DRM backends
X-BeenThere: meta-arago@arago-project.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Arago metadata layer for TI SDKs - OE-Core/Yocto compatible
	<meta-arago.arago-project.org>
List-Unsubscribe: <http://arago-project.org/cgi-bin/mailman/options/meta-arago>, 
	<mailto:meta-arago-request@arago-project.org?subject=unsubscribe>
List-Archive: <http://arago-project.org/pipermail/meta-arago>
List-Post: <mailto:meta-arago@arago-project.org>
List-Help: <mailto:meta-arago-request@arago-project.org?subject=help>
List-Subscribe: <http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago>, 
	<mailto:meta-arago-request@arago-project.org?subject=subscribe>
X-List-Received-Date: Fri, 22 Aug 2014 14:04:54 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable



> -----Original Message-----
> From: R, Karthik
> Sent: Friday, August 22, 2014 8:44 AM
> To: Cooper Jr., Franklin; meta-arago@arago-project.org
> Cc: Devshatwar, Nikhil
> Subject: RE: [meta-arago] [PATCH 0/2] Adding support for Wayland for DRM
> backends
>=20
> * This is good to go into the master branch
> * Would be nice if this can be back ported onto dora.
[Franklin] I'm assuming you really need this in dora correct? The reason I =
say this is currently your patches as is won't do anything for you since ne=
wer versions of the wayland recipes exist which means those newer versions =
will be used not this older version. If you really need this in master then=
 I would suggest updating these patches against Wayland 1.4/1.5. I have pen=
ding patches for Wayland 1.5 so if it is accepted I would rebase those patc=
hes off of that version.
>=20
> Are you suggesting that this recipe be made machine specific because of t=
he
> dependency on omapdrm?
[Franklin] Yes
> Am not sure about the machine names used for the other catalog derivative=
s
> of dra7xx or other SoCs that use omapdrm, it would have to include those
> machine names as well. Any pointers on that?
[Franklin] From my understanding the kernel for am57xx-evm and dra7xx-evm a=
ren't the same. There are probably patches missing between these kernels th=
at these Weston/Wayland patches depend on. So applying patches for am57xx-e=
vm would probably cause problems. Until these kernel patches are pushed to =
the integration tree so they are available for am57xx-evm I would just limi=
t it to dra7xx-evm. It would be simple to include am57xx-evm at a later tim=
e.
>=20
> I will take care of mentioning the branch in the email header if its spec=
ific to
> a particular branch.
> Thanks for that pointer.
>=20
> Regards
> Karthik
>=20
> -----Original Message-----
> From: Cooper Jr., Franklin
> Sent: Friday, August 22, 2014 7:05 PM
> To: R, Karthik; meta-arago@arago-project.org
> Cc: Devshatwar, Nikhil
> Subject: RE: [meta-arago] [PATCH 0/2] Adding support for Wayland for DRM
> backends
>=20
> I'm assuming this isn't for master since currently daisy in oe-core is us=
ing
> wayland 1.4.0. Which maintenance branch is this specifically for and it w=
ill be
> helpful in the patch title that you specific the branch these patches are=
 meant
> for.
>=20
> For example if these patches are for dora:
> [meta-arago][dora] [PATCH 0/2] Adding support for Wayland for DRM
> backends
>=20
> Also since your mentioning omapdrm please make sure these drm patches
> are only applied on devices using omapdrm which I think as of now is only
> dra7xx-evm
>=20
> > -----Original Message-----
> > From: meta-arago-bounces@arago-project.org [mailto:meta-arago-
> > bounces@arago-project.org] On Behalf Of R, Karthik
> > Sent: Friday, August 22, 2014 8:25 AM
> > To: meta-arago@arago-project.org
> > Cc: Devshatwar, Nikhil
> > Subject: [meta-arago] [PATCH 0/2] Adding support for Wayland for DRM
> > backends
> >
> > There are some issues with the current omapdrm (kernel driver) and
> > related dependencies on the TI platform such as dra7xx.
> >
> > Weston version 1.3.0 has been very highly tested and is currently
> > shipping to customers who are using wayland with DRM backend. This
> > patch set brings in support for Weston and also includes patches that
> > help resolve some important issues in the Weston. These issues are
> > specific to TI platforms and cannot be submitted upstream.
> >
> > Karthik Ramanan (2):
> >   wayland: add support for version 1.3.0 for drm backend
> >   wayland: adding support for weston 1.3.0 for DRM backend
> >
> >  ...tor-drm-Change-path-of-gbm.h-to-gbm-gbm.h.patch |   26 ++++
> >  ...e-Include-option-to-search-in-include-drm.patch |   47 +++++++
> >  ...urce-prevent-input-disable-during-repaint.patch |   34 +++++
> >  .../0005-temp-hack-to-enable-weston-1.3.patch      |   33 +++++
> >  .../0006-weston-drm-Enable-multiple-displays.patch |   43 ++++++
> >  .../recipes-graphics/wayland/just-scanner.patch    |   36 +++++
> >  .../recipes-graphics/wayland/pattern.png           |  Bin 0 -> 1846 by=
tes
> >  meta-arago-extras/recipes-graphics/wayland/profile |    9 ++
> >  .../recipes-graphics/wayland/terminal.png          |  Bin 0 -> 1005 by=
tes
> >  .../recipes-graphics/wayland/wayland.inc           |    5 +
> >  .../recipes-graphics/wayland/wayland_1.3.0.bb      |   34 +++++
> >  .../recipes-graphics/wayland/weston.desktop        |   91 ++++++++++++
> >  .../recipes-graphics/wayland/weston.png            |  147
> > +++++++++++++++++++
> >  .../recipes-graphics/wayland/weston_1.3.0.bb       |  148
> > ++++++++++++++++++++
> >  14 files changed, 653 insertions(+)
> >  create mode 100755 meta-arago-extras/recipes-graphics/wayland/0001-
> > compositor-drm-Change-path-of-gbm.h-to-gbm-gbm.h.patch
> >  create mode 100755 meta-arago-extras/recipes-graphics/wayland/0002-
> > Makefile-Include-option-to-search-in-include-drm.patch
> >  create mode 100644 meta-arago-extras/recipes-graphics/wayland/0003-
> > input-source-prevent-input-disable-during-repaint.patch
> >  create mode 100644 meta-arago-extras/recipes-graphics/wayland/0005-
> > temp-hack-to-enable-weston-1.3.patch
> >  create mode 100644 meta-arago-extras/recipes-graphics/wayland/0006-
> > weston-drm-Enable-multiple-displays.patch
> >  create mode 100644 meta-arago-extras/recipes-graphics/wayland/just-
> > scanner.patch
> >  create mode 100644 meta-arago-extras/recipes-
> > graphics/wayland/pattern.png  create mode 100644
> > meta-arago-extras/recipes-graphics/wayland/profile
> >  create mode 100644 meta-arago-extras/recipes-
> > graphics/wayland/terminal.png  create mode 100644
> > meta-arago-extras/recipes- graphics/wayland/wayland.inc  create mode
> > 100644 meta-arago-extras/recipes- graphics/wayland/wayland_1.3.0.bb
> > create mode 100644 meta-arago-extras/recipes-
> > graphics/wayland/weston.desktop  create mode 100644
> > meta-arago-extras/recipes- graphics/wayland/weston.png  create mode
> > 100644 meta-arago-extras/recipes- graphics/wayland/weston_1.3.0.bb
> >
> > --
> > 1.7.9.5
> >
> > _______________________________________________
> > meta-arago mailing list
> > meta-arago@arago-project.org
> > http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

