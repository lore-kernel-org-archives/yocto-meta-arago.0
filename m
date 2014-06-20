Return-Path: <chase.maupin@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by arago-project.org (Postfix) with ESMTPS id CE3E2529D7
	for <meta-arago@arago-project.org>;
	Fri, 20 Jun 2014 19:03:08 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id s5KJ37jl021191;
	Fri, 20 Jun 2014 14:03:07 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id s5KJ37jk029400;
	Fri, 20 Jun 2014 14:03:07 -0500
Received: from DLEE11.ent.ti.com ([fe80::40fa:b936:da7c:d113]) by
	DFLE73.ent.ti.com ([fe80::c9be:a3a9:7cd8:c8b3%28]) with mapi id
	14.03.0174.001; Fri, 20 Jun 2014 14:03:07 -0500
From: "Maupin, Chase" <chase.maupin@ti.com>
To: Denys Dmytriyenko <denis@denix.org>, "meta-arago@arago-project.org"
	<meta-arago@arago-project.org>
Thread-Topic: [meta-arago] [PATCH 01/19] README: update with Daisy info
Thread-Index: AQHPjLEbVprG91w9KUakJjlhCeJNspt6WxQA
Date: Fri, 20 Jun 2014 19:03:07 +0000
Message-ID: <7D46E86EC0A8354091174257B2FED1015D0D8FBD@DLEE11.ent.ti.com>
References: <1403287009-11256-1-git-send-email-denis@denix.org>
	<1403287009-11256-2-git-send-email-denis@denix.org>
In-Reply-To: <1403287009-11256-2-git-send-email-denis@denix.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.247.5.50]
MIME-Version: 1.0
Subject: Re: [PATCH 01/19] README: update with Daisy info
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
X-List-Received-Date: Fri, 20 Jun 2014 19:03:09 -0000
Content-Language: en-US
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

Acked-by: Chase Maupin <chase.maupin@ti.com>

>-----Original Message-----
>From: meta-arago-bounces@arago-project.org [mailto:meta-arago-
>bounces@arago-project.org] On Behalf Of Denys Dmytriyenko
>Sent: Friday, June 20, 2014 12:57 PM
>To: meta-arago@arago-project.org
>Subject: [meta-arago] [PATCH 01/19] README: update with Daisy info
>
>From: Denys Dmytriyenko <denys@ti.com>
>
>Signed-off-by: Denys Dmytriyenko <denys@ti.com>
>---
> meta-arago-distro/README | 12 ++++++------
> meta-arago-extras/README | 12 ++++++------
> 2 files changed, 12 insertions(+), 12 deletions(-)
>
>diff --git a/meta-arago-distro/README b/meta-arago-distro/README
>index aed3b58..05b0261 100644
>--- a/meta-arago-distro/README
>+++ b/meta-arago-distro/README
>@@ -1,24 +1,24 @@
> meta-arago-distro provides Arago distribution configuration for
>TI SDK products
>
>-This layer works with the latest Yocto Project release (currently
>1.5) and tracks
>-the stable/maintenance branches (currently "dora") of the
>corresponding layers:
>+This layer works with the latest Yocto Project release (currently
>1.6) and tracks
>+the stable/maintenance branches (currently "daisy") of the
>corresponding layers:
>
> URI: git://git.openembedded.org/openembedded-core
>-branch: dora
>+branch: daisy
> revision: HEAD
> layers: meta
>
> URI: git://git.openembedded.org/meta-openembedded
>-branch: dora
>+branch: daisy
> revision: HEAD
> layers: meta-oe, toolchain-layer, meta-networking
>
> URI: git://arago-project.org/git/meta-ti
>-branch: dora
>+branch: daisy
> revision: HEAD
>
> URI: git://git.linaro.org/openembedded/meta-linaro
>-branch: dora
>+branch: daisy
> revision: HEAD
> layers: meta-linaro-toolchain
>
>diff --git a/meta-arago-extras/README b/meta-arago-extras/README
>index f303d14..1c6e8e5 100644
>--- a/meta-arago-extras/README
>+++ b/meta-arago-extras/README
>@@ -1,24 +1,24 @@
> meta-arago-extras provides additional TI SDK applications that
>are distro-agnostic
>
>-This layer works with the latest Yocto Project release (currently
>1.5) and tracks
>-the stable/maintenance branches (currently "dora") of the
>corresponding layers:
>+This layer works with the latest Yocto Project release (currently
>1.6) and tracks
>+the stable/maintenance branches (currently "daisy") of the
>corresponding layers:
>
> URI: git://git.openembedded.org/openembedded-core
>-branch: dora
>+branch: daisy
> revision: HEAD
> layers: meta
>
> URI: git://git.openembedded.org/meta-openembedded
>-branch: dora
>+branch: daisy
> revision: HEAD
> layers: meta-oe, toolchain-layers, meta-networking
>
> URI: git://arago-project.org/git/meta-ti
>-branch: dora
>+branch: daisy
> revision: HEAD
>
> URI: git://git.linaro.org/openembedded/meta-linaro
>-branch: dora
>+branch: daisy
> revision: HEAD
> layers: meta-linaro-toolchain
>
>--
>2.0.0
>
>_______________________________________________
>meta-arago mailing list
>meta-arago@arago-project.org
>http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

