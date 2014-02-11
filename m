Return-Path: <chase.maupin@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by arago-project.org (Postfix) with ESMTPS id 045D15298A
	for <meta-arago@arago-project.org>;
	Tue, 11 Feb 2014 14:24:12 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id s1BEOCD3012669
	for <meta-arago@arago-project.org>; Tue, 11 Feb 2014 08:24:12 -0600
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id s1BEOC9c008915
	for <meta-arago@arago-project.org>; Tue, 11 Feb 2014 08:24:12 -0600
Received: from DLEE11.ent.ti.com ([fe80::40fa:b936:da7c:d113]) by
	DFLE73.ent.ti.com ([fe80::c9be:a3a9:7cd8:c8b3%28]) with mapi id
	14.02.0342.003; Tue, 11 Feb 2014 08:24:11 -0600
From: "Maupin, Chase" <chase.maupin@ti.com>
To: "Nelson, Sam" <sam.nelson@ti.com>, "meta-arago@arago-project.org"
	<meta-arago@arago-project.org>
Thread-Topic: [meta-arago] [PATCH] linuxptp: Add recipe for linux ptp
Thread-Index: AQHPJsgQY24F8eM8h0atnTigTMjg+ZqwG2yg
Date: Tue, 11 Feb 2014 14:24:11 +0000
Message-ID: <7D46E86EC0A8354091174257B2FED1015996092A@DLEE11.ent.ti.com>
References: <1392081879-10520-1-git-send-email-sam.nelson@ti.com>
In-Reply-To: <1392081879-10520-1-git-send-email-sam.nelson@ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.247.5.50]
MIME-Version: 1.0
Subject: Re: [PATCH] linuxptp: Add recipe for linux ptp
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
X-List-Received-Date: Tue, 11 Feb 2014 14:24:13 -0000
Content-Language: en-US
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

>-----Original Message-----
>From: meta-arago-bounces@arago-project.org [mailto:meta-arago-
>bounces@arago-project.org] On Behalf Of Nelson, Sam
>Sent: Monday, February 10, 2014 7:25 PM
>To: meta-arago@arago-project.org
>Subject: [meta-arago] [PATCH] linuxptp: Add recipe for linux ptp
>
>- linuxptp is an implementtation of precision time protocol (PTP)
>

Same question about submitting to lower layers.

>Signed-off-by: Sam Nelson <sam.nelson@ti.com>
>---
> .../recipes-bsp/linuxptp/linuxptp_1.0.bb           |   25
>++++++++++++++++++++
> 1 file changed, 25 insertions(+)
> create mode 100755 meta-arago-extras/recipes-
>bsp/linuxptp/linuxptp_1.0.bb
>
>diff --git a/meta-arago-extras/recipes-
>bsp/linuxptp/linuxptp_1.0.bb b/meta-arago-extras/recipes-
>bsp/linuxptp/linuxptp_1.0.bb
>new file mode 100755
>index 0000000..c7482aa
>--- /dev/null
>+++ b/meta-arago-extras/recipes-bsp/linuxptp/linuxptp_1.0.bb
>@@ -0,0 +1,25 @@
>+DESCRIPTION =3D "This software is an implementation of the
>Precision Time Protocol (PTP) \
>+according to IEEE standard 1588 for Linux"
>+HOMEPAGE =3D "http://linuxptp.sourceforge.net/"
>+SECTION =3D "console/network"
>+LICENSE =3D "GPLv2"
>+LIC_FILES_CHKSUM =3D
>"file://COPYING;md5=3Db234ee4d69f5fce4486a80fdaf4a4263"
>+DEPENDS +=3D "virtual/kernel"
>+PR =3D "r0"
>+
>+SRC_URI =3D "git://git.code.sf.net/p/linuxptp/code;protocol=3Dgit"
>+
>+SRCREV =3D "74e703727ec9b1c334c7bfbba9be1cabf4b7b461"
>+
>+S =3D "${WORKDIR}/git"
>+
>+inherit autotools
>+
>+STAGING_KERNEL_DIR =3D
>"${STAGING_DIR}/${MACHINE_ARCH}${TARGET_VENDOR}-${TARGET_OS}"

Isn't this already set?  Why the need to reset it?

>+EXTRA_OEMAKE =3D "KBUILD_OUTPUT=3D${STAGING_KERNEL_DIR}
>CROSS_COMPILE=3D${TARGET_PREFIX} ARCH=3D${TARGET_ARCH}"
>+
>+do_install() {
>+	install -d ${D}${bindir}/
>+	install -c -m 755 ${S}/ptp4l ${D}${bindir}/
>+}
>+
>--
>1.7.9.5
>
>_______________________________________________
>meta-arago mailing list
>meta-arago@arago-project.org
>http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

