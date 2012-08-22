Return-Path: <fcooper@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id 604F452A7A
	for <meta-arago@arago-project.org>;
	Wed, 22 Aug 2012 22:32:37 +0000 (UTC)
Received: from dlelxv30.itg.ti.com ([172.17.2.17])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id q7MMWa4q009852
	for <meta-arago@arago-project.org>; Wed, 22 Aug 2012 17:32:36 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dlelxv30.itg.ti.com (8.13.8/8.13.8) with ESMTP id q7MMWa4E001816
	for <meta-arago@arago-project.org>; Wed, 22 Aug 2012 17:32:36 -0500
Received: from DFLE09.ent.ti.com ([fe80::3103:58c3:47f:860b]) by
	DFLE72.ent.ti.com ([fe80::5c48:b90d:af93:5822%30]) with mapi id
	14.01.0323.003; Wed, 22 Aug 2012 17:32:36 -0500
From: "Cooper Jr., Franklin" <fcooper@ti.com>
To: "Dmytriyenko, Denys" <denys@ti.com>
Thread-Topic: [meta-arago] [PATCH] psplash: Update to latest version of
	psplash. Tweak LIC_FILES_CHKSUM variable
Thread-Index: AQHNgJH0miZpJ6o0D0awib47A7v8jJdmItWwgABo34D//982Pg==
Date: Wed, 22 Aug 2012 22:32:35 +0000
Message-ID: <ACD0C0DC-A194-4D9B-85F8-23A792DE4C4D@ti.com>
References: <1344889987-31288-1-git-send-email-fcooper@ti.com>
	<8F29D6B095ED194EA1980491A5E029710C2A8788@DFLE09.ent.ti.com>
	<20120822181421.GG21025@edge>
	<8F29D6B095ED194EA1980491A5E029710C2A87E5@DFLE09.ent.ti.com>,
	<20120822192957.GH21025@edge>
In-Reply-To: <20120822192957.GH21025@edge>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
MIME-Version: 1.0
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Subject: Re: [PATCH] psplash: Update to latest version of psplash. Tweak LIC_FILES_CHKSUM variable
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
X-List-Received-Date: Wed, 22 Aug 2012 22:32:37 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

I tried your suggestion and couldn't get it to work. I tried other approach=
es and couldnt get it to work. Can u point to another bbappend that is name=
d based on the PN_PV when the recipe that it is appending doesn't follow th=
at naming convention ie psplash_git.bb? I just need an example to understan=
d what I am doing incorrectly.

On Aug 22, 2012, at 2:29 PM, "Dmytriyenko, Denys" <denys@ti.com> wrote:

> On Wed, Aug 22, 2012 at 02:17:10PM -0400, Cooper Jr., Franklin wrote:
>> Dropping it into master. I add comments to the recipe and to the commit=
=20
>> history explaining that these changes were already made in oe-core maste=
r. I=20
>> don't quite understand Chase's comment in the other thread
>> " Could we perhaps us the PV value in the recipe of 0.1+git${SRCPV} in t=
he=20
>> bbappend to force the append to that specific version and therefore brea=
k on=20
>> an upgrade?" But I am sure what ever changes he wants we can add later.
>=20
> What he meant was that psplash_git.bbappend is too generic and will try t=
o=20
> apply a year later, even though underlying psplash.bb recipe could have=20
> evolved a lot. We can try creating a more specific bbappend with the vers=
ion=20
> in the name - psplash_${PV}.bbappend. Then when PV changes, our bbappend =
will=20
> no longer apply with a big message that the underlying recipe has changed=
 and=20
> require our attention.
>=20
> --=20
> Denys
>=20
>=20
>> -----Original Message-----
>> From: Dmytriyenko, Denys=20
>> Sent: Wednesday, August 22, 2012 1:14 PM
>> To: Cooper Jr., Franklin
>> Cc: meta-arago@arago-project.org
>> Subject: Re: [meta-arago] [PATCH] psplash: Update to latest version of p=
splash. Tweak LIC_FILES_CHKSUM variable
>>=20
>> On Wed, Aug 22, 2012 at 06:06:43PM +0000, Cooper Jr., Franklin wrote:
>>> Ignore this patch. A new patch will be sent out that addresses the conc=
ern=20
>>> of patch [meta-arago] [PATCH] meta-arago-upstream: Create new upstream =
layer
>>=20
>> Right, are you going to use a separate "next" branch or just drop it in=
=20
>> "master" for now, as we discussed?
>>=20
>> --=20
>> Denys
>>=20
>>=20
>>> -----Original Message-----
>>> From: Cooper Jr., Franklin=20
>>> Sent: Monday, August 13, 2012 3:33 PM
>>> To: meta-arago@arago-project.org
>>> Cc: Cooper Jr., Franklin
>>> Subject: [meta-arago][PATCH] psplash: Update to latest version of pspla=
sh. Tweak LIC_FILES_CHKSUM variable
>>>=20
>>> * Add the change to the variable LIC_FILES_CHKSUM to insure that only
>>>  the lines that contains license information are used for the checksum
>>> * Update to the latest version of psplash.
>>> * The above changes are already found in the psplash recipe located in =
oe-core
>>>  master
>>>=20
>>> Signed-off-by: Franklin S Cooper Jr <fcooper@ti.com>
>>> ---
>>> .../recipes-core/psplash/psplash_git.bbappend |    4 ++++
>>> 1 files changed, 4 insertions(+), 0 deletions(-)
>>> create mode 100644 meta-arago-upstream/recipes-core/psplash/psplash_git=
.bbappend
>>>=20
>>> diff --git a/meta-arago-upstream/recipes-core/psplash/psplash_git.bbapp=
end b/meta-arago-upstream/recipes-core/psplash/psplash_git.bbappend
>>> new file mode 100644
>>> index 0000000..0ddbd6a
>>> --- /dev/null
>>> +++ b/meta-arago-upstream/recipes-core/psplash/psplash_git.bbappend
>>> @@ -0,0 +1,4 @@
>>> +LIC_FILES_CHKSUM =3D "file://psplash.h;beginline=3D1;endline=3D16;md5=
=3D840fb2356b10a85bed78dd09dc7745c6"
>>> +
>>> +SRCREV =3D "de9979aefbc56af59b4d236a4b63dd19dcdcfb53"
>>> +PRINC :=3D "${@int(PRINC) + 1}"
>>> --=20
>>> 1.7.0.4
>>>=20
>>> _______________________________________________
>>> meta-arago mailing list
>>> meta-arago@arago-project.org
>>> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

