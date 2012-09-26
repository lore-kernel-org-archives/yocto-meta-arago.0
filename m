Return-Path: <fcooper@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by arago-project.org (Postfix) with ESMTPS id 0D55552ABE
	for <meta-arago@arago-project.org>;
	Wed, 26 Sep 2012 08:04:21 +0000 (UTC)
Received: from dlelxv30.itg.ti.com ([172.17.2.17])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id q8Q84KQc030417;
	Wed, 26 Sep 2012 03:04:20 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dlelxv30.itg.ti.com (8.13.8/8.13.8) with ESMTP id q8Q84KLQ006695;
	Wed, 26 Sep 2012 03:04:20 -0500
Received: from DFLE09.ent.ti.com ([fe80::3103:58c3:47f:860b]) by
	DFLE73.ent.ti.com ([fe80::86e:fab6:cd95:e158%28]) with mapi id
	14.01.0323.003; Wed, 26 Sep 2012 03:04:20 -0500
From: "Cooper Jr., Franklin" <fcooper@ti.com>
To: "Dmytriyenko, Denys" <denys@ti.com>
Thread-Topic: [meta-arago] [PATCH] dt: Port dt recipe
Thread-Index: AQHNmzBY+30PvKgoPUOSRDfzTS7WhJecSeYA///6yJk=
Date: Wed, 26 Sep 2012 08:04:19 +0000
Message-ID: <E62AEE2A-08C6-46A2-87E4-39467C8D5469@ti.com>
References: <1348587502-25473-1-git-send-email-fcooper@ti.com>,
	<20120926032300.GC8181@denix.org>
In-Reply-To: <20120926032300.GC8181@denix.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
MIME-Version: 1.0
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Subject: Re: [PATCH] dt: Port dt recipe
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
X-List-Received-Date: Wed, 26 Sep 2012 08:04:25 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Wrong commit message. Ported from oe-classic not oe-core. Will resend an up=
dated patch.

On Sep 25, 2012, at 11:23 PM, "Dmytriyenko, Denys" <denys@ti.com> wrote:

> On Tue, Sep 25, 2012 at 10:38:22AM -0500, Franklin S. Cooper Jr wrote:
>> * Port dt recipe from oe-core
>=20
> Why is this ported from oe-core? Can you bbappend it instead?
>=20
>=20
>> Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
>> ---
>> .../recipes-devtools/dt/dt/no_aio.patch            |   17 +++++++++++
>> meta-arago-extras/recipes-devtools/dt/dt_17.07.bb  |   30 ++++++++++++++=
++++++
>> 2 files changed, 47 insertions(+), 0 deletions(-)
>> create mode 100644 meta-arago-extras/recipes-devtools/dt/dt/no_aio.patch
>> create mode 100644 meta-arago-extras/recipes-devtools/dt/dt_17.07.bb
>>=20
>> diff --git a/meta-arago-extras/recipes-devtools/dt/dt/no_aio.patch b/met=
a-arago-extras/recipes-devtools/dt/dt/no_aio.patch
>> new file mode 100644
>> index 0000000..8253e86
>> --- /dev/null
>> +++ b/meta-arago-extras/recipes-devtools/dt/dt/no_aio.patch
>> @@ -0,0 +1,17 @@
>> +---
>> + Makefile.linux |    2 +-
>> + 1 file changed, 1 insertion(+), 1 deletion(-)
>> +
>> +Index: dt.d-WIP/Makefile.linux
>> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>> +--- dt.d-WIP/Makefile.linux
>> ++++ dt.d-WIP/Makefile.linux
>> +@@ -68,7 +68,7 @@ LINTLIBS=3D
>> +
>> + PORG      =3D -O3
>> +
>> +-CFLAGS=3D $(PORG) -DAIO -DFIFO -DMMAP -DTTY -D__linux__ -D_GNU_SOURCE =
-D_FILE_OFFSET_BITS=3D64
>> ++CFLAGS=3D $(PORG) -DFIFO -DMMAP -DTTY -D__linux__ -D_GNU_SOURCE -D_FIL=
E_OFFSET_BITS=3D64
>> + CPP=3D    /lib/cpp
>> + CPPOPTS=3D -D__GNUC__ -DFIFO -DMMAP -D__linux__ -D_GNU_SOURCE
>> + LDFLAGS=3D
>> diff --git a/meta-arago-extras/recipes-devtools/dt/dt_17.07.bb b/meta-ar=
ago-extras/recipes-devtools/dt/dt_17.07.bb
>> new file mode 100644
>> index 0000000..22fd6ac
>> --- /dev/null
>> +++ b/meta-arago-extras/recipes-devtools/dt/dt_17.07.bb
>> @@ -0,0 +1,30 @@
>> +HOMEPAGE =3D "http://home.comcast.net/~SCSIguy/SCSI_FAQ/RMiller_Tools/d=
t.html"
>> +DESCRIPTION =3D "The Data Test Program (dt) is a generic data test prog=
ram used to verify proper \
>> +operation of peripherals, file systems, device drivers, or any data str=
eam supported by the \
>> +operating system."
>> +
>> +SECTION =3D "console/tests"
>> +
>> +LICENSE =3D "MIT"
>> +LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Dfb073c94d1f584010fc75867b686=
d6d3"
>> +
>> +INC_PR =3D "r0"
>> +
>> +SRC_URI =3D "http://home.comcast.net/~SCSIguy/SCSI_FAQ/RMiller_Tools/ft=
p/dt/dt-source.tar.gz"
>> +S =3D "${WORKDIR}/dt.d"
>> +
>> +TARGET_CC_ARCH +=3D "${LDFLAGS}"
>> +
>> +do_compile() {
>> +    ${MAKE} -f Makefile.linux
>> +}
>> +
>> +SRC_URI_append_libc-uclibc =3D " file://no_aio.patch "
>> +
>> +do_install() {
>> +    install -d ${D}${bindir}
>> +    install -m 0755 dt ${D}${bindir}
>> +}
>> +
>> +SRC_URI[md5sum] =3D "fc3373e30868698b90f02cc5fab9aabd"
>> +SRC_URI[sha256sum] =3D "6a213b8da2b8907c4f1633c3b90229085ac239e4d43aa58=
79b0123c21f951cab"
>> --=20
>> 1.7.0.4
>>=20
>> _______________________________________________
>> meta-arago mailing list
>> meta-arago@arago-project.org
>> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago
>>=20
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

