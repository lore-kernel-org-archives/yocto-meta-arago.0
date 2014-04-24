Return-Path: <chase.maupin@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id D705152A8C
	for <meta-arago@arago-project.org>;
	Thu, 24 Apr 2014 12:35:52 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id s3OCZqm7002172;
	Thu, 24 Apr 2014 07:35:52 -0500
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id s3OCZqqY020745;
	Thu, 24 Apr 2014 07:35:52 -0500
Received: from DLEE11.ent.ti.com ([fe80::40fa:b936:da7c:d113]) by
	DLEE71.ent.ti.com ([fe80::4dce:5c82:1ad0:d462%28]) with mapi id
	14.03.0174.001; Thu, 24 Apr 2014 07:35:51 -0500
From: "Maupin, Chase" <chase.maupin@ti.com>
To: Denys Dmytriyenko <denis@denix.org>, "meta-arago@arago-project.org"
	<meta-arago@arago-project.org>
Thread-Topic: [meta-arago] [PATCH 7/8] iperf: update the license from NewBSD
	to the proper BSD-3-Clause
Thread-Index: AQHPX1+8ptfT1OPUdEysdLoSzcGzIpsgtLCg
Date: Thu, 24 Apr 2014 12:35:51 +0000
Message-ID: <7D46E86EC0A8354091174257B2FED1015CFB2007@DLEE11.ent.ti.com>
References: <1398304280-15426-1-git-send-email-denis@denix.org>
	<1398304280-15426-7-git-send-email-denis@denix.org>
In-Reply-To: <1398304280-15426-7-git-send-email-denis@denix.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [157.170.170.90]
MIME-Version: 1.0
Subject: Re: [PATCH 7/8] iperf: update the license from NewBSD to the proper BSD-3-Clause
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
X-List-Received-Date: Thu, 24 Apr 2014 12:35:53 -0000
Content-Language: en-US
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

Acked-by: Chase Maupin <chase.maupin@ti.com>

>-----Original Message-----
>From: meta-arago-bounces@arago-project.org [mailto:meta-arago-
>bounces@arago-project.org] On Behalf Of Denys Dmytriyenko
>Sent: Wednesday, April 23, 2014 8:51 PM
>To: meta-arago@arago-project.org
>Subject: [meta-arago] [PATCH 7/8] iperf: update the license from
>NewBSD to the proper BSD-3-Clause
>
>From: Denys Dmytriyenko <denys@ti.com>
>
>Signed-off-by: Denys Dmytriyenko <denys@ti.com>
>---
> meta-arago-extras/recipes-benchmark/iperf/iperf_2.0.5.bb | 4 ++--
> 1 file changed, 2 insertions(+), 2 deletions(-)
>
>diff --git a/meta-arago-extras/recipes-
>benchmark/iperf/iperf_2.0.5.bb b/meta-arago-extras/recipes-
>benchmark/iperf/iperf_2.0.5.bb
>index 208b955..32c76e1 100644
>--- a/meta-arago-extras/recipes-benchmark/iperf/iperf_2.0.5.bb
>+++ b/meta-arago-extras/recipes-benchmark/iperf/iperf_2.0.5.bb
>@@ -1,10 +1,10 @@
> DESCRIPTION =3D "Iperf is a tool to measure maximum TCP bandwidth,
>allowing the tuning of various parameters and UDP characteristics"
> HOMEPAGE =3D "http://dast.nlanr.net/Projects/Iperf/"
> SECTION =3D "console/network"
>-LICENSE =3D "NewBSD"
>+LICENSE =3D "BSD-3-Clause"
> LIC_FILES_CHKSUM =3D
>"file://COPYING;md5=3De8478eae9f479e39bc34975193360298"
>
>-PR =3D "r0"
>+PR =3D "r1"
>
> SRC_URI =3D " ${SOURCEFORGE_MIRROR}/iperf/iperf-${PV}.tar.gz \
>             file://000-Iperf_Fix-CPU-Usage.diff \
>--
>1.9.2
>
>_______________________________________________
>meta-arago mailing list
>meta-arago@arago-project.org
>http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

