Return-Path: <j-stiffler@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id 9D63552A52
	for <meta-arago@arago-project.org>;
	Thu,  5 Mar 2015 19:00:11 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id t25J0A4B028308
	for <meta-arago@arago-project.org>; Thu, 5 Mar 2015 13:00:10 -0600
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id t25J09Nj028433
	for <meta-arago@arago-project.org>; Thu, 5 Mar 2015 13:00:09 -0600
Received: from DFLE09.ent.ti.com ([fe80::7090:147d:b5eb:4c12]) by
	DLEE71.ent.ti.com ([fe80::4dce:5c82:1ad0:d462%28]) with mapi id
	14.03.0224.002; Thu, 5 Mar 2015 13:00:08 -0600
From: "Stiffler, Jacob" <j-stiffler@ti.com>
To: "Dmytriyenko, Denys" <denys@ti.com>, "Cooper Jr., Franklin"
	<fcooper@ti.com>
Thread-Topic: [meta-arago] [RFC v2 0/4] Add WAYLAND_SUPPORT flag.
Thread-Index: AQHQV3KiXa2OyP1Kr0qdgwQcAPooO50OolaA//+buQA=
Date: Thu, 5 Mar 2015 19:00:08 +0000
Message-ID: <4B26FB5A64EBA14C87266869E037F958141056AF@DFLE09.ent.ti.com>
References: <1425580304-19919-1-git-send-email-j-stiffler@ti.com>
	<20150305185809.GV6052@edge>
In-Reply-To: <20150305185809.GV6052@edge>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [157.170.170.90]
MIME-Version: 1.0
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Subject: Re: [RFC v2 0/4] Add WAYLAND_SUPPORT flag.
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
X-List-Received-Date: Thu, 05 Mar 2015 19:00:11 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

This is needed to the dual-camera-demo, though I'm not sure why exactly.=20

Franklin can you comment on this?

-----Original Message-----
From: Dmytriyenko, Denys=20
Sent: Thursday, March 05, 2015 1:58 PM
To: Stiffler, Jacob
Cc: meta-arago@arago-project.org
Subject: Re: [meta-arago] [RFC v2 0/4] Add WAYLAND_SUPPORT flag.

On Thu, Mar 05, 2015 at 01:31:39PM -0500, Jacob Stiffler wrote:
> * This falg may be used to exclude wayland/weston from the file system.
> * QT platform will be set based on this value.
> * Add processor-sdk band to disable wayland for ti33x and ti43x.

So, what's the future of wayland in SDKs, then?


> Jacob Stiffler (4):
>   arago-prefs: Add WAYLAND_SUPPORT flag.
>   packagegroups: Implement WAYLAND_SUPPORT flag.
>   qtbase: Set qpa based in WAYLAND_SUPPORT flag.
>   branding-processor-sdk: Add processor-sdk brand.
>=20
>  .../conf/distro/include/arago-prefs.inc            |    2 ++
>  .../conf/distro/include/branding-processor-sdk.inc |   34 ++++++++++++++=
++++++
>  .../packagegroups/packagegroup-arago-qte.bb        |    4 +--
>  .../packagegroup-arago-tisdk-graphics.bb           |    4 +--
>  .../packagegroups/packagegroup-arago-tisdk-qte.bb  |    4 +--
>  .../packagegroups/packagegroup-linaro-tc-test.bb   |    5 +--
>  meta-arago-distro/recipes-qt/qt5/qtbase/qt_env.sh  |    1 -
>  .../recipes-qt/qt5/qtbase_5.4.1.bbappend           |    9 ++++--
>  8 files changed, 51 insertions(+), 12 deletions(-)  create mode=20
> 100644=20
> meta-arago-distro/conf/distro/include/branding-processor-sdk.inc
>=20
> --
> 1.7.9.5
>=20
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

