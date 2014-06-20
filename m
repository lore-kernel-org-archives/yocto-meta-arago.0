Return-Path: <fcooper@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by arago-project.org (Postfix) with ESMTPS id CE88B52A0F
	for <meta-arago@arago-project.org>;
	Fri, 20 Jun 2014 20:17:42 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id s5KKHg6S030687;
	Fri, 20 Jun 2014 15:17:42 -0500
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id s5KKHg1x005560;
	Fri, 20 Jun 2014 15:17:42 -0500
Received: from DFLE08.ent.ti.com ([fe80::187f:8c86:2b7:ef9f]) by
	DLEE71.ent.ti.com ([fe80::4dce:5c82:1ad0:d462%28]) with mapi id
	14.03.0174.001; Fri, 20 Jun 2014 15:17:42 -0500
From: "Cooper Jr., Franklin" <fcooper@ti.com>
To: "Maupin, Chase" <chase.maupin@ti.com>, Denys Dmytriyenko <denis@denix.org>,
	"meta-arago@arago-project.org" <meta-arago@arago-project.org>
Thread-Topic: [meta-arago] [PATCH 09/19] recipes: update bbappends to match
	newer versions in lower layers
Thread-Index: AQHPjLEfwmgDd4oFR0i+w4IcnrMpWJt6sGSA//+/mbA=
Date: Fri, 20 Jun 2014 20:17:41 +0000
Message-ID: <8F29D6B095ED194EA1980491A5E029710C6D666F@DFLE08.ent.ti.com>
References: <1403287009-11256-1-git-send-email-denis@denix.org>
	<1403287009-11256-10-git-send-email-denis@denix.org>
	<7D46E86EC0A8354091174257B2FED1015D0D91E9@DLEE11.ent.ti.com>
In-Reply-To: <7D46E86EC0A8354091174257B2FED1015D0D91E9@DLEE11.ent.ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [157.170.170.90]
MIME-Version: 1.0
Subject: Re: [PATCH 09/19] recipes: update bbappends to match newer versions in lower layers
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
X-List-Received-Date: Fri, 20 Jun 2014 20:17:43 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Acked-by: Franklin Cooper Jr. <fcooper@ti.com>

