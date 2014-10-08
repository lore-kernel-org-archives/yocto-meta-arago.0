Return-Path: <manuel.torres.fernandez@gmail.com>
Received: from mail-ig0-f171.google.com (mail-ig0-f171.google.com
	[209.85.213.171])
	by arago-project.org (Postfix) with ESMTPS id 7346E52973
	for <meta-arago@arago-project.org>;
	Wed,  8 Oct 2014 08:12:21 +0000 (UTC)
Received: by mail-ig0-f171.google.com with SMTP id h15so6481042igd.4
	for <meta-arago@arago-project.org>;
	Wed, 08 Oct 2014 01:12:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=Psb1WvaVVxzexWkjTUVL7/tAskmSNmT0zGaKwqLMKQk=;
	b=cK75GdqM7OjdUQ+MVcNDEfHLWLjz+aWp5k3s+V0yXBRIySww0ygfJO7tPtB5RvuuCl
	BT/Qg1qgHwSRyy86a6iFTNI8UvI9mep9AX+ZPpo/W7x2Jj796qh6b5iVE5TigTsPelIh
	4sXIIDIusRFIbkxY4su9fX8foEN23Jr/9N6SMR/GzyiKQoF0I/C/4u2bEkRbPt7+woy7
	nxiMm/WHTU3/s/VafbPKWKXUPlEYu/Pv3zsxhX6ZDbCpd+Bm3tMuxMh4QJUXCvkue4JD
	l4Spf0FJ4MKnMjymoEPRHAh5pGEuX8c4h///LjEcW8euNbCblklN11mvVgzKdisBBlBr
	u1GA==
MIME-Version: 1.0
X-Received: by 10.50.79.129 with SMTP id j1mr13401979igx.47.1412755940322;
	Wed, 08 Oct 2014 01:12:20 -0700 (PDT)
Received: by 10.107.135.18 with HTTP; Wed, 8 Oct 2014 01:12:20 -0700 (PDT)
In-Reply-To: <20141007211048.GH25997@denix.org>
References: <CAF+2n7Ssaq3OwRiY6kicGdh+N8z0o2OPNJcd8MGbEvTTfioYDA@mail.gmail.com>
	<20141007211048.GH25997@denix.org>
Date: Wed, 8 Oct 2014 10:12:20 +0200
Message-ID: <CAF+2n7TZ0Bbw+R67nhwK4BkCWzOCREt20=82NsYP=fBAETHhOg@mail.gmail.com>
From: Manuel Torres <manuel.torres.fernandez@gmail.com>
To: Denys Dmytriyenko <denis@denix.org>
Cc: meta-arago@arago-project.org
Subject: Re: Video encoding on OMAP 4430
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
X-List-Received-Date: Wed, 08 Oct 2014 08:12:21 -0000
Content-Type: multipart/alternative; boundary=089e011609fcfa33b70504e4dfce

--089e011609fcfa33b70504e4dfce
Content-Type: text/plain; charset=UTF-8

Thank you very much for looking into it.



On Tue, Oct 7, 2014 at 11:10 PM, Denys Dmytriyenko <denis@denix.org> wrote:

