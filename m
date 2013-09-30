Return-Path: <chase.maupin@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by arago-project.org (Postfix) with ESMTPS id D0563529EB
	for <meta-arago@arago-project.org>;
	Mon, 30 Sep 2013 19:53:47 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id r8UJrlJc011189;
	Mon, 30 Sep 2013 14:53:47 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id r8UJrkq5017949;
	Mon, 30 Sep 2013 14:53:46 -0500
Received: from DLEE11.ent.ti.com ([fe80::40fa:b936:da7c:d113]) by
	DFLE72.ent.ti.com ([fe80::e5e2:bab6:34dc:a483%28]) with mapi id
	14.02.0342.003; Mon, 30 Sep 2013 14:53:46 -0500
From: "Maupin, Chase" <chase.maupin@ti.com>
To: Denys Dmytriyenko <denis@denix.org>, "meta-arago@arago-project.org"
	<meta-arago@arago-project.org>
Thread-Topic: [meta-arago] [PATCH] external-linaro-toolchain: fix "xen"
	header conflict with linux-libc-headers
Thread-Index: AQHOvhUJcjxOOVz/ZEiZplWklR+W5ZnesU7A
Date: Mon, 30 Sep 2013 19:53:46 +0000
Message-ID: <7D46E86EC0A8354091174257B2FED1015977149B@DLEE11.ent.ti.com>
References: <1380570056-27153-1-git-send-email-denis@denix.org>
In-Reply-To: <1380570056-27153-1-git-send-email-denis@denix.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [157.170.170.90]
MIME-Version: 1.0
Subject: Re: [PATCH] external-linaro-toolchain: fix "xen" header conflict with linux-libc-headers
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
X-List-Received-Date: Mon, 30 Sep 2013 19:53:48 -0000
Content-Language: en-US
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

Acked-by: Chase Maupin <chase.maupin@ti.com>


>-----Original Message-----
>From: meta-arago-bounces@arago-project.org [mailto:meta-arago-
>bounces@arago-project.org] On Behalf Of Denys Dmytriyenko
>Sent: Monday, September 30, 2013 2:41 PM
>To: meta-arago@arago-project.org
>Subject: [meta-arago] [PATCH] external-linaro-toolchain: fix "xen"
>header conflict with linux-libc-headers
>
>From: Denys Dmytriyenko <denys@ti.com>
>
>Signed-off-by: Denys Dmytriyenko <denys@ti.com>
>---
> .../recipes-core/meta/external-linaro-toolchain.bbappend
>| 4 ++--
> 1 file changed, 2 insertions(+), 2 deletions(-)
>
>diff --git a/meta-arago-extras/recipes-core/meta/external-linaro-
>toolchain.bbappend b/meta-arago-extras/recipes-core/meta/external-
>linaro-toolchain.bbappend
>index 2aac21b..34d4edd 100644
>--- a/meta-arago-extras/recipes-core/meta/external-linaro-
>toolchain.bbappend
>+++ b/meta-arago-extras/recipes-core/meta/external-linaro-
>toolchain.bbappend
>@@ -2,7 +2,7 @@ INSANE_SKIP_libstdc++-dev +=3D "staticdev"
>
> ALLOW_EMPTY_${PN}-utils =3D "1"
>
>-PR_append =3D "-arago4"
>+PR_append =3D "-arago5"
>
> PROVIDES :=3D "${@oe_filter_out('virtual/linux-libc-headers',
>'${PROVIDES}', d)}"
> PROVIDES :=3D "${@oe_filter_out('linux-libc-headers',
>'${PROVIDES}', d)}"
>@@ -99,7 +99,7 @@ do_install_append() {
> 	cp -a ${TOOLCHAIN_PATH}/${ELT_TARGET_SYS}/include/*
>${D}/include
>
> 	${@base_conditional('PREFERRED_PROVIDER_linux-libc-headers',
>'external-linaro-toolchain', '', 'rm -rf ${D}${includedir}/asm*;
>rm -rf ${D}${includedir}/drm; rm -rf ${D}${includedir}/linux; rm -
>rf ${D}${includedir}/mtd; rm -rf ${D}${includedir}/rdma; rm -rf
>${D}${includedir}/sound; rm -rf ${D}${includedir}/video', d)}
>-	${@base_conditional('PREFERRED_PROVIDER_linux-libc-headers',
>'external-linaro-toolchain', '', 'rm -rf
>${D}${includedir}/scsi/.install; rm -rf
>${D}${includedir}/scsi/scsi_netlink*; rm -rf
>${D}${includedir}/scsi/scsi_bsg*', d)}
>+	${@base_conditional('PREFERRED_PROVIDER_linux-libc-headers',
>'external-linaro-toolchain', '', 'rm -rf
>${D}${includedir}/scsi/.install; rm -rf
>${D}${includedir}/scsi/scsi_netlink*; rm -rf
>${D}${includedir}/scsi/scsi_bsg*; rm -rf ${D}${includedir}/xen',
>d)}
>
> 	rm -rf ${D}/lib/libgfortran*
> 	rm -rf ${D}/lib/ldscripts
>--
>1.8.3.2
>
>_______________________________________________
>meta-arago mailing list
>meta-arago@arago-project.org
>http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