> -----Original Message-----
> From: meta-arago-bounces@arago-project.org [mailto:meta-arago-
> bounces@arago-project.org] On Behalf Of Maupin, Chase
> Sent: Friday, June 20, 2014 2:08 PM
> To: Denys Dmytriyenko; meta-arago@arago-project.org
> Subject: Re: [meta-arago] [PATCH 09/19] recipes: update bbappends to matc=
h
> newer versions in lower layers
>=20
> Acked-by: Chase Maupin <chase.maupin@ti.com>
>=20
> >-----Original Message-----
> >From: meta-arago-bounces@arago-project.org [mailto:meta-arago-
> >bounces@arago-project.org] On Behalf Of Denys Dmytriyenko
> >Sent: Friday, June 20, 2014 12:57 PM
> >To: meta-arago@arago-project.org
> >Subject: [meta-arago] [PATCH 09/19] recipes: update bbappends to match
> >newer versions in lower layers
> >
> >From: Denys Dmytriyenko <denys@ti.com>
> >
> >Signed-off-by: Denys Dmytriyenko <denys@ti.com>
> >---
> > .../openssh/{openssh_6.2p2.bbappend =3D> openssh_6.5p1.bbappend}
> >| 0
> > .../busybox/{busybox_1.21.1.bbappend =3D> busybox_1.22.1.bbappend}
> >| 0
> > .../recipes-core/dbus/{dbus_1.6.10.bbappend =3D>
> >dbus_1.6.18.bbappend}      | 0
> > .../dropbear/{dropbear_2013.58.bbappend =3D>
> >dropbear_2014.63.bbappend}     | 0
> > .../freetype/{freetype_2.4.12.bbappend =3D>
> >freetype_2.5.2.bbappend}        | 0
> > .../libav/{libav_0.8.8.bbappend =3D> libav_0.8.9.bbappend}
> >| 0
> > .../pulseaudio/{pulseaudio_4.0.bbappend =3D>
> >pulseaudio_5.0.bbappend}       | 0
> > .../recipes-support/curl/{curl_7.32.0.bbappend =3D>
> >curl_7.35.0.bbappend}   | 0
> > .../recipes-devtools/opkg/{opkg_svn.bbappend =3D>
> >opkg_0.2.1.bbappend}      | 0
> > 9 files changed, 0 insertions(+), 0 deletions(-)  rename
> >meta-arago-distro/recipes- connectivity/openssh/{openssh_6.2p2.bbappend
> >=3D> openssh_6.5p1.bbappend} (100%)  rename meta-arago-distro/recipes-
> >core/busybox/{busybox_1.21.1.bbappend =3D> busybox_1.22.1.bbappend}
> >(100%)
> > rename meta-arago-distro/recipes-core/dbus/{dbus_1.6.10.bbappend
> >=3D> dbus_1.6.18.bbappend} (100%)
> > rename meta-arago-distro/recipes-
> >core/dropbear/{dropbear_2013.58.bbappend =3D>
> dropbear_2014.63.bbappend}
> >(100%)  rename meta-arago-distro/recipes-
> >graphics/freetype/{freetype_2.4.12.bbappend =3D> freetype_2.5.2.bbappend=
}
> >(100%)  rename meta-arago-distro/recipes-
> >multimedia/libav/{libav_0.8.8.bbappend =3D> libav_0.8.9.bbappend}
> >(100%)
> > rename meta-arago-distro/recipes-
> >multimedia/pulseaudio/{pulseaudio_4.0.bbappend =3D>
> >pulseaudio_5.0.bbappend} (100%)  rename meta-arago-distro/recipes-
> >support/curl/{curl_7.32.0.bbappend =3D> curl_7.35.0.bbappend} (100%)
> >rename meta-arago-extras/recipes-devtools/opkg/{opkg_svn.bbappend
> >=3D> opkg_0.2.1.bbappend} (100%)
> >
> >diff --git a/meta-arago-distro/recipes-
> >connectivity/openssh/openssh_6.2p2.bbappend b/meta-arago-
> >distro/recipes-connectivity/openssh/openssh_6.5p1.bbappend
> >similarity index 100%
> >rename from meta-arago-distro/recipes-
> >connectivity/openssh/openssh_6.2p2.bbappend
> >rename to meta-arago-distro/recipes-
> >connectivity/openssh/openssh_6.5p1.bbappend
> >diff --git a/meta-arago-distro/recipes-
> >core/busybox/busybox_1.21.1.bbappend b/meta-arago-distro/recipes-
> >core/busybox/busybox_1.22.1.bbappend
> >similarity index 100%
> >rename from meta-arago-distro/recipes-
> >core/busybox/busybox_1.21.1.bbappend
> >rename to meta-arago-distro/recipes-
> >core/busybox/busybox_1.22.1.bbappend
> >diff --git a/meta-arago-distro/recipes- core/dbus/dbus_1.6.10.bbappend
> >b/meta-arago-distro/recipes- core/dbus/dbus_1.6.18.bbappend similarity
> >index 100% rename from meta-arago-distro/recipes-
> >core/dbus/dbus_1.6.10.bbappend rename to
> >meta-arago-distro/recipes-core/dbus/dbus_1.6.18.bbappend
> >diff --git a/meta-arago-distro/recipes-
> >core/dropbear/dropbear_2013.58.bbappend b/meta-arago-
> >distro/recipes-core/dropbear/dropbear_2014.63.bbappend
> >similarity index 100%
> >rename from meta-arago-distro/recipes-
> >core/dropbear/dropbear_2013.58.bbappend
> >rename to meta-arago-distro/recipes-
> >core/dropbear/dropbear_2014.63.bbappend
> >diff --git a/meta-arago-distro/recipes-
> >graphics/freetype/freetype_2.4.12.bbappend b/meta-arago-
> >distro/recipes-graphics/freetype/freetype_2.5.2.bbappend
> >similarity index 100%
> >rename from meta-arago-distro/recipes-
> >graphics/freetype/freetype_2.4.12.bbappend
> >rename to meta-arago-distro/recipes-
> >graphics/freetype/freetype_2.5.2.bbappend
> >diff --git a/meta-arago-distro/recipes-
> >multimedia/libav/libav_0.8.8.bbappend b/meta-arago-distro/recipes-
> >multimedia/libav/libav_0.8.9.bbappend
> >similarity index 100%
> >rename from meta-arago-distro/recipes-
> >multimedia/libav/libav_0.8.8.bbappend
> >rename to meta-arago-distro/recipes-
> >multimedia/libav/libav_0.8.9.bbappend
> >diff --git a/meta-arago-distro/recipes-
> >multimedia/pulseaudio/pulseaudio_4.0.bbappend b/meta-arago-
> >distro/recipes-multimedia/pulseaudio/pulseaudio_5.0.bbappend
> >similarity index 100%
> >rename from meta-arago-distro/recipes-
> >multimedia/pulseaudio/pulseaudio_4.0.bbappend
> >rename to meta-arago-distro/recipes-
> >multimedia/pulseaudio/pulseaudio_5.0.bbappend
> >diff --git a/meta-arago-distro/recipes-
> >support/curl/curl_7.32.0.bbappend b/meta-arago-distro/recipes-
> >support/curl/curl_7.35.0.bbappend
> >similarity index 100%
> >rename from meta-arago-distro/recipes-
> >support/curl/curl_7.32.0.bbappend
> >rename to meta-arago-distro/recipes-
> >support/curl/curl_7.35.0.bbappend
> >diff --git a/meta-arago-extras/recipes- devtools/opkg/opkg_svn.bbappend
> >b/meta-arago-extras/recipes- devtools/opkg/opkg_0.2.1.bbappend
> >similarity index 100% rename from meta-arago-extras/recipes-
> >devtools/opkg/opkg_svn.bbappend rename to meta-arago-extras/recipes-
> >devtools/opkg/opkg_0.2.1.bbappend
> >--
> >2.0.0
> >
> >_______________________________________________
> >meta-arago mailing list
> >meta-arago@arago-project.org
> >http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

