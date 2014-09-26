Return-Path: <manuel.torres.fernandez@gmail.com>
Received: from mail-ie0-f178.google.com (mail-ie0-f178.google.com
	[209.85.223.178])
	by arago-project.org (Postfix) with ESMTPS id 48D2F529EA
	for <meta-arago@arago-project.org>;
	Fri, 26 Sep 2014 08:35:32 +0000 (UTC)
Received: by mail-ie0-f178.google.com with SMTP id at20so14925350iec.23
	for <meta-arago@arago-project.org>;
	Fri, 26 Sep 2014 01:35:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:date:message-id:subject:from:to:content-type;
	bh=YEcNAu1Cn6cQ5fVcmR+4a2TIcAvdAbohEpsz6RFDwdI=;
	b=gNX8PX2HkCnHeKB1XdMBcxJMSbr1KGiHhF0x46lEF7Y/T5QSOjDby8RymQBQWkCeKM
	IUYWZf/3uRxJRpWp+QlwAGtHbdokAIOzGSCkEeM9WOeoG8Qa2Vg2/JWPKz4ocAROEgKA
	n+5XIv++xLvHMmff6HtS2wFf1LeUD5fN876iTEPWk00ppLc9yT1afg+QEKc3oWHiBwLl
	5KzUPhqmpMtHvsmXoMvHjUmjn4BQlG51pXDzCqL6YnI2Sam6k8mPo+qLDuNh1MNciqaR
	oyeSnuEzzUcDW6tTXGjdXvfZheGkldEBhpCICEAL0ZSsEDjRHahvxdj5Oxwd8rlBsVPb
	8hlg==
MIME-Version: 1.0
X-Received: by 10.42.165.74 with SMTP id j10mr24532562icy.2.1411720530882;
	Fri, 26 Sep 2014 01:35:30 -0700 (PDT)
Received: by 10.107.135.13 with HTTP; Fri, 26 Sep 2014 01:35:30 -0700 (PDT)
Date: Fri, 26 Sep 2014 10:35:30 +0200
Message-ID: <CAF+2n7Ssaq3OwRiY6kicGdh+N8z0o2OPNJcd8MGbEvTTfioYDA@mail.gmail.com>
From: Manuel Torres <manuel.torres.fernandez@gmail.com>
To: meta-arago@arago-project.org
Subject: Video encoding on OMAP 4430
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
X-List-Received-Date: Fri, 26 Sep 2014 08:35:34 -0000
Content-Type: multipart/alternative; boundary=90e6ba6e83b4c407090503f3cc33

--90e6ba6e83b4c407090503f3cc33
Content-Type: text/plain; charset=UTF-8

Hello everyone,

I am trying to encode video using the OMAP 4430 video encoding capabilites
with a Gumstix Duovero Zephyr board. I have been told that the
gst-plugins-ducati recipe of the meta-arago-extras layer might work
although it has also been noted that it is intended for OMAP5.

This is as far as I got:

I included the meta-arago-extras layer, ran "bitbake-layers show-recipes"
and got this error:

Parsing recipes..ERROR: ExpansionError during parsing
/home/mtorres/Development/
Gumstix/yocto/poky/meta-arago-extras/meta-arago-extras/recipes-core/meta/
external-arago-toolchain.bb: Failure expanding variable ARG_VER_MAIN[:=],
expression was ${@arg_get_main_version(d)} which triggered exception
TypeError: unsupported operand type(s) for +: 'NoneType' and 'str'
Traceback (most recent call last):
  File
"/home/mtorres/Development/Gumstix/yocto/poky/bitbake/bin/bitbake-layers",
line 726, in <module>
    sys.exit(main(sys.argv[1:]) or 0)
  File
"/home/mtorres/Development/Gumstix/yocto/poky/bitbake/bin/bitbake-layers",
line 50, in main
    cmds.onecmd(' '.join(args))
  File "/usr/lib/python2.7/cmd.py", line 221, in onecmd
    return func(arg)
  File
"/home/mtorres/Development/Gumstix/yocto/poky/bitbake/bin/bitbake-layers",
line 212, in do_show_recipes
    self.init_bbhandler()
  File
