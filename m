Return-Path: <ankur.tyagi85@gmail.com>
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com
	[209.85.208.173])
	by arago-project.org (Postfix) with ESMTPS id 6E8E8529B3
	for <meta-arago@arago-project.org>;
	Mon, 11 Nov 2019 05:54:26 +0000 (UTC)
Received: by mail-lj1-f173.google.com with SMTP id r7so12400114ljg.2
	for <meta-arago@arago-project.org>;
	Sun, 10 Nov 2019 21:53:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=pWmf7SdciKi3vUT5Ff/D1veY0swj9WCo72UStQIn3SA=;
	b=CjluQchOVr2As/IhXBOXfsH8QF5HBgrvpvkOGwd4+P0iL/tqlPWhcLpSbWfE5StAH7
	NXE+5zUmtKi+OYKtrcPkY0L4dWVhfo8vtAYX8ZS5ZP+80IBJlJO+NwGO9ipuxJA8wD/M
	knP/jouynZFo2tgDp/6KYoGAFgkPpV0O/ACx6BMRgJa19bj+5RLL7+Ifv1w63cfKpG4E
	mixcpVaJ6rne/c7vlilYvmzBil1seceOcgzgfOfvZkvkD7hWk9B2IitX8DnkMwk91OEY
	RE4eQG+xufrU6WT89FNRNRj5H4XM7Z2yLTGMr91uioLDvDRRE7zI0069xEoQtle6/Y70
	QwNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=pWmf7SdciKi3vUT5Ff/D1veY0swj9WCo72UStQIn3SA=;
	b=rPwtqiWoMJUcmIqgdxGXVl9gUZWM+0pDgTZl6sKNphYT2eZDK9WpwjoPo+dnkHLLpl
	2RDeQQ0qT/4vdyAOHG1wUrncI5a97/xrS7e14ruITS1L3c3cFLDc9gE+9MNmkGSNw+M3
	DanfSs8ZRKUYeplM0l3576BIGi4Pq3CLJYlln4AA+bnLHTQIyQmZ15fBJGQmLgH+Kbim
	0ySmbAAPU86c6/6h11noeMbxWvteNG/NzkUWgqRJ8JBMOtdbBBcGOukMjnR7Kn3h/RMk
	IRVv7fYgSGl+xeJpAh5IuHnohrFOF5V1+daRaPG4GjO45mfwZOH3X74B2vO2ubsYLR6L
	MdEA==
X-Gm-Message-State: APjAAAXPhIxTm1FMlcCV/2Hw1qGxTpcKcqcIHMfA51yJrLpPfauPMfKW
	c2kd2OxwnPoOET06TWeFXfULr28K1e0EaxQ7xwA=
X-Google-Smtp-Source: APXvYqyvoZJt3vW8QrSQ5ESQU6teBz8nzK+z4ICFNGLsVsa3KJXAtCifVui5ov9guAjUmwH2M8fm9jWt/N6sUcmNz/o=
X-Received: by 2002:a2e:921a:: with SMTP id k26mr15245271ljg.238.1573451581396;
	Sun, 10 Nov 2019 21:53:01 -0800 (PST)
MIME-Version: 1.0
References: <CADySD0HyRLzXfSfcYTrGZmuX2acoCMi2BE+hy=v+-fKPAvF3Mw@mail.gmail.com>
	<CADySD0HKK1MWGXg2qL4PP-SRiyrHGJUpwKgAuCTVsZ0MizCSpg@mail.gmail.com>
	<20190926162746.GC5386@beryl>
	<CADySD0H4jZy5YpHudHyEwhsJLhcCLLt3yJ-nX1sdqik561Qt3g@mail.gmail.com>
In-Reply-To: <CADySD0H4jZy5YpHudHyEwhsJLhcCLLt3yJ-nX1sdqik561Qt3g@mail.gmail.com>
From: Ankur Tyagi <ankur.tyagi85@gmail.com>
Date: Sun, 10 Nov 2019 21:52:48 -0800
Message-ID: <CADySD0H7NXcvhhV++WNtCu4nsxy=CV7MiH3oMitJS_W5QmBYoA@mail.gmail.com>
To: Denys Dmytriyenko <denys@ti.com>
Cc: meta-arago@arago-project.org
Subject: Re: do_rootfs error for custom image based upon arago thud branch
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
X-List-Received-Date: Mon, 11 Nov 2019 05:54:27 -0000
Content-Type: multipart/alternative; boundary="000000000000949b5005970bbe7e"

