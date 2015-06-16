Return-Path: <matti.kaasinen@gmail.com>
Received: from mail-ig0-f172.google.com (mail-ig0-f172.google.com
	[209.85.213.172])
	by arago-project.org (Postfix) with ESMTPS id F00F8529FF
	for <meta-arago@arago-project.org>;
	Tue, 16 Jun 2015 07:22:41 +0000 (UTC)
Received: by igbzc4 with SMTP id zc4so72482916igb.0
	for <meta-arago@arago-project.org>;
	Tue, 16 Jun 2015 00:22:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:date:message-id:subject:from:to:content-type;
	bh=Oza+/tp/kV4fR8ya2OWXNZI/FqS1sOo/9uiB3iqcK5o=;
	b=ue5gYMYUGl39W/aXpDp1ZEx0IJgrPfdbBb1tYLE3jhjo1UYwziHrNipmv4xdjmcQsG
	jjeOvfQAf/5RaY04Dqd733FNQzm8e/dPpwCi6PZ+d6ZOpxuYnTC+y7ncdmUHygvSzptR
	8TvAYKpeRGYChUJ2WiaLGKYDJ7pWL8VTl6caCyaYJbNG+H/JruZ+l3JZiEzIhG8vUKJ+
	B4VeTyTdxQo8REPJt0uaVHTz1OnInsxH0clz1bi/OvBAMptIGrjMbcOhyyQNpH496ezW
	jooB81HzOUS7+ipGVqTcOYtmshTQac5fgTTzig11VJQ91Im8EEgNTJ++Gz92WXBAQmIW
	R+1A==
MIME-Version: 1.0
X-Received: by 10.50.80.19 with SMTP id n19mr1628522igx.30.1434439360545; Tue,
	16 Jun 2015 00:22:40 -0700 (PDT)
Received: by 10.36.1.197 with HTTP; Tue, 16 Jun 2015 00:22:40 -0700 (PDT)
Date: Tue, 16 Jun 2015 10:22:40 +0300
Message-ID: <CADnUhn1LN-0AUhAk8JfKYrWuKQ+RE3-A8AbvE00+V7xFWTDukA@mail.gmail.com>
From: matti kaasinen <matti.kaasinen@gmail.com>
To: meta-arago@arago-project.org
Subject: bitbake-layers show-layers crashes
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
X-List-Received-Date: Tue, 16 Jun 2015 07:22:43 -0000
Content-Type: multipart/alternative; boundary=089e01494b6889883805189d70ee

--089e01494b6889883805189d70ee
Content-Type: text/plain; charset=UTF-8

Hi
Running bitbake-layers show-layers crashes.  I have done installation with
arago-daisy-config.txt.

For instance bitbake linux-ti-staging works fine. I tried to study layer
priorities as PREFERRED_VERSION_u-boot-ti-staging setting did not work as
expected.

Following lists the error messages I get:
Traceback (most recent call last):
  File "/ARAGO/sources/bitbake/lib/bb/cookerdata.py", line 240, in
parseBaseConfiguration
    self.parseConfigurationFiles(self.prefiles, self.postfiles)
  File "/ARAGO/sources/bitbake/lib/bb/cookerdata.py", line 307, in
parseConfigurationFiles
    bb.event.fire(bb.event.ConfigParsed(), data)
  File "/ARAGO/sources/bitbake/lib/bb/event.py", line 163, in fire
    fire_class_handlers(event, d)
  File "/ARAGO/sources/bitbake/lib/bb/event.py", line 102, in
fire_class_handlers
    execute_handler(name, handler, event, d)
  File "/ARAGO/sources/bitbake/lib/bb/event.py", line 76, in execute_handler
    ret = handler(event)
  File "external_linaro_toolchain_version_handler(e)", line 8, in
external_linaro_toolchain_version_handler
  File "external-linaro-toolchain-versions.inc", line 4, in