> Sorry for the delay.
>
> Hmm, it appears the toolchain configuration from meta-arago-distro is still
> somewhat required to use meta-arago-extras... I need to look into that and
> fix
> this part, so meta-arago-extras can be used separately.
>
> --
> Denys
>
>
> On Fri, Sep 26, 2014 at 10:35:30AM +0200, Manuel Torres wrote:
> > Hello everyone,
> >
> > I am trying to encode video using the OMAP 4430 video encoding
> capabilites
> > with a Gumstix Duovero Zephyr board. I have been told that the
> > gst-plugins-ducati recipe of the meta-arago-extras layer might work
> > although it has also been noted that it is intended for OMAP5.
> >
> > This is as far as I got:
> >
> > I included the meta-arago-extras layer, ran "bitbake-layers show-recipes"
> > and got this error:
> >
> > Parsing recipes..ERROR: ExpansionError during parsing
> > /home/mtorres/Development/
> > Gumstix/yocto/poky/meta-arago-extras/meta-arago-extras/recipes-core/meta/
> > external-arago-toolchain.bb: Failure expanding variable
> ARG_VER_MAIN[:=],
> > expression was ${@arg_get_main_version(d)} which triggered exception
> > TypeError: unsupported operand type(s) for +: 'NoneType' and 'str'
> > Traceback (most recent call last):
> >   File
> >
> "/home/mtorres/Development/Gumstix/yocto/poky/bitbake/bin/bitbake-layers",
> > line 726, in <module>
> >     sys.exit(main(sys.argv[1:]) or 0)
> >   File
> >
> "/home/mtorres/Development/Gumstix/yocto/poky/bitbake/bin/bitbake-layers",
> > line 50, in main
> >     cmds.onecmd(' '.join(args))
> >   File "/usr/lib/python2.7/cmd.py", line 221, in onecmd
> >     return func(arg)
> >   File
> >
> "/home/mtorres/Development/Gumstix/yocto/poky/bitbake/bin/bitbake-layers",
> > line 212, in do_show_recipes
> >     self.init_bbhandler()
> >   File
> >
> "/home/mtorres/Development/Gumstix/yocto/poky/bitbake/bin/bitbake-layers",
> > line 67, in init_bbhandler
> >     self.bbhandler.prepare(config_only)
> >   File
> > "/home/mtorres/Development/Gumstix/yocto/poky/bitbake/lib/bb/tinfoil.py",
> > line 82, in prepare
> >     self.parseRecipes()
> >   File
> > "/home/mtorres/Development/Gumstix/yocto/poky/bitbake/lib/bb/tinfoil.py",
> > line 65, in parseRecipes
> >     self.cooker.updateCache()
> >   File
> > "/home/mtorres/Development/Gumstix/yocto/poky/bitbake/lib/bb/cooker.py",
> > line 1309, in updateCache
> >     raise bb.BBHandledException()
> > bb.BBHandledException
> >
> > Any help will be greatly appreciated.
>
> > _______________________________________________
> > meta-arago mailing list
> > meta-arago@arago-project.org
> > http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago
>
>

