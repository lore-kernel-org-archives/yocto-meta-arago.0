Return-Path: <matti.kaasinen@gmail.com>
Received: from mail-qg0-f50.google.com (mail-qg0-f50.google.com
	[209.85.192.50])
	by arago-project.org (Postfix) with ESMTPS id B57095298C
	for <meta-arago@arago-project.org>;
	Tue, 22 Dec 2015 14:22:53 +0000 (UTC)
Received: by mail-qg0-f50.google.com with SMTP id k90so132149135qge.0
	for <meta-arago@arago-project.org>;
	Tue, 22 Dec 2015 06:22:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:date:message-id:subject:from:to:content-type;
	bh=btD9tYPnB5y8erX+eA/E0ZXV52pktKoK4J4crChM8g8=;
	b=n4v1ZA/c0AckoKT/p6Z7n0VTy8nGm+jHUzSNki7otItuCnVSc2Oavt0rmW669FIvyd
	P6oTNyuUc6ED/J75I6jODIKUN+3c9gyGnHH7rUhcMrAViGKBmNDsPRW8pDNfVKLYdSkB
	uVQJqOREEa+8v4+0P3iepUtC6zpEofBRd3oeUnMNJBfBlAoI7/+NBCb7lfUuoiYVmwGD
	dxVQT1KItlvnF6Hn9y/2AkurmA42exBvHfGgH76vTpyQUKDEb8vGg5drJfL8cjgbJ53K
	/tuFexhfvHhW/7IF9S4/UdcayW8xNkTFyLVQFewynBBruEVsMclbJPH0PfQurIH3R9e2
	PXqg==
MIME-Version: 1.0
X-Received: by 10.140.177.3 with SMTP id x3mr34756245qhx.82.1450794173143;
	Tue, 22 Dec 2015 06:22:53 -0800 (PST)
Received: by 10.55.114.6 with HTTP; Tue, 22 Dec 2015 06:22:53 -0800 (PST)
Date: Tue, 22 Dec 2015 16:22:53 +0200
Message-ID: <CADnUhn3oXU5CGhobLdRmAyWF8FBUr8ejv-d+FCx+h3Nn1i6drA@mail.gmail.com>
From: matti kaasinen <matti.kaasinen@gmail.com>
To: meta-arago@arago-project.org
Subject: nand flash does not get probed linux-ti-staging-rt-4.1
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
X-List-Received-Date: Tue, 22 Dec 2015 14:22:54 -0000
Content-Type: multipart/alternative; boundary=001a113a6a8e55218205277d57f3

--001a113a6a8e55218205277d57f3
Content-Type: text/plain; charset=UTF-8

Hi!

I try to upgrade from linux-ti-staging-3.14 to .. -rt-4.1.

Most of service seems to work after fiddling with device tree and kernel
configs. However, I just can't figure out why nand flash does not get
probed.
I don't get any error messages, some warnings, though.

Clear differences are that rt-41 has emif message, but does not have "probe
deferral" message

-------
rt-4.1
-------
[    0.243614] omap-gpmc 50000000.gpmc: could not find pctldev for node
/ocp/l4_wkup@44c00000/scm@210000/pinmux@800/nandflash_pins_default,
deferring probe
...
[    1.296180]  remoteproc0: Direct firmware load for
am335x-pm-firmware.elf failed with error -2
[    1.300299] ti_emif_sram 4c000000.emif: Unable to get sram pool for
ocmcram
...
[    1.320653] omap-gpmc 50000000.gpmc: GPMC revision 6.0
[    1.320668] gpmc_mem_init: disabling cs 0 mapped at 0x0-0x1000000
.....
no partition messages in log nor proper contents in /proc/mtd

------
3.13
------
[    0.305249] omap-gpmc 50000000.gpmc: could not find pctldev for node
/pinmux@44e10800/nandflash_pins_default, deferring probe
[    0.305307] platform 50000000.gpmc: Driver omap-gpmc requests probe
deferral
....
[    2.272467] omap-gpmc 50000000.gpmc: GPMC revision 6.0
[    2.278170] gpmc_mem_init: disabling cs 0 mapped at 0x0-0x1000000
[    2.286917] nand: device found, Manufacturer ID: 0x2c, Chip ID: 0xda
[    2.293595] nand: Micron MT29F2G08ABAEAWP
[    2.297903] nand: 256MiB, SLC, page size: 2048, OOB size: 64
[    2.303833] nand: using OMAP_ECC_BCH8_CODE_HW ECC scheme
[    2.309991] 10 ofpart partitions found on MTD device omap2-nand.0
[    2.316478] Creating 10 MTD partitions on "omap2-nand.0":
[    2.322149] 0x000000000000-0x000000020000 : "NAND.SPL"
[    2.334053] 0x000000020000-0x000000040000 : "NAND.SPL.backup1"
...

