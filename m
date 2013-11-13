Return-Path: <chase.maupin@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by arago-project.org (Postfix) with ESMTPS id 8B1D352A56
	for <meta-arago@arago-project.org>;
	Wed, 13 Nov 2013 14:38:29 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id rADEcS3m000840;
	Wed, 13 Nov 2013 08:38:28 -0600
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id rADEcSgl001417;
	Wed, 13 Nov 2013 08:38:28 -0600
Received: from DLEE11.ent.ti.com ([fe80::40fa:b936:da7c:d113]) by
	DFLE73.ent.ti.com ([fe80::c9be:a3a9:7cd8:c8b3%28]) with mapi id
	14.02.0342.003; Wed, 13 Nov 2013 08:38:28 -0600
From: "Maupin, Chase" <chase.maupin@ti.com>
To: Denys Dmytriyenko <denis@denix.org>, "meta-arago@arago-project.org"
	<meta-arago@arago-project.org>
Thread-Topic: [meta-arago] [PATCH 1/6] qt-provider: split out setting
	variables	into own class
Thread-Index: AQHO32Gt+a/JJ964ukWSG9RRztPvzJojPKzw
Date: Wed, 13 Nov 2013 14:38:27 +0000
Message-ID: <7D46E86EC0A8354091174257B2FED101598157AD@DLEE11.ent.ti.com>
References: <1384231333-26952-1-git-send-email-denis@denix.org>
	<1384231333-26952-2-git-send-email-denis@denix.org>
In-Reply-To: <1384231333-26952-2-git-send-email-denis@denix.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.247.5.50]
MIME-Version: 1.0
Subject: Re: [PATCH 1/6] qt-provider: split out setting variables	into own class
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
X-List-Received-Date: Wed, 13 Nov 2013 14:38:30 -0000
Content-Language: en-US
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

Acked-by: Chase Maupin <chase.maupin@ti.com>

>-----Original Message-----
>From: meta-arago-bounces@arago-project.org [mailto:meta-arago-
>bounces@arago-project.org] On Behalf Of Denys Dmytriyenko
>Sent: Monday, November 11, 2013 10:42 PM
>To: meta-arago@arago-project.org
>Subject: [meta-arago] [PATCH 1/6] qt-provider: split out setting
>variables into own class
>
>From: Denys Dmytriyenko <denys@ti.com>
>
>This way only variables can be used from other places where
>inheriting rest of
>qt/qmake classes won't make sense.
>
>Signed-off-by: Denys Dmytriyenko <denys@ti.com>
>---
> meta-arago-distro/classes/qt-provider.bbclass | 12 +-----------
> meta-arago-distro/classes/qt-vars.bbclass     | 16
>++++++++++++++++
> 2 files changed, 17 insertions(+), 11 deletions(-)
> create mode 100644 meta-arago-distro/classes/qt-vars.bbclass
>
>diff --git a/meta-arago-distro/classes/qt-provider.bbclass b/meta-
>arago-distro/classes/qt-provider.bbclass
>index c0f7184..a0dbdef 100644
>--- a/meta-arago-distro/classes/qt-provider.bbclass
>+++ b/meta-arago-distro/classes/qt-provider.bbclass
>@@ -10,14 +10,4 @@
> QT_PROVIDER ?=3D "qt4e"
>
> inherit ${QT_PROVIDER}
>-
>-# Build-time dependencies - those are now separate modules in Qt5
>and
>-# require separate dependencies, unlike Qt4 that provides
>everything
>-# in a single qt4-embedded/qt4-x11 recipe
>-QT_DEPENDS_BASE =3D "${@base_conditional('QT_PROVIDER', 'qt5',
>'qtbase', 'qt4-embedded', d)}"
>-QT_DEPENDS_WEBKIT =3D "${@base_conditional('QT_PROVIDER', 'qt5',
>'qtwebkit', '', d)}"
>-QT_DEPENDS_SVG =3D "${@base_conditional('QT_PROVIDER', 'qt5',
>'qtsvg', '', d)}"
>-QT_DEPENDS_SCRIPT =3D "${@base_conditional('QT_PROVIDER', 'qt5',
>'qtscript', '', d)}"
>-
>-# Run-time dependencies
>-QT_RDEPENDS_FONTS =3D "${@base_conditional('QT_PROVIDER', 'qt5',
>'qtbase-fonts', 'qt4-embedded-fonts', d)}"
>+inherit qt-vars
>diff --git a/meta-arago-distro/classes/qt-vars.bbclass b/meta-
>arago-distro/classes/qt-vars.bbclass
>new file mode 100644
>index 0000000..b5efee2
>--- /dev/null
>+++ b/meta-arago-distro/classes/qt-vars.bbclass
>@@ -0,0 +1,16 @@
>+# Class to define many useful variables that differ between Qt4
>and Qt5
>+
>+QT_PROVIDER ?=3D "qt4e"
>+
>+# Build-time dependencies - those are now separate modules in Qt5
>and
>+# require separate dependencies, unlike Qt4 that provides
>everything
>+# in a single qt4-embedded/qt4-x11 recipe
>+QT_DEPENDS_BASE =3D "${@base_conditional('QT_PROVIDER', 'qt5',
>'qtbase', 'qt4-embedded', d)}"
>+QT_DEPENDS_WEBKIT =3D "${@base_conditional('QT_PROVIDER', 'qt5',
>'qtwebkit', '', d)}"
>+QT_DEPENDS_SVG =3D "${@base_conditional('QT_PROVIDER', 'qt5',
>'qtsvg', '', d)}"
>+QT_DEPENDS_SCRIPT =3D "${@base_conditional('QT_PROVIDER', 'qt5',
>'qtscript', '', d)}"
>+
>+# Run-time dependencies
>+QT_RDEPENDS_FONTS =3D "${@base_conditional('QT_PROVIDER', 'qt5',
>'qtbase-fonts', 'qt4-embedded-fonts', d)}"
>+QT_RDEPENDS_NATIVESDK_TOOLS =3D "${@base_conditional('QT_PROVIDER',
>'qt5', 'nativesdk-qtbase-tools nativesdk-qttools', 'nativesdk-qt4-
>tools', d)}"
>+QT_RDEPENDS_MKSPECS =3D "${@base_conditional('QT_PROVIDER', 'qt5',
>'qtbase-mkspecs', 'qt4-embedded-mkspecs', d)}"
>--
>1.8.3.2
>
>_______________________________________________
>meta-arago mailing list
>meta-arago@arago-project.org
>http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

