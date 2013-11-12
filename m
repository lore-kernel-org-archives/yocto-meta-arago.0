Return-Path: <fcooper@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by arago-project.org (Postfix) with ESMTPS id 0D0AB52972
	for <meta-arago@arago-project.org>;
	Tue, 12 Nov 2013 22:06:18 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id rACM6HLn029638;
	Tue, 12 Nov 2013 16:06:17 -0600
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id rACM6GmH003199;
	Tue, 12 Nov 2013 16:06:17 -0600
Received: from DFLE08.ent.ti.com ([fe80::187f:8c86:2b7:ef9f]) by
	DFLE72.ent.ti.com ([fe80::e5e2:bab6:34dc:a483%28]) with mapi id
	14.02.0342.003; Tue, 12 Nov 2013 16:06:16 -0600
From: "Cooper Jr., Franklin" <fcooper@ti.com>
To: Denys Dmytriyenko <denis@denix.org>
Thread-Topic: [meta-arago] [PATCH 0/6] Add Qt5 SDK
Thread-Index: AQHO32G10xXBdTzqxE+m6AmlfIFjwpoiKA3Q
Date: Tue, 12 Nov 2013 22:06:15 +0000
Message-ID: <8139F651-5F7B-4D20-8F49-8CDA89FE829B@ti.com>
References: <1384231333-26952-1-git-send-email-denis@denix.org>
In-Reply-To: <1384231333-26952-1-git-send-email-denis@denix.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
MIME-Version: 1.0
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Subject: Re: [PATCH 0/6] Add Qt5 SDK
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
X-List-Received-Date: Tue, 12 Nov 2013 22:06:18 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Thanks for these!

I need a couple of days to test things out and I'll report back. I also hav=
e se Qt5 related patches to add.

