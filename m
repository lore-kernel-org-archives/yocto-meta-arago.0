Return-Path: <fcooper@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id C5B98529FF
	for <meta-arago@arago-project.org>;
	Wed, 22 Aug 2012 22:13:10 +0000 (UTC)
Received: from dlelxv30.itg.ti.com ([172.17.2.17])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id q7MMD9kN008008
	for <meta-arago@arago-project.org>; Wed, 22 Aug 2012 17:13:09 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dlelxv30.itg.ti.com (8.13.8/8.13.8) with ESMTP id q7MMD9PP017215
	for <meta-arago@arago-project.org>; Wed, 22 Aug 2012 17:13:09 -0500
Received: from DFLE09.ent.ti.com ([fe80::3103:58c3:47f:860b]) by
	DFLE73.ent.ti.com ([fe80::86e:fab6:cd95:e158%28]) with mapi id
	14.01.0323.003; Wed, 22 Aug 2012 17:13:09 -0500
From: "Cooper Jr., Franklin" <fcooper@ti.com>
To: "Dmytriyenko, Denys" <denys@ti.com>
Thread-Topic: [meta-arago] [meta-arago-distro][PATCH] php: Add libiconv as a
	dependency. (Temporary)
Thread-Index: AQHNfuvsqDokfge+tUWol6CwrTnjQ5dk594AgAAjyjCAAarUAP//sktH
Date: Wed, 22 Aug 2012 22:13:08 +0000
Message-ID: <E6F2802D-57DE-4259-8BFD-EED0122B1D6F@ti.com>
References: <1345478683-6539-1-git-send-email-fcooper@ti.com>
	<20120821181530.GA3173@denix.org>
	<8F29D6B095ED194EA1980491A5E029710C2A7DE4@DFLE09.ent.ti.com>,
	<20120822215116.GA8846@denix.org>
In-Reply-To: <20120822215116.GA8846@denix.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
MIME-Version: 1.0
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Subject: Re: [meta-arago-distro][PATCH] php: Add libiconv as a dependency. (Temporary)
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
X-List-Received-Date: Wed, 22 Aug 2012 22:13:12 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Before I left today I noticed this also but didn't have a chance to debug i=
t to see why this is an issue all of a sudden. Before I sent the patch on M=
onday I did a cleanall for php php-native and iconv several times and had n=
o issue building php. Last night while I was trying to debug qt issues I cl=
eared my entire temp directory to clear out everything. The very first time=
 ( before i left today) I tried to build php I received a bunch of errors s=
aying various libiconv functions couldn't be referenced I didn't receive th=
is issue for php-native so I am not sure what has changed since initially p=
hp native was the one having the issues.

On Aug 22, 2012, at 4:51 PM, "Dmytriyenko, Denys" <denys@ti.com> wrote:

> On Wed, Aug 22, 2012 at 01:40:22AM +0000, Cooper Jr., Franklin wrote:
>> I agree with your suggestion did you want me to send the patch or tweak =
it=20
>> like you did for my other patch?
>=20
> No, can you please check if you still have this issue when building php f=
or=20
> the target:
>=20
> | cannot find -liconv collect2: ld returned 1 exit status
>=20
> --=20
> Denys
>=20
>> -----Original Message-----
>> From: Dmytriyenko, Denys=20
>> Sent: Tuesday, August 21, 2012 1:16 PM
>> To: Cooper Jr., Franklin
>> Cc: meta-arago@arago-project.org
>> Subject: Re: [meta-arago] [meta-arago-distro][PATCH] php: Add libiconv a=
s a dependency. (Temporary)
>>=20
>> On Mon, Aug 20, 2012 at 11:04:43AM -0500, Franklin S Cooper Jr wrote:
>>> * Adding libiconv as a dependency since external-linaro-toolchain.bb wh=
o
>>>  PROVIDES virtual/libiconv isn't providing the needed files for PHP.
>>> * Configuring PHP fails with
>>>  /home/<user>/toolchain/gcc-linaro-arm-linux-gnueabi-2012.03-20120326_l=
inux/bin/../
>>>  lib/gcc/arm-linux-gnueabi/4.6.3/../../../../arm-linux-gnueabi/bin/ld:
>>>  cannot find -liconv collect2: ld returned 1 exit status
>>> * This should be a temporary fix until a proper fix is made in the tool=
chain.
>>=20
>> When the first php patch is only applied to -native, this issue never ha=
ppens,=20
>> as it's masked by configure script satisfying the check with the host ic=
onv=20
>> library. It's not correct, but it's only a check and the host library is=
 not=20
>> actually being linked during the build...
>>=20
>> --=20
>> Denys
>>=20
>>=20
>>> Signed-off-by: Franklin S Cooper Jr <fcooper@ti.com>
>>> ---
>>> .../recipes-devtools/php/php_5.3.6.bbappend        |    2 ++
>>> 1 files changed, 2 insertions(+), 0 deletions(-)
>>>=20
>>> diff --git a/meta-arago-distro/recipes-devtools/php/php_5.3.6.bbappend =
b/meta-arago-distro/recipes-devtools/php/php_5.3.6.bbappend
>>> index 0d16ebe..e30664d 100644
>>> --- a/meta-arago-distro/recipes-devtools/php/php_5.3.6.bbappend
>>> +++ b/meta-arago-distro/recipes-devtools/php/php_5.3.6.bbappend
>>> @@ -4,3 +4,5 @@ FILESEXTRAPATHS_prepend :=3D "${THISDIR}/${PN}:"
>>> PR_append =3D "-arago0"
>>>=20
>>> SRC_URI +=3D "file://0001-php-native-Fix-host-contamination-issue.patch=
"
>>> +
>>> +DEPENDS +=3D "libiconv"
>>> --=20
>>> 1.7.0.4
>>>=20
>>> _______________________________________________
>>> meta-arago mailing list
>>> meta-arago@arago-project.org
>>> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago
>>>=20
>> _______________________________________________
>> meta-arago mailing list
>> meta-arago@arago-project.org
>> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago
>>=20

