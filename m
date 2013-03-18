Return-Path: <eyalr@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by arago-project.org (Postfix) with ESMTPS id 18B8C52961
	for <meta-arago@arago-project.org>;
	Mon, 18 Mar 2013 15:41:46 +0000 (UTC)
Received: from dlelxv30.itg.ti.com ([172.17.2.17])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id r2IFfkiQ021070;
	Mon, 18 Mar 2013 10:41:46 -0500
Received: from DNCE71.ent.ti.com (dnce71.ent.ti.com [137.167.131.20])
	by dlelxv30.itg.ti.com (8.13.8/8.13.8) with ESMTP id r2IFfjBW001641;
	Mon, 18 Mar 2013 10:41:46 -0500
Received: from DNCE04.ent.ti.com ([fe80::1df0:dc7c:d06:77a3]) by
	DNCE71.ent.ti.com ([fe80::3dd1:4b04:86e6:bfd0%29]) with mapi id
	14.01.0323.003; Mon, 18 Mar 2013 16:41:45 +0100
From: "Reizer, Eyal" <eyalr@ti.com>
To: "Maupin, Chase" <chase.maupin@ti.com>, Eyal Reizer <eyalreizer@gmail.com>, 
	"meta-arago@arago-project.org" <meta-arago@arago-project.org>
Thread-Topic: [meta-arago] [PATCH 2/9] wl18xx-firmware: install Wilink8	wlan
	firmware files
Thread-Index: AQHOI+4s9wkASQsw50uB408j9Bsa8pirlLoQ
Date: Mon, 18 Mar 2013 15:41:44 +0000
Message-ID: <8665E2433BC68541A24DFFCA87B70F5B17C504D9@DNCE04.ent.ti.com>
References: <1363613762-6537-1-git-send-email-eyalr@ti.com>
	<1363613762-6537-2-git-send-email-eyalr@ti.com>
	<7D46E86EC0A8354091174257B2FED10159480CD2@DLEE11.ent.ti.com>
In-Reply-To: <7D46E86EC0A8354091174257B2FED10159480CD2@DLEE11.ent.ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [137.167.131.83]
x-exclaimer-md-config: f9c360f5-3d1e-4c3c-8703-f45bf52eff6b
MIME-Version: 1.0
Subject: Re: [PATCH 2/9] wl18xx-firmware: install Wilink8	wlan	firmware files
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
X-List-Received-Date: Mon, 18 Mar 2013 15:41:47 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi,

Comments inline,

> -----Original Message-----
> From: meta-arago-bounces@arago-project.org [mailto:meta-arago-
> bounces@arago-project.org] On Behalf Of Maupin, Chase
> Sent: Monday, March 18, 2013 5:35 PM
> To: Eyal Reizer; meta-arago@arago-project.org
> Subject: Re: [meta-arago] [PATCH 2/9] wl18xx-firmware: install Wilink8
> wlan firmware files
>=20
> > -----Original Message-----
> > From: meta-arago-bounces@arago-project.org [mailto:meta-arago-
> > bounces@arago-project.org] On Behalf Of Eyal Reizer
> > Sent: Monday, March 18, 2013 8:36 AM
> > To: meta-arago@arago-project.org
> > Subject: [meta-arago] [PATCH 2/9] wl18xx-firmware: install
> > Wilink8 wlan firmware files
> >
> > Add a recipe for installing the Wilink8 wlan firmware files into the
> > target file system.
> >
> > Signed-off-by: Eyal Reizer <eyalr@ti.com>
> > ---
> >  .../wl18xx-firmware/wl18xx-firmware/Makefile       |    7 +++++
> >  .../wl18xx-firmware/wl18xx-firmware_git.bb         |   28
> > ++++++++++++++++++++
> >  2 files changed, 35 insertions(+)
> >  create mode 100644 meta-arago-extras/recipes-bsp/wl18xx-
> > firmware/wl18xx-firmware/Makefile
> >  create mode 100644 meta-arago-extras/recipes-bsp/wl18xx-
> > firmware/wl18xx-firmware_git.bb
> >
> > diff --git a/meta-arago-extras/recipes-bsp/wl18xx-
> > firmware/wl18xx-firmware/Makefile b/meta-arago-extras/recipes-
> > bsp/wl18xx-firmware/wl18xx-firmware/Makefile
> > new file mode 100644
> > index 0000000..0bb7ab8
> > --- /dev/null
> > +++ b/meta-arago-extras/recipes-bsp/wl18xx-firmware/wl18xx-
> > firmware/Makefile
> > @@ -0,0 +1,7 @@
> > +# Installs the the ti-connectiviy wlan firmware files into the
> > root file system
> > +
> > +install:
> > +	install -d  $(DEST_DIR)/lib/firmware/ti-connectivity
> > +	cp -RpP * $(DEST_DIR)/lib/firmware/ti-connectivity/
> > +	rm -f $(DEST_DIR)/lib/firmware/ti-connectivity/Makefile
> > +
> > diff --git a/meta-arago-extras/recipes-bsp/wl18xx-
> > firmware/wl18xx-firmware_git.bb b/meta-arago-extras/recipes-
> > bsp/wl18xx-firmware/wl18xx-firmware_git.bb
>=20
> Same comment as Franklin had about the wlconf recipe.  Should you drop
> the _git version if you are going to be using releases with a version?
>=20

E.R: Will be fixed

> > new file mode 100644
> > index 0000000..43c40bb
> > --- /dev/null
> > +++ b/meta-arago-extras/recipes-bsp/wl18xx-firmware/wl18xx-
> > firmware_git.bb
> > @@ -0,0 +1,28 @@
> > +DESCRIPTION =3D "Firmware files for use with TI wl18xx"
> > +LICENSE =3D "TI-TSPA"
> > +LIC_FILES_CHKSUM =3D
> > "file://LICENCE;md5=3Db28122fd6678e89fd3a8d4bc80922969"
> > +
> > +PACKAGE_ARCH =3D "all"
> > +
> > +PR =3D "r1+gitr${SRCREV}"
> > +
> > +PROVIDES +=3D "wl12xx-firmware"
> > +RPROVIDES +=3D "wl12xx-firmware"
>=20
> Why does this PROVIDES and RPROVIDES wl12xx-firmware?  Shouldn't this
> be wl18xx-firmware?

E.R: This is the intention so it will actually provide the same packages as=
 the wilink6 recipe and based on the PREFFERED_PROVIDER in arago.conf it wi=
ll be picked up instead.

>=20
> Should this RCONFLICTS with wl12xx-firmware?  Or is it OK to install
> both?   Does it make sense to install both though if they cannot co-
> exist?

E.R: As there is a selection in arago.conf between them is it really needed=
?

>=20
> > +
> > +SRCREV =3D "ol_r8.a6.01"
> > +SRC_URI =3D "git://github.com/TI-
> > OpenLink/wl18xx_fw.git;protocol=3Dgit \
> > +           file://Makefile \
> > +          "
> > +
> > +S =3D "${WORKDIR}/git"
> > +
> > +do_compile() {
> > +    :
> > +}
> > +
> > +do_install() {
> > +    cp ${WORKDIR}/Makefile ${S}
> > +    oe_runmake 'DEST_DIR=3D${D}' install }
> > +
> > +FILES_${PN} =3D "/lib/firmware/ti-connectivity/*"
> > --
> > 1.7.9.5
> >
> > _______________________________________________
> > meta-arago mailing list
> > meta-arago@arago-project.org
> > http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

