Return-Path: <chase.maupin@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by arago-project.org (Postfix) with ESMTPS id 4545F52992
	for <meta-arago@arago-project.org>;
	Wed, 26 Jun 2013 12:53:54 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id r5QCrrXe000933
	for <meta-arago@arago-project.org>; Wed, 26 Jun 2013 07:53:53 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id r5QCrr03032726
	for <meta-arago@arago-project.org>; Wed, 26 Jun 2013 07:53:53 -0500
Received: from DLEE74.ent.ti.com (157.170.170.8) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server (TLS) id 14.2.342.3;
	Wed, 26 Jun 2013 07:53:52 -0500
Received: from DLEE11.ent.ti.com ([fe80::40fa:b936:da7c:d113]) by
	DLEE74.ent.ti.com ([2002:9daa:aa08::9daa:aa08]) with mapi id
	14.02.0342.003; Wed, 26 Jun 2013 07:53:52 -0500
From: "Maupin, Chase" <chase.maupin@ti.com>
To: "Heroor, Siddharth" <heroor@ti.com>, "meta-arago@arago-project.org"
	<meta-arago@arago-project.org>
Thread-Topic: [meta-arago] [PATCH 1/2] meta-arago-distro: recipes-kernel -
	Overlay Arago info
Thread-Index: AQHOclzLDGTThl/0ZkOxrD3xClEj7ZlH82PQ
Date: Wed, 26 Jun 2013 12:53:51 +0000
Message-ID: <7D46E86EC0A8354091174257B2FED10159617417@DLEE11.ent.ti.com>
References: <1372244597-11600-1-git-send-email-heroor@ti.com>
	<1372244597-11600-2-git-send-email-heroor@ti.com>
In-Reply-To: <1372244597-11600-2-git-send-email-heroor@ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.247.5.50]
MIME-Version: 1.0
Subject: Re: [PATCH 1/2] meta-arago-distro: recipes-kernel -	Overlay Arago info
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
X-List-Received-Date: Wed, 26 Jun 2013 12:53:54 -0000
Content-Language: en-US
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

>-----Original Message-----
>From: meta-arago-bounces@arago-project.org [mailto:meta-arago-
>bounces@arago-project.org] On Behalf Of Heroor, Siddharth
>Sent: Wednesday, June 26, 2013 6:03 AM
>To: meta-arago@arago-project.org
>Subject: [meta-arago] [PATCH 1/2] meta-arago-distro: recipes-
>kernel - Overlay Arago info
>
>* Based of linux-ti-staging_3.8.bbappend
>
>Signed-off-by: Siddharth Heroor <heroor@ti.com>
>cc: Mrinmayee Hingolikar <mrinmayee@ti.com>
>---
> .../linux/linux-ti-glsdk_3.8.bbappend              |   17
>+++++++++++++++++
> 1 files changed, 17 insertions(+), 0 deletions(-)
> create mode 100644 meta-arago-distro/recipes-kernel/linux/linux-
>ti-glsdk_3.8.bbappend
>
>diff --git a/meta-arago-distro/recipes-kernel/linux/linux-ti-
>glsdk_3.8.bbappend b/meta-arago-distro/recipes-kernel/linux/linux-
>ti-glsdk_3.8.bbappend
>new file mode 100644
>index 0000000..b20c63a
>--- /dev/null
>+++ b/meta-arago-distro/recipes-kernel/linux/linux-ti-
>glsdk_3.8.bbappend
>@@ -0,0 +1,17 @@
>+MACHINE_KERNEL_PR_append =3D "-arago6"

Maybe I'm missing something, but I didn't remember seeing the patch that ad=
ded linux-ti-glsdk recipe to be appended in the first place.

Also, why start with arago6?

>+
>+FILESEXTRAPATHS_prepend :=3D "${THISDIR}/${P}:"
>+
>+require copy-defconfig.inc
>+
>+KERNEL_LOCALVERSION =3D "-g${@d.getVar('SRCPV',
>True).partition('+')[2][0:7]}"
>+
>+# The below lines are overlayed until the LOCALVERSION change is
>merged into
>+# the oe-core danny branch. Update: not coming to danny, keep
>until dylan.
>+kernel_do_configure_prepend() {
>+    if [ ! -e ${B}/.scmversion -a ! -e ${S}/.scmversion ]
>+    then
>+        echo ${KERNEL_LOCALVERSION} > ${B}/.scmversion
>+        echo ${KERNEL_LOCALVERSION} > ${S}/.scmversion
>+    fi
>+}
>--
>1.7.0.4
>
>_______________________________________________
>meta-arago mailing list
>meta-arago@arago-project.org
>http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

