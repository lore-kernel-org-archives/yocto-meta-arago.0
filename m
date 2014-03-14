Return-Path: <chase.maupin@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by arago-project.org (Postfix) with ESMTPS id CD118529B1
	for <meta-arago@arago-project.org>;
	Fri, 14 Mar 2014 12:51:19 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id s2ECpJtC018227
	for <meta-arago@arago-project.org>; Fri, 14 Mar 2014 07:51:19 -0500
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id s2ECpJqg015826
	for <meta-arago@arago-project.org>; Fri, 14 Mar 2014 07:51:19 -0500
Received: from DLEE11.ent.ti.com ([fe80::40fa:b936:da7c:d113]) by
	DLEE71.ent.ti.com ([fe80::4dce:5c82:1ad0:d462%28]) with mapi id
	14.03.0174.001; Fri, 14 Mar 2014 07:51:18 -0500
From: "Maupin, Chase" <chase.maupin@ti.com>
To: "Nelson, Sam" <sam.nelson@ti.com>, "meta-arago@arago-project.org"
	<meta-arago@arago-project.org>
Thread-Topic: [meta-arago] [PATCH v3 2/2] lksctp-tools: Update recipe to
	make it	work in dylan branch
Thread-Index: AQHPNz6vx+IgVRvIQUC8PzG+D6QZ1JrgmKog
Date: Fri, 14 Mar 2014 12:51:18 +0000
Message-ID: <7D46E86EC0A8354091174257B2FED1015CF27F42@DLEE11.ent.ti.com>
References: <1393892044-17112-1-git-send-email-sam.nelson@ti.com>
	<1393892044-17112-2-git-send-email-sam.nelson@ti.com>
In-Reply-To: <1393892044-17112-2-git-send-email-sam.nelson@ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.247.5.50]
MIME-Version: 1.0
Subject: Re: [PATCH v3 2/2] lksctp-tools: Update recipe to make it	work in dylan branch
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
X-List-Received-Date: Fri, 14 Mar 2014 12:51:20 -0000
Content-Language: en-US
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

>-----Original Message-----
>From: meta-arago-bounces@arago-project.org [mailto:meta-arago-
>bounces@arago-project.org] On Behalf Of Nelson, Sam
>Sent: Monday, March 03, 2014 6:14 PM
>To: meta-arago@arago-project.org
>Subject: [meta-arago] [PATCH v3 2/2] lksctp-tools: Update recipe
>to make it work in dylan branch
>
>- Combined to one recipe file
>- Fixed build issues
>
>Signed-off-by: Sam Nelson <sam.nelson@ti.com>
>---
>Changes from earlier patch
>- Produced patch as 2 patches including original files
>  as first commit.
>---
>---
> .../recipes-bsp/lksctp-tools/lksctp-tools.inc      |   47 -------
>-------------
> .../recipes-bsp/lksctp-tools/lksctp-tools_1.0.7.bb |   41
>++++++++++++++++-
> 2 files changed, 40 insertions(+), 48 deletions(-)
> delete mode 100644 meta-arago-extras/recipes-bsp/lksctp-
>tools/lksctp-tools.inc
>
>diff --git a/meta-arago-extras/recipes-bsp/lksctp-tools/lksctp-
>tools.inc b/meta-arago-extras/recipes-bsp/lksctp-tools/lksctp-
>tools.inc
>deleted file mode 100644
>index 8a66dc9..0000000
>--- a/meta-arago-extras/recipes-bsp/lksctp-tools/lksctp-tools.inc
>+++ /dev/null
>@@ -1,47 +0,0 @@
>-DESCRIPTION =3D "The Linux Kernel Stream Control Transmission
>Protocol (lksctp) project"
>-SECTION =3D "libs"
>-PRIORITY =3D "optional"
>-LICENSE =3D "LGPLv2"
>-
>-S =3D "${WORKDIR}/${BPN}-${PV}"
>-
>-INC_PR =3D "r1"
>-
>-BBCLASSEXTEND =3D "native"
>-
>-inherit autotools pkgconfig binconfig
>-
>-do_install_append_virtclass-native() {
>-	:
>-}
>-
>-RREPLACES =3D "lksctp"
>-
>-LEAD_SONAME =3D "libsctp.so"
>-
>-PACKAGES =3D+ "${PN}-withsctp ${PN}-utils"
>-
>-FILES_${PN} =3D "${libexecdir}/* ${libdir}/lib*${SOLIBS} \
>-            ${sysconfdir} ${sharedstatedir} ${localstatedir} \
>-            ${base_libdir}/*${SOLIBS}"
>-
>-FILES_${PN}-withsctp =3D " \
>-  ${libdir}/lksctp-tools/lib*"
>-
>-FILES_${PN}-dev +=3D " \
>-  ${datadir}/lksctp-tools/checksctp.c \
>-  ${datadir}/lksctp-tools/sctp_socket.c \
>-  ${datadir}/lksctp-tools/sctp_bind.c \
>-  ${datadir}/lksctp-tools/sctp_darn.c \
>-  ${datadir}/lksctp-tools/sctp_load_libs.c \
>-  ${datadir}/lksctp-tools/sctp_sockopt.c \
>-  ${datadir}/lksctp-tools/sctp_socket.h \
>-  ${datadir}/lksctp-tools/sctp_test.c \
>-  ${datadir}/lksctp-tools/sctp_darn.h"
>-
>-FILES_${PN}-utils =3D " \
>-  ${bindir}/sctp_test \
>-  ${bindir}/sctp_darn \
>-  ${bindir}/checksctp \
>-  ${bindir}/withsctp"
>-
>diff --git a/meta-arago-extras/recipes-bsp/lksctp-tools/lksctp-
>tools_1.0.7.bb b/meta-arago-extras/recipes-bsp/lksctp-
>tools/lksctp-tools_1.0.7.bb
>index 000bc31..f98ffc7 100755
>--- a/meta-arago-extras/recipes-bsp/lksctp-tools/lksctp-
>tools_1.0.7.bb
>+++ b/meta-arago-extras/recipes-bsp/lksctp-tools/lksctp-
>tools_1.0.7.bb
>@@ -1,4 +1,10 @@
>-require lksctp-tools.inc
>+DESCRIPTION =3D "The Linux Kernel Stream Control Transmission
>Protocol (lksctp) project"
>+SECTION =3D "libs"
>+PRIORITY =3D "optional"
>+LICENSE =3D "LGPLv2"
>+LIC_FILES_CHKSUM =3D
>"file://src/include/netinet/sctp.h;md5=3D8089fbe48b63b73c8d091bee750
>b2ebc"
>+
>+INC_PR =3D "r0"
> PR =3D "${INC_PR}.0"

