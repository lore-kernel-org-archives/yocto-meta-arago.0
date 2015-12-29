Return-Path: <matti.kaasinen@gmail.com>
Received: from mail-qg0-f44.google.com (mail-qg0-f44.google.com
	[209.85.192.44])
	by arago-project.org (Postfix) with ESMTPS id D748D5208B
	for <meta-arago@arago-project.org>;
	Tue, 29 Dec 2015 09:47:00 +0000 (UTC)
Received: by mail-qg0-f44.google.com with SMTP id b35so32204970qge.0
	for <meta-arago@arago-project.org>;
	Tue, 29 Dec 2015 01:47:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=MBVA/Edyd7Ua4Oonpx/bqLwZvPWfBSTEABlJ7cxEKTs=;
	b=QRVc+IdXlpzy2s0kreASzYz6Nsms3CmAHweMsb2RwaW89muSMl8nVPENHOTgdppjTj
	QoGfZRdbGhSBoA1qcNuMYb/n/Pc/R/CVgVbzoXnqYPF0aA7Skg3zUs/mSBwlDCpYB4B2
	sQGWUPRhxCMPg/7j37rw6/SqBm0EQlbG6sDt8ar8C9b3AxAHa/07bD7CNCjtSyolf9P+
	sgSRBpPghhcqCTWygSs3as8lK0PGh/24fGZjkcfsscPbGyyAt8W71vmB7solvHgC7sqH
	l+YfnatSA35DvyBvDMnQCl912JAz/pv59ti8Q3kv2LUdkb4COBH/p3nD5f34eVqcJ842
	Hwzg==
MIME-Version: 1.0
X-Received: by 10.140.133.144 with SMTP id 138mr81117130qhf.0.1451382420162;
	Tue, 29 Dec 2015 01:47:00 -0800 (PST)
Received: by 10.55.113.132 with HTTP; Tue, 29 Dec 2015 01:47:00 -0800 (PST)
In-Reply-To: <CADnUhn34EZA0j++r5tTOtV79e4c_hyL7nB-FP0cvAzX6Xhtjcg@mail.gmail.com>
References: <CADnUhn3oXU5CGhobLdRmAyWF8FBUr8ejv-d+FCx+h3Nn1i6drA@mail.gmail.com>
	<CADnUhn34EZA0j++r5tTOtV79e4c_hyL7nB-FP0cvAzX6Xhtjcg@mail.gmail.com>
Date: Tue, 29 Dec 2015 11:47:00 +0200
Message-ID: <CADnUhn3xeTO40JcAAnVVX+B2+48BHREoNz_VXLp=QxRAes0JrA@mail.gmail.com>
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
X-List-Received-Date: Tue, 29 Dec 2015 09:47:01 -0000
Content-Type: multipart/alternative; boundary=001a1136f5b4964ee40528064d1e

--001a1136f5b4964ee40528064d1e
Content-Type: text/plain; charset=UTF-8

I found the problem:
It was again dt definition.
Now nand section within gpmc requires:
        compatible = "ti,omap2-nand";

Well there was some other changes, too, but I think above was what counted.
Now nand gets mounted/partitions mapped and reported.
Cheers,
Matti

2015-12-23 15:53 GMT+02:00 matti kaasinen <matti.kaasinen@gmail.com>:

