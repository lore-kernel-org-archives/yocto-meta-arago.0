Return-Path: <vchengalvala@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by arago-project.org (Postfix) with ESMTPS id 13F3352A3A
	for <meta-arago@arago-project.org>;
	Thu, 12 Nov 2015 17:11:54 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id tACHBrRU008576
	for <meta-arago@arago-project.org>; Thu, 12 Nov 2015 11:11:53 -0600
Received: from DLEE70.ent.ti.com (dlemailx.itg.ti.com [157.170.170.113])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id tACHBreK032125
	for <meta-arago@arago-project.org>; Thu, 12 Nov 2015 11:11:53 -0600
Received: from DFLE08.ent.ti.com ([fe80::187f:8c86:2b7:ef9f]) by
	DLEE70.ent.ti.com ([fe80::c4c6:f618:54e7:ad11%28]) with mapi id
	14.03.0224.002; Thu, 12 Nov 2015 11:11:53 -0600
From: "Chengalvala, Vivek" <vchengalvala@ti.com>
To: "Stiffler, Jacob" <j-stiffler@ti.com>, "Dmytriyenko, Denys" <denys@ti.com>
Thread-Topic: [meta-arago] [PATCH] nativesdk-qtbase: drop locally applied
	patch that was upstreamed
Thread-Index: AQHRHWsC7+aGNCrndkW3P+Ev2lZhL56YnodA
Date: Thu, 12 Nov 2015 17:11:53 +0000
Deferred-Delivery: Thu, 12 Nov 2015 17:11:00 +0000
Message-ID: <FCB36D0BED1F0D4EA8E6242507E4245B0CB0201E@DFLE08.ent.ti.com>
References: <1447293885-4222-1-git-send-email-denis@denix.org>
	<5644AA40.5030507@ti.com> <20151112164458.GQ3272@edge>
	<5644C498.7090402@ti.com>
In-Reply-To: <5644C498.7090402@ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [157.170.170.90]
MIME-Version: 1.0
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Subject: Re: [PATCH] nativesdk-qtbase: drop locally applied patch that was upstreamed
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
X-List-Received-Date: Thu, 12 Nov 2015 17:11:54 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

The commit message from when the qt5 version was pinned says " arago-fido-c=
onfig: temporarily pin meta-qt5 to avoid breaking qtwebkit". Is that resolv=
ed?


-----Original Message-----
From: meta-arago-bounces@arago-project.org [mailto:meta-arago-bounces@arago=
-project.org] On Behalf Of Stiffler, Jacob
Sent: Thursday, November 12, 2015 11:56 AM
To: Dmytriyenko, Denys
Cc: meta-arago@arago-project.org
Subject: Re: [meta-arago] [PATCH] nativesdk-qtbase: drop locally applied pa=
tch that was upstreamed

No reason other than following coresdk.

Do you plan on updating the arago-fido-config.txt to use the tip of the mas=
ter branch on meta-qt5?

