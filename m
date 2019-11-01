Return-Path: <e-ruei1@ti.com>
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
	by arago-project.org (Postfix) with ESMTPS id 0CEE352986
	for <meta-arago@arago-project.org>;
	Fri,  1 Nov 2019 12:06:36 +0000 (UTC)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id xA1C5GSk092021
	for <meta-arago@arago-project.org>; Fri, 1 Nov 2019 07:05:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1572609916;
	bh=gQZdaNEuoc/5V2kjyC0txcCW09/Um8ESNIDRlzUujEw=;
	h=From:To:CC:Subject:Date:References:In-Reply-To;
	b=itIyJZNER7hVk7BV8RkhZvwhFFuV5MR+Th/3eiGJV+kzzJJf5xPZhbYxXuxiqYVyC
	hZHDKgLMjJQNzg3e+3oQKDyLv3BB6pb5Ioc+CNuIH111m93iPMJWDGkMMXqtg74iuX
	riXLTmTRdaxwRpv9uLsk5hmo4r4yb0k8tl+8EUj0=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id xA1C5GAT117616
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Fri, 1 Nov 2019 07:05:16 -0500
Received: from DLEE113.ent.ti.com (157.170.170.24) by DLEE108.ent.ti.com
	(157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Fri, 1 Nov 2019 07:05:02 -0500
Received: from DLEE113.ent.ti.com ([fe80::a10b:711a:6ba7:e455]) by
	DLEE113.ent.ti.com ([fe80::a10b:711a:6ba7:e455%17]) with mapi id
	15.01.1713.004; Fri, 1 Nov 2019 07:05:02 -0500
From: "Ruei, Eric" <e-ruei1@ti.com>
To: "Dmytriyenko, Denys" <denys@ti.com>
Thread-Topic: [meta-arago] [thud/master][PATCH v2 0/7] Mesa-based EGL/GLES
Thread-Index: AQHVkGKThggWP3+KqkGrwtF/tp6HaKd2N5+w
Date: Fri, 1 Nov 2019 12:05:02 +0000
Message-ID: <09b4e82861bc494d9885f78281f07f35@ti.com>
References: <20191030195550.17767-1-e-ruei1@ti.com>
	<20191101031525.GY32214@beryl>
In-Reply-To: <20191101031525.GY32214@beryl>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [158.218.113.148]
x-exclaimer-md-config: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
MIME-Version: 1.0
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Subject: Re: [thud/master][PATCH v2 0/7] Mesa-based EGL/GLES
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
X-List-Received-Date: Fri, 01 Nov 2019 12:06:37 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi, Denys:

Is the meta-ti patch as in?
What is the target?=20
I have only tried AM5/6.

Best regards,

Eric


-----Original Message-----
From: Dmytriyenko, Denys=20
Sent: Thursday, October 31, 2019 11:15 PM
To: Ruei, Eric
Cc: meta-arago@arago-project.org
Subject: Re: [meta-arago] [thud/master][PATCH v2 0/7] Mesa-based EGL/GLES

qtwebengine fails with this:
cannot find -lIMGegl


On Wed, Oct 30, 2019 at 03:55:43PM -0400, Eric Ruei wrote:
> These are the corresponding patches with Mesa-based EGL/GLES including
> - re-enable qtwebengine for AM3/4/5
> - several hacks to resolve compiling issues triggered by  mesa-based EGL
>   header files
> - Add DRM(GBM)-based 3D demos
> - Makefile cleanup per Mesa-based EGL library names=20
>=20
> V2 changes:
> - Add Upstream-Status to Weston and qtWebkit patches
>=20
> Eric Ruei (7):
>   packagegroup-arago-xxx-qte-xxx: re-enable qtwebengine per EGL 1.5 for
>     AM3/4/5
>   qtbase-conf: set the default EGLFS mode to kms
>   HACK: weston: undefine HAVE_GBM_MODIFIERS explicitly
>   HACK: qtwebkit: define MESA_EGL_NO_X11_HEADERS at ANGLE/khrplatform.h
>   img-pvr-sdk: Add DRM(GBM)-based GPU demos
>   omapdrmtest: Update LDFLAGS at util/Makefile.am per Mesa-based EGL
>   HACK: matrix-gui-machinevision-demos: disable point-cloud-viewer
>=20
>  .../packagegroups/packagegroup-arago-qte.bb   |  9 +--
>  .../packagegroup-arago-tisdk-qte.bb           |  7 +-
>  ...rm-undef-HAVE_GBM_MODIFIERS-explicit.patch | 31 ++++++++
>  .../wayland/weston_5.0.0.bbappend             |  3 +-
>  .../recipes-qt/qt5/qtbase-conf/qt_env.sh      |  2 +-
>  .../qt5/qtbase-conf/ti33x/qt_env.sh           |  2 +-
>  ...atform.h-add-define-MESA_EGL_NO_X11_.patch | 30 ++++++++
>  .../recipes-qt/qt5/qtwebkit_%.bbappend        |  3 +-
>  .../matrix-gui-machinevision-demos_2.0.bb     |  6 +-
>  ...packagegroup-arago-qte-toolchain-target.bb | 12 ++--
>  .../img-pvr-sdk/img-pvr-sdk_3.3.2.bb          | 71 ++++++++++---------
>  ...am-update-LDFLAGS-for-Mesa-based-EGL.patch | 32 +++++++++
>  .../omapdrmtest/omapdrmtest_1.0.0.bb          |  3 +-
>  13 files changed, 161 insertions(+), 50 deletions(-)
>  create mode 100644 meta-arago-distro/recipes-graphics/wayland/weston/000=
1-HACK-composito-drm-undef-HAVE_GBM_MODIFIERS-explicit.patch
>  create mode 100644 meta-arago-distro/recipes-qt/qt5/qtwebkit/0001-HACK-A=
NGLE-khrplatform.h-add-define-MESA_EGL_NO_X11_.patch
>  create mode 100644 meta-arago-extras/recipes-graphics/omapdrmtest/files/=
0001-util-Makefile.am-update-LDFLAGS-for-Mesa-based-EGL.patch
>=20
> --=20
> 2.17.1
>=20
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

