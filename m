Return-Path: <chase.maupin@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id 45AE352998
	for <meta-arago@arago-project.org>;
	Thu, 24 Apr 2014 14:55:46 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id s3OEtjYZ017933;
	Thu, 24 Apr 2014 09:55:45 -0500
Received: from DLEE70.ent.ti.com (dlemailx.itg.ti.com [157.170.170.113])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id s3OEtj1r006971;
	Thu, 24 Apr 2014 09:55:45 -0500
Received: from DLEE11.ent.ti.com ([fe80::40fa:b936:da7c:d113]) by
	DLEE70.ent.ti.com ([fe80::c4c6:f618:54e7:ad11%28]) with mapi id
	14.03.0174.001; Thu, 24 Apr 2014 09:55:45 -0500
From: "Maupin, Chase" <chase.maupin@ti.com>
To: "Dmytriyenko, Denys" <denys@ti.com>
Thread-Topic: [meta-arago] [PATCH 8/8] linux-ti-staging: disable AUTOREV
Thread-Index: AQHPX1+8LSrlkTUj+0OdfN/dCVB47JsgtMSAgAB6mID//6xR0A==
Date: Thu, 24 Apr 2014 14:55:44 +0000
Message-ID: <7D46E86EC0A8354091174257B2FED1015CFB2FD5@DLEE11.ent.ti.com>
References: <1398304280-15426-1-git-send-email-denis@denix.org>
	<1398304280-15426-8-git-send-email-denis@denix.org>
	<7D46E86EC0A8354091174257B2FED1015CFB2056@DLEE11.ent.ti.com>
	<20140424145451.GI18053@edge>
In-Reply-To: <20140424145451.GI18053@edge>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.247.5.50]
MIME-Version: 1.0
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Subject: Re: [PATCH 8/8] linux-ti-staging: disable AUTOREV
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
X-List-Received-Date: Thu, 24 Apr 2014 14:55:46 -0000
Content-Language: en-US
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

>-----Original Message-----
>From: Dmytriyenko, Denys
>Sent: Thursday, April 24, 2014 9:55 AM
>To: Maupin, Chase
>Cc: Denys Dmytriyenko; meta-arago@arago-project.org
>Subject: Re: [meta-arago] [PATCH 8/8] linux-ti-staging: disable
>AUTOREV
>
>On Thu, Apr 24, 2014 at 12:36:35PM +0000, Maupin, Chase wrote:
>> >-----Original Message-----
>> >From: meta-arago-bounces@arago-project.org [mailto:meta-arago-
>> >bounces@arago-project.org] On Behalf Of Denys Dmytriyenko
>> >Sent: Wednesday, April 23, 2014 8:51 PM
>> >To: meta-arago@arago-project.org
>> >Subject: [meta-arago] [PATCH 8/8] linux-ti-staging: disable
>> >AUTOREV
>> >
>> >From: Denys Dmytriyenko <denys@ti.com>
>> >
>> >Signed-off-by: Denys Dmytriyenko <denys@ti.com>
>> >---
>> > meta-arago-distro/recipes-kernel/linux/linux-ti-
>> >staging_3.12.bbappend | 4 +---
>> > 1 file changed, 1 insertion(+), 3 deletions(-)
>> >
>> >diff --git a/meta-arago-distro/recipes-kernel/linux/linux-ti-
>> >staging_3.12.bbappend b/meta-arago-distro/recipes-
>> >kernel/linux/linux-ti-staging_3.12.bbappend
>> >index f99482c..2a6f090 100644
>> >--- a/meta-arago-distro/recipes-kernel/linux/linux-ti-
>> >staging_3.12.bbappend
>> >+++ b/meta-arago-distro/recipes-kernel/linux/linux-ti-
>> >staging_3.12.bbappend
>> >@@ -1,11 +1,9 @@
>> >-MACHINE_KERNEL_PR_append =3D "-arago0"
>> >+MACHINE_KERNEL_PR_append =3D "-arago1"
>> >
>> > FILESEXTRAPATHS_prepend :=3D "${THISDIR}/${P}:"
>> >
>> > require copy-defconfig.inc
>> >
>> >-SRCREV =3D "${AUTOREV}"
>>
>> Any reason not to autorev to pickup the latest stable releases?
>
>AUTOREVs are evil!

:)

>
>It just pissed me off yesterday, when I was debugging something
>and it decided
>to trigger almost a complete rebuild, because kernel just got
>updated...

OK.  Let's not forget to bump regularly then.

>
>
>> > KERNEL_LOCALVERSION =3D "-g${@d.getVar('SRCPV',
>> >True).partition('+')[2][0:7]}"
>> >
>> > kernel_do_configure_prepend() {
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