"/home/mtorres/Development/Gumstix/yocto/poky/bitbake/bin/bitbake-layers",
line 67, in init_bbhandler
    self.bbhandler.prepare(config_only)
  File
"/home/mtorres/Development/Gumstix/yocto/poky/bitbake/lib/bb/tinfoil.py",
line 82, in prepare
    self.parseRecipes()
  File
"/home/mtorres/Development/Gumstix/yocto/poky/bitbake/lib/bb/tinfoil.py",
line 65, in parseRecipes
    self.cooker.updateCache()
  File
"/home/mtorres/Development/Gumstix/yocto/poky/bitbake/lib/bb/cooker.py",
line 1309, in updateCache
    raise bb.BBHandledException()
bb.BBHandledException

Any help will be greatly appreciated.

--90e6ba6e83b4c407090503f3cc33
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div><div>Hello everyone,<br><br></div>I am trying to enco=
de video using the OMAP 4430 video encoding capabilites with a Gumstix Duov=
ero Zephyr board. I have been told that the gst-plugins-ducati recipe of th=
e meta-arago-extras layer might work although it has also been noted that i=
t is intended for OMAP5.<br><br></div>This is as far as I got:<br><div><br>=
I included the meta-arago-extras layer, ran &quot;bitbake-layers show-recip=
es&quot; and got this error: <br><br>Parsing recipes..ERROR: ExpansionError=
 during parsing /home/mtorres/Development/<div>Gumstix/yocto/poky/meta-arag=
o-extras/meta-arago-extras/recipes-core/meta/<a href=3D"http://external-ara=
go-toolchain.bb" target=3D"_blank">external-arago-toolchain.bb</a>:
 Failure expanding variable ARG_VER_MAIN[:=3D], expression was=20
${@arg_get_main_version(d)} which triggered exception TypeError:=20
unsupported operand type(s) for +: &#39;NoneType&#39; and &#39;str&#39;<br>=
Traceback (most recent call last):<br>=C2=A0 File &quot;/home/mtorres/Devel=
opment/Gumstix/yocto/poky/bitbake/bin/bitbake-layers&quot;, line 726, in &l=
t;module&gt;<br>=C2=A0=C2=A0=C2=A0 sys.exit(main(sys.argv[1:]) or 0)<br>=C2=
=A0 File &quot;/home/mtorres/Development/Gumstix/yocto/poky/bitbake/bin/bit=
bake-layers&quot;, line 50, in main<br>=C2=A0=C2=A0=C2=A0 cmds.onecmd(&#39;=
 &#39;.join(args))<br>=C2=A0 File &quot;/usr/lib/python2.7/cmd.py&quot;, li=
ne 221, in onecmd<br>=C2=A0=C2=A0=C2=A0 return func(arg)<br>=C2=A0 File &qu=
ot;/home/mtorres/Development/Gumstix/yocto/poky/bitbake/bin/bitbake-layers&=
quot;, line 212, in do_show_recipes<br>=C2=A0=C2=A0=C2=A0 self.init_bbhandl=
er()<br>=C2=A0 File &quot;/home/mtorres/Development/Gumstix/yocto/poky/bitb=
ake/bin/bitbake-layers&quot;, line 67, in init_bbhandler<br>=C2=A0=C2=A0=C2=
=A0 self.bbhandler.prepare(config_only)<br>=C2=A0 File &quot;/home/mtorres/=
Development/Gumstix/yocto/poky/bitbake/lib/bb/tinfoil.py&quot;, line 82, in=
 prepare<br>=C2=A0=C2=A0=C2=A0 self.parseRecipes()<br>=C2=A0 File &quot;/ho=
me/mtorres/Development/Gumstix/yocto/poky/bitbake/lib/bb/tinfoil.py&quot;, =
line 65, in parseRecipes<br>=C2=A0=C2=A0=C2=A0 self.cooker.updateCache()<br=
>=C2=A0 File &quot;/home/mtorres/Development/Gumstix/yocto/poky/bitbake/lib=
/bb/cooker.py&quot;, line 1309, in updateCache<br>=C2=A0=C2=A0=C2=A0 raise =
bb.BBHandledException()<br>bb.BBHandledException<br></div><br></div><div>An=
y help will be greatly appreciated.<br></div></div>

--90e6ba6e83b4c407090503f3cc33--
