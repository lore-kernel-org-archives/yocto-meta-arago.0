Return-Path: <ankur.tyagi85@gmail.com>
Received: from mail-ob0-f169.google.com (mail-ob0-f169.google.com
	[209.85.214.169])
	by arago-project.org (Postfix) with ESMTPS id 2B2405297D
	for <meta-arago@arago-project.org>;
	Fri, 10 Jul 2015 03:55:00 +0000 (UTC)
Received: by obdbs4 with SMTP id bs4so184317670obd.3
	for <meta-arago@arago-project.org>;
	Thu, 09 Jul 2015 20:54:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=7C0edLGN9ufg0XNRPwSMyk4ovPnmxq/dyDw0vNj/JxA=;
	b=oT+eArOuGFriEpJm9mIw55k6UX3i1V38JkGdzQ06ebL8Hy63HPF0oK9cORfr501YJ9
	sz/u74fikvBVD1dyFcdMGtxp8NAjl8DKCyKkoTUVwe1ObmhnqzpJDW91MOBmr7pxR5bd
	7nO2RTtMM2yKB9+lFadeapNRDbRUdJpQ4wRDIzrEwAAI93/hqnJM6njN6SMo/qvxVCcz
	jB73VmwkFBNK5VnAUUErJBSt0z3N75w4U/JA+jndRhlOzox4DFvuqaCw9N74Q/F6utMQ
	2PZcIvblJcNBW52To0TXc60ysNOy3Yg0CYDT6QW4PnOGHXRcGG/BdRDTwrDgJpHz/MEC
	tAbQ==
X-Received: by 10.202.67.67 with SMTP id q64mr17020914oia.124.1436500499595;
	Thu, 09 Jul 2015 20:54:59 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.202.197.148 with HTTP; Thu, 9 Jul 2015 20:54:40 -0700 (PDT)
In-Reply-To: <20150709232356.GK15657@edge>
References: <CADySD0Et4JtD7_bZ8yMUkbaBrbrtrt8v8YETaJUHkSm=FbMaTg@mail.gmail.com>
	<CADySD0GJA3Mw4UMuEp9d5rmiChEL+ypZzgCuu-pFxXBLingw1Q@mail.gmail.com>
	<20150709232356.GK15657@edge>
From: Ankur Tyagi <ankur.tyagi85@gmail.com>
Date: Fri, 10 Jul 2015 15:54:40 +1200
Message-ID: <CADySD0ERquO0KW5Q3djRSXUe1uhZhBYcE9GaFFY9MF_Lk5kaNA@mail.gmail.com>
To: Denys Dmytriyenko <denys@ti.com>
Cc: meta-arago@arago-project.org
Subject: Re: How to build browser (chrome/firefox) for AM335x using meta-arago
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
X-List-Received-Date: Fri, 10 Jul 2015 03:55:00 -0000
Content-Type: multipart/alternative; boundary=001a113dd3d6ff89fb051a7d554b

--001a113dd3d6ff89fb051a7d554b
Content-Type: text/plain; charset=UTF-8

Hi,

I get this error :

