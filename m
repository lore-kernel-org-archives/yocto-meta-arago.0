Return-Path: <fcooper@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by arago-project.org (Postfix) with ESMTPS id 95B5552993
	for <meta-arago@arago-project.org>;
	Fri, 22 Aug 2014 13:35:26 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id s7MDZPT7031926
	for <meta-arago@arago-project.org>; Fri, 22 Aug 2014 08:35:25 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id s7MDZPNk028437
	for <meta-arago@arago-project.org>; Fri, 22 Aug 2014 08:35:25 -0500
Received: from DFLE08.ent.ti.com ([fe80::187f:8c86:2b7:ef9f]) by
	DFLE73.ent.ti.com ([fe80::c9be:a3a9:7cd8:c8b3%28]) with mapi id
	14.03.0174.001; Fri, 22 Aug 2014 08:35:25 -0500
From: "Cooper Jr., Franklin" <fcooper@ti.com>
To: "R, Karthik" <karthik.ramanan@ti.com>, "meta-arago@arago-project.org"
	<meta-arago@arago-project.org>
Thread-Topic: [meta-arago] [PATCH 0/2] Adding support for Wayland for DRM
	backends
Thread-Index: AQHPvgz8fbpOPycfTU6KzRU6D9cdkJvcnoow
Date: Fri, 22 Aug 2014 13:35:24 +0000
Message-ID: <8F29D6B095ED194EA1980491A5E029710C702016@DFLE08.ent.ti.com>
References: <1408713923-25284-1-git-send-email-a0393906@ti.com>
In-Reply-To: <1408713923-25284-1-git-send-email-a0393906@ti.com>
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
X-List-Received-Date: Fri, 22 Aug 2014 13:35:26 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

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
> From: meta-arago-bounces@arago-project.org [mailto:meta-arago-
> bounces@arago-project.org] On Behalf Of R, Karthik
> Sent: Friday, August 22, 2014 8:25 AM
> To: meta-arago@arago-project.org
> Cc: Devshatwar, Nikhil
> Subject: [meta-arago] [PATCH 0/2] Adding support for Wayland for DRM
> backends
>=20
> There are some issues with the current omapdrm (kernel driver) and relate=
d
> dependencies on the TI platform such as dra7xx.
>=20
> Weston version 1.3.0 has been very highly tested and is currently shippin=
g to
> customers who are using wayland with DRM backend. This patch set brings i=
n
> support for Weston and also includes patches that help resolve some
> important issues in the Weston. These issues are specific to TI platforms=
 and
> cannot be submitted upstream.
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
>  create mode 100644 meta-arago-extras/recipes-
> graphics/wayland/pattern.png
>  create mode 100644 meta-arago-extras/recipes-graphics/wayland/profile
>  create mode 100644 meta-arago-extras/recipes-
> graphics/wayland/terminal.png
>  create mode 100644 meta-arago-extras/recipes-
> graphics/wayland/wayland.inc
>  create mode 100644 meta-arago-extras/recipes-
> graphics/wayland/wayland_1.3.0.bb
>  create mode 100644 meta-arago-extras/recipes-
> graphics/wayland/weston.desktop
>  create mode 100644 meta-arago-extras/recipes-
> graphics/wayland/weston.png
>  create mode 100644 meta-arago-extras/recipes-
> graphics/wayland/weston_1.3.0.bb
>=20
> --
> 1.7.9.5
>=20
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

