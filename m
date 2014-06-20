Return-Path: <chase.maupin@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id 319CA529D7
	for <meta-arago@arago-project.org>;
	Fri, 20 Jun 2014 19:07:42 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id s5KJ7frZ016936;
	Fri, 20 Jun 2014 14:07:41 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id s5KJ7fec002065;
	Fri, 20 Jun 2014 14:07:41 -0500
Received: from DLEE11.ent.ti.com ([fe80::40fa:b936:da7c:d113]) by
	DFLE73.ent.ti.com ([fe80::c9be:a3a9:7cd8:c8b3%28]) with mapi id
	14.03.0174.001; Fri, 20 Jun 2014 14:07:41 -0500
From: "Maupin, Chase" <chase.maupin@ti.com>
To: Denys Dmytriyenko <denis@denix.org>, "meta-arago@arago-project.org"
	<meta-arago@arago-project.org>
Thread-Topic: [meta-arago] [PATCH 07/19] libjpeg-turbo: remove bbappend for
	SVN URI, as main recipe uses tarball now
Thread-Index: AQHPjLEY88cJslJf6U+nLXwMo7trzpt6XGfg
Date: Fri, 20 Jun 2014 19:07:40 +0000
Message-ID: <7D46E86EC0A8354091174257B2FED1015D0D915D@DLEE11.ent.ti.com>
References: <1403287009-11256-1-git-send-email-denis@denix.org>
	<1403287009-11256-8-git-send-email-denis@denix.org>
In-Reply-To: <1403287009-11256-8-git-send-email-denis@denix.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.247.5.50]
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
X-List-Received-Date: Fri, 20 Jun 2014 19:07:42 -0000
Content-Language: en-US
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

Acked-by: Chase Maupin <chase.maupin@ti.com>

>-----Original Message-----
>From: meta-arago-bounces@arago-project.org [mailto:meta-arago-
>bounces@arago-project.org] On Behalf Of Denys Dmytriyenko
>Sent: Friday, June 20, 2014 12:57 PM
>To: meta-arago@arago-project.org
>Subject: [meta-arago] [PATCH 07/19] libjpeg-turbo: remove bbappend
>for SVN URI, as main recipe uses tarball now
>
>From: Denys Dmytriyenko <denys@ti.com>
>
>Signed-off-by: Denys Dmytriyenko <denys@ti.com>
>---
> meta-arago-distro/recipes-core/jpeg/libjpeg-turbo_svn.bbappend |
>3 ---
> 1 file changed, 3 deletions(-)
> delete mode 100644 meta-arago-distro/recipes-core/jpeg/libjpeg-
>turbo_svn.bbappend
>
>diff --git a/meta-arago-distro/recipes-core/jpeg/libjpeg-
>turbo_svn.bbappend b/meta-arago-distro/recipes-core/jpeg/libjpeg-
>turbo_svn.bbappend
>deleted file mode 100644
>index 23949aa..0000000
>--- a/meta-arago-distro/recipes-core/jpeg/libjpeg-
>turbo_svn.bbappend
>+++ /dev/null
>@@ -1,3 +0,0 @@
>-python __anonymous () {
>-    d.setVar("SRC_URI",
>d.getVar("SRC_URI").replace("protocol=3Dsvn", "protocol=3Dhttp"))
>-}
>--
>2.0.0
>
>_______________________________________________
>meta-arago mailing list
>meta-arago@arago-project.org
>http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