> Update:
> I made some debugging.
> Messages seem to come mostly from drivers/base/dd.c.
> Log message importance has been lowered from _info to _debug. That is why
> "probe deferral" message was not present in "rt-4.1" log.
> Now after adding more prints it seems that nand and some other devices
> like i2c are added to deferral list. They are re-probed successfully except
> nand (actually 50000000.gpmc). Only following lines come from deferred gpmc
> probe:
> [    1.778365] platform 50000000.gpmc: Retrying from deferred list
> [    1.778412] bus: 'platform': really_probe: probing driver omap-gpmc
> with device 50000000.gpmc
> [    1.778828] omap-gpmc 50000000.gpmc: GPMC revision 6.0
> [    1.778843] gpmc_mem_init: disabling cs 0 mapped at 0x0-0x1000000
>
> First two are lines that come when I changed dev_debug print functions to
> dev_info functions in deferred_probe_work_func and
> really_probe. Probing does not care about nand anymore.
>
> That's for now - I'm somewhat confused!
>
> Merry Christmas!
> -Matti
>
> 2015-12-22 16:22 GMT+02:00 matti kaasinen <matti.kaasinen@gmail.com>:
>
>> Hi!
>>
>> I try to upgrade from linux-ti-staging-3.14 to .. -rt-4.1.
>>
>> Most of service seems to work after fiddling with device tree and kernel
>> configs. However, I just can't figure out why nand flash does not get
>> probed.
>> I don't get any error messages, some warnings, though.
>>
>> Clear differences are that rt-41 has emif message, but does not have
>> "probe deferral" message
>>
>> -------
>> rt-4.1
>> -------
>> [    0.243614] omap-gpmc 50000000.gpmc: could not find pctldev for node
>> /ocp/l4_wkup@44c00000/scm@210000/pinmux@800/nandflash_pins_default,
>> deferring probe
>> ...
>> [    1.296180]  remoteproc0: Direct firmware load for
>> am335x-pm-firmware.elf failed with error -2
>> [    1.300299] ti_emif_sram 4c000000.emif: Unable to get sram pool for
>> ocmcram
>> ...
>> [    1.320653] omap-gpmc 50000000.gpmc: GPMC revision 6.0
>> [    1.320668] gpmc_mem_init: disabling cs 0 mapped at 0x0-0x1000000
>> .....
>> no partition messages in log nor proper contents in /proc/mtd
>>
>> ------
>> 3.13
>> ------
>> [    0.305249] omap-gpmc 50000000.gpmc: could not find pctldev for node
>> /pinmux@44e10800/nandflash_pins_default, deferring probe
>> [    0.305307] platform 50000000.gpmc: Driver omap-gpmc requests probe
>> deferral
>> ....
>> [    2.272467] omap-gpmc 50000000.gpmc: GPMC revision 6.0
>> [    2.278170] gpmc_mem_init: disabling cs 0 mapped at 0x0-0x1000000
>> [    2.286917] nand: device found, Manufacturer ID: 0x2c, Chip ID: 0xda
>> [    2.293595] nand: Micron MT29F2G08ABAEAWP
>> [    2.297903] nand: 256MiB, SLC, page size: 2048, OOB size: 64
>> [    2.303833] nand: using OMAP_ECC_BCH8_CODE_HW ECC scheme
>> [    2.309991] 10 ofpart partitions found on MTD device omap2-nand.0
>> [    2.316478] Creating 10 MTD partitions on "omap2-nand.0":
>> [    2.322149] 0x000000000000-0x000000020000 : "NAND.SPL"
>> [    2.334053] 0x000000020000-0x000000040000 : "NAND.SPL.backup1"
>> ...
>>
>> Do anyone else make sense out of this?
>>
>> Thanks,
>> Matti
>>
>
>

--001a1136f5b4964ee40528064d1e
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div><div><div><div><div><div>I found the problem:<br></di=
v>It was again dt definition.<br></div>Now nand section within gpmc require=
s:<br>=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 compatible =3D &quot;ti,omap2-n=
and&quot;;<br><br></div>Well there was some other changes, too, but I think=
 above was what counted.<br></div>Now nand gets mounted/partitions mapped a=
nd reported.<br></div>Cheers,<br></div>Matti<br></div><div class=3D"gmail_e=
xtra"><br><div class=3D"gmail_quote">2015-12-23 15:53 GMT+02:00 matti kaasi=
nen <span dir=3D"ltr">&lt;<a href=3D"mailto:matti.kaasinen@gmail.com" targe=
t=3D"_blank">matti.kaasinen@gmail.com</a>&gt;</span>:<br><blockquote class=
=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padd=
ing-left:1ex"><div dir=3D"ltr"><div><div><div><div>Update:<br></div>I made =
some debugging.<br></div>Messages seem to come mostly from drivers/base/dd.=
c.<br></div>Log message importance has been lowered from _info to _debug. T=
hat is why  &quot;probe deferral&quot; message was not present in &quot;rt-=
4.1&quot; log.<br></div><div>Now after adding more prints it seems that nan=
d and some other devices like i2c are added to deferral list. They are re-p=
robed successfully except nand (actually 50000000.gpmc). Only following lin=
es come from deferred gpmc probe:<br>[=C2=A0=C2=A0=C2=A0 1.778365] platform=
 50000000.gpmc: Retrying from deferred list<br>[=C2=A0=C2=A0=C2=A0 1.778412=
] bus: &#39;platform&#39;: really_probe: probing driver omap-gpmc with devi=
ce 50000000.gpmc<br>[=C2=A0=C2=A0=C2=A0 1.778828] omap-gpmc 50000000.gpmc: =
GPMC revision 6.0<br>[=C2=A0=C2=A0=C2=A0 1.778843] gpmc_mem_init: disabling=
 cs 0 mapped at 0x0-0x1000000<br></div><div><br></div><div>First two are li=
nes that come when I changed dev_debug print functions to dev_info function=
s in deferred_probe_work_func and <br></div><div>really_probe. Probing does=
 not care about nand anymore.<br><br></div><div>That&#39;s for now - I&#39;=