--000000000000949b5005970bbe7e
Content-Type: text/plain; charset="UTF-8"

Hi Denys,

I have again encountered the same problem so there is a fundamental issue
somewhere.
Let me explain when this problem occurs and what is my setup:

1) Let's assume current u-boot SRCREV in recipe is
"4fc3ad1c4d92a32c1e233c524d65836226488912" and linux SRCREV is
"634579ce9ee01466fd84524602bd0a262a0add00"
2) I build my image and preserve sstate-cache
3) Change u-boot SRCREV to "b31ea1d6069a3634c696d9fbff86373fd5b0f82d" and
linux SRCREV to "d02acfec3d72606798f498c33728f5a0839e6360"
4) Build my image again using the preserved sstate-cache so only u-boot and
linux is rebuilt

Then I get following error

******************************
Collected errors:
 * Solver encountered 2 problem(s):
 * Problem 1/2:
 *   - nothing provides u-boot-ti-staging-src >= 2019.01+git0+b31ea1d606
needed by linux-ti-staging-src-4.19.73+git0+d02acfec3d-gamos.wsl
 *
 * Solution 1:
 *   - do not ask to install a package providing packagegroup-ggl-base

 * Problem 2/2:
 *   - nothing provides u-boot-ti-staging-src >= 2019.01+git0+b31ea1d606
needed by linux-ti-staging-src-4.19.73+git0+d02acfec3d-gamos.wsl
 *
 * Solution 1:
 *   - do not ask to install a package providing packagegroup-ggl-qt
******************************

Can you please provide me with some pointers on what could be causing it or
where should I start investigating it?

Thanks
Ankur


On Fri, 27 Sep 2019, 9:00 a.m. Ankur Tyagi, <ankur.tyagi85@gmail.com> wrote:

> thanks for your response Denys
>
> On Fri, 27 Sep 2019, 4:27 a.m. Denys Dmytriyenko, <denys@ti.com> wrote:
>
>> Thanks for following up with the update!
>>
>> Unfortunately, opkg install issues like this are very specific to your
>> build
>> environment and harder to debug remotely. You'd need to see why the
>> package
>> gets one version, while a different one being requested. In some cases it
>> can
>> be due to a stale package, like here. In others it's more complicated.
>>
>> Denys
>>
>>
>> On Thu, Sep 26, 2019 at 07:17:26AM +1200, Ankur Tyagi wrote:
>> > It got resolved after removing tmp directory and rebuilding
>> >
>> > On Wed, 25 Sep 2019, 1:23 a.m. Ankur Tyagi, <ankur.tyagi85@gmail.com>
>> wrote:
>> >
>> > > Hi,
>> > >
>> > > I was using "thud" branch to create custom image for my board.
>> > > Recently updated meta-ti, meta-arago "thud" branch and started
>> > > receiving following error message during do_rootfs task
>> > >
>> > > ERROR: ggl-wsl-prod-image-1.0-r0 do_rootfs: Unable to install
>> > > packages. Command
>> > >
>> > >
>> '/home/yocto/ggl-yocto-tools/build/tmp-external-arm-toolchain/work/wsl-linux-gnueabi/ggl-wsl-prod-image/1.0-r0/recipe-sysroot-native/usr/bin/opkg
>> > > --volatile-cache -f
>> > >
>> > >
>> /home/yocto/ggl-yocto-tools/build/tmp-external-arm-toolchain/work/wsl-linux-gnueabi/ggl-wsl-prod-image/1.0-r0/opkg.conf
>> > > -t
>> > >
>> /home/yocto/ggl-yocto-tools/build/tmp-external-arm-toolchain/work/wsl-linux-gnueabi/ggl-wsl-prod-image/1.0-r0/temp/ipktemp/
>> > > -o
>> > >
>> /home/yocto/ggl-yocto-tools/build/tmp-external-arm-toolchain/work/wsl-linux-gnueabi/ggl-wsl-prod-image/1.0-r0/rootfs
>> > >  --force_postinstall    install packagegroup-core-boot
>> > > packagegroup-ggl-base packagegroup-ggl-connectivity
>> > > packagegroup-ggl-qt psplash run-postinsts' returned 2:
>> > > Collected errors:
>> > >  * Solver encountered 2 problem(s):
>> > >  * Problem 1/2:
>> > >  *   - nothing provides u-boot-ti-staging-src >=
>> > > 2019.01+git0+571bb85860 needed by
>> > > linux-ti-staging-src-4.19.73+git0+761ba629e9-gamos.wsl
>> > >  *
>> > >  * Solution 1:
>> > >  *   - do not ask to install a package providing packagegroup-ggl-base
>> > >
>> > >  * Problem 2/2:
>> > >  *   - nothing provides u-boot-ti-staging-src >=
>> > > 2019.01+git0+571bb85860 needed by
>> > > linux-ti-staging-src-4.19.73+git0+761ba629e9-gamos.wsl
>> > >  *
>> > >  * Solution 1:
>> > >  *   - do not ask to install a package providing packagegroup-ggl-qt
>> > >
>> > >  * opkg_finalize_intercepts: Failed to open dir
>> > >
>> > >
>> /home/yocto/ggl-yocto-tools/build/tmp-external-arm-toolchain/work/wsl-linux-gnueabi/ggl-wsl-prod-image/1.0-r0/temp/ipktemp//opkg-JLB910/opkg-intercept-xOvXqH:
>> > > No such file or directory.
>> > >  * rm_r: Failed to open dir
>> > >
>> > >
>> /home/yocto/ggl-yocto-tools/build/tmp-external-arm-toolchain/work/wsl-linux-gnueabi/ggl-wsl-prod-image/1.0-r0/temp/ipktemp//opkg-JLB910/opkg-intercept-xOvXqH:
>> > > No such file or directory.
>> > >  * rm_r: Failed to open dir
>> > >
>> > >
>> /home/yocto/ggl-yocto-tools/build/tmp-external-arm-toolchain/work/wsl-linux-gnueabi/ggl-wsl-prod-image/1.0-r0/temp/ipktemp//opkg-JLB910:
>> > > No such file or directory.
>> > >
>> > >
>> > >
>> > > ERROR: ggl-wsl-prod-image-1.0-r0 do_rootfs: Function failed: do_rootfs
>> > > ERROR: Logfile of failure stored in:
>> > >
>> > >
>> /home/yocto/ggl-yocto-tools/build/tmp-external-arm-toolchain/work/wsl-linux-gnueabi/ggl-wsl-prod-image/1.0-r0/temp/log.do_rootfs.107554
>> > > ERROR: Task
>> > >
>> (/home/yocto/ggl-yocto-tools/sources/ggl-yocto/meta-ggl-image/recipes-core/images/
>> ggl-wsl-prod-image.bb:
>> > > do_rootfs)
>> > > failed with exit code '1'
>> > >
>> > > Can you please help:
>> > > 1) to understand the underlying problem
>> > > 2) how can I fix it
>> > >
>> > > thanks
>> > > Ankur
>> > >
>>
>> > _______________________________________________
>> > meta-arago mailing list
>> > meta-arago@arago-project.org
>> > http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago
>>
>>

