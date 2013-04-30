Return-Path: <fcooper@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by arago-project.org (Postfix) with ESMTPS id 9421C52A3E
	for <meta-arago@arago-project.org>;
	Tue, 30 Apr 2013 12:20:26 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id r3UCKPCw010683
	for <meta-arago@arago-project.org>; Tue, 30 Apr 2013 07:20:25 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id r3UCKP6r019926
	for <meta-arago@arago-project.org>; Tue, 30 Apr 2013 07:20:25 -0500
Received: from DLEE74.ent.ti.com (157.170.170.8) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server (TLS) id 14.2.342.3;
	Tue, 30 Apr 2013 07:20:25 -0500
Received: from DFLE08.ent.ti.com ([fe80::187f:8c86:2b7:ef9f]) by
	DLEE74.ent.ti.com ([fe80::a0f1:125b:e7e3:7ed8%18]) with mapi id
	14.01.0323.003; Tue, 30 Apr 2013 07:20:25 -0500
From: "Cooper Jr., Franklin" <fcooper@ti.com>
To: "Reizer, Eyal" <eyalr@ti.com>
Thread-Topic: [meta-arago] [PATCH v3 1/9] wlconf: configuration utility for
	wilink8 wireless driver
Thread-Index: AQHOPllFKSFZij3IpEiKATxOZMLFXJjjhIPggACQr4CAAOI6wIAJXyIggABm7qQ=
Date: Tue, 30 Apr 2013 12:20:24 +0000
Message-ID: <E6295660-AB91-4931-8F91-7ECACB239F85@ti.com>
References: <1366524535-13207-1-git-send-email-eyalr@ti.com>
	<8665E2433BC68541A24DFFCA87B70F5B17C74011@DNCE04.ent.ti.com>
	<20130423193529.GG11449@edge>
	,<8665E2433BC68541A24DFFCA87B70F5B17C7B2A7@DNCE04.ent.ti.com>
In-Reply-To: <8665E2433BC68541A24DFFCA87B70F5B17C7B2A7@DNCE04.ent.ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
MIME-Version: 1.0
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>, "Zarmi,
	Ilan" <ilanz@ti.com>, "Sasover, Inon" <inon@ti.com>
Subject: Re: [PATCH v3 1/9] wlconf: configuration utility for wilink8 wireless driver
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
X-List-Received-Date: Tue, 30 Apr 2013 12:20:27 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Your patch set was committed April 24th.

On Apr 30, 2013, at 1:14 AM, "Reizer, Eyal" <eyalr@ti.com> wrote:

