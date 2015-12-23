Return-Path: <matti.kaasinen@gmail.com>
Received: from mail-qk0-f180.google.com (mail-qk0-f180.google.com
	[209.85.220.180])
	by arago-project.org (Postfix) with ESMTPS id B3DCE5296D
	for <meta-arago@arago-project.org>;
	Wed, 23 Dec 2015 13:53:23 +0000 (UTC)
Received: by mail-qk0-f180.google.com with SMTP id n135so40465070qka.2
	for <meta-arago@arago-project.org>;
	Wed, 23 Dec 2015 05:53:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=7D1jQruzWqu4a3JZ9Q1YEiynTIw5DnrVYRMc5744Rlk=;
	b=u/Fz1p5G8DT0aaZBcpSYId9RHrDm57O9uWNdJ1CysC+rFG6BP3RtWJpkEMACsI/i6F
	bRMR4n0rvVWLZGhYXnddi3TYezi8VQQo3seRSNvtOnnh8KhzgnwcwkdkZflnq571qwWE
	dlMUNTwZel2eKrjuFFrD4IM2ax6gD2Vx1FOjqMv5bqC8UcnC0bOkvqF0OsX6b0MZamM5
	q2Q9mosr9tYbO8TUB+odS+MFHRnyMyfgyNlJ5cwr9G0yfb/HZbv+BZueP1hYPOZpJS4i
	Shg8IhI74/K/jng6IgIRFFw4Lt0zN4JJJnoQSynhwCCrUNEzL1ebu23hfeagi1Wkw6fC
	IUCw==
MIME-Version: 1.0
X-Received: by 10.55.50.195 with SMTP id y186mr39614186qky.86.1450878803426;
	Wed, 23 Dec 2015 05:53:23 -0800 (PST)
Received: by 10.55.114.6 with HTTP; Wed, 23 Dec 2015 05:53:23 -0800 (PST)
In-Reply-To: <CADnUhn3oXU5CGhobLdRmAyWF8FBUr8ejv-d+FCx+h3Nn1i6drA@mail.gmail.com>
References: <CADnUhn3oXU5CGhobLdRmAyWF8FBUr8ejv-d+FCx+h3Nn1i6drA@mail.gmail.com>
Date: Wed, 23 Dec 2015 15:53:23 +0200
Message-ID: <CADnUhn34EZA0j++r5tTOtV79e4c_hyL7nB-FP0cvAzX6Xhtjcg@mail.gmail.com>
From: matti kaasinen <matti.kaasinen@gmail.com>
To: meta-arago@arago-project.org
Subject: Re: nand flash does not get probed linux-ti-staging-rt-4.1
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
X-List-Received-Date: Wed, 23 Dec 2015 13:53:23 -0000
Content-Type: multipart/alternative; boundary=001a1147956cb0d63b0527910bd7

--001a1147956cb0d63b0527910bd7
Content-Type: text/plain; charset=UTF-8

Update:
I made some debugging.
Messages seem to come mostly from drivers/base/dd.c.
Log message importance has been lowered from _info to _debug. That is why
"probe deferral" message was not present in "rt-4.1" log.
Now after adding more prints it seems that nand and some other devices like
i2c are added to deferral list. They are re-probed successfully except nand
(actually 50000000.gpmc). Only following lines come from deferred gpmc
probe:
[    1.778365] platform 50000000.gpmc: Retrying from deferred list
[    1.778412] bus: 'platform': really_probe: probing driver omap-gpmc with
device 50000000.gpmc
[    1.778828] omap-gpmc 50000000.gpmc: GPMC revision 6.0
[    1.778843] gpmc_mem_init: disabling cs 0 mapped at 0x0-0x1000000

First two are lines that come when I changed dev_debug print functions to
dev_info functions in deferred_probe_work_func and
really_probe. Probing does not care about nand anymore.

That's for now - I'm somewhat confused!

Merry Christmas!
-Matti

2015-12-22 16:22 GMT+02:00 matti kaasinen <matti.kaasinen@gmail.com>:

> Hi!
>
> I try to upgrade from linux-ti-staging-3.14 to .. -rt-4.1.
>
> Most of service seems to work after fiddling with device tree and kernel
> configs. However, I just can't figure out why nand flash does not get
> probed.
> I don't get any error messages, some warnings, though.
>
> Clear differences are that rt-41 has emif message, but does not have
> "probe deferral" message
>
> -------
> rt-4.1
> -------
> [    0.243614] omap-gpmc 50000000.gpmc: could not find pctldev for node
> /ocp/l4_wkup@44c00000/scm@210000/pinmux@800/nandflash_pins_default,
> deferring probe
> ...
> [    1.296180]  remoteproc0: Direct firmware load for
> am335x-pm-firmware.elf failed with error -2
> [    1.300299] ti_emif_sram 4c000000.emif: Unable to get sram pool for
> ocmcram
> ...
> [    1.320653] omap-gpmc 50000000.gpmc: GPMC revision 6.0
> [    1.320668] gpmc_mem_init: disabling cs 0 mapped at 0x0-0x1000000
> .....
> no partition messages in log nor proper contents in /proc/mtd
>
> ------
> 3.13
> ------
> [    0.305249] omap-gpmc 50000000.gpmc: could not find pctldev for node
> /pinmux@44e10800/nandflash_pins_default, deferring probe
> [    0.305307] platform 50000000.gpmc: Driver omap-gpmc requests probe
> deferral
> ....
> [    2.272467] omap-gpmc 50000000.gpmc: GPMC revision 6.0
> [    2.278170] gpmc_mem_init: disabling cs 0 mapped at 0x0-0x1000000
> [    2.286917] nand: device found, Manufacturer ID: 0x2c, Chip ID: 0xda
> [    2.293595] nand: Micron MT29F2G08ABAEAWP
> [    2.297903] nand: 256MiB, SLC, page size: 2048, OOB size: 64
> [    2.303833] nand: using OMAP_ECC_BCH8_CODE_HW ECC scheme
> [    2.309991] 10 ofpart partitions found on MTD device omap2-nand.0
> [    2.316478] Creating 10 MTD partitions on "omap2-nand.0":
> [    2.322149] 0x000000000000-0x000000020000 : "NAND.SPL"
> [    2.334053] 0x000000020000-0x000000040000 : "NAND.SPL.backup1"
> ...
>
> Do anyone else make sense out of this?
>
> Thanks,
> Matti
>

--001a1147956cb0d63b0527910bd7
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div><div><div><div>Update:<br></div>I made some debugging=
.<br></div>Messages seem to come mostly from drivers/base/dd.c.<br></div>Lo=
g message importance has been lowered from _info to _debug. That is why  &q=
uot;probe deferral&quot; message was not present in &quot;rt-4.1&quot; log.=
<br></div><div>Now after adding more prints it seems that nand and some oth=
er devices like i2c are added to deferral list. They are re-probed successf=
ully except nand (actually 50000000.gpmc). Only following lines come from d=
eferred gpmc probe:<br>[=C2=A0=C2=A0=C2=A0 1.778365] platform 50000000.gpmc=
: Retrying from deferred list<br>[=C2=A0=C2=A0=C2=A0 1.778412] bus: &#39;pl=
atform&#39;: really_probe: probing driver omap-gpmc with device 50000000.gp=
mc<br>[=C2=A0=C2=A0=C2=A0 1.778828] omap-gpmc 50000000.gpmc: GPMC revision =
6.0<br>[=C2=A0=C2=A0=C2=A0 1.778843] gpmc_mem_init: disabling cs 0 mapped a=
t 0x0-0x1000000<br></div><div><br></div><div>First two are lines that come =
when I changed dev_debug print functions to dev_info functions in deferred_=
probe_work_func and <br></div><div>really_probe. Probing does not care abou=
t nand anymore.<br><br></div><div>That&#39;s for now - I&#39;m somewhat con=
fused!<br><br></div><div>Merry Christmas!<br></div><div>-Matti<br></div></d=
iv><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">2015-12-22 16:=
22 GMT+02:00 matti kaasinen <span dir=3D"ltr">&lt;<a href=3D"mailto:matti.k=
aasinen@gmail.com" target=3D"_blank">matti.kaasinen@gmail.com</a>&gt;</span=
>:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-l=
eft:1px #ccc solid;padding-left:1ex"><div dir=3D"ltr"><div><div><div>Hi!<br=
><br></div>I try to upgrade from linux-ti-staging-3.14 to .. -rt-4.1.<br><b=
r></div>Most of service seems to work after fiddling with device tree and k=
ernel configs. However, I just can&#39;t figure out why nand flash does not=
 get probed. <br>I don&#39;t get any error messages, some warnings, though.=
