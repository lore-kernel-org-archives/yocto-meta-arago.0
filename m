Return-Path: <chase.maupin@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by arago-project.org (Postfix) with ESMTPS id D67CD52A61
	for <meta-arago@arago-project.org>;
	Fri, 28 Feb 2014 22:24:07 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id s1SMO7wZ022124
	for <meta-arago@arago-project.org>; Fri, 28 Feb 2014 16:24:07 -0600
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id s1SMO7YF002163
	for <meta-arago@arago-project.org>; Fri, 28 Feb 2014 16:24:07 -0600
Received: from DLEE11.ent.ti.com ([fe80::40fa:b936:da7c:d113]) by
	DFLE73.ent.ti.com ([fe80::c9be:a3a9:7cd8:c8b3%28]) with mapi id
	14.03.0174.001; Fri, 28 Feb 2014 16:24:06 -0600
From: "Maupin, Chase" <chase.maupin@ti.com>
To: "Dmytriyenko, Denys" <denys@ti.com>
Thread-Topic: [meta-arago] [PATCH 2/2] arago-prefs: set PREFERRED VERSION of
	libdrm to latest
Thread-Index: AQHPNMEz7FCckovxD0mpcKBm9Rw8cJrLPaAA
Date: Fri, 28 Feb 2014 22:24:05 +0000
Message-ID: <7D46E86EC0A8354091174257B2FED1015CEFEADE@DLEE11.ent.ti.com>
References: <1391197703-29424-1-git-send-email-chase.maupin@ti.com>
	<1391197703-29424-2-git-send-email-chase.maupin@ti.com>
	<20140228201025.GA22890@denix.org>
In-Reply-To: <20140228201025.GA22890@denix.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [157.170.170.90]
MIME-Version: 1.0
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Subject: Re: [PATCH 2/2] arago-prefs: set PREFERRED VERSION of libdrm to latest
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
X-List-Received-Date: Fri, 28 Feb 2014 22:24:08 -0000
Content-Language: en-US
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

>-----Original Message-----
>From: Dmytriyenko, Denys
>Sent: Friday, February 28, 2014 2:10 PM
>To: Maupin, Chase
>Cc: meta-arago@arago-project.org
>Subject: Re: [meta-arago] [PATCH 2/2] arago-prefs: set PREFERRED
>VERSION of libdrm to latest
>
>On Fri, Jan 31, 2014 at 01:48:23PM -0600, Chase Maupin wrote:
>> * Set the PREFERRED_VERSION of libdrm to the latest available in
>>   openembedded core by default.
>> * This will allow using a version of libdrm that will support
>>   the latest TI devices
>>
>> Signed-off-by: Chase Maupin <chase.maupin@ti.com>
>> ---
>>  .../conf/distro/include/arago-prefs.inc            |    3 +++
>>  1 file changed, 3 insertions(+)
>>
>> diff --git a/meta-arago-distro/conf/distro/include/arago-
>prefs.inc b/meta-arago-distro/conf/distro/include/arago-prefs.inc
>> index 20c6a63..e417585 100644
>> --- a/meta-arago-distro/conf/distro/include/arago-prefs.inc
>> +++ b/meta-arago-distro/conf/distro/include/arago-prefs.inc
>> @@ -4,6 +4,9 @@ include conf/distro/include/qt5-versions.inc
>>  # Use the latest version of ltp-ddt for kernel versions 3.8+
>>  PREFERRED_PROVIDER_ltp-ddt =3D "ltp-ddt"
>>
>> +# User the latest version of libdrm
>> +PREFERRED_VERSION_libdrm =3D "2.4.46"
>
>Was this meant for dora and up? As dylan only has 2.4.42 version
>in oe-core...
>Just noticed the warning about 2.4.46 not being available. Was
>this change
>required for our release and will it work with 2.4.42, which we
>end up
>building anyway?

Dora and up.  It was a nice to have, not a have to have.

>
>
>>  PREFERRED_PROVIDER_virtual/gettext =3D "gettext"
>>
>>  ARAGO_QT_PROVIDER =3D
>"${@base_contains('MACHINE_FEATURES','sgx','qt4-embedded-
>gles','qt4-embedded',d)}"
>> --
>> 1.7.9.5
>>
>> _______________________________________________
>> meta-arago mailing list
>> meta-arago@arago-project.org
>> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago
>>

