Return-Path: <fcooper@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by arago-project.org (Postfix) with ESMTPS id 4062B529DD
	for <meta-arago@arago-project.org>;
	Sat, 31 Jan 2015 03:02:04 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id t0V320S0025173
	for <meta-arago@arago-project.org>; Fri, 30 Jan 2015 21:02:00 -0600
Received: from DFLE51.ent.ti.com (dfle51.ent.ti.com [10.64.6.12])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id t0V31xUb027542
	for <meta-arago@arago-project.org>; Fri, 30 Jan 2015 21:01:59 -0600
Received: from DFLE08.ent.ti.com ([fe80::187f:8c86:2b7:ef9f]) by
	DFLE51.ent.ti.com ([fe80::f88a:66e:ad57:ae4a%17]) with mapi id
	14.03.0224.002; Fri, 30 Jan 2015 21:01:59 -0600
From: "Cooper Jr., Franklin" <fcooper@ti.com>
To: "Dmytriyenko, Denys" <denys@ti.com>
Thread-Topic: [meta-arago] [PATCH 6/6] sitara-linux-ti-staging: Simply
	package up the sources don't copy the defconfig
Thread-Index: AQHQPNyLk/53tXJHK0mfo3pjHv2sppzZ7NIA//+eAt8=
Date: Sat, 31 Jan 2015 03:01:58 +0000
Message-ID: <78DD119C-A53F-4714-BB75-9369927CF9CD@ti.com>
References: <1422657099-15544-1-git-send-email-fcooper@ti.com>
	<1422657099-15544-6-git-send-email-fcooper@ti.com>,
	<20150131025242.GA2883@edge>
In-Reply-To: <20150131025242.GA2883@edge>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
MIME-Version: 1.0
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Subject: Re: [PATCH 6/6] sitara-linux-ti-staging: Simply package up the sources don't copy the defconfig
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
X-List-Received-Date: Sat, 31 Jan 2015 03:02:05 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable


> On Jan 30, 2015, at 8:52 PM, Dmytriyenko, Denys <denys@ti.com> wrote:
>=20
>> On Fri, Jan 30, 2015 at 04:31:39PM -0600, Franklin S. Cooper Jr wrote:
>> From: "Franklin S. Cooper Jr" <fcooper@ti.com>
>>=20
>> * Avoid creating a "new" defconfig when the one used by the recipe
>>  gives the same exact result.
>> * This also avoids the confusion people have when seeing a defconfig tha=
t
>>  doesn't exist in any other git tree.
>> * Doing this only makes sense if the defconfig is intree and not being p=
atched.
>=20
> Do you use config fragments in your kernel?
Yes and no. I have a Jenkins job that generates configs based on the fragme=
nts but then commits them as apart of my git tree.

Just makes things easier for people to use.
>=20
>=20
>> Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
>> ---
>> .../linux/sitara-linux-ti-staging_3.14.bbappend    |    4 +---
>> 1 file changed, 1 insertion(+), 3 deletions(-)
>>=20
>> diff --git a/meta-arago-distro/recipes-kernel/linux/sitara-linux-ti-stag=
ing_3.14.bbappend b/meta-arago-distro/recipes-kernel/linux/sitara-linux-ti-=
staging_3.14.bbappend
>> index b0b1df2..7e8eaf2 100644
>> --- a/meta-arago-distro/recipes-kernel/linux/sitara-linux-ti-staging_3.1=
4.bbappend
>> +++ b/meta-arago-distro/recipes-kernel/linux/sitara-linux-ti-staging_3.1=
4.bbappend
>> @@ -1,9 +1,7 @@
>> -MACHINE_KERNEL_PR_append =3D "-arago0"
>> +MACHINE_KERNEL_PR_append =3D "-arago1"
>>=20
>> FILESEXTRAPATHS_prepend :=3D "${THISDIR}/${P}:"
>>=20
>> -require copy-defconfig.inc
>> -
>> KERNEL_LOCALVERSION =3D "-g${@d.getVar('SRCPV', True).partition('+')[2][=
0:7]}"
>>=20
>> kernel_do_configure_prepend() {
>> --=20
>> 1.7.9.5
>>=20
>> _______________________________________________
>> meta-arago mailing list
>> meta-arago@arago-project.org
>> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