elt_get_main_version
IndexError: list index out of range
Traceback (most recent call last):
  File "/ARAGO/sources/bitbake/bin/bitbake-layers", line 1034, in <module>
    ret = main()
  File "/ARAGO/sources/bitbake/bin/bitbake-layers", line 1027, in main
    ret = args.func(args)
  File "/ARAGO/sources/bitbake/bin/bitbake-layers", line 725, in
do_show_appends
    self.init_bbhandler()
  File "/ARAGO/sources/bitbake/bin/bitbake-layers", line 65, in
init_bbhandler
    self.bbhandler = bb.tinfoil.Tinfoil()
  File "/ARAGO/sources/bitbake/lib/bb/tinfoil.py", line 54, in __init__
    self.cooker = BBCooker(self.config, features)

--089e01494b6889883805189d70ee
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div><div><div>Hi<br></div>Running bitbake-layers show-lay=
ers crashes.=C2=A0 I have done installation with arago-daisy-config.txt. <b=
r><br></div>For instance bitbake linux-ti-staging works fine. I tried to st=
udy layer priorities as PREFERRED_VERSION_u-boot-ti-staging setting did not=
 work as expected.<br><br></div>Following lists the error messages I get:<b=
r>Traceback (most recent call last):<br>=C2=A0 File &quot;/ARAGO/sources/bi=
tbake/lib/bb/cookerdata.py&quot;, line 240, in parseBaseConfiguration<br>=
=C2=A0=C2=A0=C2=A0 self.parseConfigurationFiles(self.prefiles, self.postfil=
es)<br>=C2=A0 File &quot;/ARAGO/sources/bitbake/lib/bb/cookerdata.py&quot;,=
 line 307, in parseConfigurationFiles<br>=C2=A0=C2=A0=C2=A0 bb.event.fire(b=
b.event.ConfigParsed(), data)<br>=C2=A0 File &quot;/ARAGO/sources/bitbake/l=
ib/bb/event.py&quot;, line 163, in fire<br>=C2=A0=C2=A0=C2=A0 fire_class_ha=
ndlers(event, d)<br>=C2=A0 File &quot;/ARAGO/sources/bitbake/lib/bb/event.p=
y&quot;, line 102, in fire_class_handlers<br>=C2=A0=C2=A0=C2=A0 execute_han=
dler(name, handler, event, d)<br>=C2=A0 File &quot;/ARAGO/sources/bitbake/l=
ib/bb/event.py&quot;, line 76, in execute_handler<br>=C2=A0=C2=A0=C2=A0 ret=
 =3D handler(event)<br>=C2=A0 File &quot;external_linaro_toolchain_version_=
handler(e)&quot;, line 8, in external_linaro_toolchain_version_handler<br>=
=C2=A0 File &quot;external-linaro-toolchain-versions.inc&quot;, line 4, in =
elt_get_main_version<br>IndexError: list index out of range<br>Traceback (m=
ost recent call last):<br>=C2=A0 File &quot;/ARAGO/sources/bitbake/bin/bitb=
ake-layers&quot;, line 1034, in &lt;module&gt;<br>=C2=A0=C2=A0=C2=A0 ret =
=3D main()<br>=C2=A0 File &quot;/ARAGO/sources/bitbake/bin/bitbake-layers&q=
uot;, line 1027, in main<br>=C2=A0=C2=A0=C2=A0 ret =3D args.func(args)<br>=
=C2=A0 File &quot;/ARAGO/sources/bitbake/bin/bitbake-layers&quot;, line 725=
, in do_show_appends<br>=C2=A0=C2=A0=C2=A0 self.init_bbhandler()<br>=C2=A0 =
File &quot;/ARAGO/sources/bitbake/bin/bitbake-layers&quot;, line 65, in ini=
t_bbhandler<br>=C2=A0=C2=A0=C2=A0 self.bbhandler =3D bb.tinfoil.Tinfoil()<b=
r>=C2=A0 File &quot;/ARAGO/sources/bitbake/lib/bb/tinfoil.py&quot;, line 54=
, in __init__<br>=C2=A0=C2=A0=C2=A0 self.cooker =3D BBCooker(self.config, f=
eatures)<br><br></div>

--089e01494b6889883805189d70ee--
