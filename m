Return-Path: <chase.maupin@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by arago-project.org (Postfix) with ESMTPS id E2738529E1
	for <meta-arago@arago-project.org>;
	Fri,  6 Jun 2014 14:09:06 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id s56E96Ei031833;
	Fri, 6 Jun 2014 09:09:06 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id s56E96MU030515;
	Fri, 6 Jun 2014 09:09:06 -0500
Received: from DLEE11.ent.ti.com ([fe80::40fa:b936:da7c:d113]) by
	DFLE73.ent.ti.com ([fe80::c9be:a3a9:7cd8:c8b3%28]) with mapi id
	14.03.0174.001; Fri, 6 Jun 2014 09:09:05 -0500
From: "Maupin, Chase" <chase.maupin@ti.com>
To: Denys Dmytriyenko <denis@denix.org>, "meta-arago@arago-project.org"
	<meta-arago@arago-project.org>
Thread-Topic: [meta-arago] [PATCH] external-linaro-toolchain: updates and
	fixes	for Linaro gcc-4.8
Thread-Index: AQHPgCn5kBpiNV3n/EibPAVB89jAqptkIWKQ
Date: Fri, 6 Jun 2014 14:09:04 +0000
Message-ID: <7D46E86EC0A8354091174257B2FED1015D097EEE@DLEE11.ent.ti.com>
References: <1401909553-14380-1-git-send-email-denis@denix.org>
In-Reply-To: <1401909553-14380-1-git-send-email-denis@denix.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.247.5.50]
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
X-List-Received-Date: Fri, 06 Jun 2014 14:09:07 -0000
Content-Language: en-US
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

ACK

>-----Original Message-----
>From: meta-arago-bounces@arago-project.org [mailto:meta-arago-
>bounces@arago-project.org] On Behalf Of Denys Dmytriyenko
>Sent: Wednesday, June 04, 2014 2:19 PM
>To: meta-arago@arago-project.org
>Subject: [meta-arago] [PATCH] external-linaro-toolchain: updates
>and fixes for Linaro gcc-4.8
>
>From: Denys Dmytriyenko <denys@ti.com>
>
>Tested with Linaro 2014.04 release.
>
>* Provide a hardfp version of ld-linux-armhf.so.3 symlink besides
>regular ld-linux.so.3
>* Update absolute ld-linux* path in libc.so script with relative
>one to work in OE sysroot
>* Avoid clashing additional scsi headers when separate linux-libc-
>headers is used
>
>Signed-off-by: Denys Dmytriyenko <denys@ti.com>
>---
> .../recipes-core/meta/external-linaro-toolchain.bbappend     | 12
>++++++++++--
> 1 file changed, 10 insertions(+), 2 deletions(-)
>
>diff --git a/meta-arago-extras/recipes-core/meta/external-linaro-
>toolchain.bbappend b/meta-arago-extras/recipes-core/meta/external-
>linaro-toolchain.bbappend
>index 34d4edd..aa7d253 100644
>--- a/meta-arago-extras/recipes-core/meta/external-linaro-
>toolchain.bbappend
>+++ b/meta-arago-extras/recipes-core/meta/external-linaro-
>toolchain.bbappend
>@@ -2,7 +2,7 @@ INSANE_SKIP_libstdc++-dev +=3D "staticdev"
>
> ALLOW_EMPTY_${PN}-utils =3D "1"
>
>-PR_append =3D "-arago5"
>+PR_append =3D "-arago6"
>
> PROVIDES :=3D "${@oe_filter_out('virtual/linux-libc-headers',
>'${PROVIDES}', d)}"
> PROVIDES :=3D "${@oe_filter_out('linux-libc-headers',
>'${PROVIDES}', d)}"
>@@ -98,8 +98,16 @@ do_install_append() {
> 	install -d ${D}/include
> 	cp -a ${TOOLCHAIN_PATH}/${ELT_TARGET_SYS}/include/*
>${D}/include
>
>+	ln -sf ld-${ELT_VER_LIBC}.so ${D}${base_libdir}/ld-linux-
>armhf.so.3
>+	if [ -f ${D}${libdir}/libc.so ];then
>+		sed -i -e "s# /lib/ld-linux# ../../lib/ld-linux#g"
>${D}${libdir}/libc.so
>+	fi
>+	if [ -f ${D}${base_libdir}/libc.so ];then
>+		sed -i -e "s# /lib/ld-linux# ../../lib/ld-linux#g"
>${D}${base_libdir}/libc.so
>+	fi
>+
> 	${@base_conditional('PREFERRED_PROVIDER_linux-libc-headers',
>'external-linaro-toolchain', '', 'rm -rf ${D}${includedir}/asm*;
>rm -rf ${D}${includedir}/drm; rm -rf ${D}${includedir}/linux; rm -
>rf ${D}${includedir}/mtd; rm -rf ${D}${includedir}/rdma; rm -rf
>${D}${includedir}/sound; rm -rf ${D}${includedir}/video', d)}
>-	${@base_conditional('PREFERRED_PROVIDER_linux-libc-headers',
>'external-linaro-toolchain', '', 'rm -rf
>${D}${includedir}/scsi/.install; rm -rf
>${D}${includedir}/scsi/scsi_netlink*; rm -rf
>${D}${includedir}/scsi/scsi_bsg*; rm -rf ${D}${includedir}/xen',
>d)}
>+	${@base_conditional('PREFERRED_PROVIDER_linux-libc-headers',
>'external-linaro-toolchain', '', 'rm -rf
>${D}${includedir}/scsi/.install; rm -rf
>${D}${includedir}/scsi/scsi_netlink*; rm -rf
>${D}${includedir}/scsi/scsi_bsg*; rm -rf
>${D}${includedir}/scsi/fc; rm -rf ${D}${includedir}/xen', d)}
>
> 	rm -rf ${D}/lib/libgfortran*
> 	rm -rf ${D}/lib/ldscripts
>--
>2.0.0
>
>_______________________________________________
>meta-arago mailing list
>meta-arago@arago-project.org
>http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