Do anyone else make sense out of this?

Thanks,
Matti

--001a113a6a8e55218205277d57f3
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div><div><div>Hi!<br><br></div>I try to upgrade from linu=
x-ti-staging-3.14 to .. -rt-4.1.<br><br></div>Most of service seems to work=
 after fiddling with device tree and kernel configs. However, I just can&#3=
9;t figure out why nand flash does not get probed. <br>I don&#39;t get any =
error messages, some warnings, though.<br><br></div><div>Clear differences =
are that rt-41 has emif message, but does not have &quot;probe deferral&quo=
t; message<br></div><div><br>-------<br>rt-4.1<br>-------<br>[=C2=A0=C2=A0=
=C2=A0 0.243614] omap-gpmc 50000000.gpmc: could not find pctldev for node /=
ocp/l4_wkup@44c00000/scm@210000/pinmux@800/nandflash_pins_default, deferrin=
g probe<br>...<br>[=C2=A0=C2=A0=C2=A0 1.296180]=C2=A0 remoteproc0: Direct f=
irmware load for am335x-pm-firmware.elf failed with error -2<br>[=C2=A0=C2=
=A0=C2=A0 1.300299] ti_emif_sram 4c000000.emif: Unable to get sram pool for=
 ocmcram<br>...<br>[=C2=A0=C2=A0=C2=A0 1.320653] omap-gpmc 50000000.gpmc: G=
PMC revision 6.0<br>[=C2=A0=C2=A0=C2=A0 1.320668] gpmc_mem_init: disabling =
cs 0 mapped at 0x0-0x1000000<br>.....<br></div>no partition messages in log=
 nor proper contents in /proc/mtd<br><div><br>------<br>3.13<br>------<br>[=
=C2=A0=C2=A0=C2=A0 0.305249] omap-gpmc 50000000.gpmc: could not find pctlde=
v for node /pinmux@44e10800/nandflash_pins_default, deferring probe<br>[=C2=
=A0=C2=A0=C2=A0 0.305307] platform 50000000.gpmc: Driver omap-gpmc requests=
 probe deferral<br>....<br>[=C2=A0=C2=A0=C2=A0 2.272467] omap-gpmc 50000000=
.gpmc: GPMC revision 6.0<br>[=C2=A0=C2=A0=C2=A0 2.278170] gpmc_mem_init: di=
sabling cs 0 mapped at 0x0-0x1000000<br>[=C2=A0=C2=A0=C2=A0 2.286917] nand:=
 device found, Manufacturer ID: 0x2c, Chip ID: 0xda<br>[=C2=A0=C2=A0=C2=A0 =
2.293595] nand: Micron MT29F2G08ABAEAWP<br>[=C2=A0=C2=A0=C2=A0 2.297903] na=
nd: 256MiB, SLC, page size: 2048, OOB size: 64<br>[=C2=A0=C2=A0=C2=A0 2.303=
833] nand: using OMAP_ECC_BCH8_CODE_HW ECC scheme<br>[=C2=A0=C2=A0=C2=A0 2.=
309991] 10 ofpart partitions found on MTD device omap2-nand.0<br>[=C2=A0=C2=
=A0=C2=A0 2.316478] Creating 10 MTD partitions on &quot;omap2-nand.0&quot;:=
<br>[=C2=A0=C2=A0=C2=A0 2.322149] 0x000000000000-0x000000020000 : &quot;NAN=
D.SPL&quot;<br>[=C2=A0=C2=A0=C2=A0 2.334053] 0x000000020000-0x000000040000 =
: &quot;NAND.SPL.backup1&quot;<br>...<br><br></div><div>Do anyone else make=
 sense out of this?<br><br></div><div>Thanks,<br></div><div>Matti<br></div>=
</div>

--001a113a6a8e55218205277d57f3--