On 11/12/2015 11:44 AM, Denys Dmytriyenko wrote:
> Yeah, I meant to un-pin meta-qt5 some time ago right after 2015.01.=20
> Any particular reason you want it pinned now?
>
>
> On Thu, Nov 12, 2015 at 10:03:28AM -0500, Jacob Stiffler wrote:
>> In our configs, we have the meta-qt5 layer frozen at=20
>> 97ce05c0b2a81f05388d7f727741529fb9177775.
>>
>> How will we get this upstream patch?
>>
>> Thanks,
>> Jake
>>
>> On 11/11/2015 9:04 PM, Denys Dmytriyenko wrote:
>>> From: Denys Dmytriyenko <denys@ti.com>
>>>
>>> Signed-off-by: Denys Dmytriyenko <denys@ti.com>
>>> ---
>>>   ...xpand-path-increase-change-to-2-more-path.patch | 28 -------------=
---------
>>>   .../recipes-qt/qt5/nativesdk-qtbase_%.bbappend     |  5 ----
>>>   2 files changed, 33 deletions(-)
>>>   delete mode 100644 meta-arago-distro/recipes-qt/qt5/nativesdk-qtbase/=
0001-configure-expand-path-increase-change-to-2-more-path.patch
>>>   delete mode 100644=20
>>> meta-arago-distro/recipes-qt/qt5/nativesdk-qtbase_%.bbappend
>>>
>>> diff --git=20
>>> a/meta-arago-distro/recipes-qt/qt5/nativesdk-qtbase/0001-configure-e
>>> xpand-path-increase-change-to-2-more-path.patch=20
>>> b/meta-arago-distro/recipes-qt/qt5/nativesdk-qtbase/0001-configure-e
>>> xpand-path-increase-change-to-2-more-path.patch
>>> deleted file mode 100644
>>> index fc54c64..0000000
>>> ---=20
>>> a/meta-arago-distro/recipes-qt/qt5/nativesdk-qtbase/0001-configure-e
>>> xpand-path-increase-change-to-2-more-path.patch
>>> +++ /dev/null
>>> @@ -1,28 +0,0 @@
>>> -From cfa358e04b9e7c66d59db3000b2a2ab2ebf543c8 Mon Sep 17 00:00:00=20
>>> 2001
>>> -From: Denys Dmytriyenko <denys@ti.com>
>>> -Date: Tue, 25 Aug 2015 11:26:48 -0400
>>> -Subject: [PATCH] configure: expand path increase change to 2 more=20
>>> paths
>>> -
>>> -Signed-off-by: Denys Dmytriyenko <denys@ti.com>
>>> ----
>>> - configure | 4 ++--
>>> - 1 file changed, 2 insertions(+), 2 deletions(-)
>>> -
>>> -diff --git a/configure b/configure
>>> -index bea14af..fe18487 100755
>>> ---- a/configure
>>> -+++ b/configure
>>> -@@ -3853,8 +3853,8 @@ static const char qt_configure_installation     =
     [12+11]    =3D "qt_instdate=3D2
>>> - /* Installation Info */
>>> - static const char qt_configure_prefix_path_str       [512 + 12] =3D "=
qt_prfxpath=3D$QT_INSTALL_PREFIX";
>>> - #ifdef QT_BUILD_QMAKE
>>> --static const char qt_configure_ext_prefix_path_str   [256 + 12] =3D "=
qt_epfxpath=3D$QT_EXT_PREFIX";
>>> --static const char qt_configure_host_prefix_path_str  [256 + 12] =3D=20
>>> "qt_hpfxpath=3D$QT_HOST_PREFIX";
>>> -+static const char qt_configure_ext_prefix_path_str   [512 + 12] =3D "=
qt_epfxpath=3D$QT_EXT_PREFIX";
>>> -+static const char qt_configure_host_prefix_path_str  [512 + 12] =3D=20
>>> -+"qt_hpfxpath=3D$QT_HOST_PREFIX";
>>> - #endif
>>> -
>>> - static const short qt_configure_str_offsets[] =3D {
>>> ---
>>> -2.2.0
>>> -
>>> diff --git=20
>>> a/meta-arago-distro/recipes-qt/qt5/nativesdk-qtbase_%.bbappend=20
>>> b/meta-arago-distro/recipes-qt/qt5/nativesdk-qtbase_%.bbappend
>>> deleted file mode 100644
>>> index 39f739a..0000000
>>> --- a/meta-arago-distro/recipes-qt/qt5/nativesdk-qtbase_%.bbappend
>>> +++ /dev/null
>>> @@ -1,5 +0,0 @@
>>> -FILESEXTRAPATHS_prepend :=3D "${THISDIR}/${PN}:"
>>> -
>>> -SRC_URI +=3D "file://0001-configure-expand-path-increase-change-to-2-m=
ore-path.patch"
>>> -
>>> -PR_append =3D "-arago0"
>> _______________________________________________
>> meta-arago mailing list
>> meta-arago@arago-project.org
>> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

_______________________________________________
meta-arago mailing list
meta-arago@arago-project.org
http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

