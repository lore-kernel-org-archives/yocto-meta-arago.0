Return-Path: <chase.maupin@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by arago-project.org (Postfix) with ESMTPS id 34B02529D7
	for <meta-arago@arago-project.org>;
	Fri, 20 Jun 2014 19:07:29 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id s5KJ7S4t021706;
	Fri, 20 Jun 2014 14:07:28 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id s5KJ7SKI015514;
	Fri, 20 Jun 2014 14:07:28 -0500
Received: from DLEE11.ent.ti.com ([fe80::40fa:b936:da7c:d113]) by
	DFLE73.ent.ti.com ([fe80::c9be:a3a9:7cd8:c8b3%28]) with mapi id
	14.03.0174.001; Fri, 20 Jun 2014 14:07:28 -0500
From: "Maupin, Chase" <chase.maupin@ti.com>
To: Denys Dmytriyenko <denis@denix.org>, "meta-arago@arago-project.org"
	<meta-arago@arago-project.org>
Thread-Topic: [meta-arago] [PATCH 06/19] linux-ti-staging: remove 3.8
	bbappend, as recipe is gone from meta-ti
Thread-Index: AQHPjLEYZwXae5Ex20OutH086eMdN5t6XFcw
Date: Fri, 20 Jun 2014 19:07:27 +0000
Message-ID: <7D46E86EC0A8354091174257B2FED1015D0D914A@DLEE11.ent.ti.com>
References: <1403287009-11256-1-git-send-email-denis@denix.org>
	<1403287009-11256-7-git-send-email-denis@denix.org>
In-Reply-To: <1403287009-11256-7-git-send-email-denis@denix.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.247.5.50]
MIME-Version: 1.0
Subject: Re: [PATCH 06/19] linux-ti-staging: remove 3.8 bbappend, as recipe is gone from meta-ti
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
X-List-Received-Date: Fri, 20 Jun 2014 19:07:29 -0000
Content-Language: en-US
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

Acked-by: Chase Maupin <chase.maupin@ti.com>

>-----Original Message-----
>From: meta-arago-bounces@arago-project.org [mailto:meta-arago-
>bounces@arago-project.org] On Behalf Of Denys Dmytriyenko
>Sent: Friday, June 20, 2014 12:57 PM
>To: meta-arago@arago-project.org
>Subject: [meta-arago] [PATCH 06/19] linux-ti-staging: remove 3.8
>bbappend, as recipe is gone from meta-ti
>
>From: Denys Dmytriyenko <denys@ti.com>
>
>Signed-off-by: Denys Dmytriyenko <denys@ti.com>
>---
> .../recipes-kernel/linux/linux-ti-staging_3.8.bbappend  | 17 ----
>-------------
> 1 file changed, 17 deletions(-)
> delete mode 100644 meta-arago-distro/recipes-kernel/linux/linux-
>ti-staging_3.8.bbappend
>
>diff --git a/meta-arago-distro/recipes-kernel/linux/linux-ti-
>staging_3.8.bbappend b/meta-arago-distro/recipes-
>kernel/linux/linux-ti-staging_3.8.bbappend
>deleted file mode 100644
>index b20c63a..0000000
>--- a/meta-arago-distro/recipes-kernel/linux/linux-ti-
>staging_3.8.bbappend
>+++ /dev/null
>@@ -1,17 +0,0 @@
>-MACHINE_KERNEL_PR_append =3D "-arago6"
>-
>-FILESEXTRAPATHS_prepend :=3D "${THISDIR}/${P}:"
>-
>-require copy-defconfig.inc
>-
>-KERNEL_LOCALVERSION =3D "-g${@d.getVar('SRCPV',
>True).partition('+')[2][0:7]}"
>-
>-# The below lines are overlayed until the LOCALVERSION change is
>merged into
>-# the oe-core danny branch. Update: not coming to danny, keep
>until dylan.
>-kernel_do_configure_prepend() {
>-    if [ ! -e ${B}/.scmversion -a ! -e ${S}/.scmversion ]
>-    then
>-        echo ${KERNEL_LOCALVERSION} > ${B}/.scmversion
>-        echo ${KERNEL_LOCALVERSION} > ${S}/.scmversion
>-    fi
>-}
>--
>2.0.0
>
>_______________________________________________
>meta-arago mailing list
>meta-arago@arago-project.org
>http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

