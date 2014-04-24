Return-Path: <chase.maupin@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by arago-project.org (Postfix) with ESMTPS id 6DFC352974
	for <meta-arago@arago-project.org>;
	Thu, 24 Apr 2014 14:52:16 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id s3OEqFuL025541;
	Thu, 24 Apr 2014 09:52:15 -0500
Received: from DLEE70.ent.ti.com (dlemailx.itg.ti.com [157.170.170.113])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id s3OEqFaF016604;
	Thu, 24 Apr 2014 09:52:15 -0500
Received: from DLEE11.ent.ti.com ([fe80::40fa:b936:da7c:d113]) by
	DLEE70.ent.ti.com ([fe80::c4c6:f618:54e7:ad11%28]) with mapi id
	14.03.0174.001; Thu, 24 Apr 2014 09:52:15 -0500
From: "Maupin, Chase" <chase.maupin@ti.com>
To: "Dmytriyenko, Denys" <denys@ti.com>
Thread-Topic: [meta-arago] [PATCH 3/8] qtbase: move setting PACKAGECONFIG
	flags	to arago.conf
Thread-Index: AQHPX1+3WlFDR2nMskC4H6WqKoE6eJsgs9nwgAB6boD//6xmAA==
Date: Thu, 24 Apr 2014 14:52:14 +0000
Message-ID: <7D46E86EC0A8354091174257B2FED1015CFB2F3C@DLEE11.ent.ti.com>
References: <1398304280-15426-1-git-send-email-denis@denix.org>
	<1398304280-15426-3-git-send-email-denis@denix.org>
	<7D46E86EC0A8354091174257B2FED1015CFB1F10@DLEE11.ent.ti.com>
	<20140424145059.GH18053@edge>
In-Reply-To: <20140424145059.GH18053@edge>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.247.5.50]
MIME-Version: 1.0
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Subject: Re: [PATCH 3/8] qtbase: move setting PACKAGECONFIG flags	to arago.conf
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
X-List-Received-Date: Thu, 24 Apr 2014 14:52:16 -0000
Content-Language: en-US
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable


>-----Original Message-----
>From: Dmytriyenko, Denys
>Sent: Thursday, April 24, 2014 9:51 AM
>To: Maupin, Chase
>Cc: Denys Dmytriyenko; meta-arago@arago-project.org
>Subject: Re: [meta-arago] [PATCH 3/8] qtbase: move setting
>PACKAGECONFIG flags to arago.conf
>
>On Thu, Apr 24, 2014 at 12:33:21PM +0000, Maupin, Chase wrote:
>>
>> >-----Original Message-----
>> >From: meta-arago-bounces@arago-project.org [mailto:meta-arago-
>> >bounces@arago-project.org] On Behalf Of Denys Dmytriyenko
>> >Sent: Wednesday, April 23, 2014 8:51 PM
>> >To: meta-arago@arago-project.org
>> >Subject: [meta-arago] [PATCH 3/8] qtbase: move setting
>> >PACKAGECONFIG flags to arago.conf
>> >
>> >From: Denys Dmytriyenko <denys@ti.com>
>> >
>> >Signed-off-by: Denys Dmytriyenko <denys@ti.com>
>> >---
>> > meta-arago-distro/conf/distro/arago.conf               | 5
>+++++
>> > meta-arago-distro/recipes-qt/qt5/qtbase_5.2.0.bbappend | 4 +--
>-
>> > 2 files changed, 6 insertions(+), 3 deletions(-)
>> >
>> >diff --git a/meta-arago-distro/conf/distro/arago.conf b/meta-
>> >arago-distro/conf/distro/arago.conf
>> >index 1c8c572..7bd1de2 100644
>> >--- a/meta-arago-distro/conf/distro/arago.conf
>> >+++ b/meta-arago-distro/conf/distro/arago.conf
>> >@@ -26,6 +26,11 @@ DISTRO_FEATURES =3D "alsa argp bluetooth ext2
>> >irda largefile pcmcia usbgadget usbh
>> > DISTRO_FEATURES +=3D "opengl"
>> > PACKAGECONFIG_pn-weston =3D "kms fbdev"
>> >
>> >+# Configure Qt5 flags (GLES is disabled for now)
>> >+#PACKAGECONFIG_GL_pn-qtbase =3D "gles2 linuxfb"
>> >+PACKAGECONFIG_GL_pn-qtbase =3D "linuxfb"
>> >+PACKAGECONFIG_DISTRO_pn-qtbase =3D "icu"
>> >+
>>
>> Can you explain this a bit more?  What is the advantage of
>moving it to the
>> config vs in the recipe?
>
>Most of PACKAGECONFIG flags are set automatically based on
>DISTRO_FEATURES,
>but not all of them. The remainder can still be thought as distro-
>specific.
>The big thing is to set those up centrally w/o creating
>unnecessary bbappends.
>Of course, in this case we still need bbappend for qtbase for
>patches, but I
>just wanted to start consolidating different PACKAGEGROUPS in one
>place, like
>I did with Weston above...

OK, makes sense.  And the branding files would still allow for overrides of=
 this?

>
>
>> > # ARM9 is not supported by the Linaro toolchain so default
>back
>> >to the Arago
>> > # toolchain for ARM9 based SOCs.
>> > TC_SANE_DEFAULT :=3D
>>
>>"${@bb.utils.contains('SOC_FAMILY','omapl138','arago','linaro',d)
>}
>> >"
>> >diff --git a/meta-arago-distro/recipes-
>> >qt/qt5/qtbase_5.2.0.bbappend b/meta-arago-distro/recipes-
>> >qt/qt5/qtbase_5.2.0.bbappend
>> >index d35a948..2c0a52d 100644
>> >--- a/meta-arago-distro/recipes-qt/qt5/qtbase_5.2.0.bbappend
>> >+++ b/meta-arago-distro/recipes-qt/qt5/qtbase_5.2.0.bbappend
>> >@@ -1,10 +1,8 @@
>> > FILESEXTRAPATHS_prepend :=3D "${THISDIR}/${PN}:"
>> >
>> >-PACKAGECONFIG_GL =3D "icu linuxfb"
>> >-
>> > SRC_URI +=3D " \
>> > 	file://0001-qeglfswindow.cpp.patch \
>> > 	file://0002-qeglfswindow.cpp.patch \
>> > "
>> >
>> >-PR_append =3D "-arago0"
>> >+PR_append =3D "-arago1"
>> >--
>> >1.9.2
>> >
>> >_______________________________________________
>> >meta-arago mailing list
>> >meta-arago@arago-project.org
>> >http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago
>> _______________________________________________
>> meta-arago mailing list
>> meta-arago@arago-project.org
>> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