--089e011609fcfa33b70504e4dfce
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Thank you very much for looking into it.<br><br><br></div>=
<div class=3D"gmail_extra"><br><div class=3D"gmail_quote">On Tue, Oct 7, 20=
14 at 11:10 PM, Denys Dmytriyenko <span dir=3D"ltr">&lt;<a href=3D"mailto:d=
enis@denix.org" target=3D"_blank">denis@denix.org</a>&gt;</span> wrote:<br>=
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">Sorry for the delay.<br>
<br>
Hmm, it appears the toolchain configuration from meta-arago-distro is still=
<br>
somewhat required to use meta-arago-extras... I need to look into that and =
fix<br>
this part, so meta-arago-extras can be used separately.<br>
<br>
--<br>
Denys<br>
<div><div class=3D"h5"><br>
<br>
On Fri, Sep 26, 2014 at 10:35:30AM +0200, Manuel Torres wrote:<br>
&gt; Hello everyone,<br>
&gt;<br>
&gt; I am trying to encode video using the OMAP 4430 video encoding capabil=
ites<br>
&gt; with a Gumstix Duovero Zephyr board. I have been told that the<br>
&gt; gst-plugins-ducati recipe of the meta-arago-extras layer might work<br=
>
&gt; although it has also been noted that it is intended for OMAP5.<br>
&gt;<br>
&gt; This is as far as I got:<br>
&gt;<br>
&gt; I included the meta-arago-extras layer, ran &quot;bitbake-layers show-=
recipes&quot;<br>
&gt; and got this error:<br>
&gt;<br>
&gt; Parsing recipes..ERROR: ExpansionError during parsing<br>
&gt; /home/mtorres/Development/<br>
&gt; Gumstix/yocto/poky/meta-arago-extras/meta-arago-extras/recipes-core/me=
ta/<br>
&gt; <a href=3D"http://external-arago-toolchain.bb" target=3D"_blank">exter=
nal-arago-toolchain.bb</a>: Failure expanding variable ARG_VER_MAIN[:=3D],<=
br>
&gt; expression was ${@arg_get_main_version(d)} which triggered exception<b=
r>
&gt; TypeError: unsupported operand type(s) for +: &#39;NoneType&#39; and &=
#39;str&#39;<br>
&gt; Traceback (most recent call last):<br>
&gt;=C2=A0 =C2=A0File<br>
&gt; &quot;/home/mtorres/Development/Gumstix/yocto/poky/bitbake/bin/bitbake=
-layers&quot;,<br>
&gt; line 726, in &lt;module&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0sys.exit(main(sys.argv[1:]) or 0)<br>
&gt;=C2=A0 =C2=A0File<br>
&gt; &quot;/home/mtorres/Development/Gumstix/yocto/poky/bitbake/bin/bitbake=
-layers&quot;,<br>
&gt; line 50, in main<br>
&gt;=C2=A0 =C2=A0 =C2=A0cmds.onecmd(&#39; &#39;.join(args))<br>
&gt;=C2=A0 =C2=A0File &quot;/usr/lib/python2.7/cmd.py&quot;, line 221, in o=
necmd<br>
&gt;=C2=A0 =C2=A0 =C2=A0return func(arg)<br>
&gt;=C2=A0 =C2=A0File<br>
&gt; &quot;/home/mtorres/Development/Gumstix/yocto/poky/bitbake/bin/bitbake=
-layers&quot;,<br>
&gt; line 212, in do_show_recipes<br>
&gt;=C2=A0 =C2=A0 =C2=A0self.init_bbhandler()<br>
&gt;=C2=A0 =C2=A0File<br>
&gt; &quot;/home/mtorres/Development/Gumstix/yocto/poky/bitbake/bin/bitbake=
-layers&quot;,<br>
&gt; line 67, in init_bbhandler<br>
&gt;=C2=A0 =C2=A0 =C2=A0self.bbhandler.prepare(config_only)<br>
&gt;=C2=A0 =C2=A0File<br>
&gt; &quot;/home/mtorres/Development/Gumstix/yocto/poky/bitbake/lib/bb/tinf=
oil.py&quot;,<br>
&gt; line 82, in prepare<br>
&gt;=C2=A0 =C2=A0 =C2=A0self.parseRecipes()<br>
&gt;=C2=A0 =C2=A0File<br>
&gt; &quot;/home/mtorres/Development/Gumstix/yocto/poky/bitbake/lib/bb/tinf=
oil.py&quot;,<br>
&gt; line 65, in parseRecipes<br>
&gt;=C2=A0 =C2=A0 =C2=A0self.cooker.updateCache()<br>
&gt;=C2=A0 =C2=A0File<br>
&gt; &quot;/home/mtorres/Development/Gumstix/yocto/poky/bitbake/lib/bb/cook=
er.py&quot;,<br>
&gt; line 1309, in updateCache<br>
&gt;=C2=A0 =C2=A0 =C2=A0raise bb.BBHandledException()<br>
&gt; bb.BBHandledException<br>
&gt;<br>
&gt; Any help will be greatly appreciated.<br>
<br>
</div></div>&gt; _______________________________________________<br>
&gt; meta-arago mailing list<br>
&gt; <a href=3D"mailto:meta-arago@arago-project.org">meta-arago@arago-proje=
ct.org</a><br>
&gt; <a href=3D"http://arago-project.org/cgi-bin/mailman/listinfo/meta-arag=
o" target=3D"_blank">http://arago-project.org/cgi-bin/mailman/listinfo/meta=
-arago</a><br>
<br>
</blockquote></div><br></div>

--089e011609fcfa33b70504e4dfce--
