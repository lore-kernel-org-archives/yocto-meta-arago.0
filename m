Return-Path: <chase.maupin@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by arago-project.org (Postfix) with ESMTPS id 22A2A529BD
	for <meta-arago@arago-project.org>;
	Tue,  4 Feb 2014 13:16:49 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id s14DGkZb025779
	for <meta-arago@arago-project.org>; Tue, 4 Feb 2014 07:16:46 -0600
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id s14DGkaL014054
	for <meta-arago@arago-project.org>; Tue, 4 Feb 2014 07:16:46 -0600
Received: from DLEE11.ent.ti.com ([fe80::40fa:b936:da7c:d113]) by
	DFLE73.ent.ti.com ([fe80::c9be:a3a9:7cd8:c8b3%28]) with mapi id
	14.02.0342.003; Tue, 4 Feb 2014 07:16:45 -0600
From: "Maupin, Chase" <chase.maupin@ti.com>
To: "Hingolikar, Mrinmayee" <mrinmayee@ti.com>, "Dmytriyenko, Denys"
	<denys@ti.com>, "Etheridge, Darren" <detheridge@ti.com>
Thread-Topic: [meta-arago] [PATCH 1/2] branding-glsdk: pin to GLSDK libdrm
	version
Thread-Index: AQHPHr1pNZDqcRZHD0KjvZI5nuKsW5qjwuKAgAEe7jCAADcq8A==
Date: Tue, 4 Feb 2014 13:16:45 +0000
Message-ID: <7D46E86EC0A8354091174257B2FED1015994658F@DLEE11.ent.ti.com>
References: <1391197703-29424-1-git-send-email-chase.maupin@ti.com>
	<7D46E86EC0A8354091174257B2FED1015993D972@DLEE11.ent.ti.com>
	<20140204005129.GE18784@edge>
	<CF956B779D819D41BBC043B7082161D547CE0C@DBDE04.ent.ti.com>
In-Reply-To: <CF956B779D819D41BBC043B7082161D547CE0C@DBDE04.ent.ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [157.170.170.90]
MIME-Version: 1.0
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Subject: Re: [PATCH 1/2] branding-glsdk: pin to GLSDK libdrm version
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
X-List-Received-Date: Tue, 04 Feb 2014 13:16:56 -0000
Content-Language: en-US
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

Mrinmayee,

What is in your 2.4.41 version that makes you need to pin there.  I ask bec=
ause Darren has reported needing a newer version to work properly with devi=
ces like DRA7xx.

>-----Original Message-----
>From: Hingolikar, Mrinmayee
>Sent: Tuesday, February 04, 2014 5:05 AM
>To: Dmytriyenko, Denys; Maupin, Chase
>Cc: meta-arago@arago-project.org
>Subject: RE: [meta-arago] [PATCH 1/2] branding-glsdk: pin to GLSDK
>libdrm version
>
>Hi all,
>
>The libdrm in GLSDK is based on the 2.4.41 version from upstream.
>A preferred version is required since a 2.4.42 version is present
>in oe-core.
>
>
>Regards,
>Mrinmayee
>
>> -----Original Message-----
>> From: Dmytriyenko, Denys
>> Sent: Tuesday, February 04, 2014 6:21 AM
>> To: Maupin, Chase
>> Cc: meta-arago@arago-project.org; Hingolikar, Mrinmayee
>> Subject: Re: [meta-arago] [PATCH 1/2] branding-glsdk: pin to
>GLSDK
>> libdrm version
>>
>> Ping
>>
>> On Fri, Jan 31, 2014 at 07:50:39PM +0000, Maupin, Chase wrote:
>> > Mrinmayee,
>> >
>> > Can you comment on the below need for 2.4.41?
>> >
>> > >-----Original Message-----
>> > >From: Maupin, Chase
>> > >Sent: Friday, January 31, 2014 1:48 PM
>> > >To: meta-arago@arago-project.org
>> > >Cc: Maupin, Chase
>> > >Subject: [PATCH 1/2] branding-glsdk: pin to GLSDK libdrm
>version
>> > >
>> > >* The GLSDK prefers to use the 2.4.41 version of libdrm from
>> > >  meta-ti so pin that version in the branding file.
>> > >
>> > >Signed-off-by: Chase Maupin <chase.maupin@ti.com>
>> > >---
>> > > .../conf/distro/include/branding-glsdk.inc         |    4
>++++
>> > > 1 file changed, 4 insertions(+)
>> > >
>> > >diff --git a/meta-arago-distro/conf/distro/include/branding-
>> > >glsdk.inc b/meta-arago-distro/conf/distro/include/branding-
>> > >glsdk.inc
>> > >index d1c30f3..b33b21d 100644
>> > >--- a/meta-arago-distro/conf/distro/include/branding-
>glsdk.inc
>> > >+++ b/meta-arago-distro/conf/distro/include/branding-
>glsdk.inc
>> > >@@ -2,3 +2,7 @@
>> > >
>> > > # Use the SDK supported kernel and kernel version
>> > > PREFERRED_PROVIDER_virtual/kernel =3D "linux-ti-glsdk"
>> > >+
>> > >+# Set the PREFERRED_VERSION of libdrm to the glsdk version
>for
>> > >the
>> > >+# glsdk branded builds
>> > >+PREFERRED_VERSION_libdrm =3D "2.4.41"
>> > >--
>> > >1.7.9.5
>> >
>> > _______________________________________________
>> > meta-arago mailing list
>> > meta-arago@arago-project.org
>> > http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

