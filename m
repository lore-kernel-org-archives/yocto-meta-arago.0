Return-Path: <karthik.ramanan@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by arago-project.org (Postfix) with ESMTPS id 1CA0F529F7
	for <meta-arago@arago-project.org>;
	Fri, 22 Aug 2014 13:43:54 +0000 (UTC)
Received: from dbdlxv05.itg.ti.com ([172.24.171.60])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id s7MDhqFo032623
	for <meta-arago@arago-project.org>; Fri, 22 Aug 2014 08:43:52 -0500
Received: from DBDE72.ent.ti.com (dbde72.ent.ti.com [172.24.171.97])
	by dbdlxv05.itg.ti.com (8.14.3/8.13.8) with ESMTP id s7MDhnXI018603
	for <meta-arago@arago-project.org>; Fri, 22 Aug 2014 19:13:50 +0530
Received: from DBDE04.ent.ti.com ([fe80::21ac:d9f:f810:c8e7]) by
	DBDE72.ent.ti.com ([fe80::bd56:32bf:87fd:2763%27]) with mapi id
	14.03.0174.001; Fri, 22 Aug 2014 19:13:49 +0530
From: "R, Karthik" <karthik.ramanan@ti.com>
To: "Cooper Jr., Franklin" <fcooper@ti.com>, "meta-arago@arago-project.org"
	<meta-arago@arago-project.org>
Thread-Topic: [meta-arago] [PATCH 0/2] Adding support for Wayland for DRM
	backends
Thread-Index: AQHPvgz5ZvRfOuu5sEyjODmTbSJKq5vcQ4wAgABc00A=
Date: Fri, 22 Aug 2014 13:43:48 +0000
Message-ID: <24B88602B5904F49971CAF899152529B7EAB1F@DBDE04.ent.ti.com>
References: <1408713923-25284-1-git-send-email-a0393906@ti.com>
	<8F29D6B095ED194EA1980491A5E029710C702016@DFLE08.ent.ti.com>
In-Reply-To: <8F29D6B095ED194EA1980491A5E029710C702016@DFLE08.ent.ti.com>
Accept-Language: en-IN, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [172.24.170.142]
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 03 Sep 2014 18:01:30 +0000
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
X-List-Received-Date: Fri, 22 Aug 2014 13:43:54 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

* This is good to go into the master branch=20
* Would be nice if this can be back ported onto dora.

Are you suggesting that this recipe be made machine specific because of the=
 dependency on omapdrm?
Am not sure about the machine names used for the other catalog derivatives =
of dra7xx or other SoCs that use omapdrm, it would have to include those ma=
chine names as well. Any pointers on that?

I will take care of mentioning the branch in the email header if its specif=
ic to a particular branch.=20
Thanks for that pointer.

Regards
Karthik

-----Original Message-----
From: Cooper Jr., Franklin=20
Sent: Friday, August 22, 2014 7:05 PM
To: R, Karthik; meta-arago@arago-project.org
Cc: Devshatwar, Nikhil
Subject: RE: [meta-arago] [PATCH 0/2] Adding support for Wayland for DRM ba=
ckends

I'm assuming this isn't for master since currently daisy in oe-core is usin=
g wayland 1.4.0. Which maintenance branch is this specifically for and it w=
ill be helpful in the patch title that you specific the branch these patche=
s are meant for.

For example if these patches are for dora:
[meta-arago][dora] [PATCH 0/2] Adding support for Wayland for DRM backends

Also since your mentioning omapdrm please make sure these drm patches are o=
nly applied on devices using omapdrm which I think as of now is only dra7xx=
-evm

> -----Original Message-----
> From: meta-arago-bounces@arago-project.org [mailto:meta-arago-=20
> bounces@arago-project.org] On Behalf Of R, Karthik
> Sent: Friday, August 22, 2014 8:25 AM
> To: meta-arago@arago-project.org
> Cc: Devshatwar, Nikhil
> Subject: [meta-arago] [PATCH 0/2] Adding support for Wayland for DRM=20
> backends
>=20
> There are some issues with the current omapdrm (kernel driver) and=20
> related dependencies on the TI platform such as dra7xx.
>=20
> Weston version 1.3.0 has been very highly tested and is currently=20
> shipping to customers who are using wayland with DRM backend. This=20
> patch set brings in support for Weston and also includes patches that=20
> help resolve some important issues in the Weston. These issues are=20
> specific to TI platforms and cannot be submitted upstream.
>=20
> Karthik Ramanan (2):
>   wayland: add support for version 1.3.0 for drm backend
>   wayland: adding support for weston 1.3.0 for DRM backend
>=20
>  ...tor-drm-Change-path-of-gbm.h-to-gbm-gbm.h.patch |   26 ++++
>  ...e-Include-option-to-search-in-include-drm.patch |   47 +++++++
>  ...urce-prevent-input-disable-during-repaint.patch |   34 +++++
>  .../0005-temp-hack-to-enable-weston-1.3.patch      |   33 +++++
>  .../0006-weston-drm-Enable-multiple-displays.patch |   43 ++++++
>  .../recipes-graphics/wayland/just-scanner.patch    |   36 +++++
>  .../recipes-graphics/wayland/pattern.png           |  Bin 0 -> 1846 byte=
s
>  meta-arago-extras/recipes-graphics/wayland/profile |    9 ++
>  .../recipes-graphics/wayland/terminal.png          |  Bin 0 -> 1005 byte=
s
>  .../recipes-graphics/wayland/wayland.inc           |    5 +
>  .../recipes-graphics/wayland/wayland_1.3.0.bb      |   34 +++++
>  .../recipes-graphics/wayland/weston.desktop        |   91 ++++++++++++
>  .../recipes-graphics/wayland/weston.png            |  147
> +++++++++++++++++++
>  .../recipes-graphics/wayland/weston_1.3.0.bb       |  148
> ++++++++++++++++++++
>  14 files changed, 653 insertions(+)
>  create mode 100755 meta-arago-extras/recipes-graphics/wayland/0001-
> compositor-drm-Change-path-of-gbm.h-to-gbm-gbm.h.patch
>  create mode 100755 meta-arago-extras/recipes-graphics/wayland/0002-
> Makefile-Include-option-to-search-in-include-drm.patch
>  create mode 100644 meta-arago-extras/recipes-graphics/wayland/0003-
> input-source-prevent-input-disable-during-repaint.patch
>  create mode 100644 meta-arago-extras/recipes-graphics/wayland/0005-
> temp-hack-to-enable-weston-1.3.patch
>  create mode 100644 meta-arago-extras/recipes-graphics/wayland/0006-
> weston-drm-Enable-multiple-displays.patch
>  create mode 100644 meta-arago-extras/recipes-graphics/wayland/just-
> scanner.patch
>  create mode 100644 meta-arago-extras/recipes-=20
> graphics/wayland/pattern.png  create mode 100644=20
> meta-arago-extras/recipes-graphics/wayland/profile
>  create mode 100644 meta-arago-extras/recipes-=20
> graphics/wayland/terminal.png  create mode 100644=20
> meta-arago-extras/recipes- graphics/wayland/wayland.inc  create mode=20
> 100644 meta-arago-extras/recipes- graphics/wayland/wayland_1.3.0.bb =20
> create mode 100644 meta-arago-extras/recipes-=20
> graphics/wayland/weston.desktop  create mode 100644=20
> meta-arago-extras/recipes- graphics/wayland/weston.png  create mode=20
> 100644 meta-arago-extras/recipes- graphics/wayland/weston_1.3.0.bb
>=20
> --
> 1.7.9.5
>=20
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

