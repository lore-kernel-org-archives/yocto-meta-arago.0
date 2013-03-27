Return-Path: <eyalr@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by arago-project.org (Postfix) with ESMTPS id 3623C52991
	for <meta-arago@arago-project.org>;
	Wed, 27 Mar 2013 07:53:29 +0000 (UTC)
Received: from dlelxv30.itg.ti.com ([172.17.2.17])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id r2R7rQlY015120
	for <meta-arago@arago-project.org>; Wed, 27 Mar 2013 02:53:26 -0500
Received: from DNCE70.ent.ti.com (dnce70.ent.ti.com [137.167.131.19])
	by dlelxv30.itg.ti.com (8.13.8/8.13.8) with ESMTP id r2R7rPfr032378
	for <meta-arago@arago-project.org>; Wed, 27 Mar 2013 02:53:26 -0500
Received: from DNCE04.ent.ti.com ([fe80::1df0:dc7c:d06:77a3]) by
	DNCE70.ent.ti.com ([fe80::70c9:b447:24a2:dddc%30]) with mapi id
	14.01.0323.003; Wed, 27 Mar 2013 08:53:25 +0100
From: "Reizer, Eyal" <eyalr@ti.com>
To: "Dmytriyenko, Denys" <denys@ti.com>
Thread-Topic: [meta-arago] [PATCHv3 2/9] wl18xx-firmware: install Wilink8
	wlan firmware files
Thread-Index: AQHOJU2Q2BArNs6KHESHXrzNhjXR8pi4SMuAgADsmAA=
Date: Wed, 27 Mar 2013 07:53:24 +0000
Message-ID: <8665E2433BC68541A24DFFCA87B70F5B17C5D70E@DNCE04.ent.ti.com>
References: <1363771816-4022-2-git-send-email-eyalr@ti.com>
	<20130326184527.GA22032@denix.org>
In-Reply-To: <20130326184527.GA22032@denix.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [137.167.131.83]
x-exclaimer-md-config: f9c360f5-3d1e-4c3c-8703-f45bf52eff6b
MIME-Version: 1.0
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Subject: Re: [PATCHv3 2/9] wl18xx-firmware: install Wilink8 wlan firmware files
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
X-List-Received-Date: Wed, 27 Mar 2013 07:53:33 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi,


> -----Original Message-----
> From: Dmytriyenko, Denys
> Sent: Tuesday, March 26, 2013 8:45 PM
> To: Reizer, Eyal
> Cc: meta-arago@arago-project.org
> Subject: Re: [meta-arago] [PATCHv3 2/9] wl18xx-firmware: install
> Wilink8 wlan firmware files
>=20
> On Wed, Mar 20, 2013 at 11:30:09AM +0200, Eyal Reizer wrote:
> > Add a recipe for installing the Wilink8 wlan firmware files into the
> > target file system.
> >
> > This package replace the wilink6 package which is provided by the
> > wl12xx-firmware recipe. Selection between the two is done using a
> > "WILINK_VERSION" switch added to arago.conf
>=20
> I have 2 questions:
>=20
> 1. I seem to be missing the first patch in this series - 1/9 never made

I do see patch 1/9 in the following link:
http://arago-project.org/pipermail/meta-arago/2013-March/001004.html


> it 2. Is this set depending on Franklin's big set of 17 patches?
=20
>=20
> > Changes in v2:
> > * Use an actual release name in the recipe name instead of _git
> > * Add RPROVIDES, RREPLACES, RCONFLICTS as this recipe completely
> >   replace the wilink6 one.
> >
> > Changes in v3:
> > * Add _${PN} to all runtime variables
> >
> > Signed-off-by: Eyal Reizer <eyalr@ti.com>
> > ---
> >  .../wl18xx-firmware/wl18xx-firmware/Makefile       |    7 +++++
> >  .../wl18xx-firmware/wl18xx-firmware_r8.a6.01.bb    |   30
> ++++++++++++++++++++
> >  2 files changed, 37 insertions(+)
> >  create mode 100644
> > meta-arago-extras/recipes-bsp/wl18xx-firmware/wl18xx-
> firmware/Makefile
> >  create mode 100644
> > meta-arago-extras/recipes-bsp/wl18xx-firmware/wl18xx-
> firmware_r8.a6.01
> > .bb
> >
> > diff --git
> > a/meta-arago-extras/recipes-bsp/wl18xx-firmware/wl18xx-
> firmware/Makefi
> > le
> > b/meta-arago-extras/recipes-bsp/wl18xx-firmware/wl18xx-
> firmware/Makefi
> > le
> > new file mode 100644
> > index 0000000..0bb7ab8
> > --- /dev/null
> > +++ b/meta-arago-extras/recipes-bsp/wl18xx-firmware/wl18xx-
> firmware/Ma
> > +++ kefile
> > @@ -0,0 +1,7 @@
> > +# Installs the the ti-connectiviy wlan firmware files into the root
> > +file system
> > +
> > +install:
> > +	install -d  $(DEST_DIR)/lib/firmware/ti-connectivity
> > +	cp -RpP * $(DEST_DIR)/lib/firmware/ti-connectivity/
> > +	rm -f $(DEST_DIR)/lib/firmware/ti-connectivity/Makefile
> > +
> > diff --git
> > a/meta-arago-extras/recipes-bsp/wl18xx-firmware/wl18xx-
> firmware_r8.a6.
> > 01.bb
> > b/meta-arago-extras/recipes-bsp/wl18xx-firmware/wl18xx-
> firmware_r8.a6.
> > 01.bb
> > new file mode 100644
> > index 0000000..fd463cc
> > --- /dev/null
> > +++ b/meta-arago-extras/recipes-bsp/wl18xx-firmware/wl18xx-
> firmware_r8
> > +++ .a6.01.bb
> > @@ -0,0 +1,30 @@
> > +DESCRIPTION =3D "Firmware files for use with TI wl18xx"
> > +LICENSE =3D "TI-TSPA"
> > +LIC_FILES_CHKSUM =3D
> "file://LICENCE;md5=3Db28122fd6678e89fd3a8d4bc80922969"
> > +
> > +PACKAGE_ARCH =3D "all"
> > +
> > +PR =3D "r1+gitr${SRCREV}"
> > +
> > +PROVIDES +=3D "wl12xx-firmware"
> > +RPROVIDES_${PN} +=3D "wl12xx-firmware"
> > +RREPLACES_${PN} +=3D "wl12xx-firmware"
> > +RCONFLICTS_${PN} +=3D "wl12xx-firmware"
> > +
> > +SRCREV =3D "ol_r8.a6.01"
> > +SRC_URI =3D "git://github.com/TI-OpenLink/wl18xx_fw.git;protocol=3Dgit=
 \
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
> >

