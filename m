Return-Path: <fcooper@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by arago-project.org (Postfix) with ESMTPS id 272D552A0F
	for <meta-arago@arago-project.org>;
	Fri, 20 Jun 2014 20:17:55 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id s5KKHs6D004962;
	Fri, 20 Jun 2014 15:17:54 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id s5KKHsdu028448;
	Fri, 20 Jun 2014 15:17:54 -0500
Received: from DFLE08.ent.ti.com ([fe80::187f:8c86:2b7:ef9f]) by
	DFLE73.ent.ti.com ([fe80::c9be:a3a9:7cd8:c8b3%28]) with mapi id
	14.03.0174.001; Fri, 20 Jun 2014 15:17:54 -0500
From: "Cooper Jr., Franklin" <fcooper@ti.com>
To: "Maupin, Chase" <chase.maupin@ti.com>, Denys Dmytriyenko <denis@denix.org>,
	"meta-arago@arago-project.org" <meta-arago@arago-project.org>
Thread-Topic: [meta-arago] [PATCH 07/19] libjpeg-turbo: remove bbappend for
	SVN URI, as main recipe uses tarball now
Thread-Index: AQHPjLEY979HnklmFUCu2thr5baqUJt6sD8A//+/zCA=
Date: Fri, 20 Jun 2014 20:17:53 +0000
Message-ID: <8F29D6B095ED194EA1980491A5E029710C6D66A5@DFLE08.ent.ti.com>
References: <1403287009-11256-1-git-send-email-denis@denix.org>
	<1403287009-11256-8-git-send-email-denis@denix.org>
	<7D46E86EC0A8354091174257B2FED1015D0D915D@DLEE11.ent.ti.com>
In-Reply-To: <7D46E86EC0A8354091174257B2FED1015D0D915D@DLEE11.ent.ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [157.170.170.90]
MIME-Version: 1.0
Subject: Re: [PATCH 07/19] libjpeg-turbo: remove bbappend for SVN URI, as main recipe uses tarball now
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
X-List-Received-Date: Fri, 20 Jun 2014 20:17:55 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Acked-by: Franklin Cooper Jr. <fcooper@ti.com>

> -----Original Message-----
> From: meta-arago-bounces@arago-project.org [mailto:meta-arago-
> bounces@arago-project.org] On Behalf Of Maupin, Chase
> Sent: Friday, June 20, 2014 2:08 PM
> To: Denys Dmytriyenko; meta-arago@arago-project.org
> Subject: Re: [meta-arago] [PATCH 07/19] libjpeg-turbo: remove bbappend fo=
r
> SVN URI, as main recipe uses tarball now
>=20
> Acked-by: Chase Maupin <chase.maupin@ti.com>
>=20
> >-----Original Message-----
> >From: meta-arago-bounces@arago-project.org [mailto:meta-arago-
> >bounces@arago-project.org] On Behalf Of Denys Dmytriyenko
> >Sent: Friday, June 20, 2014 12:57 PM
> >To: meta-arago@arago-project.org
> >Subject: [meta-arago] [PATCH 07/19] libjpeg-turbo: remove bbappend for
> >SVN URI, as main recipe uses tarball now
> >
> >From: Denys Dmytriyenko <denys@ti.com>
> >
> >Signed-off-by: Denys Dmytriyenko <denys@ti.com>
> >---
> > meta-arago-distro/recipes-core/jpeg/libjpeg-turbo_svn.bbappend |
> >3 ---
> > 1 file changed, 3 deletions(-)
> > delete mode 100644 meta-arago-distro/recipes-core/jpeg/libjpeg-
> >turbo_svn.bbappend
> >
> >diff --git a/meta-arago-distro/recipes-core/jpeg/libjpeg-
> >turbo_svn.bbappend b/meta-arago-distro/recipes-core/jpeg/libjpeg-
> >turbo_svn.bbappend
> >deleted file mode 100644
> >index 23949aa..0000000
> >--- a/meta-arago-distro/recipes-core/jpeg/libjpeg-
> >turbo_svn.bbappend
> >+++ /dev/null
> >@@ -1,3 +0,0 @@
> >-python __anonymous () {
> >-    d.setVar("SRC_URI",
> >d.getVar("SRC_URI").replace("protocol=3Dsvn", "protocol=3Dhttp")) -}
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