<br><br></div><div>Clear differences are that rt-41 has emif message, but d=
oes not have &quot;probe deferral&quot; message<br></div><div><br>-------<b=
r>rt-4.1<br>-------<br>[=C2=A0=C2=A0=C2=A0 0.243614] omap-gpmc 50000000.gpm=
c: could not find pctldev for node /ocp/l4_wkup@44c00000/scm@210000/pinmux@=
800/nandflash_pins_default, deferring probe<br>...<br>[=C2=A0=C2=A0=C2=A0 1=
.296180]=C2=A0 remoteproc0: Direct firmware load for am335x-pm-firmware.elf=
 failed with error -2<br>[=C2=A0=C2=A0=C2=A0 1.300299] ti_emif_sram 4c00000=
0.emif: Unable to get sram pool for ocmcram<br>...<br>[=C2=A0=C2=A0=C2=A0 1=
.320653] omap-gpmc 50000000.gpmc: GPMC revision 6.0<br>[=C2=A0=C2=A0=C2=A0 =
1.320668] gpmc_mem_init: disabling cs 0 mapped at 0x0-0x1000000<br>.....<br=
></div>no partition messages in log nor proper contents in /proc/mtd<br><di=
v><br>------<br>3.13<br>------<br>[=C2=A0=C2=A0=C2=A0 0.305249] omap-gpmc 5=
0000000.gpmc: could not find pctldev for node /pinmux@44e10800/nandflash_pi=
ns_default, deferring probe<br>[=C2=A0=C2=A0=C2=A0 0.305307] platform 50000=
000.gpmc: Driver omap-gpmc requests probe deferral<br>....<br>[=C2=A0=C2=A0=
=C2=A0 2.272467] omap-gpmc 50000000.gpmc: GPMC revision 6.0<br>[=C2=A0=C2=
=A0=C2=A0 2.278170] gpmc_mem_init: disabling cs 0 mapped at 0x0-0x1000000<b=
r>[=C2=A0=C2=A0=C2=A0 2.286917] nand: device found, Manufacturer ID: 0x2c, =
Chip ID: 0xda<br>[=C2=A0=C2=A0=C2=A0 2.293595] nand: Micron MT29F2G08ABAEAW=
P<br>[=C2=A0=C2=A0=C2=A0 2.297903] nand: 256MiB, SLC, page size: 2048, OOB =
size: 64<br>[=C2=A0=C2=A0=C2=A0 2.303833] nand: using OMAP_ECC_BCH8_CODE_HW=
 ECC scheme<br>[=C2=A0=C2=A0=C2=A0 2.309991] 10 ofpart partitions found on =
MTD device omap2-nand.0<br>[=C2=A0=C2=A0=C2=A0 2.316478] Creating 10 MTD pa=
rtitions on &quot;omap2-nand.0&quot;:<br>[=C2=A0=C2=A0=C2=A0 2.322149] 0x00=
0000000000-0x000000020000 : &quot;NAND.SPL&quot;<br>[=C2=A0=C2=A0=C2=A0 2.3=
34053] 0x000000020000-0x000000040000 : &quot;NAND.SPL.backup1&quot;<br>...<=
br><br></div><div>Do anyone else make sense out of this?<br><br></div><div>=
Thanks,<br></div><div>Matti<br></div></div>
</blockquote></div><br></div>

--001a1147956cb0d63b0527910bd7--
