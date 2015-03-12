Return-Path: <eyalr@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id 5720D52A7E
	for <meta-arago@arago-project.org>;
	Thu, 12 Mar 2015 07:57:26 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id t2C7vPi9030252
	for <meta-arago@arago-project.org>; Thu, 12 Mar 2015 02:57:25 -0500
Received: from DFRE71.ent.ti.com (dfre71.ent.ti.com [10.167.188.35])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id t2C7vNX4031521
	for <meta-arago@arago-project.org>; Thu, 12 Mar 2015 02:57:24 -0500
Received: from DFRE01.ent.ti.com ([fe80::b027:5293:c8d8:d82a]) by
	DFRE71.ent.ti.com ([fe80::1d1a:fb50:7d9b:ab68%31]) with mapi id
	14.03.0224.002; Thu, 12 Mar 2015 08:57:23 +0100
From: "Reizer, Eyal" <eyalr@ti.com>
To: "Dmytriyenko, Denys" <denys@ti.com>, "meta-arago@arago-project.org"
	<meta-arago@arago-project.org>
Thread-Topic: [meta-arago] gitorious.org status
Thread-Index: AQHQXCZDGCtjkTwo6UWnii/R+PnlD50YexGw
Date: Thu, 12 Mar 2015 07:57:22 +0000
Message-ID: <8665E2433BC68541A24DFFCA87B70F5B23636F88@DFRE01.ent.ti.com>
References: <20150311180729.GA23587@edge>
In-Reply-To: <20150311180729.GA23587@edge>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.167.188.42]
x-exclaimer-md-config: f9c360f5-3d1e-4c3c-8703-f45bf52eff6b
MIME-Version: 1.0
Subject: Re: gitorious.org status
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
X-List-Received-Date: Thu, 12 Mar 2015 07:57:26 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi Denys,

The uim code base has been moved to the following internal git:
https://git.ti.com/ti-bt/uim

Next, we need to update the uim_git.bb recipe to point to the new location,=
 and remove the patching that was done inside the recipe as the new git is =
updated with it.

Best Regards,
Eyal


