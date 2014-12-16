Return-Path: <sam.nelson@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id 5474652079
	for <meta-arago@arago-project.org>;
	Tue, 16 Dec 2014 15:40:43 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id sBGFegMn028350
	for <meta-arago@arago-project.org>; Tue, 16 Dec 2014 09:40:42 -0600
Received: from DLEE70.ent.ti.com (dlemailx.itg.ti.com [157.170.170.113])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id sBGFegq8013279
	for <meta-arago@arago-project.org>; Tue, 16 Dec 2014 09:40:42 -0600
Received: from DLEE11.ent.ti.com ([fe80::40fa:b936:da7c:d113]) by
	DLEE70.ent.ti.com ([fe80::c4c6:f618:54e7:ad11%28]) with mapi id
	14.03.0174.001; Tue, 16 Dec 2014 09:40:42 -0600
From: "Nelson, Sam" <sam.nelson@ti.com>
To: "Dmytriyenko, Denys" <denys@ti.com>
Thread-Topic: [meta-arago] [PATCH] lksctp-tools: Add new recipe for lksctp
	tools: library and utilities
Thread-Index: AQHQGJJ6KSDOE+4pmUeQ/dPAFtJdXZyRakwAgADvNRA=
Date: Tue, 16 Dec 2014 15:40:41 +0000
Message-ID: <4F9216F96E5DF9428610502835A9F490580E9455@DLEE11.ent.ti.com>
References: <1418667057-19653-1-git-send-email-sam.nelson@ti.com>
	<20141215191504.GD28600@edge>
In-Reply-To: <20141215191504.GD28600@edge>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.247.5.50]
MIME-Version: 1.0
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Subject: Re: [PATCH] lksctp-tools: Add new recipe for lksctp tools: library and utilities
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
X-List-Received-Date: Tue, 16 Dec 2014 15:40:44 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable



> -----Original Message-----
> From: Dmytriyenko, Denys
> Sent: Monday, December 15, 2014 2:15 PM
> To: Nelson, Sam
> Cc: meta-arago@arago-project.org
> Subject: Re: [meta-arago] [PATCH] lksctp-tools: Add new recipe for lksctp
> tools: library and utilities
>=20
> On Mon, Dec 15, 2014 at 01:10:57PM -0500, Sam Nelson wrote:
> > - Stream Control Transmission Protocol (SCTP) is a reliable, message-
> oriented,
> >   multihomed transport protocol. Developed by the IETF SIGTRAN working
> group
> >   to transport SS7 over IP, it is now the third general-purpose transpo=
rt
> developed
> >   by the IETF.
>=20
> Looks fine to me. Please see below for 1 small question.
>=20
>=20
> > Signed-off-by: Sam Nelson <sam.nelson@ti.com>
> > ---
> >  .../lksctp-tools/lksctp-tools_1.0.16.bb            |   44 ++++++++++++=
++++++++
> >  1 file changed, 44 insertions(+)
> >  create mode 100755 meta-arago-extras/recipes-connectivity/lksctp-
> tools/lksctp-tools_1.0.16.bb
> >
> > diff --git a/meta-arago-extras/recipes-connectivity/lksctp-tools/lksctp=
-
> tools_1.0.16.bb b/meta-arago-extras/recipes-connectivity/lksctp-
> tools/lksctp-tools_1.0.16.bb
> > new file mode 100755
> > index 0000000..3765715
> > --- /dev/null
> > +++ b/meta-arago-extras/recipes-connectivity/lksctp-tools/lksctp-
> tools_1.0.16.bb
> > @@ -0,0 +1,44 @@
> > +DESCRIPTION =3D "The Linux Kernel Stream Control Transmission Protocol
> (lksctp) project"
> > +SECTION =3D "libs"
> > +PRIORITY =3D "optional"
> > +LICENSE =3D "LGPLv2"
> > +LIC_FILES_CHKSUM =3D
> "file://COPYING;md5=3D0c56db0143f4f80c369ee3af7425af6e"
> > +
> > +PR =3D "r0"
> > +
> > +SRC_URI =3D "${SOURCEFORGE_MIRROR}/lksctp/lksctp-tools-${PV}.tar.gz"
> > +
> > +SRC_URI[md5sum] =3D "708bb0b5a6806ad6e8d13c55b067518e"
> > +SRC_URI[sha256sum] =3D
> "0903dd526b7f30a89d5031aa2c82757612becc38ed7bc6e4f972f8deae351f2
> 6"
> > +
> > +BBCLASSEXTEND =3D "native"
> > +
> > +inherit autotools pkgconfig binconfig
> > +
> > +RREPLACES_${PN} =3D "lksctp"
> > +
> > +PACKAGES =3D+ "${PN}-utils"
> > +
> > +FILES_${PN} =3D "${libexecdir}/* ${libdir}/lib*${SOLIBS} \
> > +            ${sysconfdir} ${sharedstatedir} ${localstatedir} \
> > +            ${base_libdir}/*${SOLIBS}"
> > +
> > +FILES_${PN}-dev +=3D " \
> > +  ${datadir}/lksctp-tools/checksctp.c \
> > +  ${datadir}/lksctp-tools/sctp_socket.c \
> > +  ${datadir}/lksctp-tools/sctp_bind.c \
> > +  ${datadir}/lksctp-tools/sctp_darn.c \
> > +  ${datadir}/lksctp-tools/sctp_load_libs.c \
> > +  ${datadir}/lksctp-tools/sctp_sockopt.c \
> > +  ${datadir}/lksctp-tools/sctp_socket.h \
> > +  ${datadir}/lksctp-tools/sctp_test.c \
> > +  ${datadir}/lksctp-tools/sctp_darn.h \
> > +  ${datadir}/lksctp-tools/sctp_status.c \
> > +  ${libdir}/lksctp-tools/lib*.so"
>=20
> The last line above lists all lib*.so in lksctp-tools off of libdir - are
> those real libraries and do you need to list them in the main package too=
?
>=20
[Sam] Yes they are real libraries.  Looking more into the details looks lik=
e it makes sense to include in separate package. I will send updated patch.
>=20
> > +
> > +FILES_${PN}-utils =3D " \
> > +  ${bindir}/sctp_test \
> > +  ${bindir}/sctp_darn \
> > +  ${bindir}/checksctp \
> > +  ${bindir}/withsctp \
> > +  ${bindir}/sctp_status"
> > --
> > 1.7.9.5
> >
> > _______________________________________________
> > meta-arago mailing list
> > meta-arago@arago-project.org
> > http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

