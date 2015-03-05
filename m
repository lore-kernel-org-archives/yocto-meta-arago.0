Return-Path: <j-stiffler@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by arago-project.org (Postfix) with ESMTPS id EEE9E52A52
	for <meta-arago@arago-project.org>;
	Thu,  5 Mar 2015 18:55:27 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id t25ItRwR011769
	for <meta-arago@arago-project.org>; Thu, 5 Mar 2015 12:55:27 -0600
Received: from DLEE70.ent.ti.com (dlemailx.itg.ti.com [157.170.170.113])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id t25ItQjL024735
	for <meta-arago@arago-project.org>; Thu, 5 Mar 2015 12:55:26 -0600
Received: from DFLE09.ent.ti.com ([fe80::7090:147d:b5eb:4c12]) by
	DLEE70.ent.ti.com ([fe80::c4c6:f618:54e7:ad11%28]) with mapi id
	14.03.0224.002; Thu, 5 Mar 2015 12:55:25 -0600
From: "Stiffler, Jacob" <j-stiffler@ti.com>
To: "Cooper Jr., Franklin" <fcooper@ti.com>
Thread-Topic: [meta-arago] [RFC v2 0/4] Add WAYLAND_SUPPORT flag.
Thread-Index: AQHQV3KiXa2OyP1Kr0qdgwQcAPooO50OniyAgAAAZ4D//55DoA==
Date: Thu, 5 Mar 2015 18:55:25 +0000
Message-ID: <4B26FB5A64EBA14C87266869E037F9581410567B@DFLE09.ent.ti.com>
References: <1425580304-19919-1-git-send-email-j-stiffler@ti.com>,
	<3D6F3E0F-5161-4F3A-884E-7E93C9D098CD@ti.com>
	<9B50A8DA-E887-476F-B906-59EFECD9D148@ti.com>
In-Reply-To: <9B50A8DA-E887-476F-B906-59EFECD9D148@ti.com>
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
X-List-Received-Date: Thu, 05 Mar 2015 18:55:28 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

That patch is present in 3/4.

-----Original Message-----
From: Cooper Jr., Franklin=20
Sent: Thursday, March 05, 2015 1:45 PM
To: Stiffler, Jacob
Cc: meta-arago@arago-project.org
Subject: Re: [meta-arago] [RFC v2 0/4] Add WAYLAND_SUPPORT flag.

Also ur missing the patch that removed the qt platform line from the qt env=
 script.


> On Mar 5, 2015, at 12:43 PM, Cooper Jr., Franklin <fcooper@ti.com> wrote:
>=20
> Patchset looks good.
>=20
> Personally I would use true/false instead of 0/1 to make things more obvi=
ous.
>=20
> Unless someone else has a problem with it then I'll leave it up to you.
>=20
>=20
>> On Mar 5, 2015, at 12:31 PM, Stiffler, Jacob <j-stiffler@ti.com> wrote:
>>=20
>> * This falg may be used to exclude wayland/weston from the file system.
>> * QT platform will be set based on this value.
>> * Add processor-sdk band to disable wayland for ti33x and ti43x.
>>=20
>>=20
>>=20
>> Jacob Stiffler (4):
>> arago-prefs: Add WAYLAND_SUPPORT flag.
>> packagegroups: Implement WAYLAND_SUPPORT flag.
>> qtbase: Set qpa based in WAYLAND_SUPPORT flag.
>> branding-processor-sdk: Add processor-sdk brand.
>>=20
>> .../conf/distro/include/arago-prefs.inc            |    2 ++
>> .../conf/distro/include/branding-processor-sdk.inc |   34 ++++++++++++++=
++++++
>> .../packagegroups/packagegroup-arago-qte.bb        |    4 +--
>> .../packagegroup-arago-tisdk-graphics.bb           |    4 +--
>> .../packagegroups/packagegroup-arago-tisdk-qte.bb  |    4 +--
>> .../packagegroups/packagegroup-linaro-tc-test.bb   |    5 +--
>> meta-arago-distro/recipes-qt/qt5/qtbase/qt_env.sh  |    1 -
>> .../recipes-qt/qt5/qtbase_5.4.1.bbappend           |    9 ++++--
>> 8 files changed, 51 insertions(+), 12 deletions(-) create mode 100644=20
>> meta-arago-distro/conf/distro/include/branding-processor-sdk.inc
>>=20
>> --
>> 1.7.9.5
>>=20
>> _______________________________________________
>> meta-arago mailing list
>> meta-arago@arago-project.org
>> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

