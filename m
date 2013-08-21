Return-Path: <nick.gart@gmail.com>
Received: from mail-ob0-f176.google.com (mail-ob0-f176.google.com
	[209.85.214.176])
	by arago-project.org (Postfix) with ESMTPS id D2C6F52A61
	for <meta-arago@arago-project.org>;
	Wed, 21 Aug 2013 21:36:44 +0000 (UTC)
Received: by mail-ob0-f176.google.com with SMTP id uz19so1915200obc.35
	for <meta-arago@arago-project.org>;
	Wed, 21 Aug 2013 14:36:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:date:message-id:subject:from:to:content-type;
	bh=Dov7GcdgBknqjldJV1ADHxw1VrHsQ4Hg/QKlndkxIMs=;
	b=go1Oh05J93xmjh6RVwmfKRlFgyoc2HN6g/AsQZRvd6iLAeccajZmGFe4wUCLm1nVva
	Vd6aYwdN/3xHk23IiSnWLAo0nD+RP4wmbpO2RTwvFL/nHwQN9IHMmsaLCpfHdzS4H5/7
	I/b+7a5CR+fuuOKTESCyVwK0lR7CUM7+hRUPh+k7j7n5+gg85BFSm/YsNHliwEjLrbCb
	yOqRQKgL5YG/eTtU8U6mVIM/5Fz2qUAOAJuYWZgOR4G+h9accdg8e0ScoClRUl1WiDLi
	I4fzzGZsuMOsO9FU/nOydtp6XuUGMdi9Uk+qWiisfsq8mUvooWMyRlugaFIyozcBT113
	T54w==
MIME-Version: 1.0
X-Received: by 10.182.129.233 with SMTP id nz9mr10596887obb.8.1377121004204;
	Wed, 21 Aug 2013 14:36:44 -0700 (PDT)
Received: by 10.60.39.99 with HTTP; Wed, 21 Aug 2013 14:36:44 -0700 (PDT)
Date: Wed, 21 Aug 2013 14:36:44 -0700
Message-ID: <CADBzu5AZA8NRjTeQGvFDurHEDOx=gaSL90FgYM0-0tf1kdDAmQ@mail.gmail.com>
From: Nick Gart <nick.gart@gmail.com>
To: meta-arago@arago-project.org
Subject: flashing arago onto beaglebone black emmc
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
X-List-Received-Date: Wed, 21 Aug 2013 21:36:45 -0000
Content-Type: multipart/alternative; boundary=089e0149d28a44b9ac04e47bf81f

--089e0149d28a44b9ac04e47bf81f
Content-Type: text/plain; charset=ISO-8859-1

Sorry, I am not sure if my first e-mail went through since I wasn't
subscribed to the list, please ignore if this is a duplicate.

I'm trying to flash ti-sdk-am335x-evm-06.00.00.00 to the eMMC of a beagle
bone black.
I believe I'm successfully partitioning and flashing it, using angstrom's
emmc flashing script(
https://raw.github.com/beagleboard/meta-beagleboard/master/contrib/bone-flash-tool/emmc.sh)
but upon boot I get the following output:


U-Boot SPL 2013.01.01 (Aug 20 2013 - 17:14:40)
musb-hdrc: ConfigData=0xde (UTMI-8, dyn FIFOs, bulk combine, bulk split,
HB-ISO Rx, HB-ISO Tx, SoftConn)
musb-hdrc: MHDRC RTL version 2.0
musb-hdrc: setup fifo_mode 4
musb-hdrc: 28/31 max ep, 16384/16384 memory
USB Peripheral mode controller at 47401000 using PIO, IRQ 0
musb-hdrc: ConfigData=0xde (UTMI-8, dyn FIFOs, bulk combine, bulk split,
HB-ISO Rx, HB-ISO Tx, SoftConn)
musb-hdrc: MHDRC RTL version 2.0
musb-hdrc: setup fifo_mode 4
musb-hdrc: 28/31 max ep, 16384/16384 memory
USB Host mode controller at 47401800 using PIO, IRQ 0
OMAP SD/MMC: 0
mmc_send_cmd : timeout: No status update
reading u-boot.img
reading u-boot.img


U-Boot 2013.01.01 (Aug 20 2013 - 17:14:40)

I2C:   ready
DRAM:  512 MiB
WARNING: Caches not enabled
NAND:  No NAND device found!!!
0 MiB
MMC:   OMAP SD/MMC: 0, OMAP SD/MMC: 1
*** Warning - readenv() failed, using default environment

musb-hdrc: ConfigData=0xde (UTMI-8, dyn FIFOs, bulk combine, bulk split,
HB-ISO Rx, HB-ISO Tx, SoftConn)
musb-hdrc: MHDRC RTL version 2.0
musb-hdrc: setup fifo_mode 4
musb-hdrc: 28/31 max ep, 16384/16384 memory
USB Peripheral mode controller at 47401000 using PIO, IRQ 0
musb-hdrc: ConfigData=0xde (UTMI-8, dyn FIFOs, bulk combine, bulk split,
HB-ISO Rx, HB-ISO Tx, SoftConn)
musb-hdrc: MHDRC RTL version 2.0
musb-hdrc: setup fifo_mode 4
musb-hdrc: 28/31 max ep, 16384/16384 memory
USB Host mode controller at 47401800 using PIO, IRQ 0
Net:   <ethaddr> not set. Validating first E-fuse MAC
cpsw, usb_ether
Hit any key to stop autoboot:  1 ... 0
mmc_send_cmd : timeout: No status update
Card did not respond to voltage select!
mmc0(part 0) is current device
mmc_send_cmd : timeout: No status update
Card did not respond to voltage select!
Booting from nand ...

no devices available
Wrong Image Format for bootm command
ERROR: can't get kernel image!
U-Boot#



Any ideas on how to proceed?

--089e0149d28a44b9ac04e47bf81f
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br>Sorry, I am not sure if my first e-mail went through s=
ince I wasn&#39;t subscribed to the list, please ignore if this is a duplic=
ate.<div><br></div><div><span style=3D"font-family:arial,sans-serif;font-si=
ze:12.727272033691406px">I&#39;m trying to flash=A0ti-sdk-am335x-evm-06.00.=
</span><span style=3D"font-family:arial,sans-serif;font-size:12.72727203369=
1406px">00.00 to the eMMC of a beagle bone black.</span><div style=3D"font-=
family:arial,sans-serif;font-size:12.727272033691406px">
I believe I&#39;m successfully partitioning and flashing it, using angstrom=
&#39;s emmc flashing script(<a href=3D"https://raw.github.com/beagleboard/m=
eta-beagleboard/master/contrib/bone-flash-tool/emmc.sh" target=3D"_blank">h=
ttps://raw.github.com/beagleboard/meta-beagleboard/master/contrib/bone-flas=
h-tool/emmc.sh</a>) but upon boot I get the following output:</div>
<div style=3D"font-family:arial,sans-serif;font-size:12.727272033691406px">=
<br></div><div style=3D"font-family:arial,sans-serif;font-size:12.727272033=
691406px"><br></div><div style=3D"font-family:arial,sans-serif;font-size:12=
.727272033691406px">
<div>U-Boot SPL 2013.01.01 (Aug 20 2013 - 17:14:40)</div><div>musb-hdrc: Co=
nfigData=3D0xde (UTMI-8, dyn FIFOs, bulk combine, bulk split, HB-ISO Rx, HB=
-ISO Tx, SoftConn)</div><div>musb-hdrc: MHDRC RTL version 2.0=A0</div><div>
musb-hdrc: setup fifo_mode 4</div><div>musb-hdrc: 28/31 max ep, 16384/16384=
 memory</div><div>USB Peripheral mode controller at 47401000 using PIO, IRQ=
 0</div><div>musb-hdrc: ConfigData=3D0xde (UTMI-8, dyn FIFOs, bulk combine,=
 bulk split, HB-ISO Rx, HB-ISO Tx, SoftConn)</div>
