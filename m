Return-Path: <chase.maupin@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by arago-project.org (Postfix) with ESMTPS id 97BEF5299B
	for <meta-arago@arago-project.org>;
	Tue, 15 Oct 2013 15:46:57 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id r9FFkums031633;
	Tue, 15 Oct 2013 10:46:56 -0500
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id r9FFku6E007050;
	Tue, 15 Oct 2013 10:46:56 -0500
Received: from DLEE11.ent.ti.com ([fe80::40fa:b936:da7c:d113]) by
	DLEE71.ent.ti.com ([fe80::4dce:5c82:1ad0:d462%28]) with mapi id
	14.02.0342.003; Tue, 15 Oct 2013 10:46:56 -0500
From: "Maupin, Chase" <chase.maupin@ti.com>
To: Denys Dmytriyenko <denis@denix.org>, "meta-arago@arago-project.org"
	<meta-arago@arago-project.org>
Thread-Topic: [meta-arago] [PATCH 2/5] qt-provider: expand with extra
	dependency variables for qtsvg and qtscript
Thread-Index: AQHOyVXJHcF0dimeEkWMPnJs7L56Zpn16Npg
Date: Tue, 15 Oct 2013 15:46:56 +0000
Message-ID: <7D46E86EC0A8354091174257B2FED101597B1E4E@DLEE11.ent.ti.com>
References: <1381807317-3759-1-git-send-email-denis@denix.org>
	<1381807317-3759-2-git-send-email-denis@denix.org>
In-Reply-To: <1381807317-3759-2-git-send-email-denis@denix.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.247.5.50]
MIME-Version: 1.0
Subject: Re: [PATCH 2/5] qt-provider: expand with extra dependency variables for qtsvg and qtscript
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
X-List-Received-Date: Tue, 15 Oct 2013 15:46:58 -0000
Content-Language: en-US
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

Acked-by: Chase Maupin <chase.maupin@ti.com>

>-----Original Message-----
>From: meta-arago-bounces@arago-project.org [mailto:meta-arago-
>bounces@arago-project.org] On Behalf Of Denys Dmytriyenko
>Sent: Monday, October 14, 2013 10:22 PM
>To: meta-arago@arago-project.org
>Subject: [meta-arago] [PATCH 2/5] qt-provider: expand with extra
>dependency variables for qtsvg and qtscript
>
>From: Denys Dmytriyenko <denys@ti.com>
>
>Signed-off-by: Denys Dmytriyenko <denys@ti.com>
>---
> meta-arago-distro/classes/qt-provider.bbclass | 6 +++++-
> 1 file changed, 5 insertions(+), 1 deletion(-)
>
>diff --git a/meta-arago-distro/classes/qt-provider.bbclass b/meta-
>arago-distro/classes/qt-provider.bbclass
>index 444c76a..c0f7184 100644
>--- a/meta-arago-distro/classes/qt-provider.bbclass
>+++ b/meta-arago-distro/classes/qt-provider.bbclass
>@@ -11,9 +11,13 @@ QT_PROVIDER ?=3D "qt4e"
>
> inherit ${QT_PROVIDER}
>
>-# Build-time dependencies
>+# Build-time dependencies - those are now separate modules in Qt5
>and
>+# require separate dependencies, unlike Qt4 that provides
>everything
>+# in a single qt4-embedded/qt4-x11 recipe
> QT_DEPENDS_BASE =3D "${@base_conditional('QT_PROVIDER', 'qt5',
>'qtbase', 'qt4-embedded', d)}"
> QT_DEPENDS_WEBKIT =3D "${@base_conditional('QT_PROVIDER', 'qt5',
>'qtwebkit', '', d)}"
>+QT_DEPENDS_SVG =3D "${@base_conditional('QT_PROVIDER', 'qt5',
>'qtsvg', '', d)}"
>+QT_DEPENDS_SCRIPT =3D "${@base_conditional('QT_PROVIDER', 'qt5',
>'qtscript', '', d)}"
>
> # Run-time dependencies
> QT_RDEPENDS_FONTS =3D "${@base_conditional('QT_PROVIDER', 'qt5',
>'qtbase-fonts', 'qt4-embedded-fonts', d)}"
>--
>1.8.3.2
>
>_______________________________________________
>meta-arago mailing list
>meta-arago@arago-project.org
>http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

