Return-Path: <chase.maupin@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by arago-project.org (Postfix) with ESMTPS id 1855C52979
	for <meta-arago@arago-project.org>;
	Tue,  2 Jul 2013 18:43:32 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id r62IhVKw012834
	for <meta-arago@arago-project.org>; Tue, 2 Jul 2013 13:43:31 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id r62IhVKN025078
	for <meta-arago@arago-project.org>; Tue, 2 Jul 2013 13:43:31 -0500
Received: from DLEE11.ent.ti.com ([fe80::40fa:b936:da7c:d113]) by
	DFLE73.ent.ti.com ([fe80::c9be:a3a9:7cd8:c8b3%28]) with mapi id
	14.02.0342.003; Tue, 2 Jul 2013 13:43:31 -0500
From: "Maupin, Chase" <chase.maupin@ti.com>
To: "Cooper Jr., Franklin" <fcooper@ti.com>, "meta-arago@arago-project.org"
	<meta-arago@arago-project.org>
Thread-Topic: [meta-arago] [master & danny][PATCH 2/6] linux-am335x-psp:
	Update	to latest 3.2 release
Thread-Index: AQHOd0YAuMt2qoLBAU2P5QzvnkDWAJlRuYcw
Date: Tue, 2 Jul 2013 18:43:30 +0000
Message-ID: <7D46E86EC0A8354091174257B2FED101596304D3@DLEE11.ent.ti.com>
References: <1372785354-1920-1-git-send-email-fcooper@ti.com>
	<1372785354-1920-2-git-send-email-fcooper@ti.com>
In-Reply-To: <1372785354-1920-2-git-send-email-fcooper@ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [157.170.170.90]
MIME-Version: 1.0
Subject: Re: [master & danny][PATCH 2/6] linux-am335x-psp: Update	to latest 3.2 release
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
X-List-Received-Date: Tue, 02 Jul 2013 18:43:32 -0000
Content-Language: en-US
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

Acked-by: Chase Maupin <chase.maupin@ti.com>
>-----Original Message-----
>From: meta-arago-bounces@arago-project.org [mailto:meta-arago-
>bounces@arago-project.org] On Behalf Of Cooper Jr., Franklin
>Sent: Tuesday, July 02, 2013 12:16 PM
>To: meta-arago@arago-project.org
>Cc: Cooper Jr., Franklin
>Subject: [meta-arago] [master & danny][PATCH 2/6] linux-am335x-
>psp: Update to latest 3.2 release
>
>* Update to latest Linux kernel release that adds support for the
>PG 2.1 evms
>  and 1 Ghz.
>
>Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
>---
> .../linux/linux-am335x-psp_3.2.bbappend            |    4 ++--
> 1 files changed, 2 insertions(+), 2 deletions(-)
>
>diff --git a/meta-arago-distro/recipes-kernel/linux/linux-am335x-
>psp_3.2.bbappend b/meta-arago-distro/recipes-kernel/linux/linux-
>am335x-psp_3.2.bbappend
>index 701666f..b881190 100644
>--- a/meta-arago-distro/recipes-kernel/linux/linux-am335x-
>psp_3.2.bbappend
>+++ b/meta-arago-distro/recipes-kernel/linux/linux-am335x-
>psp_3.2.bbappend
>@@ -1,6 +1,6 @@
>-PR_append =3D "-arago4"
>+PR_append =3D "-arago5"
>
> # KVER is used by arago-source-ipk.conf
>-KVER =3D "3.2.0-psp04.06.00.10"
>+KVER =3D "3.2.0-psp04.06.00.11"
>
> require copy-defconfig.inc
>--
>1.7.0.4
>
>_______________________________________________
>meta-arago mailing list
>meta-arago@arago-project.org
>http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

