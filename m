Return-Path: <chase.maupin@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by arago-project.org (Postfix) with ESMTPS id E7F545296F
	for <meta-arago@arago-project.org>;
	Wed,  2 Oct 2013 12:54:01 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id r92Cs1ZI014673;
	Wed, 2 Oct 2013 07:54:01 -0500
Received: from DLEE70.ent.ti.com (dlee70.ent.ti.com [157.170.170.113])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id r92Cs1Ya013207;
	Wed, 2 Oct 2013 07:54:01 -0500
Received: from DLEE11.ent.ti.com ([fe80::40fa:b936:da7c:d113]) by
	DLEE70.ent.ti.com ([fe80::c4c6:f618:54e7:ad11%28]) with mapi id
	14.02.0342.003; Wed, 2 Oct 2013 07:54:01 -0500
From: "Maupin, Chase" <chase.maupin@ti.com>
To: Denys Dmytriyenko <denis@denix.org>, "meta-arago@arago-project.org"
	<meta-arago@arago-project.org>
Thread-Topic: [meta-arago] [PATCH 02/13] matrix-gui-browser: replace ${S}
	with ${B} in do_install()
Thread-Index: AQHOvnWDYIpWxZLGWE6ygOtyIaTK15nhX+wQ
Date: Wed, 2 Oct 2013 12:54:00 +0000
Message-ID: <7D46E86EC0A8354091174257B2FED1015977A4C9@DLEE11.ent.ti.com>
References: <1380611472-23600-1-git-send-email-denis@denix.org>
	<1380611472-23600-3-git-send-email-denis@denix.org>
In-Reply-To: <1380611472-23600-3-git-send-email-denis@denix.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [157.170.170.90]
MIME-Version: 1.0
Subject: Re: [PATCH 02/13] matrix-gui-browser: replace ${S} with ${B} in do_install()
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
X-List-Received-Date: Wed, 02 Oct 2013 12:54:02 -0000
Content-Language: en-US
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable


>-----Original Message-----
>From: meta-arago-bounces@arago-project.org [mailto:meta-arago-
>bounces@arago-project.org] On Behalf Of Denys Dmytriyenko
>Sent: Tuesday, October 01, 2013 2:11 AM
>To: meta-arago@arago-project.org
>Subject: [meta-arago] [PATCH 02/13] matrix-gui-browser: replace
>${S} with ${B} in do_install()
>
>From: Denys Dmytriyenko <denys@ti.com>
>
>Replcae ${S}ource with ${B}uild directory when installing the

Typo.

Aside from that=20
Acked-by: Chase Maupin <chase.maupin@ti.com>


>binary.
>Normally B =3D=3D S when the build output is in the same directory
>where sources
>are, but it's better to use B for when build output is in a
>different location.
>
>Signed-off-by: Denys Dmytriyenko <denys@ti.com>
>---
> meta-arago-extras/recipes-core/matrix/matrix-gui-browser_2.0.bb |
>4 ++--
> 1 file changed, 2 insertions(+), 2 deletions(-)
>
>diff --git a/meta-arago-extras/recipes-core/matrix/matrix-gui-
>browser_2.0.bb b/meta-arago-extras/recipes-core/matrix/matrix-gui-
>browser_2.0.bb
>index ecb97c2..0e508a0 100644
>--- a/meta-arago-extras/recipes-core/matrix/matrix-gui-
>browser_2.0.bb
>+++ b/meta-arago-extras/recipes-core/matrix/matrix-gui-
>browser_2.0.bb
>@@ -7,7 +7,7 @@ SECTION =3D "multimedia"
> # Make sure that QT font libraries have been installed
> RDEPENDS_${PN} +=3D "qt4-embedded-fonts"
>
>-PR =3D "r1"
>+PR =3D "r2"
>
> SRCREV =3D "db2e6b10e5a14358b6120a4a28de2f9d591bc55c"
> BRANCH ?=3D "master"
>@@ -20,5 +20,5 @@ inherit qt4e
>
> do_install() {
> 	install -d ${D}/${bindir}
>-	install -m 0755 ${S}/matrix_browser ${D}/${bindir}
>+	install -m 0755 ${B}/matrix_browser ${D}/${bindir}
> }
>--
>1.8.3.2
>
>_______________________________________________
>meta-arago mailing list
>meta-arago@arago-project.org
>http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

