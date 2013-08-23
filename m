Return-Path: <trini@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by arago-project.org (Postfix) with ESMTPS id C963A52A5F
	for <meta-arago@arago-project.org>;
	Fri, 23 Aug 2013 15:16:28 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id r7NFGQr6010071
	for <meta-arago@arago-project.org>; Fri, 23 Aug 2013 10:16:26 -0500
Received: from DLEE70.ent.ti.com (dlee70.ent.ti.com [157.170.170.113])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id r7NFGQie010931
	for <meta-arago@arago-project.org>; Fri, 23 Aug 2013 10:16:26 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.2.342.3;
	Fri, 23 Aug 2013 10:16:25 -0500
Received: from [172.24.52.106] (dbdp20.itg.ti.com [172.24.170.38])	by
	dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id r7NFGLhr011973;
	Fri, 23 Aug 2013 10:16:23 -0500
Message-ID: <52177CC3.4010804@ti.com>
Date: Fri, 23 Aug 2013 11:16:19 -0400
From: Tom Rini <trini@ti.com>
Organization: Texas Instruments
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/17.0 Thunderbird/17.0
MIME-Version: 1.0
To: "Maupin, Chase" <chase.maupin@ti.com>
References: <1377209433-10830-1-git-send-email-fcooper@ti.com>
	<1377209433-10830-3-git-send-email-fcooper@ti.com>
	<7D46E86EC0A8354091174257B2FED101596DCDC5@DLEE11.ent.ti.com>
In-Reply-To: <7D46E86EC0A8354091174257B2FED101596DCDC5@DLEE11.ent.ti.com>
X-Enigmail-Version: 1.5.2
X-Mailman-Approved-At: Fri, 23 Aug 2013 15:20:19 +0000
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>, "Cooper Jr.,
	Franklin" <fcooper@ti.com>
Subject: Re: [PATCH 3/4] board-port-labs: Use new SRCIPK_PRESERVE_GIT git feature in sourceipk.bbclass
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
X-List-Received-Date: Fri, 23 Aug 2013 15:16:31 -0000
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 08/23/2013 10:36 AM, Maupin, Chase wrote:
>> -----Original Message----- From: 
>> meta-arago-bounces@arago-project.org [mailto:meta-arago- 
>> bounces@arago-project.org] On Behalf Of Cooper Jr., Franklin 
>> Sent: Thursday, August 22, 2013 5:11 PM To: 
>> meta-arago@arago-project.org Cc: Cooper Jr., Franklin Subject: 
>> [meta-arago] [PATCH 3/4] board-port-labs: Use new 
>> SRCIPK_PRESERVE_GIT git feature in sourceipk.bbclass
[snip]
>> +++ b/meta-arago-distro/recipes-tisdk/board-port-labs/board-port-
>>  labs-u-boot_git.bb @@ -0,0 +1,36 @@ +DESCRIPTION = "Git 
>> repositories containing sample board port code" +HOMEPAGE = 
>> "https://gitorious.org/sitara-board-port" +LICENSE = "GPLv2"
> 
> U-Boot license in the base recipes are GPLv2+ so this probably 
> needs to match.
> 
>> + +LIC_FILES_CHKSUM = 
>> "file://../LICENSE;md5=d9fb2a547cd8e6bb75c0ecf427a139a9"
> 
> Why not use the file in the sources at Licenses/gpl-2.0.txt?
> 
> Tom, with all the licenses in that directory would you stay u-boot 
> is still GPLv2+?  It seems those other licenses are for the stand 
> alone apps, but for source distribution should this license be 
> updated to include the other licenses?

So, with the change in how we've noted licensing, from boiler plates
in every file and a top-level LICENSE file to having SPDX tags in
every file, we haven't changed the terms (modulo a few cases of
correcting GPLv2+ files to GPLv2) of the project.  We have however
made it clearer where future problems may lie.  We are still GPLv2+,
however all of the kernel code we have that is GPLv2 would make a
future license change harder.

In sum, yes, we're GPLv2+ and Licenses/gpl-2.0.txt is fine to point at
since it says "or later" in it.

- -- 
Tom
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)
Comment: Using GnuPG with Thunderbird - http://www.enigmail.net/

iQIcBAEBAgAGBQJSF3zDAAoJENk4IS6UOR1WlbgP/A8j97ylSD93oF/g31CqN9JA
PrtU80fJTpsSiCRt8JyGCAekfeP8/ZeoCnWfrpa4F6ARTPv2q2kgJQ9cqmBKYrIm
HNUOEGC6iMSaEmAP0LDbc9KPGkevvI5eyzSvUwbIMX2OiL87hHnuhCfAnAqPfyDK
sCGDju1PK72R7E1FsZjVdxJylx/Z81FWGas6+KlOL4Cj9QLvVqkKBrzloFquJGDe
g1nqZgv20qOQiWnR8l2CY8H6g7tEUBf6v1oSfOkyU7fKJcl8AL3wAAG00/kqhXfj
/kUmwo+uAGVSd2X0z6vKKgRXDI2iOzzycJ93CfgiTA2enCTkyjRMCQU/mrp47pdD
UD8r97GRipPboxoFGJAbfZOKVV24CWB0mU5aL9bfvDiFyhit6RatZYUajO7edgTK
QNjh2PIRMN2Jx1MXD4qhg47buOU4jY4Drmk5NLo/f4ykippW6Kw5jC4ZUuaQbCqe
aFp1oj/NK6v8swN7SYy+Nq362Xazsit1BJR0g86/Wdn6g91AyEfOIdNQvOpbGrON
1T6MbCFK7Pu3YjsfvgOVfFO2JTEnGsdJzHPPci8FAfDfnJO8+wobH9Gu6AqASTjO
wuVVbaGGQYTDQx2AndNa8usej7WhlPkoyMI0n4OD5EcT2Tz55eGhCzN7VfMo3ByB
vbMoTUYcyPuO53GivSPU
=icLI
-----END PGP SIGNATURE-----