> -----Original Message-----
> From: meta-arago-bounces@arago-project.org [mailto:meta-arago-
> bounces@arago-project.org] On Behalf Of Dmytriyenko, Denys
> Sent: Wednesday, March 11, 2015 8:07 PM
> To: meta-arago@arago-project.org
> Subject: [meta-arago] gitorious.org status
>=20
> So, it appears gitorious.org has disabled "git" access across the board,
> probably to enforce read-only state and prevent people from updating thei=
r
> repos further, forcing them to migrate to gitlab...
>=20
> There are patches for meta-qt5 to switch SRC_URIs to code.qt.io - that wi=
ll
> take care of Qt5 recipes, once commited to meta-qt5/master, which we trac=
k.
>=20
> We would need to take care of our own repositories (qt-apps, matrix, uim,
> etc.) and decide where to move them over to. Franklin, most of those repo=
s
> are owned by you or your tem. What are your plans?
>=20
> meta-arago-extras/recipes-connectivity/uim/uim_git.bb:SRC_URI =3D
> "git://gitorious.org/uim/uim.git \ meta-arago-extras/recipes-qt/qt-apps/i=
mage-
> gallery_git.bb:HOMEPAGE =3D "https://gitorious.org/image-gallery"
> meta-arago-extras/recipes-qt/qt-apps/image-gallery_git.bb:SRC_URI =3D
> "git://gitorious.org/image-gallery/image-
> gallery.git;protocol=3Dgit;branch=3D${BRANCH}"
> meta-arago-extras/recipes-qt/qt-apps/qt-tstat_2.0.bb:HOMEPAGE =3D
> "https://gitorious.org/thermostat-demo"
> meta-arago-extras/recipes-qt/qt-apps/qt-tstat_2.0.bb:
> git://gitorious.org/thermostat-demo/thermostat-demo.git;protocol=3Dgit \
> meta-arago-extras/recipes-core/am-sysinfo/am-sysinfo_git.bb:SRC_URI =3D
> "git://gitorious.org/am_sysinfo/am_sysinfo.git;protocol=3Dgit;branch=3D${=
BRANCH
> }"
> meta-arago-extras/recipes-core/oprofile-example/oprofile-
> example_git.bb:HOMEPAGE =3D "https://gitorious.org/oprofile-example"
> meta-arago-extras/recipes-core/oprofile-example/oprofile-
> example_git.bb:SRC_URI =3D "git://gitorious.org/oprofile-example/oprofile=
-
> example.git;protocol=3Dgit;branch=3D${BRANCH}"
> meta-arago-extras/recipes-core/matrix/matrix-gui-
> browser_2.0.bb:HOMEPAGE =3D "https://gitorious.org/matrix-gui-
> v2/matrix_browser"
> meta-arago-extras/recipes-core/matrix/matrix-gui-browser_2.0.bb:SRC_URI =
=3D
> "git://gitorious.org/matrix-gui-
> v2/matrix_browser.git;protocol=3Dgit;branch=3D${BRANCH}"
> meta-arago-extras/recipes-core/matrix/matrix-gui-clocks_2.0.bb:HOMEPAGE
> =3D "https://gitorious.org/matrix-gui-v2/matrix-gui-v2-apps"
> meta-arago-extras/recipes-core/matrix/matrix-gui-armbenchmarks-
> demos_2.0.bb:HOMEPAGE =3D "https://gitorious.org/matrix-gui-v2/matrix-gui=
-
> v2-apps"
> meta-arago-extras/recipes-core/matrix/matrix-gui-
> submenus_2.0.bb:HOMEPAGE =3D "https://gitorious.org/matrix-gui-v2/matrix-
> gui-v2-apps"
> meta-arago-extras/recipes-core/matrix/matrix-gui-qt4-
> demos_2.0.bb:HOMEPAGE =3D "https://gitorious.org/matrix-gui-v2/matrix-gui=
-
> v2-apps"
> meta-arago-extras/recipes-core/matrix/matrix-gui-generic-
> pm_2.0.bb:HOMEPAGE =3D "https://gitorious.org/matrix-gui-v2/matrix-gui-v2=
-
> apps"
> meta-arago-extras/recipes-core/matrix/matrix-gui-multimedia-
> demos_2.0.bb:HOMEPAGE =3D "https://gitorious.org/matrix-gui-v2/matrix-gui=
-
> v2-apps"
> meta-arago-extras/recipes-core/matrix/matrix-gui-settings-
> demos_2.0.bb:HOMEPAGE =3D "https://gitorious.org/matrix-gui-v2/matrix-gui=
-
> v2-apps"
> meta-arago-extras/recipes-core/matrix/matrix-gui-v4l2-
> demos_2.0.bb:HOMEPAGE =3D "https://gitorious.org/matrix-gui-v2/matrix-gui=
-
> v2-apps"
> meta-arago-extras/recipes-core/matrix/matrix-gui-apps-git.inc:SRC_URI =3D
> "git://gitorious.org/matrix-gui-v2/matrix-gui-v2-
> apps.git;protocol=3Dgit;branch=3D${BRANCH}"
> meta-arago-extras/recipes-core/matrix/refresh-screen_2.0.bb:HOMEPAGE =3D
> "https://gitorious.org/matrix-gui-v2/refresh-screen"
> meta-arago-extras/recipes-core/matrix/refresh-screen_2.0.bb:SRC_URI =3D
> "git://gitorious.org/matrix-gui-v2/refresh-
> screen.git;protocol=3Dgit;branch=3D${BRANCH}"
> meta-arago-extras/recipes-core/matrix/matrix-gui-pru-
> demos_2.0.bb:HOMEPAGE =3D "https://gitorious.org/matrix-gui-v2/matrix-gui=
-
> v2-apps"
> meta-arago-extras/recipes-core/matrix/matrix-gui-3d-
> demos_2.0.bb:HOMEPAGE =3D "https://gitorious.org/matrix-gui-v2/matrix-gui=
-
> v2-apps"
> meta-arago-extras/recipes-core/matrix/matrix-gui-apps-
> images_2.0.bb:HOMEPAGE =3D "https://gitorious.org/matrix-gui-v2/matrix-gu=
i-
> v2-apps"
> meta-arago-extras/recipes-core/matrix/matrix-gui-oprofile-
> demos_2.0.bb:HOMEPAGE =3D "https://gitorious.org/matrix-gui-v2/matrix-gui=
-
> v2-apps"
> meta-arago-extras/recipes-core/matrix/matrix-gui-helper-
> scripts.bb:HOMEPAGE =3D "https://gitorious.org/matrix-gui-v2/matrix-gui-v=
2-
> apps"
> meta-arago-extras/recipes-core/matrix/matrix-gui_2.0.bb:SRC_URI =3D
> "git://gitorious.org/matrix-gui-v2/matrix-gui-
> v2.git;protocol=3Dgit;branch=3D${BRANCH} \ meta-arago-extras/recipes-
> core/matrix/matrix-gui-wifi-demos_2.0.bb:HOMEPAGE =3D
> "https://gitorious.org/matrix-gui-v2/matrix-gui-v2-apps"
> meta-arago-extras/recipes-core/matrix/matrix-gui-pm-
> demos_2.0.bb:HOMEPAGE =3D "https://gitorious.org/matrix-gui-v2/matrix-gui=
-
> v2-apps"
> meta-arago-extras/recipes-core/matrix/matrix-gui-display-
> control_2.0.bb:HOMEPAGE =3D "https://gitorious.org/matrix-gui-v2/matrix-g=
ui-
> v2-apps"
> meta-arago-extras/recipes-core/matrix/matrix-gui-crypto-
> demos_2.0.bb:HOMEPAGE =3D "https://gitorious.org/matrix-gui-v2/matrix-gui=
-
> v2-apps"
> meta-arago-extras/recipes-core/matrix/matrix-gui-usb-
> demos_2.0.bb:HOMEPAGE =3D "https://gitorious.org/matrix-gui-v2/matrix-gui=
-
> v2-apps"
> meta-arago-extras/recipes-core/matrix/matrix-gui-ethernet-
> demos_2.0.bb:HOMEPAGE =3D "https://gitorious.org/matrix-gui-v2/matrix-gui=
-
> v2-apps"
> meta-arago-extras/recipes-core/matrix/matrix-gui-camera-
> loopback_2.0.bb:HOMEPAGE =3D "https://gitorious.org/matrix-gui-v2/matrix-
> gui-v2-apps"
> meta-arago-extras/recipes-core/matrix/matrix-gui-qt5-
> demos_2.0.bb:HOMEPAGE =3D "https://gitorious.org/matrix-gui-v2/matrix-gui=
-
> v2-apps"
> meta-arago-extras/recipes-
> graphics/screenshot/screenshot_1.0.bb:HOMEPAGE =3D
> "https://gitorious.org/screenshot"
> meta-arago-extras/recipes-graphics/screenshot/screenshot_1.0.bb:SRC_URI
> =3D
> "git://gitorious.org/screenshot/screenshot.git;protocol=3Dgit;branch=3D${=
BRANCH
> }"
> meta-arago-extras/recipes-benchmark/arm-benchmarks/arm-
> benchmarks_1.3.bb:SRC_URI =3D
> "git://gitorious.org/arm_benchmarks/arm_benchmarks.git;protocol=3Dgit;bra=
nc
> h=3D${BRANCH}"
> meta-arago-extras/recipes-multimedia/av-examples/av-
> examples_1.0.bb:SRC_URI =3D
> "git://gitorious.org/av_examples/av_examples.git;protocol=3Dgit;branch=3D=
${BRA
> NCH}"
> meta-arago-extras/recipes-multimedia/dual-camera-demo/dual-camera-
> demo_1.0.bb:HOMEPAGE =3D "https://gitorious.org/dual-camera-demo/"
> meta-arago-extras/recipes-multimedia/dual-camera-demo/dual-camera-
> demo_1.0.bb:SRC_URI =3D "git://gitorious.org/dual-camera-demo/dual-camera=
-
> demo.git;protocol=3Dgit;branch=3D${BRANCH} \
>=20
> --
> Denys
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

