Return-Path: <chase.maupin@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by arago-project.org (Postfix) with ESMTPS id 3C858529B1
	for <meta-arago@arago-project.org>;
	Fri, 14 Mar 2014 12:47:19 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id s2EClIAc015884
	for <meta-arago@arago-project.org>; Fri, 14 Mar 2014 07:47:18 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id s2EClHxr012903
	for <meta-arago@arago-project.org>; Fri, 14 Mar 2014 07:47:18 -0500
Received: from DLEE11.ent.ti.com ([fe80::40fa:b936:da7c:d113]) by
	DFLE72.ent.ti.com ([fe80::e5e2:bab6:34dc:a483%28]) with mapi id
	14.03.0174.001; Fri, 14 Mar 2014 07:47:17 -0500
From: "Maupin, Chase" <chase.maupin@ti.com>
To: "Nelson, Sam" <sam.nelson@ti.com>, "meta-arago@arago-project.org"
	<meta-arago@arago-project.org>
Thread-Topic: [meta-arago] [PATCH v3 1/2] lksctp-tools: Add recipe for
	lksctp	tools
Thread-Index: AQHPNz6v/rVRJAU+dESDsFBFEdfF5Jrgl7dw
Date: Fri, 14 Mar 2014 12:47:17 +0000
Message-ID: <7D46E86EC0A8354091174257B2FED1015CF27F1B@DLEE11.ent.ti.com>
References: <1393892044-17112-1-git-send-email-sam.nelson@ti.com>
In-Reply-To: <1393892044-17112-1-git-send-email-sam.nelson@ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.247.5.50]
MIME-Version: 1.0
Subject: Re: [PATCH v3 1/2] lksctp-tools: Add recipe for lksctp	tools
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
X-List-Received-Date: Fri, 14 Mar 2014 12:47:19 -0000
Content-Language: en-US
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

>-----Original Message-----
>From: meta-arago-bounces@arago-project.org [mailto:meta-arago-
>bounces@arago-project.org] On Behalf Of Nelson, Sam
>Sent: Monday, March 03, 2014 6:14 PM
>To: meta-arago@arago-project.org
>Subject: [meta-arago] [PATCH v3 1/2] lksctp-tools: Add recipe for
>lksctp tools
>
>- Copied as is from meta-arago-extras/recipes-bsp/lksctp-
>tools/lksctp-tools_1.0.7.bb
>- With intention to fix issues to make it work.

This is not clear enough.  For one thing you mention copying as is from the=
 same location that you are adding it to so I'm unclear on that.  Second, w=
hat issues are being fixed, etc?  You have a v3 on this but there is no his=
tory of the revisions and what has changed in between.

Further comments below.

>
>Signed-off-by: Sam Nelson <sam.nelson@ti.com>
>---
> .../recipes-bsp/lksctp-tools/lksctp-tools.inc      |   47
>++++++++++++++++++++
> .../recipes-bsp/lksctp-tools/lksctp-tools_1.0.7.bb |    8 ++++
> 2 files changed, 55 insertions(+)
> create mode 100644 meta-arago-extras/recipes-bsp/lksctp-
>tools/lksctp-tools.inc
> create mode 100755 meta-arago-extras/recipes-bsp/lksctp-
>tools/lksctp-tools_1.0.7.bb
>
>diff --git a/meta-arago-extras/recipes-bsp/lksctp-tools/lksctp-
>tools.inc b/meta-arago-extras/recipes-bsp/lksctp-tools/lksctp-
>tools.inc
>new file mode 100644
>index 0000000..8a66dc9
>--- /dev/null
>+++ b/meta-arago-extras/recipes-bsp/lksctp-tools/lksctp-tools.inc
>@@ -0,0 +1,47 @@
>+DESCRIPTION =3D "The Linux Kernel Stream Control Transmission
>Protocol (lksctp) project"
>+SECTION =3D "libs"
>+PRIORITY =3D "optional"
>+LICENSE =3D "LGPLv2"
>+
>+S =3D "${WORKDIR}/${BPN}-${PV}"
>+
>+INC_PR =3D "r1"
>+
>+BBCLASSEXTEND =3D "native"
>+
>+inherit autotools pkgconfig binconfig
>+
>+do_install_append_virtclass-native() {
>+	:
>+}

I find this confusing.  You are appending a do nothing to a function?

>+
>+RREPLACES =3D "lksctp"
>+
>+LEAD_SONAME =3D "libsctp.so"
>+
>+PACKAGES =3D+ "${PN}-withsctp ${PN}-utils"
>+
>+FILES_${PN} =3D "${libexecdir}/* ${libdir}/lib*${SOLIBS} \
>+            ${sysconfdir} ${sharedstatedir} ${localstatedir} \
>+            ${base_libdir}/*${SOLIBS}"
>+
>+FILES_${PN}-withsctp =3D " \
>+  ${libdir}/lksctp-tools/lib*"
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
>+  ${datadir}/lksctp-tools/sctp_darn.h"
>+
>+FILES_${PN}-utils =3D " \
>+  ${bindir}/sctp_test \
>+  ${bindir}/sctp_darn \
>+  ${bindir}/checksctp \
>+  ${bindir}/withsctp"
>+
>diff --git a/meta-arago-extras/recipes-bsp/lksctp-tools/lksctp-
>tools_1.0.7.bb b/meta-arago-extras/recipes-bsp/lksctp-
>tools/lksctp-tools_1.0.7.bb
>new file mode 100755
>index 0000000..000bc31
>--- /dev/null
>+++ b/meta-arago-extras/recipes-bsp/lksctp-tools/lksctp-
>tools_1.0.7.bb
>@@ -0,0 +1,8 @@
>+require lksctp-tools.inc
>+PR =3D "${INC_PR}.0"
>+
>+SRC_URI =3D "${SOURCEFORGE_MIRROR}/lksctp/lksctp-tools-
>${PV}.tar.gz"
>+
>+SRC_URI[md5sum] =3D "047562b40537eb3be5d5ec3ae0a2198b"
>+SRC_URI[sha256sum] =3D
>"e920e89d110cff9847f1d86a1d7a23a156a8abcc9e65a35655d687fd08377595"
>+
>--
>1.7.9.5
>
>_______________________________________________
>meta-arago mailing list
>meta-arago@arago-project.org
>http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