--000000000000949b5005970bbe7e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"auto"><div>Hi Denys<span class=3D"gmail_defaul=
t" style=3D"font-family:arial,helvetica,sans-serif">,</span></div><div><spa=
n class=3D"gmail_default" style=3D"font-family:arial,helvetica,sans-serif">=
<br></span></div><div><span class=3D"gmail_default" style=3D"font-family:ar=
ial,helvetica,sans-serif">I have again encountered the same problem so ther=
e is a fundamental issue somewhere.</span></div><div><span class=3D"gmail_d=
efault" style=3D"font-family:arial,helvetica,sans-serif">Let me explain whe=
n this problem occurs and what is my setup:</span></div><div><span class=3D=
"gmail_default" style=3D"font-family:arial,helvetica,sans-serif"><br></span=
></div><div><span class=3D"gmail_default" style=3D"font-family:arial,helvet=
ica,sans-serif">1) Let&#39;s assume current u-boot SRCREV in recipe is &quo=
t;4fc3ad1c4d92a32c1e233c524d65836226488912&quot; and linux SRCREV is &quot;=
634579ce9ee01466fd84524602bd0a262a0add00&quot;<br></span></div><div><span c=
lass=3D"gmail_default" style=3D"font-family:arial,helvetica,sans-serif">2) =
I build my image and preserve sstate-cache<br></span></div><div><span class=
=3D"gmail_default" style=3D"font-family:arial,helvetica,sans-serif">3) Chan=
ge u-boot SRCREV to &quot;b31ea1d6069a3634c696d9fbff86373fd5b0f82d&quot; an=
d linux SRCREV to &quot;d02acfec3d72606798f498c33728f5a0839e6360&quot;<br><=
/span></div><div><span class=3D"gmail_default" style=3D"font-family:arial,h=
elvetica,sans-serif">4) Build my image again using the preserved sstate-cac=
he so only u-boot and linux is rebuilt<br></span></div><div><span class=3D"=
gmail_default" style=3D"font-family:arial,helvetica,sans-serif"><br></span>=
</div><div><span class=3D"gmail_default" style=3D"font-family:arial,helveti=
ca,sans-serif">Then I get following error</span></div><div><span class=3D"g=
mail_default" style=3D"font-family:arial,helvetica,sans-serif"><br></span><=
/div><div><span class=3D"gmail_default" style=3D"font-family:arial,helvetic=
a,sans-serif">******************************<br></span></div><div><span cla=
ss=3D"gmail_default" style=3D"font-family:arial,helvetica,sans-serif">Colle=
cted errors:<br>=C2=A0* Solver encountered 2 problem(s):<br>=C2=A0* Problem=
 1/2:<br>=C2=A0* =C2=A0 - nothing provides u-boot-ti-staging-src &gt;=3D 20=
19.01+git0+b31ea1d606 needed by linux-ti-staging-src-4.19.73+git0+d02acfec3=
d-gamos.wsl<br>=C2=A0* <br>=C2=A0* Solution 1:<br>=C2=A0* =C2=A0 - do not a=
sk to install a package providing packagegroup-ggl-base<br><br>=C2=A0* Prob=
lem 2/2:<br>=C2=A0* =C2=A0 - nothing provides u-boot-ti-staging-src &gt;=3D=
 2019.01+git0+b31ea1d606 needed by linux-ti-staging-src-4.19.73+git0+d02acf=
ec3d-gamos.wsl<br>=C2=A0* <br>=C2=A0* Solution 1:<br>=C2=A0* =C2=A0 - do no=
t ask to install a package providing packagegroup-ggl-qt<br></span></div><d=
iv dir=3D"auto"><div style=3D"font-family:arial,helvetica,sans-serif" class=
=3D"gmail_default">******************************</div><br></div><div dir=
=3D"auto"><div style=3D"font-family:arial,helvetica,sans-serif" class=3D"gm=
ail_default">Can you please provide me with some pointers on what could be =
causing it or where should I start investigating it?</div><div style=3D"fon=
t-family:arial,helvetica,sans-serif" class=3D"gmail_default"><br></div><div=
 style=3D"font-family:arial,helvetica,sans-serif" class=3D"gmail_default">T=