> Hi Denys,
>=20
> Ping again on this set of wilink8 recipes.
>=20
> Best Regards,
> Eyal Reizer
>=20
>> -----Original Message-----
>> From: Reizer, Eyal
>> Sent: Wednesday, April 24, 2013 10:06 AM
>> To: Dmytriyenko, Denys
>> Cc: meta-arago@arago-project.org
>> Subject: RE: [meta-arago] [PATCH v3 1/9] wlconf: configuration utility
>> for wilink8 wireless driver
>>=20
>> Denys,
>>=20
>> Thanks for the update.
>> Please let me know in case you need my help.
>>=20
>> Best Regards,
>> Eyal
>>=20
>>> -----Original Message-----
>>> From: Dmytriyenko, Denys
>>> Sent: Tuesday, April 23, 2013 10:35 PM
>>> To: Reizer, Eyal
>>> Cc: meta-arago@arago-project.org
>>> Subject: Re: [meta-arago] [PATCH v3 1/9] wlconf: configuration
>> utility
>>> for wilink8 wireless driver
>>>=20
>>> Eyal,
>>>=20
>>> Not yet - it failed to apply wpa-supplicant patch when I tried
>>> yesterday. I may need to massage the patches, once I have time...
>>>=20
>>> --
>>> Denys
>>>=20
>>>=20
>>> On Tue, Apr 23, 2013 at 08:58:33AM +0000, Reizer, Eyal wrote:
>>>> Ping on this set of wilink8 related patches.
>>>>=20
>>>> Regards,
>>>> Eyal
>>>>=20
>>>>> -----Original Message-----
>>>>> From: Reizer, Eyal
>>>>> Sent: Sunday, April 21, 2013 9:09 AM
>>>>> To: meta-arago@arago-project.org
>>>>> Cc: Reizer, Eyal
>>>>> Subject: [PATCH v3 1/9] wlconf: configuration utility for wilink8
>>>>> wireless driver
>>>>>=20
>>>>> Add a recipe for building and installing the wlconf configuration
>>>>> utility for TI Wilink8 family of chips.
>>>>>=20
>>>>> Signed-off-by: Eyal Reizer <eyalr@ti.com>
>>>>> ---
>>>>> Changes in v2:
>>>>> * Rename to use an actual release name instead of _git
>>>>> * Line indentation fixes
>>>>> Changes in v3:
>>>>> * Drop the PV assignment
>>>>>=20
>>>>> .../recipes-connectivity/wlconf/wlconf_r8.a6.01.bb |   36
>>>>> ++++++++++++++++++++
>>>>> 1 file changed, 36 insertions(+)
>>>>> create mode 100644 meta-arago-extras/recipes-
>>>>> connectivity/wlconf/wlconf_r8.a6.01.bb
>>>>>=20
>>>>> diff --git a/meta-arago-extras/recipes-
>>>>> connectivity/wlconf/wlconf_r8.a6.01.bb
>>>>> b/meta-arago-extras/recipes-
>>>>> connectivity/wlconf/wlconf_r8.a6.01.bb
>>>>> new file mode 100644
>>>>> index 0000000..ade2e84
>>>>> --- /dev/null
>>>>> +++ b/meta-arago-extras/recipes-
>>> connectivity/wlconf/wlconf_r8.a6.01.bb
>>>>> @@ -0,0 +1,36 @@
>>>>> +DESCRIPTION =3D "Configuration utility for TI wireless drivers"
>>>>> +LICENSE =3D "GPLv2"
>>>>> +LIC_FILES_CHKSUM =3D
>> "file://README;beginline=3D1;endline=3D21;md5=3Dadc05a1903d3f107f85c9032=
8e3a
>>> 9
>>>>> 438"
>>>>> +
>>>>> +PR =3D"r1"
>>>>> +PR_append =3D "+gitr${SRCREV}"
>>>>> +
>>>>> +SRCREV =3D "ol_r8.a6.01"
>>>>> +SRC_URI =3D "git://github.com/TI-OpenLink/18xx-ti-utils.git"
>>>>> +
>>>>> +S =3D "${WORKDIR}/git/wlconf"
>>>>> +
>>>>> +EXTRA_OEMAKE =3D "CC=3D${TARGET_PREFIX}gcc"
>>>>> +
>>>>> +do_install() {
>>>>> +    install -d ${D}${bindir}
>>>>> +    install -d ${D}${bindir}/wlconf/
>>>>> +    install -d ${D}${bindir}/wlconf/official_inis
>>>>> +
>>>>> +    install -m 0755 wlconf ${D}${bindir}/wlconf/
>>>>> +    install -m 0755 dictionary.txt ${D}${bindir}/wlconf/
>>>>> +    install -m 0755 struct.bin ${D}${bindir}/wlconf/
>>>>> +    install -m 0755 wl18xx-conf-default.bin
>> ${D}${bindir}/wlconf/
>>>>> +    install -m 0755 README ${D}${bindir}/wlconf/
>>>>> +    install -m 0755 example.conf ${D}${bindir}/wlconf/
>>>>> +    install -m 0755 example.ini ${D}${bindir}/wlconf/
>>>>> +    install -m 0755 ${S}/official_inis/*
>>>>> +            ${D}${bindir}/wlconf/official_inis/
>>>>> +}
>>>>> +
>>>>> +FILES_${PN} +=3D " \
>>>>> +    ${bindir}/wlconf \
>>>>> +    ${bindir}/wlconf/official_inis \ "
>>>>> +
>>>>> +FILES_${PN}-dbg +=3D "${bindir}/wlconf/.debug"
>>>>> --
>>>>> 1.7.9.5
>>>>=20
>>>> _______________________________________________
>>>> meta-arago mailing list
>>>> meta-arago@arago-project.org
>>>> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

