Return-Path: <fcooper@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by arago-project.org (Postfix) with ESMTPS id B394C52A52
	for <meta-arago@arago-project.org>;
	Thu,  5 Mar 2015 18:43:19 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id t25IhJjD012328
	for <meta-arago@arago-project.org>; Thu, 5 Mar 2015 12:43:19 -0600
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id t25IhHQA016908
	for <meta-arago@arago-project.org>; Thu, 5 Mar 2015 12:43:18 -0600
Received: from DFLE08.ent.ti.com ([fe80::187f:8c86:2b7:ef9f]) by
	DFLE72.ent.ti.com ([fe80::e5e2:bab6:34dc:a483%28]) with mapi id
	14.03.0224.002; Thu, 5 Mar 2015 12:43:17 -0600
From: "Cooper Jr., Franklin" <fcooper@ti.com>
To: "Stiffler, Jacob" <j-stiffler@ti.com>
Thread-Topic: [meta-arago] [RFC v2 0/4] Add WAYLAND_SUPPORT flag.
Thread-Index: AQHQV3KozFzVQOVEiUyLNWnbwHBn050OOZgp
Date: Thu, 5 Mar 2015 18:43:17 +0000
Message-ID: <3D6F3E0F-5161-4F3A-884E-7E93C9D098CD@ti.com>
References: <1425580304-19919-1-git-send-email-j-stiffler@ti.com>
In-Reply-To: <1425580304-19919-1-git-send-email-j-stiffler@ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
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
X-List-Received-Date: Thu, 05 Mar 2015 18:43:20 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Patchset looks good.

Personally I would use true/false instead of 0/1 to make things more obviou=
s.

Unless someone else has a problem with it then I'll leave it up to you.


> On Mar 5, 2015, at 12:31 PM, Stiffler, Jacob <j-stiffler@ti.com> wrote:
>=20
> * This falg may be used to exclude wayland/weston from the file system.
> * QT platform will be set based on this value.
> * Add processor-sdk band to disable wayland for ti33x and ti43x.
>=20
>=20
>=20
> Jacob Stiffler (4):
>  arago-prefs: Add WAYLAND_SUPPORT flag.
>  packagegroups: Implement WAYLAND_SUPPORT flag.
>  qtbase: Set qpa based in WAYLAND_SUPPORT flag.
>  branding-processor-sdk: Add processor-sdk brand.
>=20
> .../conf/distro/include/arago-prefs.inc            |    2 ++
> .../conf/distro/include/branding-processor-sdk.inc |   34 +++++++++++++++=
+++++
> .../packagegroups/packagegroup-arago-qte.bb        |    4 +--
> .../packagegroup-arago-tisdk-graphics.bb           |    4 +--
> .../packagegroups/packagegroup-arago-tisdk-qte.bb  |    4 +--
> .../packagegroups/packagegroup-linaro-tc-test.bb   |    5 +--
> meta-arago-distro/recipes-qt/qt5/qtbase/qt_env.sh  |    1 -
> .../recipes-qt/qt5/qtbase_5.4.1.bbappend           |    9 ++++--
> 8 files changed, 51 insertions(+), 12 deletions(-)
> create mode 100644 meta-arago-distro/conf/distro/include/branding-process=
or-sdk.inc
>=20
> --=20
> 1.7.9.5
>=20
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