ERROR: Function failed: do_configure (log file is located at
/home/ankur/ti-arago/oe-layersetup/build/arago-tmp-external-linaro-toolchain/work/cortexa8t2hf-vfp-neon-linux-gnueabi/chromium/40.0.2214.91-r0/temp/log.do_configure.24479)
ERROR: Logfile of failure stored in:
/home/ankur/ti-arago/oe-layersetup/build/arago-tmp-external-linaro-toolchain/work/cortexa8t2hf-vfp-neon-linux-gnueabi/chromium/40.0.2214.91-r0/temp/log.do_configure.24479
Log data follows:
| DEBUG: Executing python function sysroot_cleansstate
| DEBUG: Python function sysroot_cleansstate finished
| DEBUG: Executing shell function do_configure
| Updating projects from gyp files...
| Package gdk-2.0 was not found in the pkg-config search path.
| Perhaps you should add the directory containing `gdk-2.0.pc'
| to the PKG_CONFIG_PATH environment variable
| No package 'gdk-2.0' found
| gyp: Call to 'pkg-config --cflags gdk-2.0' returned exit status 1.
| WARNING:
/home/ankur/ti-arago/oe-layersetup/build/arago-tmp-external-linaro-toolchain/work/cortexa8t2hf-vfp-neon-linux-gnueabi/chromium/40.0.2214.91-r0/temp/run.do_configure.24479:1
exit 1 from
|   build/gyp_chromium --depth=. -Dangle_use_commit_id=0 -Dclang=0
-Dhost_clang=0 -Ddisable_fatal_linker_warnings=1 -Dlinux_use_gold_binary=0
-Dlinux_use_gold_flags=0 -I
/home/ankur/ti-arago/oe-layersetup/build/arago-tmp-external-linaro-toolchain/work/cortexa8t2hf-vfp-neon-linux-gnueabi/chromium/40.0.2214.91-r0/oe-defaults.gypi
-I
/home/ankur/ti-arago/oe-layersetup/build/arago-tmp-external-linaro-toolchain/work/cortexa8t2hf-vfp-neon-linux-gnueabi/chromium/40.0.2214.91-r0/include.gypi
-f ninja
| ERROR: Function failed: do_configure (log file is located at
/home/ankur/ti-arago/oe-layersetup/build/arago-tmp-external-linaro-toolchain/work/cortexa8t2hf-vfp-neon-linux-gnueabi/chromium/40.0.2214.91-r0/temp/log.do_configure.24479)
ERROR: Task 372
(/home/ankur/ti-arago/oe-layersetup/sources/meta-openembedded/meta-browser/recipes-browser/chromium/
chromium_40.0.2214.91.bb, do_configure) failed with exit code '1'
NOTE: Tasks Summary: Attempted 2856 tasks of which 2833 didn't need to be
rerun and 1 failed.

Thanks
Ankur

"Knowledge is knowing tomato is a fruit, wisdom is not putting it in a
fruit salad"

On Fri, Jul 10, 2015 at 11:23 AM, Denys Dmytriyenko <denys@ti.com> wrote:

> I haven't tried it recently, but you should be able to add meta-browser to
> bblayers.conf file and bitbake the corresponding target.
>
> --
> Denys
>
>
> On Fri, Jul 03, 2015 at 04:17:21PM +1200, Ankur Tyagi wrote:
> > Hi,
> >
> > In case previous one was missed.
> >
> > I want to build chrome/firefox browser for my AM335x EVM.
> >
> > I am using "arago-daisy-config.txt" to bitbake tisdk-rootfs-image.
> >
> > I see there is meta-browser which includes chrome, firefox.
> >
> > How can I get them build with my tisdk rootfs ?
> >
> > What all do I need to modify in my bblayer and local conf files ?
> >
> > thanks
> >
> >
> > "Knowledge is knowing tomato is a fruit, wisdom is not putting it in a
> > fruit salad"
> >
> > On Fri, Jun 19, 2015 at 7:04 PM, Ankur Tyagi <ankur.tyagi85@gmail.com>
> > wrote:
> >
> > > Hi,
> > >
> > > I want to build chrome/firefox browser for my AM335x EVM.
> > >
> > > I am using "arago-daisy-config.txt" to bitbake tisdk-rootfs-image.
> > >
> > > I see there is meta-browser which includes chrome, firefox.
> > >
> > > How can I get them build with my tisdk rootfs ?
> > >
> > > What all do I need to modify in my bblayer and local conf files ?
> > >
> > > thanks
> > >
>
> > _______________________________________________
> > meta-arago mailing list
> > meta-arago@arago-project.org
> > http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago
>
>

--001a113dd3d6ff89fb051a7d554b
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_default" style=3D"font-family:georgia,=
serif;font-size:small;color:rgb(51,51,153)">Hi,</div><div class=3D"gmail_de=
fault" style=3D"font-family:georgia,serif;font-size:small;color:rgb(51,51,1=
53)"><br></div><div class=3D"gmail_default" style=3D"font-family:georgia,se=
rif;font-size:small;color:rgb(51,51,153)">I get this error :</div><div clas=
s=3D"gmail_default" style=3D"font-family:georgia,serif;font-size:small;colo=
r:rgb(51,51,153)"><br></div><div class=3D"gmail_default" style=3D""><div cl=
ass=3D"gmail_default" style=3D""><font color=3D"#333399" face=3D"georgia, s=
erif">ERROR: Function failed: do_configure (log file is located at /home/an=
kur/ti-arago/oe-layersetup/build/arago-tmp-external-linaro-toolchain/work/c=
ortexa8t2hf-vfp-neon-linux-gnueabi/chromium/40.0.2214.91-r0/temp/log.do_con=
figure.24479)</font></div><div class=3D"gmail_default" style=3D""><font col=
or=3D"#333399" face=3D"georgia, serif">ERROR: Logfile of failure stored in:=
 /home/ankur/ti-arago/oe-layersetup/build/arago-tmp-external-linaro-toolcha=
in/work/cortexa8t2hf-vfp-neon-linux-gnueabi/chromium/40.0.2214.91-r0/temp/l=
og.do_configure.24479</font></div><div class=3D"gmail_default" style=3D""><=
font color=3D"#333399" face=3D"georgia, serif">Log data follows:</font></di=
v><div class=3D"gmail_default" style=3D""><font color=3D"#333399" face=3D"g=
eorgia, serif">| DEBUG: Executing python function sysroot_cleansstate</font=
></div><div class=3D"gmail_default" style=3D""><font color=3D"#333399" face=
=3D"georgia, serif">| DEBUG: Python function sysroot_cleansstate finished</=
font></div><div class=3D"gmail_default" style=3D""><font color=3D"#333399" =
face=3D"georgia, serif">| DEBUG: Executing shell function do_configure</fon=
t></div><div class=3D"gmail_default" style=3D""><font color=3D"#333399" fac=
e=3D"georgia, serif">| Updating projects from gyp files...</font></div><div=
 class=3D"gmail_default" style=3D""><font color=3D"#333399" face=3D"georgia=
, serif">| Package gdk-2.0 was not found in the pkg-config search path.</fo=
nt></div><div class=3D"gmail_default" style=3D""><font color=3D"#333399" fa=
ce=3D"georgia, serif">| Perhaps you should add the directory containing `gd=
k-2.0.pc&#39;</font></div><div class=3D"gmail_default" style=3D""><font col=
or=3D"#333399" face=3D"georgia, serif">| to the PKG_CONFIG_PATH environment=
 variable</font></div><div class=3D"gmail_default" style=3D""><font color=