hanks</div><div style=3D"font-family:arial,helvetica,sans-serif" class=3D"g=
mail_default">Ankur<br></div><br><br><div class=3D"gmail_quote" dir=3D"auto=
"><div dir=3D"ltr" class=3D"gmail_attr">On Fri, 27 Sep 2019, 9:00 a.m. Anku=
r Tyagi, &lt;<a href=3D"mailto:ankur.tyagi85@gmail.com" target=3D"_blank">a=
nkur.tyagi85@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_q=
uote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1e=
x"><div dir=3D"auto">thanks for your response Denys</div><br><div class=3D"=
gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Fri, 27 Sep 2019, 4:2=
7 a.m. Denys Dmytriyenko, &lt;<a href=3D"mailto:denys@ti.com" rel=3D"norefe=
rrer" target=3D"_blank">denys@ti.com</a>&gt; wrote:<br></div><blockquote cl=
ass=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;p=
adding-left:1ex">Thanks for following up with the update!<br>
<br>
Unfortunately, opkg install issues like this are very specific to your buil=
d <br>
environment and harder to debug remotely. You&#39;d need to see why the pac=
kage <br>
gets one version, while a different one being requested. In some cases it c=
an <br>
be due to a stale package, like here. In others it&#39;s more complicated.<=
br>
<br>
Denys<br>
<br>
<br>
On Thu, Sep 26, 2019 at 07:17:26AM +1200, Ankur Tyagi wrote:<br>
&gt; It got resolved after removing tmp directory and rebuilding<br>
&gt; <br>
&gt; On Wed, 25 Sep 2019, 1:23 a.m. Ankur Tyagi, &lt;<a href=3D"mailto:anku=
r.tyagi85@gmail.com" rel=3D"noreferrer noreferrer" target=3D"_blank">ankur.=
tyagi85@gmail.com</a>&gt; wrote:<br>
&gt; <br>
&gt; &gt; Hi,<br>
&gt; &gt;<br>
&gt; &gt; I was using &quot;thud&quot; branch to create custom image for my=
 board.<br>