m somewhat confused!<br><br></div><div>Merry Christmas!<span class=3D"HOEnZ=
b"><font color=3D"#888888"><br></font></span></div><span class=3D"HOEnZb"><=
font color=3D"#888888"><div>-Matti<br></div></font></span></div><div class=
=3D"HOEnZb"><div class=3D"h5"><div class=3D"gmail_extra"><br><div class=3D"=
gmail_quote">2015-12-22 16:22 GMT+02:00 matti kaasinen <span dir=3D"ltr">&l=
t;<a href=3D"mailto:matti.kaasinen@gmail.com" target=3D"_blank">matti.kaasi=
nen@gmail.com</a>&gt;</span>:<br><blockquote class=3D"gmail_quote" style=3D=
"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div dir=3D=
"ltr"><div><div><div>Hi!<br><br></div>I try to upgrade from linux-ti-stagin=
g-3.14 to .. -rt-4.1.<br><br></div>Most of service seems to work after fidd=
ling with device tree and kernel configs. However, I just can&#39;t figure =
out why nand flash does not get probed. <br>I don&#39;t get any error messa=
ges, some warnings, though.<br><br></div><div>Clear differences are that rt=
-41 has emif message, but does not have &quot;probe deferral&quot; message<=
br></div><div><br>-------<br>rt-4.1<br>-------<br>[=C2=A0=C2=A0=C2=A0 0.243=
614] omap-gpmc 50000000.gpmc: could not find pctldev for node /ocp/l4_wkup@=
44c00000/scm@210000/pinmux@800/nandflash_pins_default, deferring probe<br>.=
..<br>[=C2=A0=C2=A0=C2=A0 1.296180]=C2=A0 remoteproc0: Direct firmware load=
 for am335x-pm-firmware.elf failed with error -2<br>[=C2=A0=C2=A0=C2=A0 1.3=
00299] ti_emif_sram 4c000000.emif: Unable to get sram pool for ocmcram<br>.=
..<br>[=C2=A0=C2=A0=C2=A0 1.320653] omap-gpmc 50000000.gpmc: GPMC revision =
6.0<br>[=C2=A0=C2=A0=C2=A0 1.320668] gpmc_mem_init: disabling cs 0 mapped a=
t 0x0-0x1000000<br>.....<br></div>no partition messages in log nor proper c=
ontents in /proc/mtd<br><div><br>------<br>3.13<br>------<br>[=C2=A0=C2=A0=
=C2=A0 0.305249] omap-gpmc 50000000.gpmc: could not find pctldev for node /=
pinmux@44e10800/nandflash_pins_default, deferring probe<br>[=C2=A0=C2=A0=C2=
=A0 0.305307] platform 50000000.gpmc: Driver omap-gpmc requests probe defer=
ral<br>....<br>[=C2=A0=C2=A0=C2=A0 2.272467] omap-gpmc 50000000.gpmc: GPMC =
revision 6.0<br>[=C2=A0=C2=A0=C2=A0 2.278170] gpmc_mem_init: disabling cs 0=
 mapped at 0x0-0x1000000<br>[=C2=A0=C2=A0=C2=A0 2.286917] nand: device foun=
d, Manufacturer ID: 0x2c, Chip ID: 0xda<br>[=C2=A0=C2=A0=C2=A0 2.293595] na=
nd: Micron MT29F2G08ABAEAWP<br>[=C2=A0=C2=A0=C2=A0 2.297903] nand: 256MiB, =
SLC, page size: 2048, OOB size: 64<br>[=C2=A0=C2=A0=C2=A0 2.303833] nand: u=
sing OMAP_ECC_BCH8_CODE_HW ECC scheme<br>[=C2=A0=C2=A0=C2=A0 2.309991] 10 o=
fpart partitions found on MTD device omap2-nand.0<br>[=C2=A0=C2=A0=C2=A0 2.=
316478] Creating 10 MTD partitions on &quot;omap2-nand.0&quot;:<br>[=C2=A0=
=C2=A0=C2=A0 2.322149] 0x000000000000-0x000000020000 : &quot;NAND.SPL&quot;=
<br>[=C2=A0=C2=A0=C2=A0 2.334053] 0x000000020000-0x000000040000 : &quot;NAN=
D.SPL.backup1&quot;<br>...<br><br></div><div>Do anyone else make sense out =
of this?<br><br></div><div>Thanks,<br></div><div>Matti<br></div></div>
</blockquote></div><br></div>
</div></div></blockquote></div><br></div>

--001a1136f5b4964ee40528064d1e--