No need for INC_PR

>
> SRC_URI =3D "${SOURCEFORGE_MIRROR}/lksctp/lksctp-tools-
>${PV}.tar.gz"
>@@ -6,3 +12,36 @@ SRC_URI =3D "${SOURCEFORGE_MIRROR}/lksctp/lksctp-
>tools-${PV}.tar.gz"
> SRC_URI[md5sum] =3D "047562b40537eb3be5d5ec3ae0a2198b"
> SRC_URI[sha256sum] =3D
>"e920e89d110cff9847f1d86a1d7a23a156a8abcc9e65a35655d687fd08377595"
>
>+S =3D "${WORKDIR}/${BPN}-${PV}"

Isn't this the default?

>+
>+BBCLASSEXTEND =3D "native"
>+
>+inherit autotools pkgconfig binconfig
>+
>+RREPLACES_${PN} =3D "lksctp"
>+
>+LEAD_SONAME =3D "libsctp.so"

Not sure this is required

>+
>+PACKAGES =3D+ "${PN}-withsctp ${PN}-utils"

You define a -withsctp package but I don't see you setting what files go in=
 that package.

>+
>+FILES_${PN} =3D "${libexecdir}/* ${libdir}/lib*${SOLIBS} \
>+            ${sysconfdir} ${sharedstatedir} ${localstatedir} \
>+            ${base_libdir}/*${SOLIBS}"
>+
>+FILES_${PN}-dev +=3D " \
>+  ${datadir}/lksctp-tools/checksctp.c \
>+  ${datadir}/lksctp-tools/sctp_socket.c \
>+  ${datadir}/lksctp-tools/sctp_bind.c \
>+  ${datadir}/lksctp-tools/sctp_darn.c \
>+  ${datadir}/lksctp-tools/sctp_load_libs.c \
>+  ${datadir}/lksctp-tools/sctp_sockopt.c \
>+  ${datadir}/lksctp-tools/sctp_socket.h \
>+  ${datadir}/lksctp-tools/sctp_test.c \
>+  ${datadir}/lksctp-tools/sctp_darn.h \
>+  ${libdir}/lksctp-tools/lib*.so"
>+
>+FILES_${PN}-utils =3D " \
>+  ${bindir}/sctp_test \
>+  ${bindir}/sctp_darn \
>+  ${bindir}/checksctp \
>+  ${bindir}/withsctp"
>--
>1.7.9.5
>
>_______________________________________________
>meta-arago mailing list
>meta-arago@arago-project.org
>http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

