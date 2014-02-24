Return-Path: <chase.maupin@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by arago-project.org (Postfix) with ESMTPS id 173DB529C2
	for <meta-arago@arago-project.org>;
	Mon, 24 Feb 2014 16:00:30 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id s1OG0PCb028643
	for <meta-arago@arago-project.org>; Mon, 24 Feb 2014 10:00:25 -0600
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id s1OG0PLB030487
	for <meta-arago@arago-project.org>; Mon, 24 Feb 2014 10:00:25 -0600
Received: from DLEE11.ent.ti.com ([fe80::40fa:b936:da7c:d113]) by
	DFLE72.ent.ti.com ([fe80::e5e2:bab6:34dc:a483%28]) with mapi id
	14.03.0174.001; Mon, 24 Feb 2014 10:00:25 -0600
From: "Maupin, Chase" <chase.maupin@ti.com>
To: "Nelson, Sam" <sam.nelson@ti.com>, "meta-arago@arago-project.org"
	<meta-arago@arago-project.org>
Thread-Topic: [meta-arago] [PATCH v2] lksctp-tools: Add recipe for lksctp
Thread-Index: AQHPMEGAxqsTvFaNaE+1vdX0aMUpJ5rEkjRg
Date: Mon, 24 Feb 2014 16:00:25 +0000
Message-ID: <7D46E86EC0A8354091174257B2FED1015CEE95EB@DLEE11.ent.ti.com>
References: <1393123599-4661-1-git-send-email-sam.nelson@ti.com>
In-Reply-To: <1393123599-4661-1-git-send-email-sam.nelson@ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [157.170.170.90]
MIME-Version: 1.0
Subject: Re: [PATCH v2] lksctp-tools: Add recipe for lksctp
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
X-List-Received-Date: Mon, 24 Feb 2014 16:00:36 -0000
Content-Language: en-US
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

>-----Original Message-----
>From: meta-arago-bounces@arago-project.org [mailto:meta-arago-
>bounces@arago-project.org] On Behalf Of Nelson, Sam
>Sent: Saturday, February 22, 2014 8:47 PM
>To: meta-arago@arago-project.org
>Subject: [meta-arago] [PATCH v2] lksctp-tools: Add recipe for
>lksctp
>
>- The linux kernel Stream control transmission protocol
>- Original recipe by Jingting Zhou

Can you please give a more descriptive statement about where this recipe ca=
me from?  What layer for example, a URL to the original recipe.

Also, can you split this into two patches?  One that adds the original reci=
pe and one that splits out your changes so it is easier to tell what has be=
en modified on top.

>
>Signed-off-by: Sam Nelson <sam.nelson@ti.com>
>
>---
>Updated RREPLACES_${PN}
>Fix build issue with .so
>---
>---
> .../recipes-bsp/lksctp-tools/lksctp-tools_1.0.7.bb |   51
>++++++++++++++++++++
> 1 file changed, 51 insertions(+)
> create mode 100755 meta-arago-extras/recipes-bsp/lksctp-
>tools/lksctp-tools_1.0.7.bb
>
>diff --git a/meta-arago-extras/recipes-bsp/lksctp-tools/lksctp-
>tools_1.0.7.bb b/meta-arago-extras/recipes-bsp/lksctp-
>tools/lksctp-tools_1.0.7.bb
>new file mode 100755
>index 0000000..5c75552
>--- /dev/null
>+++ b/meta-arago-extras/recipes-bsp/lksctp-tools/lksctp-
>tools_1.0.7.bb
>@@ -0,0 +1,51 @@
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
>+PR =3D "${INC_PR}.0"
>+
>+SRC_URI =3D "${SOURCEFORGE_MIRROR}/lksctp/lksctp-tools-
>${PV}.tar.gz"
>+
>+SRC_URI[md5sum] =3D "047562b40537eb3be5d5ec3ae0a2198b"
>+SRC_URI[sha256sum] =3D
>"e920e89d110cff9847f1d86a1d7a23a156a8abcc9e65a35655d687fd08377595"
>+
>+S =3D "${WORKDIR}/${BPN}-${PV}"
>+
>+BBCLASSEXTEND =3D "native"
>+
>+inherit autotools pkgconfig binconfig
>+
>+do_install_append_virtclass-native() {
>+	:
>+}
>+
>+RREPLACES_${PN} =3D "lksctp"
>+
>+LEAD_SONAME =3D "libsctp.so"
>+
>+PACKAGES =3D+ "${PN}-withsctp ${PN}-utils"
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

