Return-Path: <sam.nelson@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id BC9A452A7D
	for <meta-arago@arago-project.org>;
	Tue,  3 Nov 2015 19:37:13 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id tA3JbCMP026065
	for <meta-arago@arago-project.org>; Tue, 3 Nov 2015 13:37:13 -0600
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id tA3JbCnQ004112
	for <meta-arago@arago-project.org>; Tue, 3 Nov 2015 13:37:12 -0600
Received: from DLEE11.ent.ti.com ([fe80::40fa:b936:da7c:d113]) by
	DLEE71.ent.ti.com ([fe80::4dce:5c82:1ad0:d462%28]) with mapi id
	14.03.0224.002; Tue, 3 Nov 2015 13:37:12 -0600
From: "Nelson, Sam" <sam.nelson@ti.com>
To: "Stiffler, Jacob" <j-stiffler@ti.com>, "meta-arago@arago-project.org"
	<meta-arago@arago-project.org>
Thread-Topic: [meta-arago] [PATCH] strongswan: Add back config patch for
	pkcs11 in 5.2.1 format
Thread-Index: AQHRDeHNxkCdDgmbUUKsIr/qOCtW+Z6KvQ+AgAAEHGA=
Date: Tue, 3 Nov 2015 19:37:12 +0000
Message-ID: <4F9216F96E5DF9428610502835A9F49058253C62@DLEE11.ent.ti.com>
References: <1445639140-9135-1-git-send-email-sam.nelson@ti.com>
	<5638B421.5040603@ti.com>
In-Reply-To: <5638B421.5040603@ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [157.170.170.90]
MIME-Version: 1.0
Subject: Re: [PATCH] strongswan: Add back config patch for pkcs11 in 5.2.1 format
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
X-List-Received-Date: Tue, 03 Nov 2015 19:37:14 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable


> -----Original Message-----
> From: Stiffler, Jacob
> Sent: Tuesday, November 03, 2015 8:18 AM
> To: Nelson, Sam; meta-arago@arago-project.org
> Subject: Re: [meta-arago] [PATCH] strongswan: Add back config patch for
> pkcs11 in 5.2.1 format
>=20
>=20
>=20
> On 10/23/2015 6:25 PM, Sam Nelson wrote:
> > - 5.2.1 version of strongswan expects config in changed format.
> >    This patch adds the pkcs11_plugin.conf file to adapt to that.
> >
> > Signed-off-by: Sam Nelson <sam.nelson@ti.com>
> > ---
> >   .../strongswan/files/pkcs11_plugin.conf            |   15 +++++++++++=
++++
> >   .../strongswan/files/strongswan_libsecstore.patch  |   16 -----------=
-----
> >   .../strongswan/strongswan_%.bbappend               |    4 ++--
> >   3 files changed, 17 insertions(+), 18 deletions(-)
> >   create mode 100644 meta-arago-distro/recipes-
> support/strongswan/files/pkcs11_plugin.conf
> >   delete mode 100644
> > meta-arago-distro/recipes-support/strongswan/files/strongswan_libsecst
> > ore.patch
> >
> > diff --git
> > a/meta-arago-distro/recipes-support/strongswan/files/pkcs11_plugin.con
> > f
> > b/meta-arago-distro/recipes-support/strongswan/files/pkcs11_plugin.con
> > f
> > new file mode 100644
> > index 0000000..6d8c1cb
> > --- /dev/null
> > +++ b/meta-arago-distro/recipes-support/strongswan/files/pkcs11_plugin
> > +++ .conf
> > @@ -0,0 +1,15 @@
> > +# strongswan.conf - strongSwan configuration file libstrongswan {
> > +
> > +	#  set to no, the DH exponent size is optimized
> > +	#  dh_exponent_ansi_x9_42 =3D no
> > +  plugins {
> > +    pkcs11 {
> > +      modules {
> > +        secstore {
> > +          path =3D /usr/lib/softhsm/libsecstore.so.1
> > +        }
> > +      }
> > +    }
> > +  }
> > +}
> > diff --git
> > a/meta-arago-distro/recipes-support/strongswan/files/strongswan_libsec
> > store.patch
> > b/meta-arago-distro/recipes-support/strongswan/files/strongswan_libsec
> > store.patch
> > deleted file mode 100644
> > index c16b05e..0000000
> > ---
> > a/meta-arago-distro/recipes-support/strongswan/files/strongswan_libsec
> > store.patch
> > +++ /dev/null
> > @@ -1,16 +0,0 @@
> > ---- strongswan-5.0.0/src/strongswan.conf	2010-10-22
> 10:33:30.000000000 -0400
> > -+++ strongswan-5.0.0.libsecstore/src/strongswan.conf	2014-04-03
> 18:31:17.228569896 -0400
> > -@@ -31,4 +31,13 @@
> > -
> > - 	#  set to no, the DH exponent size is optimized
> > - 	#  dh_exponent_ansi_x9_42 =3D no
> > -+  plugins {
> > -+    pkcs11 {
> > -+      modules {
> > -+        secstore {
> > -+          path =3D /usr/lib/softhsm/libsecstore.so.1
> > -+        }
> > -+      }
> > -+    }
> > -+  }
> > - }
> > diff --git
> > a/meta-arago-distro/recipes-
> support/strongswan/strongswan_%.bbappend
> > b/meta-arago-distro/recipes-
> support/strongswan/strongswan_%.bbappend
> > index f065a63..74829e7 100644
> > ---
> > a/meta-arago-distro/recipes-
> support/strongswan/strongswan_%.bbappend
> > +++ b/meta-arago-distro/recipes-
> support/strongswan/strongswan_%.bbappe
> > +++ nd
> > @@ -1,4 +1,4 @@
> > -PR_append =3D "-arago1"
> > +PR_append =3D "-arago2"
> >   FILESEXTRAPATHS_prepend :=3D "${THISDIR}/files:"
> >
> >   DEPENDS_remove =3D "gmp"
> > @@ -11,4 +11,4 @@ EXTRA_OECONF +=3D "--disable-gmp \
> >           --disable-tools \
> >   "
> >
> > -#SRC_URI +=3D "file://strongswan_libsecstore.patch"
> > +SRC_URI +=3D "file://pkcs11_plugin.conf"
>=20
> How is this file being installed?
Need to add install script. I have sent update to add this.
>=20
> Do you know if it is compatible with strongswan 5.3.1?
I am not sure if it is compatible.
>=20
> - Jake


