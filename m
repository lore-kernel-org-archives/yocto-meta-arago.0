Return-Path: <chase.maupin@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by arago-project.org (Postfix) with ESMTPS id 0BEC652A19
	for <meta-arago@arago-project.org>;
	Fri, 23 Aug 2013 20:24:44 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id r7NKOhkV031865;
	Fri, 23 Aug 2013 15:24:43 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id r7NKOhD2019144;
	Fri, 23 Aug 2013 15:24:43 -0500
Received: from DLEE11.ent.ti.com ([fe80::40fa:b936:da7c:d113]) by
	DFLE73.ent.ti.com ([fe80::c9be:a3a9:7cd8:c8b3%28]) with mapi id
	14.02.0342.003; Fri, 23 Aug 2013 15:24:43 -0500
From: "Maupin, Chase" <chase.maupin@ti.com>
To: Denys Dmytriyenko <denis@denix.org>, "meta-arago@arago-project.org"
	<meta-arago@arago-project.org>
Thread-Topic: [meta-arago] [PATCH 4/4] u-boot-ti-staging: enable
	LOCALVERSION and	AUTOREV
Thread-Index: AQHOoD3ARdAeFJAIbkq/fYvvKLejIZmjPREg
Date: Fri, 23 Aug 2013 20:24:43 +0000
Message-ID: <7D46E86EC0A8354091174257B2FED101596DF2C7@DLEE11.ent.ti.com>
References: <1377289002-20230-1-git-send-email-denis@denix.org>
	<1377289002-20230-4-git-send-email-denis@denix.org>
In-Reply-To: <1377289002-20230-4-git-send-email-denis@denix.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.247.5.50]
MIME-Version: 1.0
Subject: Re: [PATCH 4/4] u-boot-ti-staging: enable LOCALVERSION and	AUTOREV
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
X-List-Received-Date: Fri, 23 Aug 2013 20:24:44 -0000
Content-Language: en-US
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

>-----Original Message-----
>From: meta-arago-bounces@arago-project.org [mailto:meta-arago-
>bounces@arago-project.org] On Behalf Of Denys Dmytriyenko
>Sent: Friday, August 23, 2013 3:17 PM
>To: meta-arago@arago-project.org
>Subject: [meta-arago] [PATCH 4/4] u-boot-ti-staging: enable
>LOCALVERSION and AUTOREV
>
>From: Denys Dmytriyenko <denys@ti.com>
>
>Signed-off-by: Denys Dmytriyenko <denys@ti.com>
>---
> .../recipes-bsp/u-boot/u-boot-ti-staging_git.bbappend     | 15
>+++++++++++++++
> 1 file changed, 15 insertions(+)
> create mode 100644 meta-arago-distro/recipes-bsp/u-boot/u-boot-
>ti-staging_git.bbappend
>
>diff --git a/meta-arago-distro/recipes-bsp/u-boot/u-boot-ti-
>staging_git.bbappend b/meta-arago-distro/recipes-bsp/u-boot/u-
>boot-ti-staging_git.bbappend
>new file mode 100644
>index 0000000..754d625
>--- /dev/null
>+++ b/meta-arago-distro/recipes-bsp/u-boot/u-boot-ti-
>staging_git.bbappend
>@@ -0,0 +1,15 @@
>+PR_append =3D "-arago0"
>+
>+SRCREV =3D "${AUTOREV}"
>+
>+UBOOT_LOCALVERSION =3D "-g${@d.getVar('SRCPV',
>True).partition('+')[2][0:7]}"
>+
>+# the lines below can be removed once the U-Boot LOCALVERSION
>patches are merged
>+# into the oe-core danny branch. Update: not coming to danny,
>wait for dylan.

Still needed?

>+do_compile_prepend() {
>+    if [ ! -e ${B}/.scmversion -a ! -e ${S}/.scmversion ]
>+    then
>+        echo ${UBOOT_LOCALVERSION} > ${B}/.scmversion
>+        echo ${UBOOT_LOCALVERSION} > ${S}/.scmversion
>+    fi
>+}
>--
>1.8.3.2
>
>_______________________________________________
>meta-arago mailing list
>meta-arago@arago-project.org
>http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