=3D"#333399" face=3D"georgia, serif">| No package &#39;gdk-2.0&#39; found</=
font></div><div class=3D"gmail_default" style=3D""><font color=3D"#333399" =
face=3D"georgia, serif">| gyp: Call to &#39;pkg-config --cflags gdk-2.0&#39=
; returned exit status 1.</font></div><div class=3D"gmail_default" style=3D=
""><font color=3D"#333399" face=3D"georgia, serif">| WARNING: /home/ankur/t=
i-arago/oe-layersetup/build/arago-tmp-external-linaro-toolchain/work/cortex=
a8t2hf-vfp-neon-linux-gnueabi/chromium/40.0.2214.91-r0/temp/run.do_configur=
e.24479:1 exit 1 from</font></div><div class=3D"gmail_default" style=3D""><=
font color=3D"#333399" face=3D"georgia, serif">| =C2=A0 build/gyp_chromium =
--depth=3D. -Dangle_use_commit_id=3D0 -Dclang=3D0 -Dhost_clang=3D0 -Ddisabl=
e_fatal_linker_warnings=3D1 -Dlinux_use_gold_binary=3D0 -Dlinux_use_gold_fl=
ags=3D0 -I /home/ankur/ti-arago/oe-layersetup/build/arago-tmp-external-lina=
ro-toolchain/work/cortexa8t2hf-vfp-neon-linux-gnueabi/chromium/40.0.2214.91=
-r0/oe-defaults.gypi -I /home/ankur/ti-arago/oe-layersetup/build/arago-tmp-=
external-linaro-toolchain/work/cortexa8t2hf-vfp-neon-linux-gnueabi/chromium=
/40.0.2214.91-r0/include.gypi -f ninja</font></div><div class=3D"gmail_defa=
ult" style=3D""><font color=3D"#333399" face=3D"georgia, serif">| ERROR: Fu=
nction failed: do_configure (log file is located at /home/ankur/ti-arago/oe=
-layersetup/build/arago-tmp-external-linaro-toolchain/work/cortexa8t2hf-vfp=
-neon-linux-gnueabi/chromium/40.0.2214.91-r0/temp/log.do_configure.24479)</=
font></div><div class=3D"gmail_default" style=3D""><font color=3D"#333399" =
face=3D"georgia, serif">ERROR: Task 372 (/home/ankur/ti-arago/oe-layersetup=
/sources/meta-openembedded/meta-browser/recipes-browser/chromium/<a href=3D=
"http://chromium_40.0.2214.91.bb">chromium_40.0.2214.91.bb</a>, do_configur=
e) failed with exit code &#39;1&#39;</font></div><div class=3D"gmail_defaul=
t" style=3D""><font color=3D"#333399" face=3D"georgia, serif">NOTE: Tasks S=
ummary: Attempted 2856 tasks of which 2833 didn&#39;t need to be rerun and =
1 failed.</font></div><div class=3D"gmail_default" style=3D"color:rgb(51,51=
,153);font-family:georgia,serif;font-size:small"><br></div><div class=3D"gm=
ail_default" style=3D"color:rgb(51,51,153);font-family:georgia,serif;font-s=
ize:small">Thanks</div><div class=3D"gmail_default" style=3D"color:rgb(51,5=
1,153);font-family:georgia,serif;font-size:small">Ankur</div></div></div><d=
iv class=3D"gmail_extra"><br clear=3D"all"><div><div class=3D"gmail_signatu=
re"><div dir=3D"ltr">&quot;Knowledge is knowing tomato is a fruit, wisdom i=
s not putting it in a fruit salad&quot;</div></div></div>
<br><div class=3D"gmail_quote">On Fri, Jul 10, 2015 at 11:23 AM, Denys Dmyt=
riyenko <span dir=3D"ltr">&lt;<a href=3D"mailto:denys@ti.com" target=3D"_bl=
ank">denys@ti.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote=
" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">I=
 haven&#39;t tried it recently, but you should be able to add meta-browser =