> On Nov 11, 2013, at 10:43 PM, "Denys Dmytriyenko" <denis@denix.org> wrote=
:
>=20
> From: Denys Dmytriyenko <denys@ti.com>
>=20
> This patchset adds necessary nativesdk tools and updates corresponding
> packagegroup and meta-toolchain recipes to enable building Qt5 SDK.
>=20
> Denys Dmytriyenko (6):
>  qt-provider: split out setting variables into own class
>  nativesdk-qtbase: add nativesdk version of qtbase necessary for SDK
>    tools
>  nativesdk-qttools: add nativesdk version of qttools necessary for SDK
>    tools
>  nativesdk-packagegroup-arago-qte-toolchain-host: update to support Qt4
>    and Qt5
>  packagegroup-arago-qt5-toolchain-target: add Qt5-specific version
>  meta-toolchain-arago-qte: update to support Qt4 and Qt5 SDK
>=20
> meta-arago-distro/classes/qt-provider.bbclass      |  12 +-
> meta-arago-distro/classes/qt-vars.bbclass          |  16 ++
> meta-arago-distro/recipes-qt/qt5/nativesdk-qt5.inc |  12 +
> .../recipes-qt/qt5/nativesdk-qtbase.inc            | 188 +++++++++++++
> .../0001-Add-linux-oe-g-platform.patch             | 304 ++++++++++++++++=
+++++
> .../nativesdk-qtbase/0001-Always-build-uic.patch   |  40 +++
> ...ump-path-length-from-256-to-512-character.patch |  29 ++
> ...reserve-built-qmake-and-swap-with-native-.patch |  29 ++
> ...o-allow-to-set-qt.conf-from-the-outside-u.patch |  36 +++
> .../0003-Add-external-hostbindir-option.patch      | 219 +++++++++++++++
> ..._functions-temporary-remove-isEmpty-check.patch |  51 ++++
> ...-building-a-separate-qmake-for-the-target.patch |  29 ++
> ...p-Prefix-default-LIBDIRS-and-INCDIRS-with.patch |  29 ++
> .../0008-qt_module-Fix-pkgconfig-replacement.patch |  70 +++++
> .../0009-qt_module-Fix-paths-in-.prl-files.patch   |  62 +++++
> ...on-t-export-SYSTEM_VARIABLES-to-.qmake.va.patch |  44 +++
> ....prf-Allow-to-add-extra-arguments-to-make.patch |  37 +++
> .../0013-Disable-mkv8snapshot.patch                |  47 ++++
> ...tslib-device-to-be-read-from-env-variable.patch |  35 +++
> .../0015-qtbase-allow-build-of-examples.patch      |  48 ++++
> ...ure-make-pulseaudio-a-configurable-option.patch |  36 +++
> ...configure-make-alsa-a-configurable-option.patch |  35 +++
> ...igure-make-freetype-a-configurable-option.patch |  35 +++
> ...E_PATH_EXTERNAL_HOST_BINS-to-determine-pa.patch |  84 ++++++
> .../recipes-qt/qt5/nativesdk-qtbase_5.1.1.bb       |   5 +
> .../recipes-qt/qt5/nativesdk-qttools.inc           |  32 +++
> ...w-to-build-only-lrelease-lupdate-lconvert.patch | 138 ++++++++++
> .../recipes-qt/qt5/nativesdk-qttools_5.1.1.bb      |  10 +
> .../recipes-core/meta/meta-toolchain-arago-qte.bb  |  31 ++-
> ...ivesdk-packagegroup-arago-qte-toolchain-host.bb |   4 +-
> .../packagegroup-arago-qt5-toolchain-target.bb     |  33 +++
> 31 files changed, 1756 insertions(+), 24 deletions(-)
> create mode 100644 meta-arago-distro/classes/qt-vars.bbclass
> create mode 100644 meta-arago-distro/recipes-qt/qt5/nativesdk-qt5.inc
> create mode 100644 meta-arago-distro/recipes-qt/qt5/nativesdk-qtbase.inc
> create mode 100644 meta-arago-distro/recipes-qt/qt5/nativesdk-qtbase/0001=
-Add-linux-oe-g-platform.patch
> create mode 100644 meta-arago-distro/recipes-qt/qt5/nativesdk-qtbase/0001=
-Always-build-uic.patch
> create mode 100644 meta-arago-distro/recipes-qt/qt5/nativesdk-qtbase/0001=
-configure-bump-path-length-from-256-to-512-character.patch
> create mode 100644 meta-arago-distro/recipes-qt/qt5/nativesdk-qtbase/0001=
-configure-preserve-built-qmake-and-swap-with-native-.patch
> create mode 100644 meta-arago-distro/recipes-qt/qt5/nativesdk-qtbase/0002=
-qlibraryinfo-allow-to-set-qt.conf-from-the-outside-u.patch
> create mode 100644 meta-arago-distro/recipes-qt/qt5/nativesdk-qtbase/0003=
-Add-external-hostbindir-option.patch
> create mode 100644 meta-arago-distro/recipes-qt/qt5/nativesdk-qtbase/0004=
-qt_functions-temporary-remove-isEmpty-check.patch
> create mode 100644 meta-arago-distro/recipes-qt/qt5/nativesdk-qtbase/0006=
-Allow-building-a-separate-qmake-for-the-target.patch
> create mode 100644 meta-arago-distro/recipes-qt/qt5/nativesdk-qtbase/0007=
-configureapp-Prefix-default-LIBDIRS-and-INCDIRS-with.patch
> create mode 100644 meta-arago-distro/recipes-qt/qt5/nativesdk-qtbase/0008=
-qt_module-Fix-pkgconfig-replacement.patch
> create mode 100644 meta-arago-distro/recipes-qt/qt5/nativesdk-qtbase/0009=
-qt_module-Fix-paths-in-.prl-files.patch
> create mode 100644 meta-arago-distro/recipes-qt/qt5/nativesdk-qtbase/0011=
-configure-don-t-export-SYSTEM_VARIABLES-to-.qmake.va.patch
> create mode 100644 meta-arago-distro/recipes-qt/qt5/nativesdk-qtbase/0012=
-configure.prf-Allow-to-add-extra-arguments-to-make.patch
> create mode 100644 meta-arago-distro/recipes-qt/qt5/nativesdk-qtbase/0013=
-Disable-mkv8snapshot.patch
> create mode 100644 meta-arago-distro/recipes-qt/qt5/nativesdk-qtbase/0014=
-enables-tslib-device-to-be-read-from-env-variable.patch
> create mode 100644 meta-arago-distro/recipes-qt/qt5/nativesdk-qtbase/0015=
-qtbase-allow-build-of-examples.patch
> create mode 100644 meta-arago-distro/recipes-qt/qt5/nativesdk-qtbase/0021=
-configure-make-pulseaudio-a-configurable-option.patch
> create mode 100644 meta-arago-distro/recipes-qt/qt5/nativesdk-qtbase/0022=
-configure-make-alsa-a-configurable-option.patch
> create mode 100644 meta-arago-distro/recipes-qt/qt5/nativesdk-qtbase/0023=
-configure-make-freetype-a-configurable-option.patch
> create mode 100644 meta-arago-distro/recipes-qt/qt5/nativesdk-qtbase/0024=
-Use-OE_QMAKE_PATH_EXTERNAL_HOST_BINS-to-determine-pa.patch
> create mode 100644 meta-arago-distro/recipes-qt/qt5/nativesdk-qtbase_5.1.=
1.bb
> create mode 100644 meta-arago-distro/recipes-qt/qt5/nativesdk-qttools.inc
> create mode 100644 meta-arago-distro/recipes-qt/qt5/nativesdk-qttools/000=
1-Allow-to-build-only-lrelease-lupdate-lconvert.patch
> create mode 100644 meta-arago-distro/recipes-qt/qt5/nativesdk-qttools_5.1=
.1.bb
> create mode 100644 meta-arago-extras/recipes-core/packagegroups/packagegr=
oup-arago-qt5-toolchain-target.bb
>=20
> --=20
> 1.8.3.2
>=20
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

