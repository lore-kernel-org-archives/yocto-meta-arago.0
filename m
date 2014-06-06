Return-Path: <fcooper@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id 85D0352A1E
	for <meta-arago@arago-project.org>;
	Fri,  6 Jun 2014 14:25:21 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id s56EPKDZ010125;
	Fri, 6 Jun 2014 09:25:20 -0500
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id s56EPKT2012302;
	Fri, 6 Jun 2014 09:25:20 -0500
Received: from DFLE08.ent.ti.com ([fe80::187f:8c86:2b7:ef9f]) by
	DLEE71.ent.ti.com ([fe80::4dce:5c82:1ad0:d462%28]) with mapi id
	14.03.0174.001; Fri, 6 Jun 2014 09:25:20 -0500
From: "Cooper Jr., Franklin" <fcooper@ti.com>
To: "Maupin, Chase" <chase.maupin@ti.com>, Denys Dmytriyenko <denis@denix.org>,
	"meta-arago@arago-project.org" <meta-arago@arago-project.org>
Thread-Topic: [meta-arago] [PATCH] external-linaro-toolchain: updates and
	fixes	for Linaro gcc-4.8
Thread-Index: AQHPgCn5z85ftYdxskuCM/odc8SS6JtkdTwA//+wrsA=
Date: Fri, 6 Jun 2014 14:25:19 +0000
Message-ID: <8F29D6B095ED194EA1980491A5E029710C6C6667@DFLE08.ent.ti.com>
References: <1401909553-14380-1-git-send-email-denis@denix.org>
	<7D46E86EC0A8354091174257B2FED1015D097EEE@DLEE11.ent.ti.com>
In-Reply-To: <7D46E86EC0A8354091174257B2FED1015D097EEE@DLEE11.ent.ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [157.170.170.90]
MIME-Version: 1.0
Subject: Re: [PATCH] external-linaro-toolchain: updates and fixes	for Linaro gcc-4.8
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
X-List-Received-Date: Fri, 06 Jun 2014 14:25:21 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Acked-by: Franklin Cooper Jr. <fcooper@ti.com>

> -----Original Message-----
> From: meta-arago-bounces@arago-project.org [mailto:meta-arago-
> bounces@arago-project.org] On Behalf Of Maupin, Chase
> Sent: Friday, June 06, 2014 9:09 AM
> To: Denys Dmytriyenko; meta-arago@arago-project.org
> Subject: Re: [meta-arago] [PATCH] external-linaro-toolchain: updates and =
fixes
> for Linaro gcc-4.8
>=20
> ACK
>=20
> >-----Original Message-----
> >From: meta-arago-bounces@arago-project.org [mailto:meta-arago-
> >bounces@arago-project.org] On Behalf Of Denys Dmytriyenko
> >Sent: Wednesday, June 04, 2014 2:19 PM
> >To: meta-arago@arago-project.org
> >Subject: [meta-arago] [PATCH] external-linaro-toolchain: updates and
> >fixes for Linaro gcc-4.8
> >
> >From: Denys Dmytriyenko <denys@ti.com>
> >
> >Tested with Linaro 2014.04 release.
> >
> >* Provide a hardfp version of ld-linux-armhf.so.3 symlink besides
> >regular ld-linux.so.3
> >* Update absolute ld-linux* path in libc.so script with relative one to
> >work in OE sysroot
> >* Avoid clashing additional scsi headers when separate linux-libc-
> >headers is used
> >
> >Signed-off-by: Denys Dmytriyenko <denys@ti.com>
> >---
> > .../recipes-core/meta/external-linaro-toolchain.bbappend     | 12
> >++++++++++--
> > 1 file changed, 10 insertions(+), 2 deletions(-)
> >
> >diff --git a/meta-arago-extras/recipes-core/meta/external-linaro-
> >toolchain.bbappend b/meta-arago-extras/recipes-core/meta/external-
> >linaro-toolchain.bbappend
> >index 34d4edd..aa7d253 100644
> >--- a/meta-arago-extras/recipes-core/meta/external-linaro-
> >toolchain.bbappend
> >+++ b/meta-arago-extras/recipes-core/meta/external-linaro-
> >toolchain.bbappend
> >@@ -2,7 +2,7 @@ INSANE_SKIP_libstdc++-dev +=3D "staticdev"
> >
> > ALLOW_EMPTY_${PN}-utils =3D "1"
> >
> >-PR_append =3D "-arago5"
> >+PR_append =3D "-arago6"
> >
> > PROVIDES :=3D "${@oe_filter_out('virtual/linux-libc-headers',
> >'${PROVIDES}', d)}"
> > PROVIDES :=3D "${@oe_filter_out('linux-libc-headers',
> >'${PROVIDES}', d)}"
> >@@ -98,8 +98,16 @@ do_install_append() {
> > 	install -d ${D}/include
> > 	cp -a ${TOOLCHAIN_PATH}/${ELT_TARGET_SYS}/include/*
> >${D}/include
> >
> >+	ln -sf ld-${ELT_VER_LIBC}.so ${D}${base_libdir}/ld-linux-
> >armhf.so.3
> >+	if [ -f ${D}${libdir}/libc.so ];then
> >+		sed -i -e "s# /lib/ld-linux# ../../lib/ld-linux#g"
> >${D}${libdir}/libc.so
> >+	fi
> >+	if [ -f ${D}${base_libdir}/libc.so ];then
> >+		sed -i -e "s# /lib/ld-linux# ../../lib/ld-linux#g"
> >${D}${base_libdir}/libc.so
> >+	fi
> >+
> > 	${@base_conditional('PREFERRED_PROVIDER_linux-libc-headers',
> >'external-linaro-toolchain', '', 'rm -rf ${D}${includedir}/asm*; rm -rf
> >${D}${includedir}/drm; rm -rf ${D}${includedir}/linux; rm - rf
> >${D}${includedir}/mtd; rm -rf ${D}${includedir}/rdma; rm -rf
> >${D}${includedir}/sound; rm -rf ${D}${includedir}/video', d)}
> >-	${@base_conditional('PREFERRED_PROVIDER_linux-libc-headers',
> >'external-linaro-toolchain', '', 'rm -rf
> >${D}${includedir}/scsi/.install; rm -rf
> >${D}${includedir}/scsi/scsi_netlink*; rm -rf
> >${D}${includedir}/scsi/scsi_bsg*; rm -rf ${D}${includedir}/xen', d)}
> >+	${@base_conditional('PREFERRED_PROVIDER_linux-libc-headers',
> >'external-linaro-toolchain', '', 'rm -rf
> >${D}${includedir}/scsi/.install; rm -rf
> >${D}${includedir}/scsi/scsi_netlink*; rm -rf
> >${D}${includedir}/scsi/scsi_bsg*; rm -rf ${D}${includedir}/scsi/fc; rm
> >-rf ${D}${includedir}/xen', d)}
> >
> > 	rm -rf ${D}/lib/libgfortran*
> > 	rm -rf ${D}/lib/ldscripts
> >--
> >2.0.0
> >
> >_______________________________________________
> >meta-arago mailing list
> >meta-arago@arago-project.org
> >http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

