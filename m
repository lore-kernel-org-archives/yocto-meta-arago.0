Return-Path: <matti.kaasinen@gmail.com>
Received: from mail-ig0-f179.google.com (mail-ig0-f179.google.com
	[209.85.213.179])
	by arago-project.org (Postfix) with ESMTPS id D4F62529B5
	for <meta-arago@arago-project.org>;
	Thu, 18 Jun 2015 07:16:55 +0000 (UTC)
Received: by igboe5 with SMTP id oe5so11778651igb.1
	for <meta-arago@arago-project.org>;
	Thu, 18 Jun 2015 00:16:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:date:message-id:subject:from:to:content-type;
	bh=TsGmZp9nynlRY20457Z6jGzOMl8zFddsh9WHjBTaDDo=;
	b=z+ZcW/kach7QvUxgc2kUepmiHOBxR+KRBsX9zJ4LAvtj8zlQebjWServLluRzzap57
	ewMaqgDe5uDmwWEDM6YcuqaKRf5POpu7NU/hV4dCr3q8cmf10Qsp+Q9cD5foak3eYN40
	+2Nvf8dzJ06NA4oUlu+WNAqKB4JGvp++Z8FRiajsyqTnIk/fYBz28nzn7DK440dOc64H
	Zjwu+a34TLYk9bmxpj0I/hVS/BqvoS9Y63NVxEcBIVHFaObPP1lWZJNxEF4J6pRdAsmh
	q69NHDdvs9X3BMDKvG8/Sb0Ntq8+vwFLFtylMoHtE7fMUdkfcSbWUFX7dn1a+0KGhiJH
	Vn6Q==
MIME-Version: 1.0
X-Received: by 10.42.213.136 with SMTP id gw8mr4320818icb.95.1434611815223;
	Thu, 18 Jun 2015 00:16:55 -0700 (PDT)
Received: by 10.36.1.197 with HTTP; Thu, 18 Jun 2015 00:16:55 -0700 (PDT)
Date: Thu, 18 Jun 2015 10:16:55 +0300
Message-ID: <CADnUhn2i4G+G5im4T0fkh9rbuPvfHAJgswAe1C=MdzMc96n9ug@mail.gmail.com>
From: matti kaasinen <matti.kaasinen@gmail.com>
To: meta-arago@arago-project.org
Subject: major boot problem
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
X-List-Received-Date: Thu, 18 Jun 2015 07:16:56 -0000
Content-Type: multipart/alternative; boundary=001a11c31700a31a980518c59712

--001a11c31700a31a980518c59712
Content-Type: text/plain; charset=UTF-8

Hi!

Can anyone help with following boot error:

Card (am335x based special board) boots finds devices then at some point
following happens:
[    5.659197] VFS: Mounted root (ext3 filesystem) readonly on device 179:2.
[    5.673643] devtmpfs: mounted
[    5.679450] Freeing unused kernel memory: 596K (c08f5000 - c098a000)
/sbin/init: error while loading shared libraries: libc.so.6: cannot open
shared object file: No such file or directory
[    5.807240] Kernel panic - not syncing: Attempted to kill init!
exitcode=0x00007f00

I have checked from filesystem that /lib/libc.so.6 really exists.

Card boots fine with "vanilla" Poky(fido)/systemd and ArchiTech(dora)
systemd and sysv.
Problems why I try to get Arago working with my card are: ArcheTech is
buggy for instance TI ADC does not work at all. Klibc building with vanilla
Poky crashes and it turns out that also TI ADC does not work in continuous
mode (meta-ti). Therefore, I would really appreciate if anyone could give
me hand with this pretty fatal problem. It seems to me that filesystem does
not mount properly. I use same utilities for writing SD card for each of
these distros.

Thanks,
Matti

--001a11c31700a31a980518c59712
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div><div><div><div><div><div><div>Hi!<br><br></div>Can an=
yone help with following boot error:<br><br></div>Card (am335x based specia=
l board) boots finds devices then at some point following happens:<br>[=C2=
=A0=C2=A0=C2=A0 5.659197] VFS: Mounted root (ext3 filesystem) readonly on d=
evice 179:2.<br>[=C2=A0=C2=A0=C2=A0 5.673643] devtmpfs: mounted<br>[=C2=A0=
=C2=A0=C2=A0 5.679450] Freeing unused kernel memory: 596K (c08f5000 - c098a=
000)<br>/sbin/init: error while loading shared libraries: libc.so.6: cannot=
 open shared object file: No such file or directory<br>[=C2=A0=C2=A0=C2=A0 =
5.807240] Kernel panic - not syncing: Attempted to kill init! exitcode=3D0x=
00007f00<br><br></div>I have checked from filesystem that /lib/libc.so.6 re=
ally exists.<br><br></div>Card boots fine with &quot;vanilla&quot; Poky(fid=
o)/systemd and ArchiTech(dora) systemd and sysv.<br></div>Problems why I tr=
y to get Arago working with my card are: ArcheTech is buggy for instance TI=
 ADC does not work at all. Klibc building with vanilla Poky crashes and it =
turns out that also TI ADC does not work in continuous mode (meta-ti). Ther=
efore, I would really appreciate if anyone could give me hand with this pre=
tty fatal problem. It seems to me that filesystem does not mount properly. =
I use same utilities for writing SD card for each of these distros.<br><br>=
</div>Thanks,<br></div>Matti<br></div>

--001a11c31700a31a980518c59712--
