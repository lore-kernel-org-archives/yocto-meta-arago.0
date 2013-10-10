Return-Path: <chase.maupin@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by arago-project.org (Postfix) with ESMTPS id ABBA6529B0
	for <meta-arago@arago-project.org>;
	Thu, 10 Oct 2013 15:46:51 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id r9AFkpdw012771
	for <meta-arago@arago-project.org>; Thu, 10 Oct 2013 10:46:51 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id r9AFkpl0008882
	for <meta-arago@arago-project.org>; Thu, 10 Oct 2013 10:46:51 -0500
Received: from DLEE11.ent.ti.com ([fe80::40fa:b936:da7c:d113]) by
	DFLE72.ent.ti.com ([fe80::e5e2:bab6:34dc:a483%28]) with mapi id
	14.02.0342.003; Thu, 10 Oct 2013 10:46:51 -0500
From: "Maupin, Chase" <chase.maupin@ti.com>
To: "Monk, Roger" <r-monk@ti.com>, "meta-arago@arago-project.org"
	<meta-arago@arago-project.org>
Thread-Topic: [meta-arago] [PATCHv2 03/11] ti-connectivity/wl18xx-firmware:
	Apply	Workaround PD Recovery Fix
Thread-Index: AQHOxcn66g6Tvyey6E27rGaCuSbk+pnuCYmAgABU1oD//7XW8A==
Date: Thu, 10 Oct 2013 15:46:50 +0000
Message-ID: <7D46E86EC0A8354091174257B2FED1015979BF56@DLEE11.ent.ti.com>
References: <1381420942-16810-1-git-send-email-r-monk@ti.com>
	<1381420942-16810-4-git-send-email-r-monk@ti.com>
	<7D46E86EC0A8354091174257B2FED1015979B980@DLEE11.ent.ti.com>
	<4C82F39BABFE6A429733A300DEBF52240BFFB9DB@DNCE05.ent.ti.com>
In-Reply-To: <4C82F39BABFE6A429733A300DEBF52240BFFB9DB@DNCE05.ent.ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [157.170.170.90]
MIME-Version: 1.0
Subject: Re: [PATCHv2 03/11] ti-connectivity/wl18xx-firmware: Apply	Workaround PD Recovery Fix
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
X-List-Received-Date: Thu, 10 Oct 2013 15:46:51 -0000
Content-Language: en-US
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

>-----Original Message-----
>From: Monk, Roger
>Sent: Thursday, October 10, 2013 10:12 AM
>To: Maupin, Chase; meta-arago@arago-project.org
>Subject: RE: [meta-arago] [PATCHv2 03/11] ti-connectivity/wl18xx-
>firmware: Apply Workaround PD Recovery Fix
>
>On Thu, Oct 10, 2013 at 16:09:11, Maupin, Chase wrote:
>> Apply Workaround PD Recovery Fix
>>
>> >-----Original Message-----
>> >From: meta-arago-bounces@arago-project.org [mailto:meta-arago-
>> >bounces@arago-project.org] On Behalf Of Monk, Roger
>> >Sent: Thursday, October 10, 2013 11:02 AM
>> >To: meta-arago@arago-project.org
>> >Subject: [meta-arago] [PATCHv2 03/11] ti-connectivity/wl18xx-
>> >firmware: Apply Workaround PD Recovery Fix
>> >
>> >   * Update to custom firmware version (ol_r8.a7.02_pd_fix) to
>fix
>> >     power-down recovery seen on some boards/ap configurations
>> >
>> >Signed-off-by: Roger Monk <r-monk@ti.com>
>> >---
>> > .../wl18xx-firmware/wl18xx-firmware_r8.a7.02.bb    |    6 +++-
>--
>> > 1 file changed, 3 insertions(+), 3 deletions(-)
>> >
>> >diff --git a/meta-arago-extras/recipes-bsp/wl18xx-
>firmware/wl18xx-
>> >firmware_r8.a7.02.bb b/meta-arago-extras/recipes-bsp/wl18xx-
>> >firmware/wl18xx-firmware_r8.a7.02.bb
>> >index f41edd5..0f8dd9d 100644
>> >--- a/meta-arago-extras/recipes-bsp/wl18xx-firmware/wl18xx-
>> >firmware_r8.a7.02.bb
>> >+++ b/meta-arago-extras/recipes-bsp/wl18xx-firmware/wl18xx-
>> >firmware_r8.a7.02.bb
>> >@@ -4,7 +4,7 @@ LIC_FILES_CHKSUM =3D
>> >"file://LICENCE;md5=3Db28122fd6678e89fd3a8d4bc80922969"
>> >
>> > PACKAGE_ARCH =3D "all"
>> >
>> >-PR =3D "r1+gitr${SRCPV}"
>> >+PR =3D "r2+gitr${SRCPV}"
>> >
>> > PROVIDES +=3D "wl12xx-firmware"
>> > RPROVIDES_${PN} +=3D "wl12xx-firmware"
>> >@@ -13,8 +13,8 @@ RCONFLICTS_${PN} +=3D "wl12xx-firmware"
>> >
>> > COMPATIBLE_MACHINE =3D "(omap-a15)"
>> >
>> >-# Tag: ol_r8.a7.02
>> >-SRCREV =3D "f3fe754d585f9af821c244a606761c5f69278ed6"
>> >+# Tag: ol_r8.a7.02_pd_fix (workaround powerdown recovery fix)
>SRCREV
>> >+=3D "3fb3bd321f89f9910f25d3006668b831df944a7f"
>> > SRC_URI =3D "git://github.com/TI-
>>
>> Why not squash this with patch 02/11?  Do you forsee needing to
>revert
>> or remove this in the future?
>
>I was in two minds about this one.  I wanted to be able to bisect
>if necessary back the official unpatched a7.02 firmware.  I can
>squash If you think important, but I'd personally prefer to keep
>the history.

Good enough reasoning for me.

>
>>
>> >OpenLink/wl18xx_fw.git;protocol=3Dgit \
>> >            file://Makefile \
>> >           "
>> >--
>> >1.7.9.5
>> >
>> >_______________________________________________
>> >meta-arago mailing list
>> >meta-arago@arago-project.org
>> >http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago
>