&gt; &gt; Recently updated meta-ti, meta-arago &quot;thud&quot; branch and =
started<br>
&gt; &gt; receiving following error message during do_rootfs task<br>
&gt; &gt;<br>
&gt; &gt; ERROR: ggl-wsl-prod-image-1.0-r0 do_rootfs: Unable to install<br>
&gt; &gt; packages. Command<br>
&gt; &gt;<br>
&gt; &gt; &#39;/home/yocto/ggl-yocto-tools/build/tmp-external-arm-toolchain=
/work/wsl-linux-gnueabi/ggl-wsl-prod-image/1.0-r0/recipe-sysroot-native/usr=
/bin/opkg<br>
&gt; &gt; --volatile-cache -f<br>
&gt; &gt;<br>
&gt; &gt; /home/yocto/ggl-yocto-tools/build/tmp-external-arm-toolchain/work=
/wsl-linux-gnueabi/ggl-wsl-prod-image/1.0-r0/opkg.conf<br>
&gt; &gt; -t<br>
&gt; &gt; /home/yocto/ggl-yocto-tools/build/tmp-external-arm-toolchain/work=
/wsl-linux-gnueabi/ggl-wsl-prod-image/1.0-r0/temp/ipktemp/<br>
&gt; &gt; -o<br>
&gt; &gt; /home/yocto/ggl-yocto-tools/build/tmp-external-arm-toolchain/work=
/wsl-linux-gnueabi/ggl-wsl-prod-image/1.0-r0/rootfs<br>
&gt; &gt;=C2=A0 --force_postinstall=C2=A0 =C2=A0 install packagegroup-core-=
boot<br>
&gt; &gt; packagegroup-ggl-base packagegroup-ggl-connectivity<br>
&gt; &gt; packagegroup-ggl-qt psplash run-postinsts&#39; returned 2:<br>
&gt; &gt; Collected errors:<br>
&gt; &gt;=C2=A0 * Solver encountered 2 problem(s):<br>
&gt; &gt;=C2=A0 * Problem 1/2:<br>
&gt; &gt;=C2=A0 *=C2=A0 =C2=A0- nothing provides u-boot-ti-staging-src &gt;=
=3D<br>
&gt; &gt; 2019.01+git0+571bb85860 needed by<br>
&gt; &gt; linux-ti-staging-src-4.19.73+git0+761ba629e9-gamos.wsl<br>
&gt; &gt;=C2=A0 *<br>
&gt; &gt;=C2=A0 * Solution 1:<br>
&gt; &gt;=C2=A0 *=C2=A0 =C2=A0- do not ask to install a package providing p=
ackagegroup-ggl-base<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 * Problem 2/2:<br>
&gt; &gt;=C2=A0 *=C2=A0 =C2=A0- nothing provides u-boot-ti-staging-src &gt;=
=3D<br>
&gt; &gt; 2019.01+git0+571bb85860 needed by<br>
&gt; &gt; linux-ti-staging-src-4.19.73+git0+761ba629e9-gamos.wsl<br>
&gt; &gt;=C2=A0 *<br>
&gt; &gt;=C2=A0 * Solution 1:<br>
&gt; &gt;=C2=A0 *=C2=A0 =C2=A0- do not ask to install a package providing p=
ackagegroup-ggl-qt<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 * opkg_finalize_intercepts: Failed to open dir<br>
&gt; &gt;<br>
&gt; &gt; /home/yocto/ggl-yocto-tools/build/tmp-external-arm-toolchain/work=
/wsl-linux-gnueabi/ggl-wsl-prod-image/1.0-r0/temp/ipktemp//opkg-JLB910/opkg=
-intercept-xOvXqH:<br>
&gt; &gt; No such file or directory.<br>
&gt; &gt;=C2=A0 * rm_r: Failed to open dir<br>
&gt; &gt;<br>
&gt; &gt; /home/yocto/ggl-yocto-tools/build/tmp-external-arm-toolchain/work=
/wsl-linux-gnueabi/ggl-wsl-prod-image/1.0-r0/temp/ipktemp//opkg-JLB910/opkg=
-intercept-xOvXqH:<br>
&gt; &gt; No such file or directory.<br>
&gt; &gt;=C2=A0 * rm_r: Failed to open dir<br>
&gt; &gt;<br>
&gt; &gt; /home/yocto/ggl-yocto-tools/build/tmp-external-arm-toolchain/work=
/wsl-linux-gnueabi/ggl-wsl-prod-image/1.0-r0/temp/ipktemp//opkg-JLB910:<br>
&gt; &gt; No such file or directory.<br>
&gt; &gt;<br>
&gt; &gt;<br>
&gt; &gt;<br>
&gt; &gt; ERROR: ggl-wsl-prod-image-1.0-r0 do_rootfs: Function failed: do_r=
ootfs<br>
&gt; &gt; ERROR: Logfile of failure stored in:<br>
&gt; &gt;<br>
&gt; &gt; /home/yocto/ggl-yocto-tools/build/tmp-external-arm-toolchain/work=
/wsl-linux-gnueabi/ggl-wsl-prod-image/1.0-r0/temp/log.do_rootfs.107554<br>
&gt; &gt; ERROR: Task<br>
&gt; &gt; (/home/yocto/ggl-yocto-tools/sources/ggl-yocto/meta-ggl-image/rec=
ipes-core/images/<a href=3D"http://ggl-wsl-prod-image.bb" rel=3D"noreferrer=
 noreferrer noreferrer" target=3D"_blank">ggl-wsl-prod-image.bb</a>:<br>
&gt; &gt; do_rootfs)<br>
&gt; &gt; failed with exit code &#39;1&#39;<br>
&gt; &gt;<br>
&gt; &gt; Can you please help:<br>
&gt; &gt; 1) to understand the underlying problem<br>
&gt; &gt; 2) how can I fix it<br>
&gt; &gt;<br>
&gt; &gt; thanks<br>
&gt; &gt; Ankur<br>
&gt; &gt;<br>
<br>
&gt; _______________________________________________<br>
&gt; meta-arago mailing list<br>
&gt; <a href=3D"mailto:meta-arago@arago-project.org" rel=3D"noreferrer nore=
ferrer" target=3D"_blank">meta-arago@arago-project.org</a><br>
&gt; <a href=3D"http://arago-project.org/cgi-bin/mailman/listinfo/meta-arag=
o" rel=3D"noreferrer noreferrer noreferrer" target=3D"_blank">http://arago-=
project.org/cgi-bin/mailman/listinfo/meta-arago</a><br>
<br>
</blockquote></div>
</blockquote></div></div></div>
</div>

--000000000000949b5005970bbe7e--