to<br>
bblayers.conf file and bitbake the corresponding target.<br>
<br>
--<br>
Denys<br>
<div><div class=3D"h5"><br>
<br>
On Fri, Jul 03, 2015 at 04:17:21PM +1200, Ankur Tyagi wrote:<br>
&gt; Hi,<br>
&gt;<br>
&gt; In case previous one was missed.<br>
&gt;<br>
&gt; I want to build chrome/firefox browser for my AM335x EVM.<br>
&gt;<br>
&gt; I am using &quot;arago-daisy-config.txt&quot; to bitbake tisdk-rootfs-=
image.<br>
&gt;<br>
&gt; I see there is meta-browser which includes chrome, firefox.<br>
&gt;<br>
&gt; How can I get them build with my tisdk rootfs ?<br>
&gt;<br>
&gt; What all do I need to modify in my bblayer and local conf files ?<br>
&gt;<br>
&gt; thanks<br>
&gt;<br>
&gt;<br>
&gt; &quot;Knowledge is knowing tomato is a fruit, wisdom is not putting it=
 in a<br>
&gt; fruit salad&quot;<br>
&gt;<br>
&gt; On Fri, Jun 19, 2015 at 7:04 PM, Ankur Tyagi &lt;<a href=3D"mailto:ank=
ur.tyagi85@gmail.com">ankur.tyagi85@gmail.com</a>&gt;<br>
&gt; wrote:<br>
&gt;<br>
&gt; &gt; Hi,<br>
&gt; &gt;<br>
&gt; &gt; I want to build chrome/firefox browser for my AM335x EVM.<br>
&gt; &gt;<br>
&gt; &gt; I am using &quot;arago-daisy-config.txt&quot; to bitbake tisdk-ro=
otfs-image.<br>
&gt; &gt;<br>
&gt; &gt; I see there is meta-browser which includes chrome, firefox.<br>
&gt; &gt;<br>
&gt; &gt; How can I get them build with my tisdk rootfs ?<br>
&gt; &gt;<br>
&gt; &gt; What all do I need to modify in my bblayer and local conf files ?=
<br>
&gt; &gt;<br>
&gt; &gt; thanks<br>
&gt; &gt;<br>
<br>
</div></div>&gt; _______________________________________________<br>
&gt; meta-arago mailing list<br>
&gt; <a href=3D"mailto:meta-arago@arago-project.org">meta-arago@arago-proje=
ct.org</a><br>
&gt; <a href=3D"http://arago-project.org/cgi-bin/mailman/listinfo/meta-arag=
o" rel=3D"noreferrer" target=3D"_blank">http://arago-project.org/cgi-bin/ma=
ilman/listinfo/meta-arago</a><br>
<br>
</blockquote></div><br></div>

--001a113dd3d6ff89fb051a7d554b--
