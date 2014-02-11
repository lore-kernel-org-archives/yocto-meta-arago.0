Return-Path: <chase.maupin@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id 53C6F5298A
	for <meta-arago@arago-project.org>;
	Tue, 11 Feb 2014 14:21:01 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id s1BEL0Db010659
	for <meta-arago@arago-project.org>; Tue, 11 Feb 2014 08:21:00 -0600
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id s1BEL00h022143
	for <meta-arago@arago-project.org>; Tue, 11 Feb 2014 08:21:00 -0600
Received: from DLEE11.ent.ti.com ([fe80::40fa:b936:da7c:d113]) by
	DFLE73.ent.ti.com ([fe80::c9be:a3a9:7cd8:c8b3%28]) with mapi id
	14.02.0342.003; Tue, 11 Feb 2014 08:21:00 -0600
From: "Maupin, Chase" <chase.maupin@ti.com>
To: "Nelson, Sam" <sam.nelson@ti.com>, "meta-arago@arago-project.org"
	<meta-arago@arago-project.org>
Thread-Topic: [meta-arago] [PATCH] vtun: Add new recipe for vtun
Thread-Index: AQHPJsR5aLkx30Ycn0mbZm1ser+GbJqwGyJA
Date: Tue, 11 Feb 2014 14:20:59 +0000
Message-ID: <7D46E86EC0A8354091174257B2FED10159960856@DLEE11.ent.ti.com>
References: <1392080341-18735-1-git-send-email-sam.nelson@ti.com>
In-Reply-To: <1392080341-18735-1-git-send-email-sam.nelson@ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.247.5.50]
MIME-Version: 1.0
Subject: Re: [PATCH] vtun: Add new recipe for vtun
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
X-List-Received-Date: Tue, 11 Feb 2014 14:21:01 -0000
Content-Language: en-US
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable


>-----Original Message-----
>From: meta-arago-bounces@arago-project.org [mailto:meta-arago-
>bounces@arago-project.org] On Behalf Of Nelson, Sam
>Sent: Monday, February 10, 2014 6:59 PM
>To: meta-arago@arago-project.org
>Subject: [meta-arago] [PATCH] vtun: Add new recipe for vtun
>
>- Virtual Tunnels over TCP/IP networks with
>   traffic shaping, compression and encryption
>

Will you be sending this to oe-core or meta-openembedded as well?

>Signed-off-by: Sam Nelson <sam.nelson@ti.com>
>---
> .../recipes-connectivity/vtun/vtun_3.0.3.bb        |   25
>++++++++++++++++++++
> 1 file changed, 25 insertions(+)
> create mode 100755 meta-arago-extras/recipes-
>connectivity/vtun/vtun_3.0.3.bb
>
>diff --git a/meta-arago-extras/recipes-
>connectivity/vtun/vtun_3.0.3.bb b/meta-arago-extras/recipes-
>connectivity/vtun/vtun_3.0.3.bb
>new file mode 100755
>index 0000000..dc2f79e
>--- /dev/null
>+++ b/meta-arago-extras/recipes-connectivity/vtun/vtun_3.0.3.bb
>@@ -0,0 +1,25 @@
>+DESCRIPTION =3D "Virtual Tunnels over TCP/IP networks with traffic
>shaping, compression and encryption."
>+HOMEPAGE =3D "http://vtun.sourceforge.net/"
>+SECTION =3D "console/network"
>+PRIORITY =3D "optional"
>+LICENSE =3D "GPLv2"
>+DEPENDS =3D "zlib lzo openssl"
>+PR =3D "r0"
>+LIC_FILES_CHKSUM =3D
>"file://vtun.h;md5=3D72742635d461c045fdd3a1710f9f71be"

Are you sure you want to checksum the whole file instead of using beginline=
 and endline?

>+
>+SRC_URI =3D
>"http://downloads.sourceforge.net/project/vtun/vtun/${PV}/vtun-
>${PV}.tar.gz"
>+
>+SRC_URI[md5sum] =3D "f3becf2a0270910a841060c08d1db824"
>+SRC_URI[sha256sum] =3D
>"69dcbe4f8c5ce7d91b4150a6309e536d03b61841169746ca5788413ac7edb9cb"
>+
>+inherit autotools
>+
>+do_configure() {
>+	sed -i "s/\$BLOWFISH_HDR_DIR
>\/usr\/include\/ssl/\$BLOWFISH_HDR_DIR \/usr\/include\/ssl
>\$SSL_HDR_DIR/" configure
>+	oe_runconf --with-lzo-headers=3D${STAGING_INCDIR}/lzo --with-
>lzo-lib=3D${STAGING_LIBDIR} --with-ssl-
>headers=3D${STAGING_INCDIR}/openssl --with-ssl-lib=3D${STAGING_LIBDIR}
>+	sed '102d' Makefile > Makefile.new
>+	mv Makefile.new Makefile
>+}
>+
>+
>+
>--
>1.7.9.5
>
>_______________________________________________
>meta-arago mailing list
>meta-arago@arago-project.org
>http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

