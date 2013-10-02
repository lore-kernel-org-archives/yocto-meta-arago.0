Return-Path: <chase.maupin@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id 6DB015296F
	for <meta-arago@arago-project.org>;
	Wed,  2 Oct 2013 13:00:17 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id r92D0GTR012280;
	Wed, 2 Oct 2013 08:00:16 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id r92D0Gtf022300;
	Wed, 2 Oct 2013 08:00:16 -0500
Received: from DLEE11.ent.ti.com ([fe80::40fa:b936:da7c:d113]) by
	DFLE72.ent.ti.com ([fe80::e5e2:bab6:34dc:a483%28]) with mapi id
	14.02.0342.003; Wed, 2 Oct 2013 08:00:16 -0500
From: "Maupin, Chase" <chase.maupin@ti.com>
To: Denys Dmytriyenko <denis@denix.org>, "meta-arago@arago-project.org"
	<meta-arago@arago-project.org>
Thread-Topic: [meta-arago] [PATCH 10/13] arago-prefs: load up Qt5 preferred
	versions
Thread-Index: AQHOvnWBRXykftP75UeOj6Z+aeeN25nhYbuw
Date: Wed, 2 Oct 2013 13:00:15 +0000
Message-ID: <7D46E86EC0A8354091174257B2FED1015977A69E@DLEE11.ent.ti.com>
References: <1380611472-23600-1-git-send-email-denis@denix.org>
	<1380611472-23600-11-git-send-email-denis@denix.org>
In-Reply-To: <1380611472-23600-11-git-send-email-denis@denix.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [157.170.170.90]
MIME-Version: 1.0
Subject: Re: [PATCH 10/13] arago-prefs: load up Qt5 preferred	versions
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
X-List-Received-Date: Wed, 02 Oct 2013 13:00:17 -0000
Content-Language: en-US
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

Acked-by: Chase Maupin <chase.maupin@ti.com>

>-----Original Message-----
>From: meta-arago-bounces@arago-project.org [mailto:meta-arago-
>bounces@arago-project.org] On Behalf Of Denys Dmytriyenko
>Sent: Tuesday, October 01, 2013 2:11 AM
>To: meta-arago@arago-project.org
>Subject: [meta-arago] [PATCH 10/13] arago-prefs: load up Qt5
>preferred versions
>
>From: Denys Dmytriyenko <denys@ti.com>
>
>Signed-off-by: Denys Dmytriyenko <denys@ti.com>
>---
> meta-arago-distro/conf/distro/include/arago-prefs.inc | 3 +++
> 1 file changed, 3 insertions(+)
>
>diff --git a/meta-arago-distro/conf/distro/include/arago-prefs.inc
>b/meta-arago-distro/conf/distro/include/arago-prefs.inc
>index 70f02b9..fac831f 100644
>--- a/meta-arago-distro/conf/distro/include/arago-prefs.inc
>+++ b/meta-arago-distro/conf/distro/include/arago-prefs.inc
>@@ -1,3 +1,6 @@
>+# Set preferred Qt5 versions. Different namespace from Qt4, so no
>conflict
>+include conf/distro/include/qt5-versions.inc
>+
> # Use the latest version of ltp-ddt for kernel versions 3.8+
> PREFERRED_PROVIDER_ltp-ddt =3D "ltp-ddt"
>
>--
>1.8.3.2
>
>_______________________________________________
>meta-arago mailing list
>meta-arago@arago-project.org
>http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