<div>musb-hdrc: MHDRC RTL version 2.0=A0</div><div>musb-hdrc: setup fifo_mo=
de 4</div><div>musb-hdrc: 28/31 max ep, 16384/16384 memory</div><div>USB Ho=
st mode controller at 47401800 using PIO, IRQ 0</div><div>OMAP SD/MMC: 0</d=
iv>
<div>mmc_send_cmd : timeout: No status update</div><div>reading u-boot.img<=
/div><div>reading u-boot.img</div><div><br></div><div><br></div><div>U-Boot=
 2013.01.01 (Aug 20 2013 - 17:14:40)</div><div><br></div><div>I2C: =A0 read=
y</div>
<div>DRAM: =A0512 MiB</div><div>WARNING: Caches not enabled</div><div>NAND:=
 =A0No NAND device found!!!</div><div>0 MiB</div><div>MMC: =A0 OMAP SD/MMC:=
 0, OMAP SD/MMC: 1</div><div>*** Warning - readenv() failed, using default =
environment</div>
<div><br></div><div>musb-hdrc: ConfigData=3D0xde (UTMI-8, dyn FIFOs, bulk c=
ombine, bulk split, HB-ISO Rx, HB-ISO Tx, SoftConn)</div><div>musb-hdrc: MH=
DRC RTL version 2.0=A0</div><div>musb-hdrc: setup fifo_mode 4</div><div>mus=
b-hdrc: 28/31 max ep, 16384/16384 memory</div>
<div>USB Peripheral mode controller at 47401000 using PIO, IRQ 0</div><div>=
musb-hdrc: ConfigData=3D0xde (UTMI-8, dyn FIFOs, bulk combine, bulk split, =
HB-ISO Rx, HB-ISO Tx, SoftConn)</div><div>musb-hdrc: MHDRC RTL version 2.0=
=A0</div>
<div>musb-hdrc: setup fifo_mode 4</div><div>musb-hdrc: 28/31 max ep, 16384/=
16384 memory</div><div>USB Host mode controller at 47401800 using PIO, IRQ =
0</div><div>Net: =A0 &lt;ethaddr&gt; not set. Validating first E-fuse MAC</=
div>
<div>cpsw, usb_ether</div><div>Hit any key to stop autoboot: =A01 ... 0=A0<=
/div><div>mmc_send_cmd : timeout: No status update</div><div>Card did not r=
espond to voltage select!</div><div>mmc0(part 0) is current device</div><di=
v>
mmc_send_cmd : timeout: No status update</div><div>Card did not respond to =
voltage select!</div><div>Booting from nand ...</div><div><br></div><div>no=
 devices available</div><div>Wrong Image Format for bootm command</div>
<div>ERROR: can&#39;t get kernel image!</div><div>U-Boot#=A0</div></div><di=
v style=3D"font-family:arial,sans-serif;font-size:12.727272033691406px"><br=
></div><div style=3D"font-family:arial,sans-serif;font-size:12.727272033691=
406px">
<br></div><div style=3D"font-family:arial,sans-serif;font-size:12.727272033=
691406px"><br></div><div style=3D"font-family:arial,sans-serif;font-size:12=
.727272033691406px">Any ideas on how to proceed?</div></div></div>

--089e0149d28a44b9ac04e47bf81f--
